## -*- coding: utf-8 -*-
<%namespace file="/lib/flash_message.mako" import="*"/>
<%namespace file="/lib/login_box.mako" import="*"/>
##
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>${self.page_title()}</title>
    ${h.stylesheet_link("/css/style.css")}
    ${h.stylesheet_link("/css/form.css")}
    ${h.stylesheet_link("/css/ui-lightness/jquery-ui.custom.css")}
    ${h.stylesheet_link("/css/jquery_style.css")}
    ${h.javascript_link("/javascripts/jquery.min.js")}
    ${h.javascript_link("/javascripts/jquery-ui.custom.min.js")}
    ${h.javascript_link("/javascripts/main.js")}
  </head>
##
  <body>
    <header id="header">
      ${login_box()}
      ${flash_message()}
    </header>
    <nav id ="navbar">
      ${self.navbar()}
    </nav>
    <section id="main">
      <article>
        <header id="breadcrumb">
          ${self.breadcrumb()}
        </header>
        ${next.body()}
      </article>
      <aside>
        ${self.sidebar()}
      </aside>
    </section>
    <footer id="footer">
      ${app_globals.name} ${app_globals.version} - \
      ${h.link_to("AGPL3", "http://www.gnu.org/licenses/agpl.html")} - \
      &copy; ${h.link_to("LDLP", "http://lazaret.unice.fr/opensource/")}
    </footer>
  </body>
</html>
##
## DEFAULT PAGE TITLE
<%def name="page_title()">
  ${_("Addressbook")}
</%def>
##
## DEFAULT BREADCRUMB
<%def name="breadcrumb()">
  ${h.link_to(_("Addressbook"), "/")}
</%def>
## DEFAULT NAV BAR
<%def name="navbar()">
  % if c.userid:
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    <li>${h.link_to(_("Statistics"), url(controller='stats'))}</li>
    % if 'manage' in c.permissions:
      <li>${h.link_to(_("Users"), url(controller='users'), class_='admin')}</li>
      <li>${h.link_to(_("Admin"), url(controller='admin'), class_='admin')}</li>
    % endif
  </ul>
  % else:
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
  </ul>
  % endif
</%def>
##
## DEFAULT SIDE BAR
<%def name="sidebar()">
</%def>