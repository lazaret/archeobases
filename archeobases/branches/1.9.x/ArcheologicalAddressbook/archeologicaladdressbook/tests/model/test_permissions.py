# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the `Permission` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import *


class TestPermissionModel(TestModel):
    """ Unit test cases for the `Permission` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestPermissionModel, self).setUp()
        group_fixture()
        permission_fixture()

    def test_01_columns(self):
        """ Test the `Permission` model columns and types."""
        permission = Session.query(model.Permission).filter_by().first()
        assert isinstance(permission.permission_id, int), '`permission_id` column is missing or has changed.'
        assert isinstance(permission.permission_name, unicode), '`permission_name` column is missing or has changed.'
        assert isinstance(permission.description, unicode), '`description` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `Permission` model.

        Test the unique constraint on `group_name`.
        """
        test_permission = DuplicatePermissionData.View()
        permission = model.Permission(
            permission_name = test_permission.permission_name,
            description = test_permission.description
        )
        Session.add(permission)
        try:
            Session.commit()
            raise AssertionError('`Permission` unique constraint on `group_name`, is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_03_group_relation(self):
        """ Test the `Permission` model relation with `Group`."""
        permission = Session.query(model.Permission).filter_by().first()
        assert permission.groups
