# -*- coding: utf-8 -*-
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    ${h.stylesheet_link("/css/style.css")}
    ${h.stylesheet_link("/css/messages.css")}
    ${h.stylesheet_link("/css/form.css")}
    ${h.javascript_link("/javascripts/jquery.min.js")}
    ${h.javascript_link("/javascripts/functions.js")}
    <title>${c.site_full_name} - ${self.page_name()}</title>
  </head>
  <body>
    ## LIGHTBOX MESSAGES
    <div id="lightbox">
      <div id="alertbox">
        ${self.lightbox()}
      </div>
    </div>
    <div id="filter">
    </div>
    ## WRAPPER TO STICK FOOTER
    <div id="wrapper">
      ## HEADER & TOP NAVBAR
      <div id="header">
        <div class="headtext">
          ${h.link_to(c.site_full_name, "/")}
        </div>
        <div id="navbar">
          ${self.navbar()}
        </div>
      </div>
      ## BREADCRUMB
      <div id="breadcrumb">
        <div class="breadcrumbtext">
          ${self.breadcrumb()}
        </div>
      </div>
      ## SIDEBAR & CONTENT
      <div id="main_content" class="clearfix">
        <div id="sidebar">
          ## right sidebar
          ${self.sidebar()}
        </div>
        <div id="content">
          ## left main content
          ${next.body()}
        </div>
      </div>
    </div>
    ## FOOTER
    <div id="footer">
      Bego ${c.version} &copy; 2009 ${h.link_to("LDLP", "http://lazaret.unice.fr/opensource/")}&nbsp;&nbsp;|&nbsp;&nbsp;${h.link_to(_("About"), "/about")}&nbsp;&nbsp;|&nbsp;&nbsp;${h.link_to(_("Admin"), "/admin")}
    </div>
  </body>
</html>


## DEFAULT BREADCRUMB
<%def name="breadcrumb()">
  ${h.link_to(c.site_short_name , "/")} &rsaquo; ${self.page_name()}
</%def>

## DEFAULT TOP NAVBAR
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## DEFAULT RIGHT SIDEBAR
<%def name="sidebar()">
</%def>

## DEFAULT LIGHTBOX CONTENT
<%def name="lightbox()">
</%def>
