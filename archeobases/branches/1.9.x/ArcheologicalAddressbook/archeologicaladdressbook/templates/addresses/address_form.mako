## -*- coding: utf-8 -*-
##
<%def name="address_form()">
  <% f = h.ModelTags(c.address, date_format='%m/%d/%Y') %>
##
##  ${f.hidden(name="address_id")}
  <fieldset>
    <legend>${_("Address")}</legend>
    <p><label for="address_line1" class="mandatory"> ${_("Line 1")} *</label> ${f.text(name="address_line1", maxlength=100)}<p/>
    <p><label for="address_line2"> ${_("Line 2")}</label> ${f.text(name="address_line2", maxlength=100)}<p/>
    <p><label for="address_line3"> ${_("Line 3")}</label> ${f.text(name="address_line3", maxlength=100)}<p/>
    <p><label for="zip_code" class="mandatory">${_("Zip code")} *</label> ${f.text(name="zip_code")}<p/>
    <p><label for="city" class="mandatory">${_("City")} *</label> ${f.text(name="city")}<p/>
    <p><label for="country">${_("Country")}</label> ${f.text(name="country")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="address_type">${_("Address type")}</label> ${f.select("address_type", [("Home", _("Home")), ("Business", _("Business")), ("Correspondent", _("Correspondent"))])}<p/>
  </fieldset>
</%def>
