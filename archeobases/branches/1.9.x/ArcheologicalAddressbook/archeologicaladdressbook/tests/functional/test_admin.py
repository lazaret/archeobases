# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `AdminController` controller fonctional tests."""

from archeologicaladdressbook.tests import *

class TestAdminController(TestController):
    """ Test the controller `AdminController`."""

    manager = {'repoze.what.userid': u'manager',
                   'groups': (u'managers'),
                   'permissions': (u'manage', u'edit', u'view')}

    editor = {'repoze.what.userid': u'editor',
                   'groups': (u'editors'),
                   'permissions': (u'edit', u'view')}

    guest = {'repoze.what.userid': u'guest',
                   'groups': (u'guests'),
                   'permissions': (u'view')}

    def test_1_routes(self):
        """ Test the routes of the `AdminController` controller."""
        self.app.get(url(controller='admin'))
        self.app.get(url(controller='admin', action='index'))

    def test_2_controller_denied_for_anonymous(self):
        """ Test than the `AdminController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='admin'), status=302)

    def test_3_controller_denied_for_viewers(self):
        """ Test than the `AdminController` controller is denied for users with 'view' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_4_controller_denied_for_editors(self):
        """ Test than the `AdminController` controller is denied for users with 'edit' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=302)

    def test_5_controller_allowed_for_managers(self):
        """ Test than the `AdminController` controller is allowed for users with 'manage' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.manager},
            status=200)

    def test_6_index_response(self):
        """ Test response of the `AdminController` index page."""
        response = self.app.get(url(controller='admin', action='index'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'admin index template' in response, 'admin index template is missing or has changed.'
