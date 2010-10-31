# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `PersonsController` controler fonctional tests."""

from archeologicaladdressbook.tests import *


class TestPersonsController(TestController):
    """ Test the controller `PersonsController`."""

    def test_01_routes(self):
        """ Test the routes of the `PersonsController` controller."""
        self.app.get(url(controller='persons'))
        self.app.get(url(controller='persons', action='index'))
        self.app.get(url(controller='persons', action='list'))
        self.app.get(url(controller='persons', action='show'))
        self.app.get(url(controller='persons', action='new'))
        self.app.get(url(controller='persons', action='create'))
        self.app.get(url(controller='persons', action='edit'))
        self.app.get(url(controller='persons', action='update'))
        self.app.get(url(controller='persons', action='confirm_delete'))
        self.app.get(url(controller='persons', action='delete'))

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `PersonsController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='persons'), status=302)

    def test_03_controller_allowed_for_editors(self):
        """ Test than the `PersonsController` controller is allowed for users with 'edit' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=200)

    def test_04_controller_allowed_for_viewers(self):
        """ Test than the `PersonsController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_05_new_denied_for_viewers(self):
        """ Test than `new` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='new'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_06_edit_denied_for_viewers(self):
        """ Test than `edit` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='edit'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_07_delete_denied_for_viewers(self):
        """ Test than `confirm_delete` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='confirm_delete'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_08_index_response(self):
        """ Test response of the `PersonsController` index page."""
        response = self.app.get(url(controller='persons', action='index'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons index template' in response, 'person index template is missing or has changed.'

    def test_09_list_response(self):
        """ Test response of the `PersonsController` list page."""
        response = self.app.get(url(controller='persons', action='list'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons list template' in response, 'list person template is missing or has changed.'

    def test_10_show_response(self):
        """ Test response of the `PersonsController` show page."""
        response = self.app.get(url(controller='persons', action='show', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons show template' in response, 'show person template is missing or has changed.'

    def test_11_new_response(self):
        """ Test response of the `PersonsController` new page."""
        response = self.app.get(url(controller='persons', action='new'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons new template' in response, 'new person template is missing or has changed.'

    def test_12_edit_response(self):
        """ Test response of the `PersonsController` edit page."""
        response = self.app.get(url(controller='persons', action='edit', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons edit template' in response, 'edit person template is missing or has changed.'

    def test_13_confirm_delete_response(self):
        """ Test response of the `PersonsController` confirm_delete page."""
        response = self.app.get(url(controller='persons', action='confirm_delete', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons confirm_delete template' in response, 'confirm delete person template is missing or has changed.'
