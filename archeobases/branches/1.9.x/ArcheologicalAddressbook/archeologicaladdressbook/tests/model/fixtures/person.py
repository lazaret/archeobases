# -*- coding: utf-8 -*-
""" Datas used for testing the `Person` model of the application."""

import datetime


class PersonData:
    """ Datas used for testing the `Person` model."""

    class john_doe:
        last_name = u'Doe'
        first_name = u'John'
        title = u'Mr'
        birth_date = datetime.date(1969, 9, 6)
        activity = u'Test person 1'


class DuplicatePersonData:
    """ Datas used for testing unique constrain on the `Person` model."""

    class john_doe:
        last_name = PersonData.john_doe.last_name
        first_name = PersonData.john_doe.first_name
        title = u'Mrs'
        birth_date = PersonData.john_doe.birth_date
        activity = u'Test person 2'
