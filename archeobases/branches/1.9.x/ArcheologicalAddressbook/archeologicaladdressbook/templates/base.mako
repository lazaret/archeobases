## -*- coding: utf-8 -*-
<%namespace file="/lib/flash_message.mako" import="*"/>
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
      % if c.userid:
      <div id="user_box_wrapper">
        <div id="user_box">
          <header>${c.userid}</strong></header>
          ${h.link_to(_("manage account"), "/account")}<br />
          ${h.link_to(_("logout"), "/logout")}
        </div>
      </div>
      % endif
      ${flash_message()}
    </header>
    <nav id ="navbar">
      <div id="nav_wrapper">
        ${self.navbar()}
      </div>
    </nav>
    <section id="main">
      <article>
        <header id="breadcrumb">
          ${self.breadcrumb()}
        </header>
        ${next.body()}
      </article>
      <aside>
        ${self.sidebox_1()}
        ${self.sidebox_2()}
      </aside>
    </section>
    <footer id="footer">
      ArcheologicalAddressbook ${app_globals.version} - \
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
  ${h.link_to(app_globals.sitename, "/")}
</%def>
## DEFAULT NAV BAR
<%def name="navbar()">
  % if c.userid:
  <ul>
    <li>${h.link_to(_("Home"), url('/'), class_='active')}</li>
    <li>${h.link_to(_("Persons"), url(controller='persons'))}</li>
    % if 'manage' in c.permissions:
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
## DEFAULT SIDES BOXES
<%def name="sidebox_1()">
</%def>
##
<%def name="sidebox_2()">
</%def>
