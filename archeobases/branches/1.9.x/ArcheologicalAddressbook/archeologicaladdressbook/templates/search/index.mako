## -*- coding: utf-8 -*-
<%inherit file="/search/base.mako" />
<%namespace file="/search/quick_search_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Search")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("Search")}
</%def>
##
<!-- search index template -->
##
${quick_search_form()}