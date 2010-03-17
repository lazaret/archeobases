# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test suite for the models of the application."""

from unittest import TestCase

from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model.fixtures import person_fixture


def setup():
    """ Detroy a possibly remaining test database."""
    meta.metadata.drop_all(meta.engine)


class TestModel(TestCase):
    """ Base unit test case for the models."""

    def setUp(self):
        """ Method used to build a test database."""
        meta.metadata.create_all(meta.engine)
        person_fixture()

    def tearDown(self):
        """ Method used to destroy the test database."""
        meta.metadata.drop_all(meta.engine)


