## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />
##
<article>
  <section>
    ${next.body()}
  </section>
</article>
<aside>
  <section>
    Actions :<br/>
    ${h.link_to(_("list"), url.current(action='list'))}<br/>
    ${h.link_to(_("new"), url.current(action='new'))}<br/>
  </section>
</aside>
##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'))}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'), class_='active')}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Admin"), url(controller='admin'))}</li>
    % endif
  </ul>
</%def>
