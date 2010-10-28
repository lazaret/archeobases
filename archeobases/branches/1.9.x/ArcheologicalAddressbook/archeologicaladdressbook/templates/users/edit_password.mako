## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("Change password")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("Change password")}
</%def>
##
<!-- users edit password template -->
##
${h.secure_form(url.current(action='update_password', id=c.user.user_id))}
##  ${f.hidden(name="user_id")}
  <fieldset>
    <legend>${_("Change password")}</legend>
    <p><label for="password" class="mandatory">${_("Password")} *</label> ${h.password(name="password", maxlength=80)}<p/>
    <p><label for="password_confirm" class="mandatory">${_("Confirm password")} *</label> ${h.password(name="password_confirm", maxlength=80)}<p/>
  </fieldset>
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}