## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("Show")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("Show")}
</%def>
##
<!-- users show template -->
##
${_("User name")} : ${c.user.user_name}<br/>
${_("Display name")} : ${c.user.display_name}<br/>
${_("Email address")} : ${c.user.email_address}<br/>
${_("Group")} : ${c.user.groups[0].group_name}<br/>
<br/>
TODO : Add permission list and created info ?

