## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Users")}
</%def>
##
<!-- users index template -->
##

