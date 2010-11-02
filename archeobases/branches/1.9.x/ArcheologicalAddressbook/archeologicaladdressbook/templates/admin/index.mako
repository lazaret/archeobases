## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Admin")}
</%def>
##
<!-- admin index template -->
##

Save / restore database

add alert to check default users and pass

stats
