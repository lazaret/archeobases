# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `UsersController` controller fonctional tests."""

from archeologicaladdressbook.tests import *
from archeologicaladdressbook.tests.model.fixtures import user_fixture, group_fixture, permission_fixture


class TestUsersController(TestController):
    """ Test the controller `UsersController`."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestUsersController, self).setUp()
        user_fixture()
        group_fixture()
        permission_fixture()

    def test_01_routes(self):
        """ Test the routes of the `UsersController` controller."""
        self.app.get(url(controller='users'))
        self.app.get(url(controller='users', action='index'))
        self.app.get(url(controller='users', action='list'))
        self.app.get(url(controller='users', action='show'))
        self.app.get(url(controller='users', action='new'))
        self.app.get(url(controller='users', action='create'))
        self.app.get(url(controller='users', action='edit'))
        self.app.get(url(controller='users', action='update'))
        self.app.get(url(controller='users', action='edit_password'))
        self.app.get(url(controller='users', action='update_password'))
        self.app.get(url(controller='users', action='confirm_delete'))
        self.app.get(url(controller='users', action='delete'))

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `UsersController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='users'), status=302)

    def test_03_controller_denied_for_viewers(self):
        """ Test than the `UsersController` controller is denied for users with 'view' permission."""
        self.app.get(url(controller='users'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_04_controller_denied_for_editors(self):
        """ Test than the `UsersController` controller is denied for users with 'edit' permission."""
        self.app.get(url(controller='users'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=302)

    def test_05_controller_allowed_for_managers(self):
        """ Test than the `UsersController` controller is allowed for users with 'manage' permission."""
        self.app.get(url(controller='users'),
            extra_environ={'repoze.what.credentials': self.manager},
            status=200)

    def test_06_index_response(self):
        """ Test response of the `UsersController` index page."""
        response = self.app.get(url(controller='users', action='index'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users index template' in response, 'users index template is missing or has changed.'

    def test_07_list_response(self):
        """ Test response of the `UsersController` list page."""
        response = self.app.get(url(controller='users', action='list'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users list template' in response, 'list users template is missing or has changed.'

    def test_08_show_response(self):
        """ Test response of the `UsersController` show page."""
        response = self.app.get(url(controller='users', action='show', id='1'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users show template' in response, 'show user template is missing or has changed.'

    def test_09_new_response(self):
        """ Test response of the `UsersController` new page."""
        response = self.app.get(url(controller='users', action='new'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users new template' in response, 'new user template is missing or has changed.'

    def test_10_edit_response(self):
        """ Test response of the `UsersController` edit page."""
        response = self.app.get(url(controller='users', action='edit', id='1'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users edit template' in response, 'edit user template is missing or has changed.'

    def test_11_edit_password_response(self):
        """ Test response of the `UsersController` edit_password page."""
        response = self.app.get(url(controller='users', action='edit_password', id='1'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users edit_password template' in response, 'edit user password template is missing or has changed.'

    def test_12_confirm_delete_response(self):
        """ Test response of the `UsersController` confirm_delete page."""
        response = self.app.get(url(controller='users', action='confirm_delete', id='1'),
            extra_environ={'repoze.what.credentials': self.manager})
        assert 'users confirm_delete template' in response, 'confirm delete user template is missing or has changed.'
