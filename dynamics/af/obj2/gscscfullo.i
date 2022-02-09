/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation ("PSC"),       *
* 14 Oak Park, Bedford, MA 01730, and other contributors as listed   *
* below.  All Rights Reserved.                                       *
*                                                                    *
* The Initial Developer of the Original Code is PSC.  The Original   *
* Code is Progress IDE code released to open source December 1, 2000.*
*                                                                    *
* The contents of this file are subject to the Possenet Public       *
* License Version 1.0 (the "License"); you may not use this file     *
* except in compliance with the License.  A copy of the License is   *
* available as of the date of this notice at                         *
* http://www.possenet.org/license.html                               *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
  FIELD security_control_obj LIKE gsc_security_control.security_control_obj VALIDATE ~
  FIELD password_max_retries LIKE gsc_security_control.password_max_retries VALIDATE ~
  FIELD password_history_life_time LIKE gsc_security_control.password_history_life_time VALIDATE ~
  FIELD full_access_by_default LIKE gsc_security_control.full_access_by_default VALIDATE ~
  FIELD security_enabled LIKE gsc_security_control.security_enabled VALIDATE ~
  FIELD help_writer_enabled LIKE gsc_security_control.help_writer_enabled VALIDATE ~
  FIELD build_top_menus_only LIKE gsc_security_control.build_top_menus_only VALIDATE ~
  FIELD default_help_filename LIKE gsc_security_control.default_help_filename VALIDATE ~
  FIELD error_log_filename LIKE gsc_security_control.error_log_filename VALIDATE ~
  FIELD translation_enabled LIKE gsc_security_control.translation_enabled VALIDATE ~
  FIELD login_filename LIKE gsc_security_control.login_filename VALIDATE ~
  FIELD multi_user_check LIKE gsc_security_control.multi_user_check VALIDATE ~
  FIELD program_access_check LIKE gsc_security_control.program_access_check VALIDATE ~
  FIELD minimise_siblings LIKE gsc_security_control.minimise_siblings VALIDATE ~
  FIELD enable_window_positioning LIKE gsc_security_control.enable_window_positioning VALIDATE ~
  FIELD force_unique_password LIKE gsc_security_control.force_unique_password VALIDATE ~
  FIELD company_logo_filename LIKE gsc_security_control.company_logo_filename VALIDATE ~
  FIELD system_icon_filename LIKE gsc_security_control.system_icon_filename VALIDATE ~
  FIELD small_icon_filename LIKE gsc_security_control.small_icon_filename VALIDATE ~
  FIELD product_logo_filename LIKE gsc_security_control.product_logo_filename VALIDATE ~
  FIELD scm_checks_on LIKE gsc_security_control.scm_checks_on VALIDATE ~
  FIELD scm_tool_code LIKE gsc_security_control.scm_tool_code VALIDATE 