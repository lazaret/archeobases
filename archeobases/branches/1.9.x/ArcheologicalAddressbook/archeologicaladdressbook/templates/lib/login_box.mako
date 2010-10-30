## -*- coding: utf-8 -*-
## Display a top login box or the username on all pages
##
<%def name="login_box()">
  % if c.userid:
    ${h.link_to(c.userid, "#login", id="login-link")}
    <div id="login-panel">
      <div id="login-left">
        <img src="/images/user_male.png" />
      </div>
      <div id="login-right">
        ${h.link_to(_("logout"), "/logout")}<br />
        ${_("manage account")}
      </div>
    </div>
  % else:
    ${h.link_to("login", "#login", id="login-link")}
    <div id="login-panel">
      ${h.form(url("/login_handler", came_from=c.came_from))}
        <label>${_("Username")} : ${h.text(name="login")}</label><br />
        <label>${_("Password")} : ${h.password(name="password")}</label><br />
        ${h.submit('Submit', 'Login')}
        <small>Press ESC to close</small>
      ${h.end_form()}
    </div>
  % endif
</%def>
