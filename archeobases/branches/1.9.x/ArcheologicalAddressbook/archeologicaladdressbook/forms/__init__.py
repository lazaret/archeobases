# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Formalchemy configuration file."""

from pylons import config
from archeologicaladdressbook import model
from archeologicaladdressbook.lib.base import render
from formalchemy import config as fa_config
from formalchemy import templates
from formalchemy import validators
from formalchemy import fields
from formalchemy import forms
from formalchemy import tables
from formalchemy.ext.fsblob import FileFieldRenderer
from formalchemy.ext.fsblob import ImageFieldRenderer


fa_config.encoding = 'utf-8'

class TemplateEngine(templates.TemplateEngine):
    """ Configure the template engine."""

    def render(self, name, **kwargs):
        """ Configure templates used to render forms."""
        return render('/forms/%s.mako' % name, extra_vars=kwargs)

fa_config.engine = TemplateEngine()


class FieldSet(forms.FieldSet):
    """ Initialize fieldsets."""
    pass


class Grid(tables.Grid):
    """ Initialize grids."""
    pass


## Initialize fieldsets
User = FieldSet(model.User)
User.configure(options=[User.created.label('Creation date')])

UserAdd = FieldSet(model.User)
UserAdd.configure(exclude=[UserAdd.created])

## Initialize grids
UserGrid = Grid(model.User)
UserGrid.configure(include=[
    UserGrid.user_name,
    UserGrid.display_name,
    UserGrid.groups,
    UserGrid.created,
    ], options=[UserGrid.created.label('Creation date')])

