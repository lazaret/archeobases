# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the ``Excavation`` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import TestModel
from archeologicaladdressbook.tests.model.fixtures import OrphanExcavationData
from archeologicaladdressbook.tests.model.fixtures import excavation_fixture


class TestExcavationModel(TestModel):
    """ Unit test cases for the ``Excavation`` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestExcavationModel, self).setUp()
        excavation_fixture()

    def test_01_columns(self):
        """ Test the `Excavation` model columns and types."""
        excavation = Session.query(model.Excavation).filter_by().first()
        assert isinstance(excavation.excavation_id, int), \
            '`excavation_id` column is missing or has changed.'
        assert isinstance(excavation.person_id, int), \
            '`person_id` column is missing or has changed.'
        assert isinstance(excavation.site_name, unicode), \
            '`site_name` column is missing or has changed.'
        assert isinstance(excavation.start_date, datetime.date), \
            '`start_date` column is missing or has changed.'
        assert isinstance(excavation.end_date, datetime.date), \
            '`end_date` column is missing or has changed.'
        assert isinstance(excavation.appreciation, unicode), \
            '`appreciation` column is missing or has changed.'

    def test_02_parent_relation(self):
        """ Test the `Excavation` model parent relation."""
        excavation = Session.query(model.Excavation).filter_by().first()
        assert excavation.person

    def test_03_cascade_delete(self):
        """ Test for cascade delete on the `Excavation` model."""
        person = Session.query(model.Person).filter_by().first()
        Session.delete(person)
        Session.commit()
        excavations = Session.query(model.Excavation). \
            filter_by(person_id=person.person_id).count()
        assert excavations == 0

    def test_04_orphans(self):
        """ Test that orphans are forbidden for the `Excavation` model."""
        test_excavation = OrphanExcavationData.ExcavationSite2()
        excavation = model.Excavation(
            site_name=test_excavation.site_name,
            start_date=test_excavation.start_date,
            end_date=test_excavation.end_date,
            appreciation=test_excavation.appreciation
        )
        Session.add(excavation)
        try:
            Session.commit()
            raise AssertionError("`Excavation` delete-orphans constraint \
                is missing.")
        except sa.exc.FlushError:
            Session.rollback()
