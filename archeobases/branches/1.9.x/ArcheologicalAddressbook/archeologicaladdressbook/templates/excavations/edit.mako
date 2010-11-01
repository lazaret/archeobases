## -*- coding: utf-8 -*-
<%inherit file="/excavations/base.mako" />
<%namespace file="/excavations/excavation_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Excavations")} - ${_("Edit")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Excavations"), url(controller="excavations"))} > ${_("Edit")}
</%def>
##
<!-- excavations edit template -->
##
${_("Last name")} : ${c.excavation.person.last_name}<br/>
${_("First name")} : ${c.excavation.person.first_name}<br/>
<br/>

${h.secure_form(url.current(action='update', id=c.excavation.excavation_id))}
  ${excavation_form()}
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
