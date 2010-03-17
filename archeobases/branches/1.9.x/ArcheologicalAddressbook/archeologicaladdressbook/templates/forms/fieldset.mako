# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
<%
_ = F_
_focus_rendered = False
%>\

% for error in fieldset.errors.get(None, []):
<div class="fieldset_error">
  ${_(error)}
</div>
% endfor

% for field in fieldset.render_fields.itervalues():
  % if field.requires_label:
<div>
  <label class="${field.is_required() and 'field_req' or 'field_opt'}" for="${field.renderer.name}">${[field.label_text, fieldset.prettify(field.key)][int(field.label_text is None)]|h}</label>
  ${field.render()|n}
  % if 'instructions' in field.metadata:
  <span class="instructions">${field.metadata['instructions']}</span>
  % endif
  % for error in field.errors:
  <span class="field_error">${_(error)}</span>
  % endfor
</div>

% if (fieldset.focus == field or fieldset.focus is True) and not _focus_rendered:
% if not field.is_readonly():
<script type="text/javascript">
//<![CDATA[
document.getElementById("${field.renderer.name}").focus();
//]]>
</script>
<% _focus_rendered = True %>\
% endif
% endif
  % else:
${field.render()}
  % endif
% endfor
