# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>
<%namespace file="/component/flash_message.mako" import="*"/>
<%namespace file="/component/forms/fieldset_buttons.mako" import="*"/>

<%def name="page_name()">${_("Image")}</%def>

## right sidebar
<%def name="sidebar()">
  ${sidebox_login()}
  ${sidebox_helptip()}
</%def>

## main content
${flash_message()}


${h.form(h.url_for(action="create"), name="form", multipart=True)}
  <div id="mainForm">
    <fieldset>
      <legend>${_("Image upload")}</legend>
      <div id="fieldset_buttons">
          ${helptip_button(_("Image upload help tip"))}
      </div>
      <p><label for="image_file"><strong>${_("Upload file")}</strong></label> ${h.file("image_file")} </p>
      <p><label for="description">${_("Description")}</label> ${h.textarea(name="description", cols=52, maxlength=500)} </p>
    </fieldset>
  </div>
  <div id="footForm">
    <button name="new_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Submit")}</button>
  </div>
${h.end_form()}
