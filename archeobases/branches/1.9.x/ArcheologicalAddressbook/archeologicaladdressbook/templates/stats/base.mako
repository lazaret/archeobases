## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />
##
<article>
${next.body()}
</article>
<aside>
aside
</aside>

##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'))}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'), class_='active')}</li>
  </ul>
</%def>

