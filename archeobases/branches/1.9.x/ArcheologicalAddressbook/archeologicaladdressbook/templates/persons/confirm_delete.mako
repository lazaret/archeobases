## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/persons/person_display.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Confirm delete")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("Confirm delete")}
</%def>
##
<!-- persons confirm_delete template -->
##
${person_display()}
<br/>
${_("Are your sure you whan tot delete this person ?")}

${h.secure_form(url.current(action='delete', id=c.person.person_id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.person.person_id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.person.person_id))}
  </footer>
${h.end_form()}
