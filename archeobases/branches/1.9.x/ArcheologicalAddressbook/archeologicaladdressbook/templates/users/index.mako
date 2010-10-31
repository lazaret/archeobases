## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Users")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > \
  ${_("Users")}
</%def>
##
<!-- users index template -->
##

