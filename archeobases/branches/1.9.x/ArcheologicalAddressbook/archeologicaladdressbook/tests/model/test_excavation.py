# -*- coding: utf-8 -*-
""" Unit test cases for the ``Excavation`` model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import OrphanExcavationData, excavation_fixture


class TestExcavationModel(TestModel):
    """ Unit test cases for the ``Excavation`` model."""

    def setUp(self):
        super(TestExcavationModel, self).setUp()
        excavation_fixture()


    def test_columns(self):
        """ Test the `Excavation` model columns and types."""
        excavation = meta.Session.query(model.Excavation).filter_by().first()
        assert isinstance(excavation.excavation_id, int), '`excavation_id` column is missing or have changed.'
        assert isinstance(excavation.person_id, int), '`person_id` column is missing or have changed.'
        assert isinstance(excavation.site_name, unicode), '`site_name` column is missing or have changed.'
        assert isinstance(excavation.start_date, datetime.date), '`birth_date` column is missing or have changed.'
        assert isinstance(excavation.end_date, datetime.date), '`birth_date` column is missing or have changed.'
        assert isinstance(excavation.appreciation, unicode), '`appreciation` column is missing or have changed.'

    def test_parent_relation(self):
        """ Test the `Excavation` model parent relation."""
        excavation = meta.Session.query(model.Excavation).filter_by().first()
        assert excavation.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Excavation` model."""
        person = meta.Session.query(model.Person).filter_by().first()
        meta.Session.delete(person)
        meta.Session.commit()
        excavations = meta.Session.query(model.Excavation).filter_by(person_id=person.person_id).count()
        assert excavations == 0

    def test_orphans(self):
        """ Test than orphans are forbiden for the `Excavation` model."""
        test_excavation = OrphanExcavationData.excavation_site_2()
        excavation = model.Excavation(
            site_name = test_excavation.site_name,
            start_date = test_excavation.start_date,
            end_date = test_excavation.end_date,
            appreciation = test_excavation.appreciation
        )
        meta.Session.add(excavation)
        try:
            meta.Session.commit()
            raise AssertionError('`Excavation` delete-orphans constrain is missing.')
        except sa.exc.FlushError:
            meta.Session.rollback()





