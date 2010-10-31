# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the `Group` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import *


class TestGroupModel(TestModel):
    """ Unit test cases for the `Group` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestGroupModel, self).setUp()
        #user_fixture()
        group_fixture()

    def test_01_columns(self):
        """ Test the `Group` model columns and types."""
        group = Session.query(model.Group).filter_by().first()
        assert isinstance(group.group_id, int), '`group_id` column is missing or has changed.'
        assert isinstance(group.group_name, unicode), '`group_name` column is missing or has changed.'
        assert isinstance(group.display_name, unicode), '`display_name` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `Group` model.

        Test the unique constraint on `group_name`.
        """
        test_group = DuplicateGroupData.Guests()
        group = model.Group(
            group_name = test_group.group_name,
            display_name = test_group.display_name
        )
        Session.add(group)
        try:
            Session.commit()
            raise AssertionError('`Group` unique constraint on `group_name`, is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()
