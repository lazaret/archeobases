## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Persons")}
</%def>
##
<!-- persons index template -->
##
