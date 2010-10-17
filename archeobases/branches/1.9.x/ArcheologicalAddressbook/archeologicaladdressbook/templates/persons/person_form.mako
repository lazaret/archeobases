## -*- coding: utf-8 -*-
##
<%def name="person_form()">
  <% f = h.ModelTags(c.person, date_format='%m/%d/%Y') %>
##
  <fieldset>
    <legend>${_("Person")}</legend>
    <p><label for="last_name" class="mandatory"> ${_("Last name")} *</label> ${f.text(name="last_name")}<p/>
    <p><label for="first_name" class="mandatory"> ${_("First name")} *</label> ${f.text(name="first_name")}<p/>
    <p><label for="title">${_("Title")}</label> ${f.text(name="title")}<p/>
    <p><label for="birth_date">${_("Birth Date")}</label> ${f.date(name="birth_date")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="email_address">${_("Email Address")}</label> ${f.text(name="email_address")}<p/>
    <p><label for="phone">${_("Phone")}</label> ${f.text(name="phone")}<p/>
    <p><label for="mobile_phone">${_("Mobile phone")}</label> ${f.text(name="mobile_phone")}<p/>
    <p><label for="activity">${_("Activity")}</label> ${f.text(name="activity")}<p/>
  </fieldset>
</%def>
