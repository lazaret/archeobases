# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>


<%def name="page_name()">${_("Image list")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_helptip()}
</%def>

## main content
<h1>${self.page_name()}</h1>

<p>Liste la table image ...</p>

<ul id="list">
% for image in c.image:
<li>
${image.id} ${image.filename} ${image.description} <small>[ ${h.link_to("view", h.url_for(action="view", id=image.id))} | ${h.link_to("delete", h.url_for(action="delete", id=image.id))} ]</small>
</li>
% endfor
</ul>


