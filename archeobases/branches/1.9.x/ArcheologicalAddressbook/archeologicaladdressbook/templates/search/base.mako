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
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Admin"), url(controller='admin'))}</li>
    % endif
  </ul>
</%def>
##
## SIDE BAR
<%def name="sidebar()">
  <section>
    search aside
  </section>
</%def>
