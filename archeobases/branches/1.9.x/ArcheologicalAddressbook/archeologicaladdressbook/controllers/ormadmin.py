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
from webhelpers.paginate import Page

from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook import model
from archeologicaladdressbook import forms
from archeologicaladdressbook.model import meta


log = logging.getLogger(__name__)


class OrmadminController(BaseController):
    """ Generate a CRUD admin interface with FormAlchemy."""
    model = model # SQLAlchemy mappers
    forms = forms # module containing FormAlchemy fieldsets definitions

    def Session(self):
        """ `AdminControler` session factory."""
        return meta.Session


OrmadminController = ModelsController(OrmadminController,
                                   prefix_name='ormadmin',
                                   member_name='model',
                                   collection_name='models',
                                  )
