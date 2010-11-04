## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Login")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Login")}
</%def>
<!-- root login template -->
##
<section>
  ${h.form(url("/login_handler"), class_="login")}
    <header>
    </header>
    <fieldset>
      <legend>${_("Login")}</legend>
      <p><label for="login" class="mandatory">${_("Username")}</label> ${h.text(name="login", maxlength=16)}<p/>
      <p><label for="password" class="mandatory">${_("Password")}</label> ${h.password(name="password", maxlength=80)}<p/>
    </fieldset>
    <footer>
      <button name="login_button" type="submit"><img src="/images/tick.png"/>${_("Login")}</button>
    </footer>
  ${h.end_form()}
</section>
##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Login"), url.current(), class_='active')}</li>
  </ul>
</%def>
##
