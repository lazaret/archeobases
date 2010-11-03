## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")}- ${_("Persons")} - ${_("Statistics")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("Statistics")}
</%def>
##
<!-- persons stats template -->
##
Number of persons : ${c.person_count}<br/>

Number of voluntary members : ${c.v_member_count}<br/>

Number of member by country<br/>

Last change<br/>


