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


class UniquePerson(validators.FancyValidator):
    """ Unique Person validator.

    Check than there is not already someone with the same `fisrt_name` and
    `last_name` in the database.
    """
    messages = {
        'not_unique': "That person already exists in the database" #TODO add _("blabla") ??
    }

    def validate_python(self, values, state):
        """ Check the database uniqueness of a person."""
        l_name = values['last_name']
        f_name = values['first_name']
        person = Session.query(Person).filter(Person.first_name==f_name).filter(Person.last_name==l_name).first()
        if person:
            errors = {'last_name': self.message('not_unique', state)}
            raise formencode.Invalid(self.message('not_unique', state), values, state, error_dict=errors)


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
    # check for uniqueness of a person in the database
    #chained_validators = [UniquePerson()]


#TODO: Better validators for phones ?
