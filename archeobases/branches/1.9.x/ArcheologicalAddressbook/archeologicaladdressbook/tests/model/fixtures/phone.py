# -*- coding: utf-8 -*-
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
