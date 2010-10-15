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

##
## NAV BAR
<%def name="navbar()">
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
  </ul>
</%def>