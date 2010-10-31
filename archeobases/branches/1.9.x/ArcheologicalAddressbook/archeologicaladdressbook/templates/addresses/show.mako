## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
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
${_("Line 1")} : ${c.address.address_line1}<br/>
${_("Line 2")} : ${c.address.address_line2}<br/>
${_("Line 3")} : ${c.address.address_line3}<br/>
${_("Zip code")} : ${c.address.zip_code}<br/>
${_("City")} : ${c.address.city}<br/>
${_("Country")} : ${c.address.country}<br/>
${_("Address type")} : ${c.address.address_type}<br/>

<br>________________<br>
${h.link_to(_("Edit"), url.current(action='edit', id=c.address.id))} |
${h.link_to(_("Delete"), url.current(action='confirm_delete', id=c.address.id))} |

