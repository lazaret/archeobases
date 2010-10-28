# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" FormEncode form schema for persons."""

import formencode
from formencode import Schema, validators

from archeologicaladdressbook.model.person import Person
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.lib.converters import *


#TODO: Better validators for phones ?
# phone validator
# can contain only [0-9] space . ( ) +

class PersonForm(Schema):
    """ Form validation schema for persons."""
    allow_extra_fields = True
    filter_extra_fields = True

    last_name = formencode.All(
        validators.String(max=25, not_empty=True),
        validators.Wrapper(to_python=upper_string))
    first_name = formencode.All(
        validators.String(max=25, not_empty=True),
        validators.Wrapper(to_python=title_string))
    title = validators.OneOf(['Mr', 'Mrs', 'Miss'])
    birth_date = validators.DateConverter(month_style='dd/mm/yyyy')
    email_address = formencode.All(
        validators.Email(resolve_domain=True),
        validators.Wrapper(to_python=lower_string))
    phone = validators.String(max=15)
    mobile_phone = validators.String(max=15)
    activity = validators.String(max=25)

