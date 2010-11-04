## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/persons/person_display.mako" import="*"/>
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
${person_display()}

<br />
Version : ${c.person.version}<br />
Last change : ${c.person.timestamp.strftime('%d/ %m / %Y %H:%M')}
<br />

% if c.person_history:
<table>
  <thead>
    <th>${_("Last name")}</th>
    <th>${_("First name")}</th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
  </thead>
  <tbody>
    % for person in c.person_history:
    <tr>
      <td>${person.last_name}</td>
      <td>${person.first_name}</td>
      <td>${person.title}</td>
      <td>${person.email_address}</td>
      <td>${person.timestamp}</td>
      <td> roolback </td>
    </tr>
    % endfor
  </tbody>
</table>
% endif

% if c.person.addresses:
<table>
  <thead>
    <th>${_("Line 1")}</th>
    <th>${_("Zip code")}</th>
    <th>${_("City")}</th>
    <th>${_("Address type")}</th>
    <th></th>
  </thead>
  <tbody>
    % for address in c.person.addresses:
    <tr>
      <td>${address.address_line1}</td>
      <td>${address.zip_code}</td>
      <td>${address.city}</td>
      <td>${address.address_type}</td>
      <td>
      ${h.link_to(h.image("/images/page_white_magnify.png", alt=_("show")), url(controller='addresses', action='show', id=address.address_id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url(controller='addresses', action='edit', id=address.address_id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url(controller='addresses', action='confirm_delete', id=address.address_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>
% endif

% if c.person.excavations:
<table>
  <thead>
    <th>${_("Site Name")}</th>
    <th>${_("Start date")}</th>
    <th>${_("End date")}</th>
    <th>${_("Appreciation")}</th>
    <th></th>
  </thead>
  <tbody>
    % for excavation in c.person.excavations:
    <tr>
      <td>${excavation.site_name}</td>
      <td>${excavation.start_date.strftime('%d / %m / %Y')}</td>
      <td>${excavation.end_date.strftime('%d / %m / %Y')}</td>
      <td>${excavation.appreciation}</td>
      <td>
      ${h.link_to(h.image("/images/page_white_magnify.png", alt=_("show")), url(controller='excavations', action='show', id=excavation.excavation_id))}
      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url(controller='excavations', action='edit', id=excavation.excavation_id))}
      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url(controller='excavations', action='confirm_delete', id=excavation.excavation_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>
% endif

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.person.person_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.person.person_id))} |
<br>________________<br>
${h.link_to(_("Add address"), url(controller='addresses', action='new', id=c.person.person_id))}
<br>________________<br>
${h.link_to(_("Add excavation"), url(controller='excavations', action='new', id=c.person.person_id))}
