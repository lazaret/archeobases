# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>

<%namespace file="/derived/rock/main_form.mako" import="*"/>

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

## breadcrumb
<%def name="breadcrumb()">
  ${h.link_to(c.site_short_name , "/")} &rsaquo; ${self.page_name()} &rsaquo;
</%def>

## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_search()}
</%def>

## main content

${h.form(h.url_for(action="save", id=c.rock.id))}
##<div id="titleForm">${self.page_name()}</div>
${main_form()}
<div id="footForm">
  <button name="delete_button" type="submit" class="negative"><img src="/images/cross.png"/>${_("Delete")}</button>
  <button name="new_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Save & New")}</button>
  <button name="edit_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Save & Modify")}</button>
</div>
${h.end_form()}
