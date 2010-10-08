## -*- coding: utf-8 -*-

<%inherit file="/base.mako" />
<!-- new_person template -->

new_person<br/><br/>

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

##${_("Last name")} : ${c.person.last_name}<br/>
##${_("First name")} : ${c.person.first_name}<br/>
##${_("Title")} : ${c.person.title}<br/>
##${_("Birth Date")} : ${c.person.birth_date}<br/>
##${_("Email Address")} : ${c.person.email_address}<br/>
##${_("Phone")} : ${c.person.phone}<br/>
##${_("Mobile phone")} : ${c.person.mobile_phone}<br/>
##${_("Activity")} : ${c.person.activity}<br/>
##${_("Person type")} : ${c.person.person_type}<br/>
##${_("Photo")} : ${c.person.photo}<br/>


___________


