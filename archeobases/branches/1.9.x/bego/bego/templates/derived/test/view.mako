# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sidebar.mako" import="*"/>


<%def name="page_name()">${_("Test view")}</%def>

## top nav bar
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
  ${sidebox_search()}
</%def>


## main content
<h1>${self.page_name()}</h1>

<p>Ce formulaire travaille sur la table de test ...</p>

Id : ${c.dico.id} <br>
Term : ${c.dico.term} <br>
Definition : ${c.dico.definition} <br><br>
${h.link_to("modify", h.url_for(action="edit", id=c.dico.id))} | ${h.link_to("delete", h.url_for(action="delete", id=c.dico.id))}
