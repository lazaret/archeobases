## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
<%namespace file="/lib/paginate.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Access Log")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > ${_("Access Log")}
</%def>
##
<!-- admin accesslog template -->
##
<table>
  <thead>
    <th>${_("Date")}</th>
    <th>${_("Time")}</th>
    <th>${_("Host")}</th>
    <th>${_("User")}</th>
    <th>${_("Method")}</th>
    <th>${_("Path")}</th>
    <th>${_("Status")}</th>
  </thead>
  <tfoot>
    <th colspan="7">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for log in c.page:
    <tr>
      <td>${log['date']}</td>
      <td>${log['time']}</td>
      <td>${log['host']}</td>
      <td>${log['userid']}</td>
      <td>${log['method']}</td>
      <td>${log['path']}</td>
      <td>${log['statuscode']}</td>
    </tr>
    % endfor
  </tbody>
</table>
