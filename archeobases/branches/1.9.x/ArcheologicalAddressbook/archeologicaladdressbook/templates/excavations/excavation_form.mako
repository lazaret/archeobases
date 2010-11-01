## -*- coding: utf-8 -*-
##
<%def name="excavation_form()">
  <% f = h.ModelTags(c.excavation, date_format='%m/%d/%Y') %>
##
  ${f.hidden(name="excavation_id")}
  <fieldset>
    <legend>${_("Excavation")}</legend>
    <p><label for="site_name" class="mandatory"> ${_("Site name")} *</label> ${f.text(name="site_name", maxlength=25)}<p/>
    <p><label for="start_date" class="mandatory"> ${_("Start date")} *</label> ${f.date(name="start_date")}<p/>
    <p><label for="end_date" class="mandatory"> ${_("End date")} *</label> ${f.date(name="end_date")}<p/>
    <p><label for="appreciation">${_("Appreciation")}</label> ${f.text(name="appreciation", maxlength=25)}<p/>
  </fieldset>
</%def>
