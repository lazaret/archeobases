## -*- coding: utf-8 -*-
##
<%def name="person_form()">
  <% f = h.ModelTags(c.person, date_format='%m/%d/%Y') %>
##
  ${f.hidden(name="person_id")}
##  <fieldset>
##  ${h.radio("person_type", value="person", checked=True, label=_("Person"))}
##  ${h.radio("person_type", value="member", label=_("Member"))}
##  </fieldset>
  <fieldset>
    <legend>${_("Person")}</legend>
    <p><label for="last_name" class="mandatory"> ${_("Last name")}</label> ${f.text(name="last_name", maxlength=25)}<p/>
    <p><label for="first_name" class="mandatory"> ${_("First name")}</label> ${f.text(name="first_name", maxlength=25)}<p/>
    <p><label for="title">${_("Title")}</label> ${f.select("title", [("Mr", _("Mr")), ("Mrs", _("Mrs")), ("Miss", _("Miss"))])}<p/>
    <p><label for="birth_date">${_("Birth Date")}</label> ${f.date(name="birth_date")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="email_address">${_("Email Address")}</label> ${f.text(name="email_address")}<p/>
    <p><label for="phone">${_("Phone")}</label> ${f.text(name="phone", maxlength=15)}<p/>
    <p><label for="mobile_phone">${_("Mobile phone")}</label> ${f.text(name="mobile_phone", maxlength=15)}<p/>
    <p><label for="activity">${_("Activity")}</label> ${f.text(name="activity", maxlength=25)}<p/>
  </fieldset>

  <fieldset class="collapsed">
    <legend>${_("Member")}</legend>
    <p><label for="member_number">${_("Member number")}</label> ${f.text(name="member_number")}<p/>
    <p><label for="last_fee_date">${_("Last fee date")}</label> ${f.date(name="last_fee_date")}<p/>
  </fieldset>
</%def>
