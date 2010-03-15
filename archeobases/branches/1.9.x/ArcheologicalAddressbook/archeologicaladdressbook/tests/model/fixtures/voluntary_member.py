# -*- coding: utf-8 -*-
""" Data used for testing the `VoluntaryMember` model of the application."""

import datetime


class VoluntaryMemberData:
    """ Data used for testing the `VoluntaryMember` model."""

    class john_smith:
        last_name = u'Smith'
        first_name = u'John'
        title = u'Mr'
        birth_date = datetime.date(1996, 9, 6)
        activity = u'Test person 1'
        member_number = 666
        last_fee_date = datetime.date(2000, 12, 31)


class DuplicateVoluntaryMemberData:
    """ Data used for testing the unique constraint on the `VoluntaryMember` model."""

    class mary_johnes:
        last_name = u'Johnes'
        first_name = u'Mary'
        title = u'Mrs'
        birth_date = datetime.date(1999, 9, 6)
        activity = u'Test person 2'
        member_number = VoluntaryMemberData.john_smith.member_number
        last_fee_date = datetime.date(1999, 12, 31)
