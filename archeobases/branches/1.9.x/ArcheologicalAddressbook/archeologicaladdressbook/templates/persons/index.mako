## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/search/quick_search_form.mako" import="*"/>
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
${quick_search_form()}
