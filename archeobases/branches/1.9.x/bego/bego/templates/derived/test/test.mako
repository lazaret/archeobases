# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sidebar.mako" import="*"/>


<%def name="page_name()">${_("Index de test")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/test" class="active">${_("Test")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_new()}
  ${sidebox_search()}
</%def>

## main content
<h1>${self.page_name()}</h1>

<p>Cet index travaille sur la table de test ...</p>

