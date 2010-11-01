## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
<%namespace file="/lib/paginate.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Addresses")} - ${_("List")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${h.link_to(_("Addresses"), url(controller="addresses"))} > ${_("List")}
</%def>
##
<!-- addresses list template -->
##
<table>
  <thead>
    <th>${_("Last name")}</th>
    <th>${_("First name")}</th>
    <th>${_("Line 1")}</th>
    <th>${_("Zip code")}</th>
    <th>${_("City")}</th>
    <th>${_("Address type")}</th>
    <th></th>
  </thead>
  <tfoot>
    <th colspan="6">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for address in c.page:
    <tr>
      <td>${address.person.last_name}</td>
      <td>${address.person.first_name}</td>
      <td>${address.address_line1}</td>
      <td>${address.zip_code}</td>
      <td>${address.city}</td>
      <td>${address.address_type}</td>
      <td>
      ${h.link_to(h.image("/images/user.png", alt=_("show")), url(controller='persons', action='show', id=address.person_id))}
      ${h.link_to(h.image("/images/magnifier.png", alt=_("show")), url.current(action='show', id=address.address_id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url.current(action='edit', id=address.address_id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url.current(action='confirm_delete', id=address.address_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>
