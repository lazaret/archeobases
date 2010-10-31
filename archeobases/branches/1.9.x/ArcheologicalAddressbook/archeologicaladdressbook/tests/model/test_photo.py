# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Unit test cases for the ``Photo`` model."""

import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicatePhotoData, OrphanPhotoData, photo_fixture


class TestPhotoModel(TestModel):
    """ Unit test cases for the ``Email`` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestPhotoModel, self).setUp()
        photo_fixture()

    def test_01_columns(self):
        """ Test the `Photo` model columns and types."""
        photo = Session.query(model.Photo).filter_by().first()
        assert isinstance(photo.id, int), '`id` column is missing or has changed.'
        assert isinstance(photo.person_id, int), '`person_id` column is missing or has changed.'
        assert isinstance(photo.path, unicode), '`path` column is missing or has changed.'

    def test_02_unique_constraint(self):
        """ Test for unique constraint for the `Photo` model.

        Test the unique constraint on `path`.
        """
        test_photo = DuplicatePhotoData.JohnDoePhoto()
        person = Session.query(model.Person).filter_by().first()
        person.photo = model.Photo(
                            path = test_photo.path
                        )
        try:
            Session.commit()
            raise AssertionError('`Photo` unique constraint on `path` is missing.')
        except sa.exc.IntegrityError:
            Session.rollback()

    def test_03_parent_relation(self):
        """ Test the `Photo` model parent relation."""
        photo = Session.query(model.Photo).filter_by().first()
        assert photo.person

    def test_04_cascade_delete(self):
        """ Test for cascade delete on the `Photo` model."""
        person = Session.query(model.Person).filter_by().first()
        Session.delete(person)
        Session.commit()
        photos = Session.query(model.Photo).filter_by(person_id=person.id).count()
        assert photos == 0

    def test_05_orphans(self):
        """ Test that orphans are forbidden for the `Photo` model."""
        test_photo = OrphanPhotoData.JohnSmithPhoto()
        photo = model.Photo(
            path = test_photo.path
        )
        Session.add(photo)
        try:
            Session.commit()
            raise AssertionError('`Photo` delete-orphans constraint is missing.')
        except sa.exc.FlushError:
            Session.rollback()
