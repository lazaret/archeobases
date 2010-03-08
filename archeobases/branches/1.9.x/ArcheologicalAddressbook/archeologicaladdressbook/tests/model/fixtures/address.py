# -*- coding: utf-8 -*-
""" data used for testing the `Phone` model of the application."""


class AddressData:
    """data used for testing the `Address` model"""

    class john_doe_address:
        address_line1 = u'The Test Company'
        address_line2 = u'1, Test Street'
        address_line3 = u''
        zip_code = u'T-00000'
        city = u'Test City'
        country = u'Test Country'
        address_type = u'Work'


class DuplicateAddressData:
    """data used for testing the unique constraint on the `Address` model."""

    class john_doe_address:
        address_line1 = u'The Test Organisation'
        address_line2 = u'2, Street of the Tests'
        address_line3 = u''
        zip_code = u'T-11111'
        city = u'City Test'
        country = u'Country Test'
        address_type = AddressData.john_doe_address.address_type


class OrphanAddressData:
    """data used for testing the orphans constraint on the `Address` model."""

    class john_smith_address:
        address_line1 = u'Some Random Village'
        address_line2 = u'3, Somewhere Street'
        address_line3 = u'Batiment Test'
        zip_code = u'T-22222'
        city = u'Random City'
        country = u'Random Country'
        address_type = u'Home'
