# -*- coding: utf-8 -*-
""" Data used for testing the `Person` model of the application."""

import datetime


class PersonData:
    """ Data used for testing the `Person` model."""

    class JohnDoe:
        """ Test values for a person."""
        last_name = u'Doe'
        first_name = u'John'
        title = u'Mr'
        birth_date = datetime.date(1969, 9, 6)
        activity = u'Test person 1'


class DuplicatePersonData:
    """ Data used for testing the unique constraint on the `Person` model."""

    class JohnDoe:
        """ Duplicate tests values for a person."""
        last_name = PersonData.JohnDoe.last_name
        first_name = PersonData.JohnDoe.first_name
        title = u'Mrs'
        birth_date = PersonData.JohnDoe.birth_date
        activity = u'Test person 2'
