# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the `Person` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import *


class TestPersonModel(TestModel):
    """ Unit test cases for the `Person` model."""

    def test_01_columns(self):
        """ Test the `Person` model columns and types."""
        person = Session.query(model.Person).filter_by().first()
        assert isinstance(person.id, int), '`id` column is missing or has changed.'
        assert isinstance(person.last_name, unicode), '`last_name` column is missing or has changed.'
        assert isinstance(person.first_name, unicode), '`first_name` column is missing or has changed.'
        assert isinstance(person.title, unicode), '`title` column is missing or has changed.'
        assert isinstance(person.birth_date, datetime.date), '`birth_date` column is missing or has changed.'
        assert isinstance(person.email_address, unicode), '`email_address` column is missing or has changed.'
        assert isinstance(person.phone, unicode), '`phone` column is missing or has changed.'
        assert isinstance(person.mobile_phone, unicode), '`mobile_phone` column is missing or has changed.'
        assert isinstance(person.activity, unicode), '`activity` column is missing or has changed.'
        assert isinstance(person.person_type, unicode), '`person_type` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `Person` model.

        Test the unique constraint on `last_name` and `first_name`.
        """
        test_person = DuplicatePersonData.JohnDoe()
        person = model.Person(
            last_name = test_person.last_name,
            first_name = test_person.first_name,
            title = test_person.title,
            birth_date = test_person.birth_date,
            activity = test_person.activity
        )
        Session.add(person)
        try:
            Session.commit()
            raise AssertionError('`Person` unique constraint on `last_name` and `first_name` is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_03_child_relations(self):
        """ Test the `Person` model child relations."""
        address_fixture()
        photo_fixture()
        person = Session.query(model.Person).filter_by().first()
        assert person.addresses, '`Address` child relation is missing.'
        assert person.photo, '`Photo` child relation is missing.'
