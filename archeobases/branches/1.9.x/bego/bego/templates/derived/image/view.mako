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


${h.form(h.url_for(action="update", id=c.id), name="form")}

<div id="topForm">
  <fieldset>
    <legend>${_("Image description")}</legend>
      <p><label for "description" class="large_label">${_("Description")} : </label>${c.description}</p>
      <p><label for "file_type" class="large_label">${_("File type")} : </label>JPEG</p>
  </fieldset>
</div>

<div id="image_preview">
${h.link_to(h.image(c.preview_path, c.filename), h.url_for(action="display", id=c.id, filename=c.filename))}
</div>

<div id="footForm">
  <button name="delete_button" type="submit" class="negative"><img src="/images/cross.png"/>${_("Delete")}</button>
  <button name="edit_button" type="submit" class="positive"><img src="/images/tick.png"/>${_("Modify")}</button>
</div>
${h.end_form()}


<%def name="lightbox()">
test
</%def>
