# -*- coding: utf-8 -*-
""" Datas used for testing the `Photo` model of the application."""


class PhotoData:
    """Datas used for testing the `Photo` model"""

    class john_doe_photo:
        path = u'000/000/0000000000000000000000000000000000.jpg'


class DuplicatePhotoData:
    """Datas used for testing unique constrain on the `Photo` model."""

    class john_doe_photo:
        path = PhotoData.john_doe_photo.path


class OrphanPhotoData:
    """Datas used for testing orphans constrain on the `Photo` model."""

    class john_smith_photo:
        path = u'FFF/FFF/0000000000000000000000000000000000.jpg'
