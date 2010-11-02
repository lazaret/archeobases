## -*- coding: utf-8 -*-
##
<%def name="address_display()">
  ${_("Line 1")} : ${c.address.address_line1}<br/>
  ${_("Line 2")} : ${c.address.address_line2}<br/>
  ${_("Line 3")} : ${c.address.address_line3}<br/>
  ${_("Zip code")} : ${c.address.zip_code}<br/>
  ${_("City")} : ${c.address.city}<br/>
  ${_("Country")} : ${c.address.country}<br/>
  ${_("Address type")} : ${c.address.address_type}<br/>
</%def>