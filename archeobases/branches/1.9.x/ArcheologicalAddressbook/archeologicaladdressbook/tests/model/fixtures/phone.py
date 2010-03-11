# -*- coding: utf-8 -*-
""" data used for testing the `Phone` model of the application."""


class PhoneData:
    """data used for testing the `Phone` model"""

    class john_doe_phone:
        phone_number = u'00 10 20 30 40'
        phone_type = u'Mobile'


class DuplicatePhoneData:
    """data used for testing the unique constraint on the `Phone` model."""

    class john_doe_phone:
        phone_number = PhoneData.john_doe_phone.phone_number
        phone_type = u'Home'


class OrphanPhoneData:
    """data used for testing the orphans constraint on the `Phone` model."""

    class john_smith_phone:
        phone_number = u'00 01 02 03 04'
        phone_type = u'Home'