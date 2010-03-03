""" Unit test cases for the ``Person`` model."""


import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicatePersonData, email_fixture


class TestPersonModel(TestModel):
    """ Unit test cases for the ``Person`` model."""

    def test_columns(self):
        """ Test the `Person` model columns and types."""
        person = meta.Session.query(model.Person).filter_by().first()
        assert isinstance(person.person_id, int), '`person_id` column is missing or have changed.'
        assert isinstance(person.last_name, unicode), '`last_name` column is missing or have changed.'
        assert isinstance(person.first_name, unicode), '`first_name` column is missing or have changed.'
        assert isinstance(person.title, unicode), '`title` column is missing or have changed.'
        assert isinstance(person.birth_date, datetime.date), '`birth_date` column is missing or have changed.'
        assert isinstance(person.activity, unicode), '`activity` column is missing or have changed.'
        assert isinstance(person.person_type, unicode), '`person_type` column is missing or have changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Person` model."""
        test_person = DuplicatePersonData.john_doe()
        person = model.Person(
            last_name = test_person.last_name,
            first_name = test_person.first_name,
            title = test_person.title,
            birth_date = test_person.birth_date,
            activity = test_person.activity,
            person_type = test_person.person_type
        )
        meta.Session.add(person)
        try:
            meta.Session.commit()
            raise AssertionError('`Person` unique constrain is missing.')
        except sa.exc.IntegrityError:
            meta.Session.rollback()

    def test_child_relations(self):
        """ Test the `Person` model childs relations."""
        email_fixture()
        person = meta.Session.query(model.Person).filter_by().first()
        assert person.emails, '`Email` child relation is missing.'


