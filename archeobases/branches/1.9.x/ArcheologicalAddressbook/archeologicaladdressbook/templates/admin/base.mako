## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />
##
<section>
  ${next.body()}
</section>
##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'))}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
    <li>${h.link_to(_("Users"), url(controller='users'), class_='admin')}</li>
    <li>${h.link_to(_("Admin"), url(controller='admin'), class_='active')}</li>
  </ul>
</%def>
##
## SIDE BAR
<%def name="sidebar()">
  <section>
    ${h.link_to(_("Database admin"), url(controller='dbadmin'))}<br/>
    ${h.link_to(_("Access log"), url.current(action='accesslog'))}<br/>
    ${h.link_to(_("Error log"), url.current(action='errorlog'))}<br/>
  </section>
</%def>