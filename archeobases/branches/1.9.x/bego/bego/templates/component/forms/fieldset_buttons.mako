# -*- coding: utf-8 -*-

## helptip button

<%def name="helptip_button(helptip)">
  <img alt="${_("Help")}" src="/images/help.png" onMouseOver="showHelp('${helptip}');" onMouseOut="hideHelp();" />
</%def>


<%def name="reset_button(group_name)">
  <% radio_group = "document.form." + group_name %>
  <img title="${_("Reset")}" src="/images/arrow_rotate_clockwise.png" onclick="clearRadioGroup(${radio_group});" />
</%def>
