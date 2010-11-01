## -*- coding: utf-8 -*-
<%inherit file="/excavations/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Excavations")} - ${_("Confirm delete")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Excavations"), url(controller="excavations"))} > ${_("Confirm delete")}
</%def>
##
<!-- excavations confirm_delete template -->
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

${_("Are your sure you whan tot delete this excavation ?")}

${h.secure_form(url.current(action='delete', id=c.excavation.excavation_id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.excavation.excavation_id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.excavation.excavation_id))}
  </footer>
${h.end_form()}

