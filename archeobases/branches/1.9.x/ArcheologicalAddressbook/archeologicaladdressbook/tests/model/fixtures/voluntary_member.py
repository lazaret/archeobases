# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `VoluntaryMember` model of the application."""

import datetime


class VoluntaryMemberData:
    """ Data used for testing the `VoluntaryMember` model."""

    class JohnSmith:
        """ Test values for a voluntary member."""
        last_name = u'Smith'
        first_name = u'John'
        title = u'Mr'
        birth_date = datetime.date(1996, 9, 6)
        activity = u'Test person 1'
        member_number = 666
        last_fee_date = datetime.date(2000, 12, 31)


class DuplicateVoluntaryMemberData:
    """ Data used for testing the unique constraint on the `VoluntaryMember` model."""

    class MaryJohnes:
        """ Duplicate tests values for a voluntary member."""
        last_name = u'Johnes'
        first_name = u'Mary'
        title = u'Mrs'
        birth_date = datetime.date(1999, 9, 6)
        activity = u'Test person 2'
        member_number = VoluntaryMemberData.JohnSmith.member_number
        last_fee_date = datetime.date(1999, 12, 31)
