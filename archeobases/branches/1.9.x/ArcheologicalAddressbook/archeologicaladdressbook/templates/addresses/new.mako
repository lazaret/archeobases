## -*- coding: utf-8 -*-
<%inherit file="/addresses/base.mako" />
<%namespace file="/addresses/address_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Addresses")} - ${_("New")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Addresses"), url(controller="addresses"))} > ${_("New")}
</%def>
##
<!-- addresses new template -->
##
${_("Last name")} : ${c.person.last_name}<br/>
${_("First name")} : ${c.person.first_name}<br/>
<br/>

${h.secure_form(url.current(action="create"))}
${h.hidden(name="person_id", value=c.person.id)}
  ${address_form()}
  <footer>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
