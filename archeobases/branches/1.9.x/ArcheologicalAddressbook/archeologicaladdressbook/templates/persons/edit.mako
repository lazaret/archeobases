## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
<%namespace file="/persons/person_form.mako" import="*"/>
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Persons")} - ${_("Edit")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Persons"), url(controller="persons"))} > ${_("Edit")}
</%def>
##
<!-- persons edit template -->
##
${h.secure_form(url.current(action='update', id=c.person.person_id))}
  ${person_form()}
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
