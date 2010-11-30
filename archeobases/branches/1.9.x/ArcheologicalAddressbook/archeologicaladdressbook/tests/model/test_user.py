# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the `User` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import TestModel
from archeologicaladdressbook.tests.model.fixtures import DuplicateUserData
from archeologicaladdressbook.tests.model.fixtures import user_fixture
from archeologicaladdressbook.tests.model.fixtures import group_fixture


class TestUserModel(TestModel):
    """ Unit test cases for the `User` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestUserModel, self).setUp()
        user_fixture()
        group_fixture()

    def test_01_columns(self):
        """ Test the `User` model columns and types."""
        user = Session.query(model.User).filter_by().first()
        assert isinstance(user.user_id, int), \
            '`user_id` column is missing or has changed.'
        assert isinstance(user.user_name, unicode), \
            '`user_name` column is missing or has changed.'
        assert isinstance(user.email_address, unicode), \
            '`email_address` column is missing or has changed.'
        assert isinstance(user.password, unicode), \
            '`password` column is missing or has changed.'
        assert isinstance(user.display_name, unicode), \
            '`display_name` column is missing or has changed.'
        assert isinstance(user.created, datetime.date), \
            '`created` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `User` model.

        Test the unique constraint on `user_name`.
        """
        test_user = DuplicateUserData.Guest()
        user = model.User(
            user_name=test_user.user_name,
            email_address=test_user.email_address,
            password=test_user.password,
            display_name=test_user.display_name
        )
        Session.add(user)
        try:
            Session.commit()
            raise AssertionError('`User` unique constraint on `user_name`, is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_03_group_relation(self):
        """ Test the `User` model relation with `Group`."""
        user = Session.query(model.User).filter_by().first()
        assert user.groups
