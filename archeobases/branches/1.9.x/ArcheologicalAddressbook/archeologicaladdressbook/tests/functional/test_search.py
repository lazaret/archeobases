# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `SearchControler` controler fonctional tests."""

from archeologicaladdressbook.tests import *


class TestSearchController(TestController):
    """ Test the controller `SearchControler`."""

    def test_index(self):
        """ Test the url of the search index page."""
        response = self.app.get(url(controller='search', action='index'))
        # Test response...
