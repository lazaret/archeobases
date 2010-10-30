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
    <li>${h.link_to(_("Persons"), url(controller='persons'), class_='active')}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Users"), url(controller='users'), class_='admin')}</li>
      <li>${h.link_to(_("Admin"), url(controller='admin'), class_='admin')}</li>
    % endif
  </ul>
</%def>
##
## SIDE BAR
<%def name="sidebar()">
  <section>
    Actions :<br/>
    ${h.link_to(_("list"), url.current(action='list'))}<br/>
    ${h.link_to(_("new"), url.current(action='new'))}<br/>
    search<br/>
  </section>
</%def>