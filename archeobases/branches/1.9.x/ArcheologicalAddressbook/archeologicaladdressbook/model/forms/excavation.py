# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" FormEncode form schema for excavations."""

import formencode
from formencode import Schema
from formencode import validators

from archeologicaladdressbook.lib.converters import upper_string


class ExcavationForm(Schema):
    """ Form validation schema for excavations."""
    allow_extra_fields = True
    filter_extra_fields = True

    person_id = validators.Int()
    site_name = formencode.All(
        validators.String(max=25, not_empty=True),
        validators.Wrapper(to_python=upper_string))
    start_date = validators.DateConverter(month_style='dd/mm/yyyy',
                                          not_empty=True)
    end_date = validators.DateConverter(month_style='dd/mm/yyyy',
                                        not_empty=True)
    appreciation = validators.String(max=25)
    # TODO: change appreciation to OneOff ?
