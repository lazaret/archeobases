# -*- coding: utf-8 -*-

## display a flash message
## see webhelpers.pylonslib


## flash message
<%def name="flash_message()">
  <% messages = h.flash_message.pop_messages() %>
  % if messages:
      % for message in messages:
        <div id="${message.category}_message">
          ${message}
        </div>
      % endfor
  % endif
</%def>
