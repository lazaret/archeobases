## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
<%namespace file="/addresses/address_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Addresses")} - ${_("Edit")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Addresses"), url(controller="addresses"))} > ${_("Edit")}
</%def>
##
<!-- addresses edit template -->
##
${_("Last name")} : ${c.address.person.last_name}<br/>
${_("First name")} : ${c.address.person.first_name}<br/>
<br/>

${h.secure_form(url.current(action='update', id=c.address.address_id))}
  ${address_form()}
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
