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
                   'permissions': (u'edit',u'view')}

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

    def test_2_anonymous_denied(self):
        """ Test than the `PersonsController` controller is denied to anonymous."""
        # status 302 and not 401 because denied users are redirected to the main page
        self.app.get(url(controller='persons'), status=302)

    #TODO separate 'view' and 'edit' permissions tests (and update templates)
    def test_3_edit_allowed(self):
        """ Test than the `PersonsController` controller is allowed for users with 'edit' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.editor},
            status=200)

    def test_4_view_allowed(self):
        """ Test than the `PersonsController` controller is allowed for users with 'view' permission."""
        self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': self.guest},
            status=200)

    def test_5_index_response(self):
        """ Test response of the `PersonsController` index page."""
        response = self.app.get(url(controller='persons', action='index'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'index_person template' in response

#TODO add fixture for this test
#    def test_5_edit_response(self):
#        """ Test response of the `PersonsController` edit page."""
#        response = self.app.get(url(controller='persons', action='edit'),
#            extra_environ={'repoze.what.credentials': self.editor})
#        assert 'edit_person template' in response

    def test_6_list_response(self):
        """ Test response of the `PersonsController` list page."""
        response = self.app.get(url(controller='persons', action='list'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'list_person template' in response

    def test_7_new_response(self):
        """ Test response of the `PersonsController` new page."""
        response = self.app.get(url(controller='persons', action='new'),
            extra_environ={'repoze.what.credentials': self.editor})
        assert 'new_person template' in response

#TODO add fixture for this test
#    def test_8_show_response(self):
#        """ Test response of the `PersonsController` show page."""
#        response = self.app.get(url(controller='persons', action='show'),
#            extra_environ={'repoze.what.credentials': self.editor})
#        assert 'show_person template' in response

#TODO add more auth tests -> view + edit
