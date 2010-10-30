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


<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.person.id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.person.id))} |

