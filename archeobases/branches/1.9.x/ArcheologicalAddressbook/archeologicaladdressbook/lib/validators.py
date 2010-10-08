# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" FormEncode validators."""


## TODO simplification or add the matt post
## matt validator from

import datetime
#from time import strptime
import formencode


class WorseDateConverter(formencode.FancyValidator):
    """
    Requires a list of valid date format strings.

    >>> wdc = WorseDateConverter(['%m-%d-%Y',  '%m/%d/%Y', '%Y-%m-%d'])
    >>> wdc.to_python('09-06-2008')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('09/06/2008')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('2008-09-06')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('2008/09/06') # slashes instead of dashes.
    Traceback (most recent call last):
        ...
    Invalid: I couldn't parse '2008/09/06' with any of my formats!
    """

    def __init__(self, dateformats):
        self.dateformats = dateformats

    def to_python(self, value, state=None):
        """ """
        if value is None:
            return
        for datefmt in self.dateformats:
            try:
                return datetime.datetime.strptime(value, datefmt).date()
            except ValueError:
                pass
        else:
            msg = "I couldn't parse '%s' with any of my formats!" % value
            raise formencode.Invalid(msg, value, state)

    def from_python(self, value, state=None):
        """ """
        if value is None:
            return None
        else:
            return value.strftime(self.dateformats[0])

