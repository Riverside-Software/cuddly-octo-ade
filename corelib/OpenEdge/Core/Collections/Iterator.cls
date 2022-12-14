/************************************************
Copyright (c)  2013, 2021 by Progress Software Corporation. All rights reserved.
*************************************************/
/*------------------------------------------------------------------------
    File        : Iterator
    Purpose     : 
    Syntax      : 
    Description : 
    @author hdaniels
    Created     : Sun Dec 16 21:26:22 EST 2007
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using OpenEdge.Core.Collections.ICollection.
using OpenEdge.Core.Collections.IIterator.
using OpenEdge.Core.String.
using Progress.Lang.AppError.
using Progress.Lang.Object.
using OpenEdge.Core.Decimal.
using OpenEdge.Core.Integer.
using OpenEdge.Core.TimeStamp.

class OpenEdge.Core.Collections.Iterator use-widget-pool implements IIterator :
    /*------------------------------------------------------------------------------
            Purpose:                                                                        
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    define protected property OwnerCollection   as ICollection no-undo  get. set .     
    define protected property QueryHandle       as handle no-undo  get. set .     
    define protected property BufferHandle      as handle no-undo  get. set .    
    define protected property ObjectFieldHandle as handle no-undo  get. set  .    
    
    constructor public Iterator (poCol as ICollection, tt as handle,ofield as char):
        this-object(poCol,tt,ofield,'','').            
    end constructor.
    
    constructor public Iterator (poCol as ICollection,tt as handle,ofield as char, sortfield as char):
        this-object(poCol,tt,ofield,sortfield,'').
    end constructor.
    
    constructor public Iterator (poCol as ICollection,tt as handle,ofield as char, sortfield as char, querystring as char):
        super ().    
        OwnerCollection = poCol.
        
        create buffer BufferHandle for table tt.
        create query QueryHandle.
        
        QueryHandle:add-buffer(BufferHandle).
        ObjectFieldHandle = BufferHandle:buffer-field(ofield).
        PrepareQuery(querystring,sortfield,sortfield = '').
        /* it is generally bad practice to open the query in the constructor 
           - excuse 1: iterators are only newed when you really want to iterate
                      (i.e. you don't new an Iterator at start up or in a constrcutor) 
           - excuse 2: if not done here it would be needed in most methods here and 
                       in ListIterator  */  
        QueryHandle:query-open().
    end constructor.
    
    method private void PrepareQuery (queryExp as char,sortExp as char,forwardOnly as logical):
        QueryHandle:query-prepare('preselect each ' + bufferHandle:name         
                                  + (if queryExp > '' 
                                     then ' where ' + queryExp 
                                     else '') 
                                  + if sortExp > '' 
                                    then ' by ' + sortExp
                                    else ''). 
        QueryHandle:forward-only = forwardOnly.
    end method. 
       
    method public logical HasNext(  ):
        define variable offend as logical no-undo.
        
        if QueryHandle:query-off-end then 
        do:
            QueryHandle:reposition-forward(1).
            offend = QueryHandle:query-off-end.
            if not QueryHandle:forward-only then
                QueryHandle:reposition-backward(1).
            return not offend. 
        end. 
        else 
        if  QueryHandle:num-results = 1 
        and QueryHandle:current-result-row = 1 then 
            return not QueryHandle:get-buffer-handle(1):avail.
        else
            return QueryHandle:current-result-row lt QueryHandle:num-results.   
    end method.

    method public Object Next(  ):
        define variable lcVal as longchar no-undo.
        
        QueryHandle:get-next().
        if bufferHandle:avail then 
        case ObjectFieldHandle:data-type:
            when 'progress.lang.object':u then
                return ObjectFieldHandle:buffer-value().
            when 'character':u then
                return new String(ObjectFieldHandle:buffer-value()).
            when 'clob':u then
            do:
                assign lcVal = ObjectFieldHandle:buffer-value().
                return new String(lcVal).
            end.
            when 'decimal':u then
                return new Decimal(ObjectFieldHandle:buffer-value()).
            when 'integer':u or
            when 'int64':u then
                return new Integer(ObjectFieldHandle:buffer-value()).
            when 'date':u or
            when 'datetime':u or
            when 'datetime-tz':u then
                return new TimeStamp(ObjectFieldHandle:buffer-value()).
            otherwise
                undo, throw new AppError(substitute('Cannot convert primitive type &1 to an object', ObjectFieldHandle:data-type), 0).
        end case.
        else
            return ?.
    end method.
    
    /* removes the current item from the underlying collection  */
    method public logical Remove(  ):    
        define variable lOk as logical no-undo.
        if BufferHandle:avail then
        do:
            lOk = OwnerCollection:Remove(ObjectFieldHandle:buffer-value).
            if lok then 
                QueryHandle:delete-result-list-entry().
        end.   
        return lok.          
    end method.

    destructor public Iterator ( ):
        if valid-handle(BufferHandle) then
            delete object bufferHandle.
        if valid-handle(QueryHandle) then
            delete object QueryHandle.
    end destructor.

 end class.
