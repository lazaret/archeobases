## -*- coding: utf-8 -*-
<%inherit file="/admin/base.mako" />
##
<%def name="page_title()">${_("Admin")}</%def>
##
<!-- admin index template -->
##
${h.link_to(_("Database"), url(controller='dbadmin'))}

Manage users

Config options

Save / restore database

add alert to check default users and pass

stats

logs
