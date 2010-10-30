## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
<%namespace file="/lib/paginate.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Admin")} - ${_("Error Log")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Admin"), url(controller="admin"))} > ${_("Error Log")}
</%def>
##
<!-- admin errorlog template -->
##
<table>
  <thead>
    <th>${_("Date")}</th>
    <th>${_("Time")}</th>
    <th>${_("Level")}</th>
    <th>${_("Module")}</th>
    <th>${_("Message")}</th>
  </thead>
  <tfoot>
    <th colspan="5">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for log in c.page:
    <tr>
      <td>${log['date']}</td>
      <td>${log['time']}</td>
      <td>${log['levelname']}</td>
      <td>${log['modulename']}</td>
      <td>${log['message']}</td>
    </tr>
    % endfor
  </tbody>
</table>
