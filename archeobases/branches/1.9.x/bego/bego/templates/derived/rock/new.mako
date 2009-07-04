# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>
<%namespace file="/component/flash_message.mako" import="*"/>
<%namespace file="/derived/rock/main_form.mako" import="*"/>

<%def name="page_name()">${_("Rock")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/rock" class="active">${_("Rock")}</a></li>
    <li><a href="/face">${_("Face")}</a></li>
    <li><a href="/figure">${_("Figure")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## breadcrumb
<%def name="breadcrumb()">
  ${h.link_to(c.site_short_name , "/")}&nbsp;&nbsp;&rsaquo;&nbsp;&nbsp;
  ${h.link_to(_("rock"), h.url_for(action="index"))}&nbsp;&nbsp;&rsaquo;&nbsp;&nbsp;${_("add new")}
</%def>

## right sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_actions()}
  ${sidebox_helptip()}
  ${sidebox_image()}
</%def>

## main content
${flash_message()}

${h.form(h.url_for(action="save", id=None), name="form")}
${main_form()}
<div id="footForm">
  <button name="new_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Save & New")}</button>
  <button name="edit_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Save & Modify")}</button>
</div>
${h.end_form()}
