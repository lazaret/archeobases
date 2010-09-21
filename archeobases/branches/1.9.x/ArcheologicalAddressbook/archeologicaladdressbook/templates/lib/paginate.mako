# -*- coding: utf-8 -*-

## display pagination links
## to be used with webhelpers.paginate.Page


## paginate
<%def name="paginate(page=None)">
  % if page:
    % if page.page != page.first_page:
      ${h.link_to(h.image("/images/first.png", alt=_("previous page")), url.current(id=page.first_page))}
      ${h.link_to(h.image("/images/previous.png", alt=_("previous page")), url.current(id=page.previous_page))}
    % else:
      ${h.image("/images/first_grey.png", "")}
      ${h.image("/images/previous_grey.png", "")}
    % endif
   ${page.page} of ${page.page_count}
    % if page.page != page.last_page:
      ${h.link_to(h.image("/images/next.png", alt=_("previous page")), url.current(id=page.next_page))}
      ${h.link_to(h.image("/images/last.png", alt=_("previous page")), url.current(id=page.last_page))}
    % else:
      ${h.image("/images/next_grey.png", "")}
      ${h.image("/images/last_grey.png", "")}
    % endif
  % endif
</%def>
&nbsp;
