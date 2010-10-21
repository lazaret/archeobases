# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Users` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.auth import ProtectController
from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.base import BaseController, render

log = logging.getLogger(__name__)


@ProtectController(has_permission('manage'))
class UsersController(BaseController):
    """ `Users` Controller."""

    def index(self):
        """ Render the users index template."""
        return render('/users/index.mako')
