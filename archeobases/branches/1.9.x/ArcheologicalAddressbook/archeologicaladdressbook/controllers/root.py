# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Root` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import is_user

from archeologicaladdressbook.lib.base import BaseController, render, validate
from archeologicaladdressbook.lib.helpers import flash_message


log = logging.getLogger(__name__)


class RootController(BaseController):
    """ `Root` controller witch serve the main index page."""

    def index(self):
        """ Render the main index page."""
        credentials = request.environ.get('repoze.what.credentials', False)
        if credentials:
            return render('index.mako')
        else:
            redirect(url.current(action='login'))

    def login(self):
        """ Render the login page."""
        credentials = request.environ.get('repoze.what.credentials', False)
        if credentials:
            redirect(url.current(action='index'))
        else:
            return render('login.mako')

    def post_login(self):
        """ Post login action.

        If the credentials are good the user is connected and redirect to the
        main index page . If they are wrong the user his resend to login.
        """
        credentials = request.environ.get('repoze.what.credentials', False)
        if credentials:
            userid = credentials['repoze.what.userid']
            flash_message(_("Successful login, %s!") % userid)
            redirect(url.current(action='index'))
        else:
            flash_message(_("Wrong credentials"), 'warning')
            redirect(url.current(action='login'))

    def post_logout(self):
        """ Post logout action.

        User is resend to login page after logout."""
        flash_message(_("You have been logout !"), 'success')
        redirect(url.current(action='login'))


################# tests ####################### TODO REMOVE BELLOW
#
#    def environ(self):
#        result = '<html><body><h1>Environ</h1>'
#        for key, value in request.environ.items():
#            result += '%s: %r <br />'% (key, value)
#        result += '</body></html>'
#        return result

        #flash_message('test success message', 'success')
        #flash_message('test warning message', 'warning')
        #flash_message('test error message', 'error')
        #flash_message('test notice message', 'notice')
