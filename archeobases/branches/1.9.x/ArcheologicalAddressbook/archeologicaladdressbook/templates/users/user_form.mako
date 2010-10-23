## -*- coding: utf-8 -*-
##
<%def name="user_form()">
  <% f = h.ModelTags(c.user, date_format='%m/%d/%Y') %>
##
  <fieldset>
    <legend>${_("User")}</legend>
    <p><label for="user_name" class="mandatory"> ${_("User name")} *</label> ${f.text(name="user_name")}<p/>
    <p><label for="Display name"> ${_("First name")} *</label> ${f.text(name="display_name")}<p/>
    <p><label for="email_address">${_("Email address")}</label> ${f.text(name="email_address")}<p/>
##    <p><label for="password">${_("Password")}</label> ${f.date(name="birth_date")}<p/>
    <p>password</p>
    <p>confirm pass </p>
    <p>group</p> Group in his fieldset ?
  </fieldset>
</%def>
