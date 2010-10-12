## -*- coding: utf-8 -*-
## display a flash message, see webhelpers.pylonslib
##
<%def name="flash_message()">
  <% messages = h.flash_message.pop_messages() %>
  % if messages:
    <div id="message_box">
    % for message in messages:
      <div id="${message.category}_message">
        ${message}
        <a href="#" class="close_message"><img alt=${_("Close")} src="/images/cross.png" /></a>
      </div>
    % endfor
    </div>
  % endif
</%def>