# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>
<%namespace file="/component/flash_message.mako" import="*"/>


<%def name="page_name()">${_("Error")} ${c.code}</%def>



## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_helptip()}
</%def>

## main content
${flash_message()}

## back button if 404 error
% if c.code == "404":
${h.form("", name="form")}
  <div id="footForm">
    <input type="button" name="back_button" value="${_("Go back")}" onclick="history.back();" />
  </div>
${h.end_form()}
% endif
