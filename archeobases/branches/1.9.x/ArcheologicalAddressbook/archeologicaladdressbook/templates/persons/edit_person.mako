## -*- coding: utf-8 -*-
<!-- edit_person template -->

edit_person<br/><br/>

${h.secure_form(url.current(action='update', id=c.person.id))}
  <fieldset>
    <legend>${_("Add a person")}</legend>
    ${_("Last name")} ${h.text(name="last_name", value=c.person.last_name)}<br/>
    ${_("First name")} ${h.text(name="first_name", value=c.person.first_name)}<br/>
    ${_("Title")} ${h.text(name="title", value=c.person.title)}<br/>
    ${_("Birth Date")} ${h.text(name="birth_date", value=c.person.birth_date)}<br/>
  </fieldset>
  <fieldset>
    ${_("Email Address")} ${h.text(name="email_address", value=c.person.email_address)}<br/>
    ${_("Phone")} ${h.text(name="phone", value=c.person.phone)}<br/>
    ${_("Mobile phone")} ${h.text(name="mobile_phone", value=c.person.mobile_phone)}<br/>
    ${_("Activity")} ${h.text(name="activity", value=c.person.activity)}<br/>
  </fieldset>
  ${h.submit('Submit', 'Submit')}
  ##<button name="new_button" type="submit" class="positive">${_("Update")}</button>
${h.end_form()}

