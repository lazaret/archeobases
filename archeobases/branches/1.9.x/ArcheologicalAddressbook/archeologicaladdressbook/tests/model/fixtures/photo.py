# -*- coding: utf-8 -*-
""" Data used for testing the `Photo` model of the application."""


class PhotoData:
    """ Data used for testing the `Photo` model."""

    class john_doe_photo:
        path = u'000/000/0000000000000000000000000000000000.jpg'


class DuplicatePhotoData:
    """ Data used for testing the unique constraint on the `Photo` model."""

    class john_doe_photo:
        path = PhotoData.john_doe_photo.path


class OrphanPhotoData:
    """ Data used for testing the orphans constraint on the `Photo` model."""

    class john_smith_photo:
        path = u'FFF/FFF/0000000000000000000000000000000000.jpg'
