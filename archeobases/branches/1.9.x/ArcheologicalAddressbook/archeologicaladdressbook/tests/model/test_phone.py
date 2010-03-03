""" Unit test cases for the ``Email`` model."""

import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicatePhoneData, OrphanPhoneData, phone_fixture


class TestPhoneModel(TestModel):
    """ Unit test cases for the ``Phone`` model."""

    def setUp(self):
        super(TestPhoneModel, self).setUp()
        phone_fixture()


    def test_columns(self):
        """ Test the `Phone` model columns and types."""
        phone = meta.Session.query(model.Phone).filter_by().first()
        assert isinstance(phone.phone_id, int), '`phone_id` column is missing or have changed.'
        assert isinstance(phone.person_id, int), '`person_id` column is missing or have changed.'
        #assert isinstance(phone.prefix, int), '`prefix` column is missing or have changed.'
        assert isinstance(phone.phone_number, unicode), '`phone_number` column is missing or have changed.'
        assert isinstance(phone.phone_number, unicode), '`phone_number` column is missing or have changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Phone` model."""
        test_phone = DuplicatePhoneData.john_doe_phone()
        person = meta.Session.query(model.Person).filter_by().first()
        person.phones.append(
            model.Phone(
                phone_number = test_phone.phone_number,
                phone_type = test_phone.phone_type
            )
        )
        try:
            meta.Session.commit()
            raise AssertionError('`Phone` unique constrain is missing.')
        except sa.exc.IntegrityError:
            meta.Session.rollback()

    def test_parent_relation(self):
        """ Test the `Phone` model parent relation."""
        phone = meta.Session.query(model.Phone).filter_by().first()
        assert phone.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Phone` model."""
        person = meta.Session.query(model.Person).filter_by().first()
        meta.Session.delete(person)
        meta.Session.commit()
        phones = meta.Session.query(model.Phone).filter_by(person_id=person.person_id).count()
        assert phones == 0

    def test_orphans(self):
        """ Test than orphans are forbiden for the `Phone` model."""
        test_phone = OrphanPhoneData.john_smith_phone()
        phone = model.Phone(
            phone_number = test_phone.phone_number,
            phone_type = test_phone.phone_type
        )
        meta.Session.add(phone)
        try:
            meta.Session.commit()
            raise AssertionError('`Phone` delete-orphans constrain is missing.')
        except sa.exc.FlushError:
            meta.Session.rollback()





