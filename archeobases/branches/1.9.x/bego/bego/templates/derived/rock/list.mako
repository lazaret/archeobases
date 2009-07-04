# -*- coding: utf-8 -*-
<%inherit file="/base/base.mako" />
<%namespace file="/component/sideboxes.mako" import="*"/>


<%def name="page_name()">${_("Rock list")}</%def>

## nav bar
<%def name="navbar()">
  <ul id="tabnav">
    <li><a href="/">${_("Homepage")}</a></li>
    <li><a href="/search">${_("Search")}</a></li>
    <li><a href="/rock" class="active">${_("Rock")}</a></li>
    <li><a href="/help">${_("Help")}</a></li>
  </ul>
</%def>

## sidebar
<%def name="sidebar()">
  ${sidebox_login()}
##  ${sidebox_new()}
  ${sidebox_search()}
</%def>

## main content
<h1>${self.page_name()}</h1>

<p>cette liste affiche la table rock ...</p>

<ul id="list">
% for rock in c.rock:
<li>
${rock.id} ${rock.geo_zone} ${rock.geo_group} ${rock.rock_number} <small>[ ${h.link_to("view", h.url_for(action="edit", id=rock.id))} | ${h.link_to("delete", h.url_for(action="delete", id=rock.id))} ]</small>
</li>
% endfor
</ul>


