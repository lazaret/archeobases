## -*- coding: utf-8 -*-
<%inherit file="/excavations/base.mako" />
<%namespace file="/excavations/excavation_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Excavations")} - ${_("New")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > \
  ${h.link_to(_("Excavations"), url(controller="excavations"))} > ${_("New")}
</%def>
##
<!-- excavations new template -->
##
${_("Last name")} : ${c.person.last_name}<br/>
${_("First name")} : ${c.person.first_name}<br/>
<br/>

${h.secure_form(url.current(action="create"))}
${h.hidden(name="person_id", value=c.person.person_id)}
  ${excavation_form()}
  <footer>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
