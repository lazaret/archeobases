""" Unit test cases for the ``Email`` model."""


import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicateEmailData, OrphanEmailData, email_fixture


class TestEmailModel(TestModel):
    """ Unit test cases for the ``Email`` model."""

    def setUp(self):
        super(TestEmailModel, self).setUp()
        email_fixture()


    def test_columns(self):
        """ Test the `Email` model columns and types."""
        email = meta.Session.query(model.Email).filter_by().first()
        assert isinstance(email.email_id, int), '`email_id` column is missing or have changed.'
        assert isinstance(email.person_id, int), '`person_id` column is missing or have changed.'
        assert isinstance(email.email_address, unicode), '`email_address` column is missing or have changed.'
        assert isinstance(email.email_type, unicode), '`email_type` column is missing or have changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Email` model."""
        test_email = DuplicateEmailData.john_doe_mail()
        person = meta.Session.query(model.Person).filter_by().first()
        person.emails.append(
            model.Email(
                email_address = test_email.email_address,
                email_type = test_email.email_type,
            )
        )
        try:
            meta.Session.commit()
            raise AssertionError('`Email` unique constrain is missing.')
        except sa.exc.IntegrityError:
            meta.Session.rollback()

    def test_parent_relation(self):
        """ Test the `Email` model parent relation."""
        email = meta.Session.query(model.Email).filter_by().first()
        assert email.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Email` model."""
        person = meta.Session.query(model.Person).filter_by().first()
        meta.Session.delete(person)
        meta.Session.commit()
        emails = meta.Session.query(model.Email).filter_by(person_id=person.person_id).count()
        assert emails == 0

    def test_orphans(self):
        """ Test than orphans are forbiden for the `Email` model."""
        test_email = OrphanEmailData.john_smith_mail()
        email = model.Email(
            email_address = test_email.email_address,
            email_type = test_email.email_type,
        )
        meta.Session.add(email)
        try:
            meta.Session.commit()
            raise AssertionError('`Email` delete-orphans constrain is missing.')
        except sa.exc.FlushError:
            meta.Session.rollback()





