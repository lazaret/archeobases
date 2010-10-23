## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
<%namespace file="/users/user_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("Edit")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("Edit")}
</%def>
##
<!-- users edit template -->
##
${h.secure_form(url.current(action='update', id=c.user.user_id))}
  ${user_form()}
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
