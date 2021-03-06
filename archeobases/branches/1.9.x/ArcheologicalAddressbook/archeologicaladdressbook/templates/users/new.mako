## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Users")} - ${_("New")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > \
  ${h.link_to(_("Users"), url(controller="users"))} > ${_("New")}
</%def>
##
<!-- users new template -->
##
${h.secure_form(url.current(action="create"))}
  <fieldset>
    <legend>${_("New user")}</legend>
    <p><label for="user_name" class="mandatory"> ${_("User name")} *</label> ${h.text(name="user_name", maxlength=16)}<p/>
    <p><label for="password" class="mandatory">${_("Password")} *</label> ${h.password(name="password", maxlength=80)}<p/>
    <p><label for="password_confirm" class="mandatory">${_("Confirm password")} *</label> ${h.password(name="password_confirm", maxlength=80)}<p/>
    <p><label for="Display name"> ${_("Display name")}</label> ${h.text(name="display_name")}<p/>
    <p><label for="email_address">${_("Email address")}</label> ${h.text(name="email_address")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="group_name">${_("Group")}</label> ${h.select("group_name", 1L, [("guests", _("Guests")), ("editors", _("Editors")), ("managers", _("Managers"))])}<p/>
  </fieldset>
  <footer>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
