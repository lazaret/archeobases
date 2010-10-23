## -*- coding: utf-8 -*-
<%inherit file="/persons/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("Confirm delete")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("Confirm delete")}
</%def>
##
<!-- users confirm_delete template -->
##
${_("User name")} : ${c.user.user_name}<br/>
${_("Display name")} : ${c.user.display_name}<br/>
${_("Email address")} : ${c.user.email_address}<br/>
${_("Group")} : ${c.user.groups[0].group_name}<br/>

${_("Are your sure you whan tot delete this user ?")}

${h.secure_form(url.current(action='delete', id=c.user.user_id))}
  <footer>
    ${h.button_to(_("Yes"), url.current(action='delete', id=c.user.user_id))}
    ${h.button_to(_("No"), url.current(action='show', id=c.user.user_id))}
  </footer>
${h.end_form()}
