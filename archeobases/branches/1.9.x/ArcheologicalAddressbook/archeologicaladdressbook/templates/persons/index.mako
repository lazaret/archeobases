## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/search/quick_search_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${_("Persons")}
</%def>
##
<!-- persons index template -->
##
${quick_search_form()}

<section>
  <head>
    Last changes
  </head>

<table>
  <caption>
  </caption>
  <thead>
    <th>${_("Last name")}</th>
    <th>${_("First name")}</th>
    <th>${_("Change date")}</th>
    <th>${_("Changed by")}</th>
  </thead>
  <tfoot>
  </tfoot>
  <tbody>
    % for person in c.person:
    <tr>
      <td>${person.last_name}</td>
      <td>${person.first_name}</td>
      <td>${person.timestamp.strftime('%d %b %Y %H:%M')}</td>
      <td>${person.user_name}</td>
      <td>
      ${h.link_to(h.image("/images/page_white_magnify.png", alt=_("show")), url.current(action='show', id=person.person_id))}
##      ${h.link_to(h.image("/images/pencil.png", alt=_("edit")), url.current(action='edit', id=person.person_id))}
##      ${h.link_to(h.image("/images/bin_closed.png", alt=_("delete")), url.current(action='confirm_delete', id=person.person_id))}
      </td>
    </tr>
    % endfor
  </tbody>
</table>


</section>