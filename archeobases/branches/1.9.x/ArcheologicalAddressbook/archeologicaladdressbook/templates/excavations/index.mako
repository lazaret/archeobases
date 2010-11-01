## -*- coding: utf-8 -*-
<%inherit file="/excavations/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Excavations")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("Excavations")}
</%def>
##
<!-- excavations index template -->
##
