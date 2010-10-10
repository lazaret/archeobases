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

    guest = {'repoze.what.userid': u'guest',
                   'groups': (u'guests'),
                   'permissions': (u'view')}

    def test_1_routes(self):
        """ Test the routes of the `SearchController` controller."""
        self.app.get(url(controller='search'))
        self.app.get(url(controller='search', action='index'))

    def test_2_anonymous_denied(self):
        """ Test than the `SearchController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='search'), status=302)

    def test_3_editors_allowed(self):
        """ Test than the `SearchController` controller is allowed for guests."""
        self.app.get(url(controller='search'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_4_index_response(self):
        """ Test response of the `SearchController` index page."""
        response = self.app.get(url(controller='search', action='index'),
            extra_environ={'repoze.what.credentials': self.guest})
        assert 'search index template' in response
