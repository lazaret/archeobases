# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `AddressesController` controller fonctional tests."""

from archeologicaladdressbook.tests import *
from archeologicaladdressbook.tests.model.fixtures import address_fixture


class TestAddressesController(TestController):
    """ Test the controller `AddressesController`."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestAddressesController, self).setUp()
        address_fixture()

    def test_01_routes(self):
        """ Test the routes of the `AddressesController` controller."""
        self.app.get(url(controller='addresses'))
        self.app.get(url(controller='addresses', action='index'))
        self.app.get(url(controller='addresses', action='list'))
        self.app.get(url(controller='addresses', action='show'))
        self.app.get(url(controller='addresses', action='new'))
        self.app.get(url(controller='addresses', action='create'))
        self.app.get(url(controller='addresses', action='edit'))
        self.app.get(url(controller='addresses', action='update'))
        self.app.get(url(controller='addresses', action='confirm_delete'))
        self.app.get(url(controller='addresses', action='delete'))

    def test_02_controller_denied_for_anonymous(self):
        """ Test than the `AddressesController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='addresses'), status=302)

    def test_03_controller_allowed_for_editors(self):
        """ Test than the `AddressesController` controller is allowed for users with 'edit' permission."""
        self.app.get(url(controller='addresses'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=200)

    def test_04_controller_allowed_for_viewers(self):
        """ Test than the `AddressesController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='addresses'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_05_new_denied_for_viewers(self):
        """ Test than `new` action of the `AddressesController` is denied for users with 'view' permission."""
        self.app.get(url(controller='addresses', action='new'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_06_edit_denied_for_viewers(self):
        """ Test than `edit` action of the `AddressesController` is denied for users with 'view' permission."""
        self.app.get(url(controller='addresses', action='edit'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_07_delete_denied_for_viewers(self):
        """ Test than `confirm_delete` action of the `AddressesController` is denied for users with 'view' permission."""
        self.app.get(url(controller='addresses', action='confirm_delete'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_08_index_response(self):
        """ Test response of the `AddressesController` index page."""
        response = self.app.get(url(controller='addresses', action='index'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses index template' in response, 'address index template is missing or has changed.'

    def test_09_list_response(self):
        """ Test response of the `AddressesController` list page."""
        response = self.app.get(url(controller='addresses', action='list'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses list template' in response, 'list address template is missing or has changed.'

    def test_10_show_response(self):
        """ Test response of the `AddressesController` show page."""
        response = self.app.get(url(controller='addresses', action='show', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses show template' in response, 'show address template is missing or has changed.'

    def test_11_new_response(self):
        """ Test response of the `AddressesController` new page."""
        # Note than `id` here is a `person_id`
        response = self.app.get(url(controller='addresses', action='new', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses new template' in response, 'new address template is missing or has changed.'

    def test_12_edit_response(self):
        """ Test response of the `AddressesController` edit page."""
        response = self.app.get(url(controller='addresses', action='edit', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses edit template' in response, 'edit address template is missing or has changed.'

    def test_13_confirm_delete_response(self):
        """ Test response of the `AddressesController` confirm_delete page."""
        response = self.app.get(url(controller='addresses', action='confirm_delete', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'addresses confirm_delete template' in response, 'confirm delete address template is missing or has changed.'
