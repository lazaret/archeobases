## -*- coding: utf-8 -*-
<%inherit file="/search/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Search")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Search")}
</%def>
##
<!-- search index template -->
##
