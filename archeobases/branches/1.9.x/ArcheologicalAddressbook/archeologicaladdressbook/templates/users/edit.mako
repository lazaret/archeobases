## -*- coding: utf-8 -*-
<%inherit file="/users/base.mako" />
##
<%def name="page_title()">
  ${_("Addressbook")} - ${_("Users")} - ${_("Edit")}
</%def>
<%def name="breadcrumb()">
  ${h.link_to(app_globals.sitename, "/")} > ${h.link_to(_("Users"), h.url(controller="users"))} > ${_("Edit")}
</%def>
##
<!-- users edit template -->
##
<% f = h.ModelTags(c.user, date_format='%m/%d/%Y') %>
${h.secure_form(url.current(action='update', id=c.user.user_id))}
  ${f.hidden(name="user_id")}
  <fieldset>
    <legend>${_("Edit user")}</legend>
    ## we prefere to not allow edit of the 'user_name'
    <p><label for="user_name"> ${_("User name")}</label> ${c.user.user_name}<p/>
    <p><label for="Display name"> ${_("Display name")}</label> ${f.text(name="display_name")}<p/>
    <p><label for="email_address">${_("Email address")}</label> ${f.text(name="email_address")}<p/>
  </fieldset>
  <fieldset>
    <p><label for="group_name">${_("Group")}</label> ${h.select("group_name", c.group, [("guests", _("Guests")), ("editors", _("Editors")), ("managers", _("Managers"))])}<p/>
  </fieldset>
  <footer>
    <button name="update_button" type="submit"><img src="/images/tick.png"/>${_("Update")}</button>
  </footer>
${h.end_form()}
