## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/lib/paginate.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("List")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("List")}
</%def>
##
<!-- persons list template -->
##
<table>
  <caption>Titre du tableau</caption>
  <thead>
    <th>${_("Last name")}</th>
    <th>${_("First name")}</th>
    <th></th>
  </thead>
  <tfoot>
    <th colspan="3">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for person in c.page:
    <tr>
      <td>${person.last_name}</td>
      <td>${person.first_name}</td>
      <td>
      ${h.link_to(h.image("/images/magnifier.png", alt=_("show")), url.current(action='show', id=person.id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url.current(action='edit', id=person.id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url.current(action='confirm_delete', id=person.id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>
