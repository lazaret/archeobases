## -*- coding: utf-8 -*-

<%inherit file="/base.mako" />


MAIN INDEX PAGE

##${h.link_to("Login", "#login", id="login-link")}
##<div id="login-panel">
##<form action="" method="post">
## <label>${_("Username")} ${h.text(name="login")}</label>
## <label>${_("Password")} ${h.password(name="password")}</label>
## ${h.submit('Submit', 'Login')}
## <small>Press ESC to close</small>
##${h.end_form()}
##</div>
