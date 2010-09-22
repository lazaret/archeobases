# -*- coding: utf-8 -*-

## Display a top login box on all page or the username
## see also

<%def name="login_box()">
  % if c.userid:
    ${h.link_to(c.userid, "#login", id="login-link")}
    <div id="login-panel">
      ${h.link_to("logout", "/logout")}<br/>
      manage account
    </div>

    ##<a href="${h.url('/logout')}">Log out</a>
  % else:
    ${h.link_to("login", "#login", id="login-link")}
    <div id="login-panel">
      ${h.form(h.url("/login_handler", came_from=c.came_from))}
        <label>${_("Username")} : ${h.text(name="login")}</label><br/>
        <label>${_("Password")} : ${h.password(name="password")}</label><br/>
        ${h.submit('Submit', 'Login')}
        <small>Press ESC to close</small>
      ${h.end_form()}
    </div>
  % endif
</%def>