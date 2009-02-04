# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sidebar.mako" import="*"/>

<%def name="page_name()">${_("Rock")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/rock" class="active">${_("Rock")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_search()}
</%def>

## main content
<h1>${self.page_name()}</h1>


${h.link_to(_("List all rocks"), h.url_for(action="list", id=None))}<br>
<br>
${h.link_to(_("Search a rock"), h.url_for(action="search", id=None))}<br>
<br>
${h.link_to(_("Add a rock"), h.url_for(action="new"))}<br>
