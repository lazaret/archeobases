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

    editor = {'repoze.what.userid': u'editor',
                   'groups': (u'editors'),
                   'permissions': (u'edit', u'view')}

    guest = {'repoze.what.userid': u'guest',
                   'groups': (u'guests'),
                   'permissions': (u'view')}

    def test_1_routes(self):
        """ Test the routes of the `PersonsController` controller."""
        self.app.get(url(controller='persons'))
        self.app.get(url(controller='persons', action='index'))
        self.app.get(url(controller='persons', action='list'))
        self.app.get(url(controller='persons', action='show'))
        self.app.get(url(controller='persons', action='new'))
        self.app.get(url(controller='persons', action='create'))
        self.app.get(url(controller='persons', action='edit'))
        self.app.get(url(controller='persons', action='update'))
        self.app.get(url(controller='persons', action='delete'))
        self.app.get(url(controller='persons', action='confirm_delete'))

    def test_2_controller_denied_for_anonymous(self):
        """ Test than the `PersonsController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='persons'), status=302)

    def test_3_controller_allowed_for_editors(self):
        """ Test than the `PersonsController` controller is allowed for users with 'edit' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=200)

    def test_4_controller_allowed_for_viewers(self):
        """ Test than the `PersonsController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_5_new_denied_for_viewers(self):
        """ Test than `new` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='new'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_6_edit_denied_for_viewers(self):
        """ Test than `edit` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='edit'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_7_delete_denied_for_viewers(self):
        """ Test than `confirm_delete` action of the `PersonsController` is denied for users with 'view' permission."""
        self.app.get(url(controller='persons', action='confirm_delete'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=302)

    def test_8_index_response(self):
        """ Test response of the `PersonsController` index page."""
        response = self.app.get(url(controller='persons', action='index'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons index template' in response, 'person index template is missing or has changed.'

    def test_9_edit_response(self): #TODO add a database fixture
        """ Test response of the `PersonsController` edit page."""
        response = self.app.get(url(controller='persons', action='edit', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons edit template' in response, 'edit person template is missing or has changed.'

    def test_10_list_response(self):
        """ Test response of the `PersonsController` list page."""
        response = self.app.get(url(controller='persons', action='list'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons list template' in response, 'list person template is missing or has changed.'

    def test_11_new_response(self):
        """ Test response of the `PersonsController` new page."""
        response = self.app.get(url(controller='persons', action='new'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons new template' in response, 'new person template is missing or has changed.'

    def test_12_show_response(self): #TODO add a database fixture
        """ Test response of the `PersonsController` show page."""
        response = self.app.get(url(controller='persons', action='show', id='1'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'persons show template' in response, 'show person template is missing or has changed.'

