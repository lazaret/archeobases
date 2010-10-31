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


class UserData:
    """ Data used for testing the `User` model."""

    class Guest:
        """ Test values for an user."""
        user_name = u'guest'
        email_address = u'guest@somedomain.com'
        display_name = u'Some guest'
        password = u'guestpass'


class DuplicateUserData:
    """ Data used for testing the unique constraint on the `User` model."""

    class Guest:
        """ Duplicate tests values for an user."""
        user_name = UserData.Guest.user_name
        email_address = u'guest@somedomain.com'
        display_name = u'Some guest 2'
        password = u'guestpass2'
