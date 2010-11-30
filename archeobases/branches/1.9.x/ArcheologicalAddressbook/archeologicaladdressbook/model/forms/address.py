# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" FormEncode form schema for addresses."""

import formencode
from formencode import Schema
from formencode import validators

from archeologicaladdressbook.lib.converters import title_string
from archeologicaladdressbook.lib.converters import upper_string


class AddressForm(Schema):
    """ Form validation schema for adresses."""
    allow_extra_fields = True
    filter_extra_fields = True

    person_id = validators.Int()
    address_line1 = validators.String(max=100, not_empty=True)
    address_line2 = validators.String(max=100)
    address_line3 = validators.String(max=100)
    zip_code = formencode.All(
        validators.String(max=15, not_empty=True),
        validators.Wrapper(to_python=upper_string))
    city = formencode.All(
        validators.String(max=25, not_empty=True),
        validators.Wrapper(to_python=title_string))
    country = formencode.All(
        validators.String(max=25),
        validators.Wrapper(to_python=upper_string))
    address_type = validators.OneOf(['Home', 'Business', 'Correspondent'])
