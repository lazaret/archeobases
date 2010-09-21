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


class UniquePerson(validators.FormValidator):

    field_names = None
    __unpackargs__ = ('*', 'field_names')

    def _to_python(self, field_dict, state):
        l_name = field_dict[self.field_names[0]]
        f_name = field_dict[self.field_names[1]]
        person = Session.query(Person).filter(Person.last_name==l_name).filter(Person.first_name==f_name)
        if person:
            raise formencode.Invalid(
                'That person already exists',
                field_dict, state)
        return field_dict


class PersonForm(Schema):
    """ Form validation schema for persons."""
    allow_extra_fields = True
    filter_extra_fields = True

    last_name = validators.String(not_empty=True)
    first_name = validators.String(not_empty=True)
    title = validators.String()
    birth_date = validators.DateConverter(month_style='dd/mm/yyyy')
    email_address = validators.Email()
    phone = validators.String()
    mobile_phone = validators.String()
    activity = validators.String()
    # check for uniqness of a person in the database
    chained_validators = [UniquePerson('last_name', 'first_name')]

#TODO: Better validators for phones ?
