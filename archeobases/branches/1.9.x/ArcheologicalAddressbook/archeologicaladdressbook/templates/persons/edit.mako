## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">${_("Persons")} - ${_("Edit")}</%def>
##
<!-- persons edit template -->

${h.secure_form(url.current(action='update', id=c.person.id))}
  <fieldset>
    <legend>${_("Person")}</legend>
    <p><label for="last_name" class="mandatory"> ${_("Last name")} *</label> ${h.text(name="last_name", value=c.person.last_name)}<p/>
    <p><label for="first_name" class="mandatory"> ${_("First name")} *</label> ${h.text(name="first_name", value=c.person.first_name)}<p/>
    <p><label for="title">${_("Title")}</label> ${h.text(name="title", value=c.person.title)}<p/>
    <p><label for="birth_date">${_("Birth Date")}</label> ${h.text(name="birth_date", value=c.person.birth_date)}<p/>
  </fieldset>
  <fieldset>
    <p><label for="email_address">${_("Email Address")}</label> ${h.text(name="email_address", value=c.person.email_address)}<p/>
    <p><label for="phone">${_("Phone")}</label> ${h.text(name="phone", value=c.person.phone)}<p/>
    <p><label for="mobile_phone">${_("Mobile phone")}</label> ${h.text(name="mobile_phone", value=c.person.mobile_phone)}<p/>
    <p><label for="activity">${_("Activity")}</label> ${h.text(name="activity", value=c.person.activity)}<p/>
  </fieldset>
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
