## -*- coding: utf-8 -*-

<%inherit file="/base.mako" />
<!-- index_person template -->

index_person<br/><br/>

Actions :<br/>
__________<br/>

${h.link_to(_("list"), url.current(action='list'))}<br/>
${h.link_to(_("new"), url.current(action='new'))}<br/>
