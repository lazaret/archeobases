## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Addresses")} - ${_("Confirm delete")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Addresses"), url(controller="addresses"))} > ${_("Confirm delete")}
</%def>
##
<!-- adresses confirm_delete template -->
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

${_("Are your sure you whan tot delete this address ?")}

${h.secure_form(url.current(action='delete', id=c.address.id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.address.id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.address.id))}
  </footer>
${h.end_form()}
