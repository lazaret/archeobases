# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>
<%namespace file="/component/flash_message.mako" import="*"/>
<%namespace file="/derived/rock/main_form.mako" import="*"/>

<%def name="page_name()">${_("Image")}</%def>

## right sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_helptip()}
</%def>

## main content
${flash_message()}

${h.form(h.url_for(action="create"), name="form", multipart=True)}
Upload file: ${h.file("image_file")} <br />
File description: ${h.text("description")} <br />
${h.submit("Submit", "Submit")}
${h.end_form()}
