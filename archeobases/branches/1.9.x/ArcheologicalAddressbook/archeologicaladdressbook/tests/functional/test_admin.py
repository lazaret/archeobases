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

    def test_01_routes(self):
        """ Test the routes of the `AdminController` controller."""
        self.app.get(url(controller='admin'))
        self.app.get(url(controller='admin', action='index'))
        self.app.get(url(controller='admin', action='accesslog'))
        self.app.get(url(controller='admin', action='errorlog'))
        self.app.get(url(controller='admin', action='options'))

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `AdminController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='admin'), status=302)

    def test_03_controller_denied_for_viewers(self):
        """ Test than the `AdminController` controller is denied for users with 'view' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_04_controller_denied_for_editors(self):
        """ Test than the `AdminController` controller is denied for users with 'edit' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=302)

    def test_05_controller_allowed_for_managers(self):
        """ Test than the `AdminController` controller is allowed for users with 'manage' permission."""
        self.app.get(url(controller='admin'),
            extra_environ={'repoze.what.credentials': self.manager},
            status=200)

    def test_06_index_response(self):
        """ Test response of the `AdminController` index page."""
        response = self.app.get(url(controller='admin', action='index'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'admin index template' in response, 'admin index template is missing or has changed.'

    def test_07_accesslog_response(self):
        """ Test response of the `AdminController` accesslog page."""
        response = self.app.get(url(controller='admin', action='accesslog'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'admin accesslog template' in response, 'admin accesslog template is missing or has changed.'

    def test_08_errorlog_response(self):
        """ Test response of the `AdminController` errorlog page."""
        response = self.app.get(url(controller='admin', action='errorlog'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'admin errorlog template' in response, 'admin errorlog template is missing or has changed.'

    def test_09_options_response(self):
        """ Test response of the `AdminController` errorlog page."""
        response = self.app.get(url(controller='admin', action='options'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'admin options template' in response, 'admin options template is missing or has changed.'
