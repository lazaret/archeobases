# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the ``Email`` model."""

import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicateAddressData, OrphanAddressData, address_fixture


class TestAddressModel(TestModel):
    """ Unit test cases for the ``Address`` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestAddressModel, self).setUp()
        address_fixture()

    def test_01_columns(self):
        """ Test the `Address` model columns and types."""
        address = Session.query(model.Address).filter_by().first()
        assert isinstance(address.id, int), '`id` column is missing or has changed.'
        assert isinstance(address.person_id, int), '`person_id` column is missing or has changed.'
        assert isinstance(address.address_line1, unicode), '`address_line1` column is missing or has changed.'
        assert isinstance(address.address_line2, unicode), '`address_line2` column is missing or has changed.'
        assert isinstance(address.address_line3, unicode), '`address_line3` column is missing or has changed.'
        assert isinstance(address.zip_code, unicode), '`zip_code` column is missing or has changed.'
        assert isinstance(address.country, unicode), '`country` column is missing or has changed.'
        assert isinstance(address.address_type, unicode), '`address_type` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `Address` model.

        Test the unique constraint on `person_id` and `address_type`."""
        test_address = DuplicateAddressData.JohnDoeAddress()
        person = Session.query(model.Person).filter_by().first()
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
            Session.commit()
            raise AssertionError('`Address` unique constraint on `person_id` and `address_type` is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_03_parent_relation(self):
        """ Test the `Address` model parent relation."""
        address = Session.query(model.Address).filter_by().first()
        assert address.person

    def test_04_cascade_delete(self):
        """ Test for cascade delete on the `Address` model."""
        person = Session.query(model.Person).filter_by().first()
        Session.delete(person)
        Session.commit()
        addresses = Session.query(model.Address).filter_by(person_id=person.id).count()
        assert addresses == 0

    def test_05_orphans(self):
        """ Test that orphans are forbidden for the `Address` model."""
        test_address = OrphanAddressData.JohnSmithAddress()
        address = model.Address(
            address_line1 = test_address.address_line1,
            address_line2 = test_address.address_line2,
            address_line3 = test_address.address_line3,
            zip_code = test_address.zip_code,
            city = test_address.city,
            country = test_address.country,
            address_type = test_address.address_type
        )
        Session.add(address)
        try:
            Session.commit()
            raise AssertionError('`Address` delete-orphans constraint is missing.')
        except sa.exc.FlushError:
            Session.rollback()
