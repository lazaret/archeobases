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

from pylons import config, request, response, session, tmpl_context as c, url
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
    """ `Admin` Controller."""

    def index(self):
        """ Render the admin index template."""
        return render('/admin/index.mako')

    def accesslog(self, id=None):
        """ Render the application access log."""
        logfile = config.get('accesslog', 'access.log')
        try:
            accesslog = combined_log_parser(logfile)
            if len(accesslog) == 0:
                log.warning("Access log file empty")
                flash_message(_("Access log file empty"), 'warning')
            else:
                accesslog.reverse() # Put yonger log lines at the begining of the list
                c.page = paginate.Page(accesslog, page=id, items_per_page = 20)
        except IOError:
            log.error("Access log file not found")
            flash_message(_("Access log file not found"), 'error')
        return render('/admin/accesslog.mako')

    def errorlog(self, id=None):
        """ Render the application error log."""
        logfile = config.get('errorlog', 'error.log')
        try:
            errorlog = error_log_parser(logfile)
            if len (errorlog) == 0:
                log.warning("Error log file empty")
                flash_message(_("Error log file empty"), 'warning')
            else:
                errorlog.reverse() # Put yonger log lines at the begining of the list
                c.page = paginate.Page(errorlog, page=id, items_per_page = 20)
        except IOError:
            log.error("Error log file not found")
            flash_message(_("Error log file not found"), 'error')
        return render('/admin/errorlog.mako')

    def options(self):
        """ """
        return render('/admin/options.mako')
