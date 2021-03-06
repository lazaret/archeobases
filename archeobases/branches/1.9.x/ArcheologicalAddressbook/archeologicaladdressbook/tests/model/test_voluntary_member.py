# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the `VoluntaryMember` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import Base
from archeologicaladdressbook.tests.model import TestModel
from archeologicaladdressbook.tests.model.fixtures import VoluntaryMemberData
from archeologicaladdressbook.tests.model.fixtures import DuplicateVoluntaryMemberData
from archeologicaladdressbook.tests.model.fixtures import voluntary_member_fixture


class TestVoluntaryMemberModel(TestModel):
    """ Unit test cases for the `VoluntaryMember` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        Base.metadata.create_all(bind=Session.bind)
        voluntary_member_fixture()

    def test_01_columns(self):
        """ Test the `VoluntaryMember` model columns and types."""
        v_member = Session.query(model.VoluntaryMember).filter_by().first()
        assert isinstance(v_member.voluntary_member_id, int), \
            '`voluntary_member_id` column is missing or has changed.'
        assert isinstance(v_member.last_name, unicode), \
            '`last_name` column is missing or has changed.'
        assert isinstance(v_member.first_name, unicode), \
            '`first_name` column is missing or has changed.'
        assert isinstance(v_member.title, unicode), \
            '`title` column is missing or has changed.'
        assert isinstance(v_member.birth_date, datetime.date), \
            '`birth_date` column is missing or has changed.'
        assert isinstance(v_member.activity, unicode), \
            '`activity` column is missing or has changed.'
        assert isinstance(v_member.person_type, unicode), \
            '`person_type` column is missing or has changed.'
        assert isinstance(v_member.member_number, int), \
            '`member_number` column is missing or has changed.'
        assert isinstance(v_member.last_fee_date, datetime.date), \
            '`last_fee_date` column is missing or has changed.'

    def test_02_inherinting(self):
        """ Test that `VoluntaryMember` model inherit from `Person` model."""
        test_v_member = VoluntaryMemberData.JohnSmith()
        person = Session.query(model.Person).filter_by(last_name=test_v_member.last_name).one()
        v_member = Session.query(model.VoluntaryMember).filter_by(last_name=test_v_member.last_name).one()
        assert person == v_member

    def test_03_unique_constraint(self):
        """ Test for unique constraint for the `VoluntaryMember` model.

        Test the unique constraint on `member_number`.
        """
        test_v_member = DuplicateVoluntaryMemberData.MaryJohnes()
        v_member = model.VoluntaryMember(
            last_name=test_v_member.last_name,
            first_name=test_v_member.first_name,
            title=test_v_member.title,
            birth_date=test_v_member.birth_date,
            activity=test_v_member.activity,
            member_number=test_v_member.member_number,
            last_fee_date=test_v_member.last_fee_date
        )
        Session.add(v_member)
        try:
            Session.commit()
            raise AssertionError('`VoluntaryMember` unique constraint on `member_number` is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_04_cascade_delete(self):
        """ Test for cascade delete between `VoluntaryMember` and `Person` models."""
        v_member = Session.query(model.VoluntaryMember).filter_by().first()
        Session.delete(v_member)
        Session.commit()
        person = Session.query(model.Person).filter_by(person_id=v_member.person_id).count()
        assert person == 0

# `VoluntaryMember` child relations are not tested as the test for this in test_person.py may be sufficient
