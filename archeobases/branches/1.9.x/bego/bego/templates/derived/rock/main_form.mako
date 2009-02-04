# -*- coding: utf-8 -*-

<%namespace file="/derived/rock/select_zone.mako" import="*"/>

## Main form for Rocks

<%def name="main_form()">
  <div id="topForm">
    <fieldset>
      <legend>${_("Rock")}</legend>
      <p><label for="geo_zone" class="large_label">${_("Zone")}</label> ${select_zone()}
      &nbsp;&nbsp;${_("Group")} ${h.select("geo_group", None, [1, 2, 3, 4, 5])}
      &nbsp;&nbsp;${_("Rock")} ${h.text(name="rock_number", size=8, maxlength=8)}</p>
      <p><label for="rock_name" class="large_label">${_("Nom de la roche")}</label> ${h.text(name="rock_name", size=48, maxlength=152)}</p>
    </fieldset>
  </div>
  <div id="mainForm">
    <div id="form_left">
      <fieldset>
        <legend>${_("Lambert III cordinates")}</legend>
        <p><label for="x" class="little_label">X</label> ${h.text(name="x", size=10, maxlength=10)}</p>
        <p><label for="y" class="little_label">Y</label> ${h.text(name="y", size=10, maxlength=10)}</p>
        <p><label for="z" class="little_label">Z</label> ${h.text(name="z", size=10, maxlength=10)}</p>
      </fieldset>
      <fieldset >
        <legend>${_("Rock measures")}</legend>
        <p><label for="length">${_("Length")}</label> ${h.text(name="length", size=3, maxlength=3)} <span class="legend">cm</span></p>
        <p><label for="width">${_("Width")}</label> ${h.text(name="width", size=3, maxlength=3)} <span class="legend">cm</span></p>
##        ${h.checkbox(name="check", label="Non mesurable")}
      </fieldset>
      <fieldset>
        <legend>${_("Geographical context")}</legend>
        <div id="fieldset_left">
          ${h.checkbox(name="geo_context_torrent", label=_("Torrent"))}<br>
          ${h.checkbox(name="geo_context_lake", label=_("Lake"))}<br>
          ${h.checkbox(name="geo_context_bog", label=_("Bog"))}<br>
        </div>
        <div id="fieldset_right">
          ${h.checkbox(name="geo_context_pass", label=_("Pass"))}<br>
          ${h.checkbox(name="geo_context_summit", label=_("Summit"))}<br>
        </div>
      </fieldset>
      </div>
      <div id="form_right">
        <fieldset>
          <legend>${_("Rock type")}</legend>
          ${h.radio("rock_type", "test", label=_(u"Grès"))}<br>
          ${h.radio("rock_type", "test", label=_(u"Grès schisteux"))}<br>
          ${h.radio("rock_type", "test", label=_(u"Schiste"))}<br>
          ${h.radio("rock_type", "test", label=_(u"Schiste gréseux"))}<br>
        </fieldset>
        <fieldset>
          <legend>${_("Outcrop type")}</legend>
          <div id="fieldset_buttons">
            <img src="/images/help.png" alt=${_("Help")}/><img src="/images/arrow_rotate_clockwise.png" alt=${_("Reset")}/>
          </div>
          <div id="fieldset_left">
            ${h.radio("outcrop_type", "test", label=_(u"Bloc"))}<br>
            ${h.radio("outcrop_type", "test", label=_(u"Dalle"))}<br>
            ${h.radio("outcrop_type", "test", label=_(u"Dôme"))}<br>
          </div>
          <div id="fieldset_right">
            ${h.radio("outcrop_type", "test", label=_(u"Paroi"))}<br>
            ${h.radio("outcrop_type", "test", label=_(u"Stele"))}<br>
          </div>
        </fieldset>
        <fieldset>
          <legend>${_("Provision")}</legend>
          ${h.radio("geo_context_torrent", "test", label=(u"Caché"))}<br>
          ${h.radio("geo_context_torrent", "test", label=(u"Ostentatoire"))}<br>
          ${h.radio("geo_context_torrent", "test", label=(u"Indiférent"))}<br>
        </fieldset>
      </div>
      <div id="clear"></div>
      <div id="description">
        <fieldset>
          <legend>${_("Description")}</legend>
          <center>${h.textarea(name="description", rows=2, cols=72, maxlength=500)}</center>
        </fieldset>
      </div>
  </div>
  <div id="clear"></div>
</%def>

