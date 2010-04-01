# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Admin controler."""

import logging
from formalchemy.ext.pylons.controller import ModelsController
from formalchemy import forms
from formalchemy import tables
from webhelpers.paginate import Page

from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta


log = logging.getLogger(__name__)


class DbAdminForms():
    """ CRUD admin interface fieldsets definitions."""

    class FieldSet(forms.FieldSet):
        """ Initialize fieldsets."""
        pass

    # Initialize fieldsets
    User = FieldSet(model.User)
    User.configure(options=[User.created.label('Creation date')])
    UserAdd = FieldSet(model.User)
    UserAdd.configure(exclude=[UserAdd.created])

    class Grid(tables.Grid):
        """ Initialize grids."""
        pass

    # Initialize grids
    UserGrid = Grid(model.User)
    UserGrid.configure(include=[
        UserGrid.user_name,
        UserGrid.display_name,
        UserGrid.groups,
        UserGrid.created,
        ], options=[UserGrid.created.label('Creation date')])


class DbadminController(BaseController):
    """ Generate a CRUD admin interface with FormAlchemy."""
    template = '/dbadmin/restfieldset.mako'
    model = model # SQLAlchemy mappers
    #forms = forms # module containing FormAlchemy fieldsets definitions
    forms = DbAdminForms

    def Session(self):
        """ `DbadminControler` session factory."""
        return meta.Session


DbadminController = ModelsController(DbadminController,
                                   prefix_name='dbadmin',
                                   member_name='model',
                                   collection_name='models',
                                  )
