# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `ExcavationsController` controller fonctional tests."""

from archeologicaladdressbook.tests import *
from archeologicaladdressbook.tests.model.fixtures import excavation_fixture


class TestExcavationsController(TestController):
    """ Test the controller `ExcavationsController`."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestExcavationsController, self).setUp()
        excavation_fixture()

    def test_01_routes(self):
        """ Test the routes of the `ExcavationsController` controller."""
        self.app.get(url(controller='excavations'))
        self.app.get(url(controller='excavations', action='index'))
        self.app.get(url(controller='excavations', action='list'))
        self.app.get(url(controller='excavations', action='show'))
        self.app.get(url(controller='excavations', action='new'))
        self.app.get(url(controller='excavations', action='create'))
        self.app.get(url(controller='excavations', action='edit'))
        self.app.get(url(controller='excavations', action='update'))
        self.app.get(url(controller='excavations', action='confirm_delete'))
        self.app.get(url(controller='excavations', action='delete'))


    def test_index(self):
        response = self.app.get(url(controller='excavations', action='index'))
        # Test response...

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `ExcavationsController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='excavations'), status=302)

    def test_03_controller_allowed_for_editors(self):
        """ Test than the `ExcavationsController` controller is allowed for users with 'edit' permission."""
        self.app.get(url(controller='excavations'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=200)

    def test_04_controller_allowed_for_viewers(self):
        """ Test than the `ExcavationsController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='excavations'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_05_new_denied_for_viewers(self):
        """ Test than `new` action of the `ExcavationsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='excavations', action='new'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_06_edit_denied_for_viewers(self):
        """ Test than `edit` action of the `ExcavationsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='excavations', action='edit'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_07_delete_denied_for_viewers(self):
        """ Test than `confirm_delete` action of the `ExcavationsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='excavations', action='confirm_delete'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_08_index_response(self):
        """ Test response of the `ExcavationsController` index page."""
        response = self.app.get(url(controller='excavations', action='index'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'excavations index template' in response, 'excavations index template is missing or has changed.'

    def test_09_show_response(self):
        """ Test response of the `ExcavationsController` show page."""
        response = self.app.get(url(controller='excavations', action='show', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'excavations show template' in response, 'show excavations template is missing or has changed.'

    def test_10_new_response(self):
        """ Test response of the `ExcavationsController` new page."""
        # Note than `id` here is a `person_id`
        response = self.app.get(url(controller='excavations', action='new', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'excavations new template' in response, 'new excavations template is missing or has changed.'

    def test_11_edit_response(self):
        """ Test response of the `ExcavationsController` edit page."""
        response = self.app.get(url(controller='excavations', action='edit', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'excavations edit template' in response, 'edit excavations template is missing or has changed.'

    def test_12_confirm_delete_response(self):
        """ Test response of the `ExcavationsController` confirm_delete page."""
        response = self.app.get(url(controller='excavations', action='confirm_delete', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'excavations confirm_delete template' in response, 'confirm delete excavations template is missing or has changed.'
