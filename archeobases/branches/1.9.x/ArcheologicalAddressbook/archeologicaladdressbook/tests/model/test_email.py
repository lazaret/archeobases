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
from archeologicaladdressbook.tests.model.fixtures import DuplicateEmailData, OrphanEmailData, email_fixture


class TestEmailModel(TestModel):
    """ Unit test cases for the ``Email`` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestEmailModel, self).setUp()
        email_fixture()

    def test_columns(self):
        """ Test the `Email` model columns and types."""
        email = Session.query(model.Email).filter_by().first()
        assert isinstance(email.email_id, int), '`email_id` column is missing or has changed.'
        assert isinstance(email.person_id, int), '`person_id` column is missing or has changed.'
        assert isinstance(email.email_address, unicode), '`email_address` column is missing or has changed.'
        assert isinstance(email.email_type, unicode), '`email_type` column is missing or has changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Email` model.

        Test the unique constraint on `person_id` and `email_address`.
        """
        test_email = DuplicateEmailData.JohnDoeMail()
        person = Session.query(model.Person).filter_by().first()
        person.emails.append(
            model.Email(
                email_address = test_email.email_address,
                email_type = test_email.email_type
            )
        )
        try:
            Session.commit()
            raise AssertionError('`Email` unique constraint on `person_id` and `email_address` is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_parent_relation(self):
        """ Test the `Email` model parent relation."""
        email = Session.query(model.Email).filter_by().first()
        assert email.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Email` model."""
        person = Session.query(model.Person).filter_by().first()
        Session.delete(person)
        Session.commit()
        emails = Session.query(model.Email).filter_by(person_id=person.person_id).count()
        assert emails == 0

    def test_orphans(self):
        """ Test that orphans are forbidden for the `Email` model."""
        test_email = OrphanEmailData.JohnSmithMail()
        email = model.Email(
            email_address = test_email.email_address,
            email_type = test_email.email_type
        )
        Session.add(email)
        try:
            Session.commit()
            raise AssertionError('`Email` delete-orphans constraint is missing.')
        except sa.exc.FlushError:
            Session.rollback()





