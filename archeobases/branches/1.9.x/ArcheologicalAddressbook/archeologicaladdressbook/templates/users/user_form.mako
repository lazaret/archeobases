## -*- coding: utf-8 -*-
##
<%def name="user_form()">
  <% f = h.ModelTags(c.user, date_format='%m/%d/%Y') %>
##
  <fieldset>
    <legend>${_("User")}</legend>
    <p><label for="user_name" class="mandatory"> ${_("User name")} *</label> ${f.text(name="user_name")}<p/>
    <p><label for="Display name"> ${_("Display name")}</label> ${f.text(name="display_name")}<p/>
    <p><label for="email_address">${_("Email address")}</label> ${f.text(name="email_address")}<p/>
    <p><label for="password">${_("Password")}</label> ${f.password(name="password")}<p/>
##    <p><label for="confirm_password">${_("Password")}</label> ${f.password(name="confirm_password")}<p/>
##
##
## problem h instead of f !!!
##    <p><label for="group">${_("Group")}</label> ${h.select("editors", 1L, [("editors", _("Editors")), ("managers", _("Managers"))])}</p>
  </fieldset>
</%def>
