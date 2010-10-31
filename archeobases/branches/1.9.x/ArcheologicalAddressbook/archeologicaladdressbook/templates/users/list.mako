## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
<%namespace file="/lib/paginate.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Users")} - ${_("List")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > \
  ${h.link_to(_("Users"), url(controller="users"))} > ${_("List")}
</%def>
##
<!-- users list template -->
##
<table>
  <thead>
    <th>${_("User name")}</th>
    <th>${_("Display name")}</th>
    <th>${_("Email address")}</th>
    <th>${_("Group")}</th>
    <th></th>
  </thead>
  <tfoot>
    <th colspan="5">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for user in c.page:
    <tr>
      <td>${user.user_name}</td>
      <td>${user.display_name}</td>
      <td>${user.email_address}</td>
      <td>${user.groups[0].group_name}</td>
      <td>
      ${h.link_to(h.image("/images/magnifier.png", alt=_("show")), url.current(action='show', id=user.user_id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url.current(action='edit', id=user.user_id))}
      ${h.link_to(h.image("/images/lock_edit.png", alt=_("change password")), url.current(action='edit_password', id=user.user_id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url.current(action='confirm_delete', id=user.user_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>
