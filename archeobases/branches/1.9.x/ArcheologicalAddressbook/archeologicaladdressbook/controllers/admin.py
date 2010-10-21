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
from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook.lib.logparser import combined_log_parser, error_log_parser

log = logging.getLogger(__name__)


@ProtectController(has_permission('manage'))
class AdminController(BaseController):

    def index(self):
        """ Render the admin index template."""
        return render('/admin/index.mako')

    def accesslog(self, id=None):
        """ Render the application access log."""
        log = combined_log_parser("access.log") #TODO seek logfile name in INI file
        #TODO manage error if file not found or empty logs
        log.reverse() # Put yonger log lines at the begining of the list
        c.page = paginate.Page(log, page=id, items_per_page = 20)
        return render('/admin/accesslog.mako')

    def errorlog(self, id=None):
        """ Render the application error log."""
        log = error_log_parser("error.log") #TODO seek logfile name in INI file
        #TODO manage error if file not found or empty logs
        log.reverse() # Put yonger log lines at the begining of the list
        c.page = paginate.Page(log, page=id, items_per_page = 20)
        return render('/admin/errorlog.mako')