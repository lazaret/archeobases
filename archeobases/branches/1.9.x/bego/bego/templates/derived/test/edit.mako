# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sidebar.mako" import="*"/>


<%def name="page_name()">${_("Rock edit")}</%def>

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
##<h1>${self.page_name()}</h1>

##<p>Formulaire de type webhelper sur la table de test ...</p>

## Form created with webhelpers
##${h.form(h.url_for(action="save", id=c.dico.id))}
##Id: ${c.dico.id} <br>
##Term: ${h.text(name="term", value=c.dico.term)} <br>
##Definition: ${h.textarea(name="definition", content=c.dico.definition, rows=3, cols=40)} <br>
##<br>
## save the record and will redirect to view
##${h.submit(name="save_button", value="Save")}
## save the record and will redirect to new
##${h.submit(name="new_button", value="Save and add another")}
## save the record and will redirect to edit
##${h.submit(name="edit_button", value="Save and continue editing")}
## delete the record
##&nbsp;&nbsp;${h.submit(name="delete_button", value="Delete")}
##${h.end_form()}



