## -*- coding: utf-8 -*-
##
<%def name="person_display()">
  ${_("Last name")} : ${c.person.last_name}<br/>
  ${_("First name")} : ${c.person.first_name}<br/>
  ${_("Title")} : ${c.person.title}<br/>
  ${_("Birth Date")} :
  % if c.person.birth_date:
    ${c.person.birth_date.strftime('%d / %m / %Y')}
  % endif
  <br/>
  ${_("Email Address")} : ${c.person.email_address}<br/>
  ${_("Phone")} : ${c.person.phone}<br/>
  ${_("Mobile phone")} : ${c.person.mobile_phone}<br/>
  ${_("Activity")} : ${c.person.activity}<br/>
  ${_("Person type")} : ${c.person.person_type}<br/>
  ${_("Photo")} : ${c.person.photo}<br/>
</%def>
