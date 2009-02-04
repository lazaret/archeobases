# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sidebar.mako" import="*"/>

<%def name="page_name()">${_("Test new")}</%def>

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
  ${sidebox_search()}
</%def>

## main content
<h1>${self.page_name()}</h1>

<p>Formulaire de type webhelper sur la table de test ...</p>

## Form created with webhelpers
${h.form(h.url_for(action="save", id=None))}
Term: ${h.text(name="term")} <br>
Definition: ${h.textarea(name="definition", rows=3, cols=40)} <br>
<br>
## save the record and will redirect here with a new empy form
${h.submit(name="new_button", value="Save & New")}
## save the record and will redirect the edit form
${h.submit(name="edit_button", value="Save & Modify")}
## save the record and will redirect to view
${h.submit(name="save_button", value="Save")}
${h.end_form()}


