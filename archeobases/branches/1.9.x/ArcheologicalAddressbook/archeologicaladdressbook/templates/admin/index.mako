## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<%def name="page_title()">${_("Admin")}</%def>
##
<!-- admin index template -->


${h.link_to(_("Database"), url(controller='dbadmin'))}
