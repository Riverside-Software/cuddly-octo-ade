/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/*
 * _mfire.p
 *
 *	Executes the function associated with a menu item via the feature.
 */

{ adecomm/_mtemp.i }
{ {&mdir}/_mnudefs.i}

define input parameter appId     as character no-undo.
define input parameter featureId as character no-undo.
define input parameter item      as widget    no-undo.

define variable s as logical   no-undo.
define variable c as character no-undo.

find first mnuApp where mnuApp.appID = appId.
if not available mnuApp then return.

/*
 * Get the feature record. It has the name of the file to run for
 * the feature.
 */

find first mnuFeatures where mnuFeatures.featureId = featureId
                        and   mnuFeatures.appId     = appId no-error.

if (not available mnuFeatures) then do:
	message "Feature not found, but should've been!"
	view-as alert-box error buttons ok.
	return.
end.

/*
 * If there is no function at all then don't consider it a problem.
 */

if   mnuFeatures.functionId = ? or mnuFeatures.functionId = ""  then return.

/*
 * Turn on the watch cursor. This will force the application to turn it off.
 * This will insure that the user will get a cusror while waiting for
 * the feature to execute.
 */

run adecomm/_setcurs.p("WAIT").

/* 
 * There are 2 forms that are handled: func (arg) and func (arg arg).
 * The second form is used if the prvData has a list in it.
 */

badfile:
do on stop undo badfile, retry badfile:

    if retry then do:

        /*
         * There are 3 reasons, or at least 3 reasons, for a stop event
         * that the menu system cares about.
         *
         *    1. The .p can't be found. For performance we assume that
         *       the function is there and run it. If it isn't then
         *       we get here. Test to see if the file is there, so that
         *       we can give a more informative error message. Of course,
         *       worry about r-code as well as code file.
         *
         *    2. The file doesn't compile. Again, check to see if an
         *       error occured and provide an informative error message
         *
         *    3. All other stops are summed to have been generated by user
         *       hitting ctrl-break. The menu system just goes on its way.
         */
         
        c = SUBSTRING(mnuFeatures.functionId,1,
                      R-INDEX(mnuFeatures.functionId,".") - 1,"CHARACTER":u).

        if search(c + ".r") = ? and search(c + ".p") = ? then
            c = "Function not found.". 
        else if compiler:error = true then
        	c = "Function does not compile.".
        else c = "".
        
        if c <> "" then 
  	
            message c skip
                    "appId     " mnuFeatures.appId skip
                    "feature   " mnuFeatures.featureId skip
                    "function  " mnuFeatures.functionId skip
                    "args      " mnuFeatures.args skip
                    "user def  " mnuFeatures.userDefined skip
            view-as alert-box error buttons ok.

        leave badfile.
    end.

    if    num-entries(mnuFeatures.args) = 1 
       or num-entries(mnuFeatures.args) = 0 then
        run value(mnuFeatures.functionId)(item,
                                        mnuFeatures.featureId,
                                        mnuFeatures.appId,
                                        mnuFeatures.args,
                                        mnuApp.prvHandle,
                                        mnuFeatures.prvData).
    else do:

        /*
         * The second form is "f, arg...."
         * So pull oput the the function f and pass the remaining args
         */

        define variable arg1 as character no-undo.
        define variable arg2 as character no-undo.
        define variable loc  as integer   no-undo.

        ASSIGN
          arg1 = ENTRY(1,mnuFeatures.args)
          loc  = INDEX(mnuFeatures.args,",")
          arg2 = SUBSTRING(mnuFeatures.args,loc + 1,-1,"CHARACTER":u).

        run value(mnuFeatures.functionId)(item, mnuFeatures.featureId,
                                              mnuFeatures.appId,
                                              arg1,
                                              arg2,
                                              mnuApp.prvHandle,
                                              mnuFeatures.prvData).
    end.

end.

/*
 * Give the application a chance to set the sensitivty state of the
 * menu items and toolbar. _machk checks to see if there is a function
 * available
 */

run {&mdir}/_machk.p(appId, output s).

run adecomm/_setcurs.p("").

