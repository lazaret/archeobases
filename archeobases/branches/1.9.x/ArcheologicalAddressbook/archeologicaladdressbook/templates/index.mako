## -*- coding: utf-8 -*-
<%inherit file="/base.mako" />\
<%def name="page_title()">${_("Main index page")}</%def>\
##
<!-- root index template -->
<article>
  <section>
    article
  </section>
</article>
<aside>
  <section>
    aside
  </section>
</aside>

<%! from repoze.what.predicates import has_permission %>
##
## NAV BAR
<%def name="navbar()">
  % if c.userid:
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Admin"), url(controller='admin'))}</li>
    % endif
  </ul>
  % else:
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
  </ul>
  % endif
</%def>
