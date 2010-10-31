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

    def test_02_controller_allowed_for_anonymous(self):
        """ Test than the `RootController` controller index page is allowed to anonymous."""
        self.app.get('/', status=200)
        self.app.get('/index', status=200)

    def test_03_index_response(self):
        """ Test response of the `RootController` index page."""
        response = self.app.get(url(controller='root', action='index'))
        assert 'root index template' in response, 'root index template is missing or has changed.'
