## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
<%namespace file="/users/user_display.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Users")} - ${_("Show")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > \
  ${h.link_to(_("Users"), url(controller="users"))} > ${_("Show")}
</%def>
##
<!-- users show template -->
##
${user_display()}
<br />

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.user.user_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.user.user_id))} |
