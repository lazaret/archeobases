# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
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
