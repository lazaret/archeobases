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

from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to

from archeologicaladdressbook.lib.base import BaseController, render

from formalchemy.ext.pylons.controller import ModelsController
from webhelpers.paginate import Page

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook import forms


log = logging.getLogger(__name__)

class AdminController(BaseController):
    """ Generate CRUD admin interface with FormAlchemy."""
    model = model # SQLAlchemy mappers
    forms = forms # module containing FormAlchemy fieldsets definitions

    def Session(self):
        """ `AdminControler` session factory."""
        return meta.Session


AdminController = ModelsController(AdminController,
                                   prefix_name='admin',
                                   member_name='model',
                                   collection_name='models',
                                  )
