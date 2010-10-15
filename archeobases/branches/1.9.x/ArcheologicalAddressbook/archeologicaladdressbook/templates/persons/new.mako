## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">${_("Persons")} - ${_("New")}</%def>
##
<!-- persons new template -->

${h.secure_form(url.current(action="create"))}
  <fieldset>
    <legend>${_("Person")}</legend>
    <p><label for="last_name" class="mandatory">${_("Last name")} *</label> ${h.text(name="last_name")}<p/>
    <p><label for="first_name" class="mandatory">${_("First name")} *</label> ${h.text(name="first_name")}<p/>
    <p><label for="title">${_("Title")}</label> ${h.text(name="title")}<p/>
    <p><label for="birth_date">${_("Birth Date")}</label> ${h.text(name="birth_date")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="email_address">${_("Email Address")}</label> ${h.text(name="email_address")}<p/>
    <p><label for="phone">${_("Phone")}</label> ${h.text(name="phone")}<p/>
    <p><label for="mobile_phone">${_("Mobile phone")}</label> ${h.text(name="mobile_phone")}<p/>
    <p><label for="activity">${_("Activity")}</label> ${h.text(name="activity")}<p/>
  </fieldset>
  <footer>
##    <button name="cancel_button" type="submit"><img src="/images/cross.png"/>${_("Cancel")}</button>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
