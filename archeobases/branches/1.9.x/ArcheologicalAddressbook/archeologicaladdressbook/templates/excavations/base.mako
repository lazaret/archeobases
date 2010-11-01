## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<section>
  ${next.body()}
</section>
##
## SIDE BOX 2
<%def name="sidebox_2()">
  <section>
    Actions :<br/>
    ${h.link_to(_("new"), url.current(action='new'))}<br/>
    search<br/>
  </section>
</%def>
