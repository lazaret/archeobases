## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Addresses")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Addresses")}
</%def>
##
<!-- addresses index template -->
##
