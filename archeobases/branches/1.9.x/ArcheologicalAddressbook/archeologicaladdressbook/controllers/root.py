# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Main controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import is_user

from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook.lib.helpers import flash_message


log = logging.getLogger(__name__)


class RootController(BaseController):
    """ Main controller witch serve the main index page."""

    def index(self):
        """ Render the main index page."""
        c.came_from = request.params.get('came_from') or url('/')
        return render("index.mako")

    def login(self):
        """ Redirect logins to the index page."""
        # We do not have a special login page,
        # login is done only with the login box
        came_from = request.params.get('came_from') or url('/')
        redirect(url(controller='root', action='index', came_from=came_from))

    def post_login(self):
        """ Post login action.

        If the credentials are good the user is connected and redirect to the
        page he comme from. If they are wrong the user his resend to login.
        """
        came_from = str(request.params.get('came_from', '')) or url('/')
        credentials = request.environ.get('repoze.what.credentials', False)
        if credentials:
            userid = credentials['repoze.what.userid']
            flash_message('Welcome back, %s!' % userid)
            redirect(url(came_from))
        else:
            flash_message('Wrong credentials', 'warning')
            redirect(url('/login', came_from=came_from))

    def post_logout(self):
        """ Post logout action."""
        flash_message('You have been logout !')
        redirect(url(controller='root', action='index'))



################# tests ####################### TODO REMOVE BELLOW
#
#    def environ(self):
#        result = '<html><body><h1>Environ</h1>'
#        for key, value in request.environ.items():
#            result += '%s: %r <br />'% (key, value)
#        result += '</body></html>'
#        return result
