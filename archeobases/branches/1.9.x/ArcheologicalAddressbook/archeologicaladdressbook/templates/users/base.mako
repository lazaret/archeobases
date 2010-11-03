## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<section>
  ${next.body()}
</section>
##
## SIDE BOX 2
<%def name="sidebox_2()">
  <section>
    ${h.image("/images/add.png", alt=_("Add new user"))}
    ${h.link_to(_("Add new user"), url(controller='users', action='new'))}<br/>
    ${h.image("/images/table.png", alt=_("List users"))}
    ${h.link_to(_("List users"), url(controller='users', action='list'))}<br/>
  </section>
</%def>
