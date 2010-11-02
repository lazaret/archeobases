## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/persons/person_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("New")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("New")}
</%def>
##
<!-- persons new template -->
##
${h.secure_form(url.current(action="create"))}
  <header>
  </header>
  ${person_form()}
  <footer>
##    <button name="cancel_button" type="submit"><img src="/images/cross.png"/>${_("Cancel")}</button>
    <button name="new_button" type="submit"><img src="/images/tick.png"/>${_("Submit")}</button>
  </footer>
${h.end_form()}
