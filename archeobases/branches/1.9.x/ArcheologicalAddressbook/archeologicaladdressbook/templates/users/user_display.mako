## -*- coding: utf-8 -*-
##
<%def name="user_display()">
  ${_("User name")} : ${c.user.user_name}<br/>
  ${_("Display name")} : ${c.user.display_name}<br/>
  ${_("Email address")} : ${c.user.email_address}<br/>
  ${_("Group")} : ${c.group}<br/>
  ${_("Permissions")} :
  ## get the list of permissions except the las one, and add a coma
  % for permission in c.permissions[0:-1]:
    ${permission.permission_name},
  % endfor
  ## get the last permission without a coma
  ${c.permissions[-1].permission_name}<br/>
  ${_("Creation date")} : ${c.user.created.strftime('%d / %m / %Y')}
</%def>