# -*- coding: utf-8 -*-

## commons sideboxes used by the right sidebar

## login sidebox
<%def name="sidebox_login()">
  <div id="sidebox_login">
    Future Login Here
  </div>
</%def>

## new record link sidebox
<%def name="sidebox_new()">
  <div id="sidebox_new">
    ${h.link_to("New", h.url_for(action="new", id=None))}<br>
  </div>
</%def>

## search records links sidebox
<%def name="sidebox_search()">
  <div id="sidebox_search">
    <img src="/images/add.png" alt=${_("Add")}/>&nbsp;${h.link_to(_("Add"), h.url_for(action="new"))}<br>
    <img src="/images/magnifier.png" alt=${_("Search")}/>&nbsp;${h.link_to(_("Search"), h.url_for(action="search"))}<br>
    <img src="/images/table.png" alt=${_("List")}/>&nbsp;${h.link_to(_("List all"), h.url_for(action="list"))}<br>
    <img src="/images/chart_bar.png" alt=${_("List")}/>&nbsp;${h.link_to(_("Stats"), h.url_for(action="stats"))}<br>
  </div>
</%def>

