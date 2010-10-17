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
    aside
  </section>
</aside>

##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'))}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'), class_='active')}</li>
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Admin"), url(controller='admin'))}</li>
    % endif
  </ul>
</%def>
