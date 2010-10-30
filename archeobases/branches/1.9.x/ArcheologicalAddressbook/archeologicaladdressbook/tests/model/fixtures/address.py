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


class AddressData:
    """ Data used for testing the `Address` model."""

    class JohnDoeAddress:
        """ Test values for an address."""
        address_line1 = u'The Test Company'
        address_line2 = u'1, Test Street'
        address_line3 = u''
        zip_code = u'T-00000'
        city = u'Test City'
        country = u'Test Country'
        address_type = u'Business'


class DuplicateAddressData:
    """ Data used for testing the unique constraint on the `Address` model."""

    class JohnDoeAddress:
        """ Duplicate tests values for an address."""
        address_line1 = u'The Test Organisation'
        address_line2 = u'2, Street of the Tests'
        address_line3 = u''
        zip_code = u'T-11111'
        city = u'City Test'
        country = u'Country Test'
        address_type = AddressData.JohnDoeAddress.address_type


class OrphanAddressData:
    """ Data used for testing the orphans constraint on the `Address` model."""

    class JohnSmithAddress:
        """ Orphan tests values for an address."""
        address_line1 = u'Some Random Village'
        address_line2 = u'3, Somewhere Street'
        address_line3 = u'Batiment Test'
        zip_code = u'T-22222'
        city = u'Random City'
        country = u'Random Country'
        address_type = u'Home'
