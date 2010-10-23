## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
<%namespace file="/users/user_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("New")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("New")}
</%def>
##
<!-- users new template -->
##
${h.secure_form(url.current(action="create"))}
  ${user_form()}
  <footer>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
