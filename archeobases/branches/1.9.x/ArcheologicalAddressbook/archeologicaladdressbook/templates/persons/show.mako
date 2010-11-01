## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Show")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url.current(controller="persons"))} > ${_("Show")}
</%def>
##
<!-- persons show template -->
##
${_("Last name")} : ${c.person.last_name}<br/>
${_("First name")} : ${c.person.first_name}<br/>
${_("Title")} : ${c.person.title}<br/>
${_("Birth Date")} :
% if c.person.birth_date:
  ${c.person.birth_date.strftime('%d / %m / %Y')}
% endif
<br/>
${_("Email Address")} : ${c.person.email_address}<br/>
${_("Phone")} : ${c.person.phone}<br/>
${_("Mobile phone")} : ${c.person.mobile_phone}<br/>
${_("Activity")} : ${c.person.activity}<br/>
${_("Person type")} : ${c.person.person_type}<br/>
${_("Photo")} : ${c.person.photo}<br/>


<table>
  <thead>
    <th>${_("Line 1")}</th>
    <th>${_("Zip code")}</th>
    <th>${_("City")}</th>
    <th>${_("Address type")}</th>
    <th></th>
  </thead>
  <tfoot>
##    <th colspan="6">${paginate(c.page)}</th>
  </tfoot>
  <tbody>
    % for address in c.person.addresses:
    <tr>
      <td>${address.address_line1}</td>
      <td>${address.zip_code}</td>
      <td>${address.city}</td>
      <td>${address.address_type}</td>
      <td>
      ${h.link_to(h.image("/images/vcard.png", alt=_("show")), url(controller='addresses', action='show', id=address.address_id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url(controller='addresses', action='edit', id=address.address_id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url(controller='addresses', action='confirm_delete', id=address.address_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.person.person_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.person.person_id))} |
<br>________________<br>
${h.link_to(_("Add address"), url(controller='addresses', action='new', id=c.person.person_id))}
<br>________________<br>
${h.link_to(_("Add excavation"), url(controller='excavations', action='new', id=c.person.person_id))}
