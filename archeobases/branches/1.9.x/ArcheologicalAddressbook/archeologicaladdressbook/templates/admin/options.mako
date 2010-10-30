## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Options")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > ${_("Options")}
</%def>
##
<!-- admin options template -->
##

