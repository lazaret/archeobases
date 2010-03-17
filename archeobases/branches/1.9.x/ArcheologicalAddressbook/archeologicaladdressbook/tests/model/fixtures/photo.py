# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `Photo` model of the application."""


class PhotoData:
    """ Data used for testing the `Photo` model."""

    class JohnDoePhoto:
        """ Test values for a photo."""
        path = u'000/000/0000000000000000000000000000000000.jpg'


class DuplicatePhotoData:
    """ Data used for testing the unique constraint on the `Photo` model."""

    class JohnDoePhoto:
        """ Duplicate tests values for a photo."""
        path = PhotoData.JohnDoePhoto.path


class OrphanPhotoData:
    """ Data used for testing the orphans constraint on the `Photo` model."""

    class JohnSmithPhoto:
        """ Orphan tests values for a photo."""
        path = u'FFF/FFF/0000000000000000000000000000000000.jpg'
