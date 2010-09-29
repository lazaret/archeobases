# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `DbadminController` controller fonctional tests."""

from archeologicaladdressbook.tests import *


class TestDbadminController(TestController):
    """ Test the controller `DbmadminController`."""

    def test_1_routes(self):
        """ Test the routes of the `DbmadminController` controller."""
        self.app.get(url(controller='dbadmin'))
        self.app.get(url(controller='dbadmin', action='models'))

    def test_2_anonymous_denied(self):
        """ Test than the `DbmadminController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='dbadmin', action='models'), status=302)

    def test_3_editors_denied(self):
        """ Test than the `DbmadminController` controller is denied to editors."""
        editor = {'repoze.what.userid': u'editor',
                   'groups': (u'editors',),
                   'permissions': (u'edit',)}
        self.app.get(url(controller='dbadmin', action='models'),
            extra_environ={'repoze.what.credentials': editor},
            status=302)

    def test_4_manager_allowed(self):
        """ Test than the `DbmadminController` controller is allowed for managers."""
        manager = {'repoze.what.userid': u'manager',
                   'groups': (u'managers',),
                   'permissions': (u'manage')}
        response = self.app.get(url(controller='dbadmin', action='models'),
            extra_environ={'repoze.what.credentials': manager},
            status=200)
        return response

    def test_5_response(self):
        """ Test response of the `DbmadminController` main page."""
        response = self.test_4_manager_allowed()
        assert 'Models' in response

