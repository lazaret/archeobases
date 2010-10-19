## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Logs")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(_("Addressbook"), "/")} > ${h.link_to(_("Admin"), h.url(controller="admin"))} > ${_("Logs")}
</%def>
##
<!-- admin index template -->
##

<table>
  <thead>
    <th>${_("Time")}</th>
    <th>${_("Level")}</th>
    <th>${_("Module")}</th>
    <th>${_("Message")}</th>
  </thead>
  <tfoot>
##    <th colspan="3">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    <tr>
      <td>10:27:56,004</td>
      <td>INFO</td>
      <td>sqlalchemy</td>
      <td>SELECT tg_user.password AS tg_user_password, tg_user.user_id AS tg_user_user_id, tg_user.user_name AS tg_user_user_name, tg_user.email_address AS tg_user_email_address, tg_user.display_name AS tg_user_display_name, tg_user.created AS tg_user_created FROM tg_user WHERE tg_user.user_name = ?</td>
    </tr>
    <tr>
      <td>10:27:47,893</td>
      <td>INFO</td>
      <td>paste</td>
      <td>Shutting down threadpool</td>
    </tr>
    <tr>
      <td>10:27:47,893</td>
      <td>INFO</td>
      <td>paste</td>
      <td>Shutting down threadpool</td>
    </tr>
    <tr>
      <td>10:27:47,893</td>
      <td>INFO</td>
      <td>paste</td>
      <td>Shutting down threadpool</td>
    </tr>
  </tbody>
</table>