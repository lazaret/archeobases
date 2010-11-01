## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
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
${_("Last name")} : ${c.person.last_name}<br/>
${_("First name")} : ${c.person.first_name}<br/>
${_("Title")} : ${c.person.title}<br/>
${_("Birth Date")} :
% if c.person.birth_date:
  ${c.person.birth_date.strftime('%d / %m / %Y')}
% endif
<br/>
${_("Email Address")} : ${c.person.email_address}<br/>
${_("Phone")} : ${c.person.phone}<br/>
${_("Mobile phone")} : ${c.person.mobile_phone}<br/>
${_("Activity")} : ${c.person.activity}<br/>
${_("Person type")} : ${c.person.person_type}<br/>
${_("Photo")} : ${c.person.photo}<br/>

${_("Are your sure you whan tot delete this person ?")}

${h.secure_form(url.current(action='delete', id=c.person.person_id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.person.person_id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.person.person_id))}
  </footer>
${h.end_form()}
