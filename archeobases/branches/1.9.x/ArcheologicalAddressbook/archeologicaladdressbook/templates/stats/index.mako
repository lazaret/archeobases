## -*- coding: utf-8 -*-
<%inherit file="/stats/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Statistics")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(_("Addressbook"), "/")} > ${_("Statistics")}
</%def>
##
<!-- stats index template -->
##
Number of persons : ${c.person_count}<br/>

number of persons by types :<br/>

Number of adresses :<br/>

