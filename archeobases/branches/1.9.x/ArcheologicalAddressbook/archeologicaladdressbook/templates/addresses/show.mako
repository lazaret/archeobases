## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
<%namespace file="/addresses/address_display.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Addresses")} - ${_("Show")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Addresses"), url.current(controller="addresses"))} > ${_("Show")}
</%def>
##
<!-- addresses show template -->
##
${_("Last name")} : ${c.address.person.last_name}<br/>
${_("First name")} : ${c.address.person.first_name}<br/>
<br/>
${address_display()}
<br />

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.address.address_id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.address.address_id))} |

