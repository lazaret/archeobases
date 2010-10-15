## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />
##
<article>
${next.body()}
</article>
<aside>
Actions :<br/>
__________<br/>

${h.link_to(_("list"), url.current(action='list'))}<br/>
${h.link_to(_("new"), url.current(action='new'))}<br/>
</aside>

##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'))}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'), class_='active')}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
  </ul>
</%def>

