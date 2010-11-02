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
      <li>${h.link_to(_("Admin"), url(controller='admin'), class_='admin')}</li>
    % endif
  </ul>
</%def>
##
## SIDE BOX 1
<%def name="sidebox_1()">
  <section>
    ${h.image("/images/add.png", alt=_("Add new person"))}
    ${h.link_to(_("Add a person"), url(controller='persons', action='new'))}<br/>
    ${h.image("/images/table.png", alt=_("Add new person"))}
    ${h.link_to(_("List persons"), url(controller='persons', action='list'))}<br/>
    ${h.image("/images/magnifier.png", alt=_("Add new person"))}
    Search<br/>
    ${h.image("/images/chart_bar.png", alt=_("statistics"))}
    Statistics<br/>
  </section>
</%def>
