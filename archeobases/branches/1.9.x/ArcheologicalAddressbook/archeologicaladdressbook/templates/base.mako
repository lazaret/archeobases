## -*- coding: utf-8 -*-
<%namespace file="/lib/flash_message.mako" import="*"/>\
<%namespace file="/lib/login_box.mako" import="*"/>\
##
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>${_("Addressbook")} - ${self.page_title()}</title>
    ${h.stylesheet_link("/css/style.css")}
    ${h.stylesheet_link("/css/ui-lightness/jquery-ui.custom.css")}
    ${h.stylesheet_link("/css/jquery_style.css")}
    ${h.javascript_link("/javascripts/jquery.min.js")}
    ${h.javascript_link("/javascripts/jquery-ui.custom.min.js")}
    ${h.javascript_link("/javascripts/main.js")}
  </head>

  <body>
    <header>
      ${login_box()}
      ${flash_message()}
    </header>
    <nav>
      ${self.navbar()}
    </nav>
    <section id="main">
      ${next.body()}
    </section>
    <footer>
      ${app_globals.name} ${app_globals.version} - \
      ${h.link_to("AGPL3", "http://www.gnu.org/licenses/agpl.html")} - \
      &copy; ${h.link_to("LDLP", "http://lazaret.unice.fr/opensource/")}
    </footer>
  </body>
</html>

##
## DEFAULT TOP NAV BAR
<%def name="navbar()">
  <ul>
    <li><a href="/">${_("Home")}</a></li>
    <li><a href="/">${_("Persons")}</a></li>
    <li><a href="/">${_("Statistics")}</a></li>
  </ul>
</%def>