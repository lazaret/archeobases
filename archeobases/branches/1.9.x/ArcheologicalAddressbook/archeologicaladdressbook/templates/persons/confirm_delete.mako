## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">${_("Persons")} - ${_("Confim delete")}</%def>
##
<!-- persons confirm_delete template -->

${_("Last name")} : ${c.person.last_name}<br/>
${_("First name")} : ${c.person.first_name}<br/>
${_("Title")} : ${c.person.title}<br/>
${_("Birth Date")} : ${c.person.birth_date}<br/>
${_("Email Address")} : ${c.person.email_address}<br/>
${_("Phone")} : ${c.person.phone}<br/>
${_("Mobile phone")} : ${c.person.mobile_phone}<br/>
${_("Activity")} : ${c.person.activity}<br/>
${_("Person type")} : ${c.person.person_type}<br/>
${_("Photo")} : ${c.person.photo}<br/>

${_("Are your sure you whan tot delete this person ?")}

${h.secure_form(url.current(action='delete', id=c.person.id))}
  ${h.button_to(_("Yes"), url.current(action='delete', id=c.person.id))}
  ${h.button_to(_("No"), url.current(action='show', id=c.person.id))}
${h.end_form()}
