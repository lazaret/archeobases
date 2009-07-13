# -*- coding: utf-8 -*-

<%namespace file="/component/forms/select_geo_zone.mako" import="*"/>
<%namespace file="/component/forms/fieldset_buttons.mako" import="*"/>


## rock related fieldset used in the rock form

<%def name="fieldset_rock()">
  <fieldset>
    <legend>${_("Rock")}</legend>
    <div id="fieldset_buttons">
      ${helptip_button(_("rock fieldset helptip"))}
    </div>
    <p><label for="geo_zone" class="large_label">${_("Zone")}</label> ${select_geo_zone()}
    &nbsp;&nbsp;${_("Group")} ${h.select("geo_group", None, [1, 2, 3, 4, 5])}
    &nbsp;&nbsp;${_("Rock")} ${h.text(name="rock_number", size=8, maxlength=8)}</p>
    <p><label for="rock_name" class="large_label">${_("Nom de la roche")}</label> ${h.text(name="rock_name", size=48, maxlength=152)}</p>
  </fieldset>
</%def>

