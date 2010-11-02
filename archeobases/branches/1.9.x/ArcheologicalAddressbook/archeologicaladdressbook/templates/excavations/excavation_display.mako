## -*- coding: utf-8 -*-
##
<%def name="excavation_display()">
  ${_("Site Name")} : ${c.excavation.site_name}<br/>
  ${_("Start date")} :
  % if c.excavation.start_date:
    ${c.excavation.start_date.strftime('%d / %m / %Y')}
  % endif
  <br/>
  ${_("End date")} :
  % if c.excavation.end_date:
    ${c.excavation.end_date.strftime('%d / %m / %Y')}
  % endif
  <br/>
  ${_("Appreciation")} : ${c.excavation.appreciation}<br/>
</%def>
