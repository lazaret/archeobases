# -*- coding: utf-8 -*-
""" Unit test cases for the ``Photo`` model."""

import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model import *
from archeologicaladdressbook.tests.model.fixtures import DuplicatePhotoData, OrphanPhotoData, photo_fixture


class TestPhotoModel(TestModel):
    """ Unit test cases for the ``Email`` model."""

    def setUp(self):
        """ Extend the method used to build a test database."""
        super(TestPhotoModel, self).setUp()
        photo_fixture()

    def test_columns(self):
        """ Test the `Photo` model columns and types."""
        photo = meta.Session.query(model.Photo).filter_by().first()
        assert isinstance(photo.photo_id, int), '`photo_id` column is missing or has changed.'
        assert isinstance(photo.person_id, int), '`person_id` column is missing or has changed.'
        assert isinstance(photo.path, unicode), '`path` column is missing or has changed.'

    def test_unique_constraint(self):
        """ Test for unique constraint for the `Photo` model.

        Test the unique constraint on `path`.
        """
        test_photo = DuplicatePhotoData.JohnDoePhoto()
        person = meta.Session.query(model.Person).filter_by().first()
        person.photos.append(
            model.Photo(
                path = test_photo.path
            )
        )
        try:
            meta.Session.commit()
            raise AssertionError('`Photo` unique constraint on `path` is missing.')
        except sa.exc.IntegrityError:
            meta.Session.rollback()

    def test_parent_relation(self):
        """ Test the `Photo` model parent relation."""
        photo = meta.Session.query(model.Photo).filter_by().first()
        assert photo.person

    def test_cascade_delete(self):
        """ Test for cascade delete on the `Photo` model."""
        person = meta.Session.query(model.Person).filter_by().first()
        meta.Session.delete(person)
        meta.Session.commit()
        photos = meta.Session.query(model.Photo).filter_by(person_id=person.person_id).count()
        assert photos == 0

    def test_orphans(self):
        """ Test that orphans are forbidden for the `Photo` model."""
        test_photo = OrphanPhotoData.JohnSmithPhoto()
        photo = model.Photo(
            path = test_photo.path
        )
        meta.Session.add(photo)
        try:
            meta.Session.commit()
            raise AssertionError('`Photo` delete-orphans constraint is missing.')
        except sa.exc.FlushError:
            meta.Session.rollback()





