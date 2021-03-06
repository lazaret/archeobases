# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `SearchController` controller fonctional tests."""

from archeologicaladdressbook.tests import *


class TestSearchController(TestController):
    """ Test the controller `SearchController`."""

    def test_01_routes(self):
        """ Test the routes of the `SearchController` controller."""
        self.app.get(url(controller='search'))
        self.app.get(url(controller='search', action='index'))
        self.app.get(url(controller='search', action='quick_search'))

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `SearchController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='search'), status=302)

    def test_03_controller_allowed_for_viewers(self):
        """ Test than the `SearchController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='search'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_04_index_response(self):
        """ Test response of the `SearchController` index page."""
        response = self.app.get(url(controller='search', action='index'),
            extra_environ={'repoze.what.credentials': self.guest})
        assert 'search index template' in response, 'search index template is missing or has changed.'
