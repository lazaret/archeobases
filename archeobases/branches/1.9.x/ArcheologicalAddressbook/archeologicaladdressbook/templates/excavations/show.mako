## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
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
${_("Site Name")} : ${c.excavation.site_name}<br/>
${_("Start date")} :
% if c.excavation.start_date:
  ${c.excavation.start_date.strftime('%d / %m / %Y')}
% endif
<br/>
${_("End date")} :
% if c.excavation.end_date:
  ${c.excavation.end_date.strftime('%d / %m / %Y')}
% endif
<br/>
${_("Appreciation")} : ${c.excavation.appreciation}<br/>

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.excavation.excavation_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.excavation.excavation_id))} |

