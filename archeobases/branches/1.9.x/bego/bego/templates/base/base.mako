# -*- coding: utf-8 -*-
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/css/form.css" type="text/css" media="screen" />
    <title>${c.site_full_name} - ${self.page_name()}</title>
  </head>

  <body>
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
      <div id="main_content">
        <div id="sidebar">
          ## right sidebar
          ${self.sidebar()}
        </div>
        <div id="content">
          ## left main content
          ${next.body()}
        </div>
      </div>

    ## FOOTER
      <div id="footer">
        <div class="foottext">
          Bego ${c.version} &copy; 2009 ${h.link_to("LDLP", "http://lazaret.unice.fr/opensource/")}&nbsp;&nbsp;|&nbsp;&nbsp;${h.link_to(_("About"), "/about")}&nbsp;&nbsp;|&nbsp;&nbsp;${h.link_to(_("Admin"), "/admin")}
        </div>
      </div>
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

