## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
<%namespace file="/addresses/address_display.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Addresses")} - ${_("Confirm delete")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Addresses"), url(controller="addresses"))} > ${_("Confirm delete")}
</%def>
##
<!-- addresses confirm_delete template -->
##
${_("Last name")} : ${c.address.person.last_name}<br/>
${_("First name")} : ${c.address.person.first_name}<br/>
<br/>
${address_display()}
<br />
${_("Are your sure you whan tot delete this address ?")}

${h.secure_form(url.current(action='delete', id=c.address.address_id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.address.address_id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.address.address_id))}
  </footer>
${h.end_form()}
