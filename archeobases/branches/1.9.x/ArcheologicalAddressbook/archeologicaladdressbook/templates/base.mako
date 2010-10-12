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
    <div id="header">
      ${login_box()}
    </div>
      ${flash_message()}
    <div id="main_content">
      ${next.body()}
    </div>
  </body>
</html>