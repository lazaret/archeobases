## -*- coding: utf-8 -*-
<%inherit file="/excavations/base.mako" />
<%namespace file="/excavations/excavation_display.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Excavations")} - ${_("Show")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Excavations"), url.current(controller="excavations"))} > ${_("Show")}
</%def>
##
<!-- excavations show template -->
##
${_("Last name")} : ${c.excavation.person.last_name}<br/>
${_("First name")} : ${c.excavation.person.first_name}<br/>
<br/>
${excavation_display()}
<br />

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.excavation.excavation_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.excavation.excavation_id))} |

