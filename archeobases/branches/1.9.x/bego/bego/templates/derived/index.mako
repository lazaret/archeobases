# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />

<%def name="page_name()">${_("Homepage")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/" class="active">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>


## main content
<h1>${self.page_name()}</h1>

<p>Lorem ipsum dolor ...</p>

