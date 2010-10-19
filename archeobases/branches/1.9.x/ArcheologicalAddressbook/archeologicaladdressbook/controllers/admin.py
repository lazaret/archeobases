# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Admin` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.auth import ProtectController
from archeologicaladdressbook.lib.base import BaseController, render


log = logging.getLogger(__name__)


@ProtectController(has_permission('manage'))
class AdminController(BaseController):

    def index(self):
        """ Render the admin index template."""
        return render('/admin/index.mako')

    def logs(self):
        """ Render the application logs."""
        return render('/admin/logs.mako')