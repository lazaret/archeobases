# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `RootController` controller fonctional tests."""

from archeologicaladdressbook.tests import *


class TestRootController(TestController):
    """ Test the controller `RootController`."""

    def test_01_routes(self):
        """ Test the routes of the `RootController` controller."""
        self.app.get('/')
        self.app.get('/index')
        self.app.get(url(controller='root'))
        self.app.get(url(controller='root', action='index'))
        self.app.get(url(controller='root', action='login'))
        self.app.get(url(controller='root', action='post_login'))
        self.app.get(url(controller='root', action='post_logout'))

    def test_02_index_denied_for_anonymous(self):
        """ Test than the index action of the`RootController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the login page
        self.app.get(url(controller='root'), status=302)
        self.app.get(url(controller='root', action='index'), status=302)

    def test_03_post_login_denied_for_anonymous(self):
        """ Test than the post_login action of the`RootController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the login page
        self.app.get(url(controller='root', action='post_login'), status=302)

    def test_04_login_allowed_for_anonymous(self):
        """ Test than the login action of the`RootController` controller is allowed to anonymous."""
        self.app.get(url(controller='root', action='login'))

    def test_05_index_response(self):
        """ Test response of the `RootController` index page."""
        response = self.app.get(url(controller='root', action='index'),
            extra_environ={'repoze.what.credentials': self.guest})
        assert 'root index template' in response, 'root index template is missing or has changed.'

    def test_06_login_response(self):
        """ Test response of the `RootController` login page."""
        response = self.app.get(url(controller='root', action='login'))
        assert 'root login template' in response, 'root login template is missing or has changed.'
