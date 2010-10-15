## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">${_("Persons")} - ${_("New")}</%def>
##
<!-- persons new template -->

${h.secure_form(url.current(action='create'))}
  <fieldset>
    <legend>${_("Add a person")}</legend>
    ${_("Last name")} ${h.text(name="last_name")}<br/>
    ${_("First name")} ${h.text(name="first_name")}<br/>
    ${_("Title")} ${h.text(name="title")}<br/>
    ${_("Birth Date")} ${h.text(name="birth_date")}<br/>
  </fieldset>
  <fieldset>
    ${_("Email Address")} ${h.text(name="email_address")}<br/>
    ${_("Phone")} ${h.text(name="phone")}<br/>
    ${_("Mobile phone")} ${h.text(name="mobile_phone")}<br/>
    ${_("Activity")} ${h.text(name="activity")}<br/>
  </fieldset>
  ${h.submit('Submit', 'Submit')}
${h.end_form()}
