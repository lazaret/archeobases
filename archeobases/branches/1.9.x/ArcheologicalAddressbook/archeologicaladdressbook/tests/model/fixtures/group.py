# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `User` model of the application."""


class GroupData:
    """ Data used for testing the `Group` model."""

    class Guests:
        """ Test values for a group."""
        group_name = u'guests'
        display_name = u'Guests group'


class DuplicateGroupData:
    """ Data used for testing the unique constraint on the `Group` model."""

    class Guests:
        """ Duplicate tests values for a group."""
        group_name = GroupData.Guests.group_name
        display_name = u'Guests group 2'

