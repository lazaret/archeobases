# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Addresses` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_any_permission, has_permission

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form

from archeologicaladdressbook.lib.auth import ProtectController, ProtectAction

from archeologicaladdressbook.model import Session

log = logging.getLogger(__name__)


@ProtectController(has_any_permission('edit', 'view'))
class AddressesController(BaseController):
    """ `Addresses` Controller."""

# index and list actions

    @ProtectAction(has_permission('view'))
    def index(self):
        """ Render the addresses index template."""
        return render('/addresses/index.mako')
