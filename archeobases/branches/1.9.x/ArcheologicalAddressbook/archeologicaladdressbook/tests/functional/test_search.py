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

    def test_1_routes(self):
        """ Test the routes of the `SearchController` controller."""
        self.app.get(url(controller='search'))
        self.app.get(url(controller='search', action='index'))

    def test_2_anonymous_denied(self):
        """ Test than the `SearchController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='search'), status=302)

    #TODO: change 'edit' permission to 'view'
    def test_3_editors_allowed(self):
        """ Test than the `SearchController` controller is allowed for editors."""
        editor = {'repoze.what.userid': u'editor',
                   'groups': (u'editors',),
                   'permissions': (u'edit',)}
        response = self.app.get(url(controller='search'),
            extra_environ={'repoze.what.credentials': editor},
            status=200)
        return response

    def test_4_index_response(self):
        """ Test response of the `SearchController` index page."""
        response = self.test_3_editors_allowed()
        #assert 'test' in response
