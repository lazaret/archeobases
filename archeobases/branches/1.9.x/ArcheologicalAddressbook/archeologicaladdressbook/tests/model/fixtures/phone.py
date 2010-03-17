# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `Phone` model of the application."""


class PhoneData:
    """ Data used for testing the `Phone` model."""

    class JohnDoePhone:
        """ Test values for a phone."""
        phone_number = u'00 10 20 30 40'
        phone_type = u'Mobile'


class DuplicatePhoneData:
    """ Data used for testing the unique constraint on the `Phone` model."""

    class JohnDoePhone:
        """ Duplicate tests values for a phone."""
        phone_number = PhoneData.JohnDoePhone.phone_number
        phone_type = u'Home'


class OrphanPhoneData:
    """ Data used for testing the orphans constraint on the `Phone` model."""

    class JohnSmithPhone:
        """ Orphan tests values for a phone."""
        phone_number = u'00 01 02 03 04'
        phone_type = u'Home'
