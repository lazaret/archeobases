## -*- coding: utf-8 -*-

<%inherit file="/base.mako" />
<%def name="page_title()">${_("Persons")}</%def>
<!-- persons index template -->


Actions :<br/>
__________<br/>

${h.link_to(_("list"), url.current(action='list'))}<br/>
${h.link_to(_("new"), url.current(action='new'))}<br/>
