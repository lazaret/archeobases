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

    #TODO separate 'view' and 'edit' permissions tests
    def test_3_editors_allowed(self):
        """ Test than the `PersonsController` controller is allowed for editors."""
        editor = {'repoze.what.userid': u'editor',
                   'groups': (u'editors',),
                   'permissions': (u'edit',)}
        response = self.app.get(url(controller='persons'),
            extra_environ={'repoze.what.credentials': editor},
            status=200)
        return response

    def test_4_index_response(self):
        """ Test response of the `PersonsController` index page."""
        pass
        #response = self.test_3_editors_allowed()
        #assert 'test' in response

