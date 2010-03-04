# -*- coding: utf-8 -*-
""" Unit test cases for the ``Email`` model."""

import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicateAddressData, OrphanAddressData, address_fixture


class TestAddressModel(TestModel):
    """ Unit test cases for the ``Address`` model."""

    def setUp(self):
        super(TestAddressModel, self).setUp()
        address_fixture()


    def test_columns(self):
        """ Test the `Address` model columns and types."""
        address = meta.Session.query(model.Address).filter_by().first()
        assert isinstance(address.address_id, int), '`address_id` column is missing or have changed.'
        assert isinstance(address.person_id, int), '`person_id` column is missing or have changed.'
        assert isinstance(address.address_line1, unicode), '`address_line1` column is missing or have changed.'
        assert isinstance(address.address_line2, unicode), '`address_line2` column is missing or have changed.'
        assert isinstance(address.address_line3, unicode), '`address_line3` column is missing or have changed.'
        assert isinstance(address.zip_code, unicode), '`zip_code` column is missing or have changed.'
        assert isinstance(address.country, unicode), '`country` column is missing or have changed.'
        assert isinstance(address.address_type, unicode), '`address_type` column is missing or have changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Address` model.

        Test the unique constraint on `person_id` and `address_type`."""
        test_address = DuplicateAddressData.john_doe_address()
        person = meta.Session.query(model.Person).filter_by().first()
        person.addresses.append(
            model.Address(
                address_line1 = test_address.address_line1,
                address_line2 = test_address.address_line2,
                address_line3 = test_address.address_line3,
                zip_code = test_address.zip_code,
                city = test_address.city,
                country = test_address.country,
                address_type = test_address.address_type
            )
        )
        try:
            meta.Session.commit()
            raise AssertionError('`Address` unique constrain on `person_id` and `address_type` is missing.')
        except sa.exc.IntegrityError:
            meta.Session.rollback()

    def test_parent_relation(self):
        """ Test the `Address` model parent relation."""
        address = meta.Session.query(model.Address).filter_by().first()
        assert address.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Address` model."""
        person = meta.Session.query(model.Person).filter_by().first()
        meta.Session.delete(person)
        meta.Session.commit()
        addresses = meta.Session.query(model.Phone).filter_by(person_id=person.person_id).count()
        assert addresses == 0

    def test_orphans(self):
        """ Test than orphans are forbiden for the `Address` model."""
        test_address = OrphanAddressData.john_smith_address()
        address = model.Address(
            address_line1 = test_address.address_line1,
            address_line2 = test_address.address_line2,
            address_line3 = test_address.address_line3,
            zip_code = test_address.zip_code,
            city = test_address.city,
            country = test_address.country,
            address_type = test_address.address_type
        )
        meta.Session.add(address)
        try:
            meta.Session.commit()
            raise AssertionError('`Address` delete-orphans constrain is missing.')
        except sa.exc.FlushError:
            meta.Session.rollback()





