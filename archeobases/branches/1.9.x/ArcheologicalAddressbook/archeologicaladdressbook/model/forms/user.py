# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" FormEncode form schema for users."""

import formencode
from formencode import Schema, validators

from archeologicaladdressbook.model.auth import User
from archeologicaladdressbook.model import Session


class UniqueUser(validators.FancyValidator):
    """ Unique user validator.

    Check than there is not already someone with the same `user_name`
    in the database.
    """
    messages = {
        'not_unique': "That user name already exists"
    }

    def validate_python(self, values, state):
        """ Check the database uniqueness of an user."""
        user = Session.query(User).filter(User.user_name==values['user_name']).first()
        if user:
            errors = {'user_name': self.message('not_unique', state)}
            raise formencode.Invalid(self.message('not_unique', state), values, state, error_dict=errors)


class UniqueEmail(validators.FancyValidator):
    """ Unique email validator.

    Check than there is not already someone with the same `email_address`
    in the database.
    """
    messages = {
        'not_unique': "That email address is already used"
    }

    def validate_python(self, values, state):
        """ Check the database uniqueness of an email."""
        email = Session.query(User).filter(User.email_address==values['email_address']).first()
        if email:
            errors = {'email_address': self.message('not_unique', state)}
            raise formencode.Invalid(self.message('not_unique', state), values, state, error_dict=errors)


class UserForm(Schema):
    """ Form validation schema for users."""
    allow_extra_fields = True
    filter_extra_fields = True

    user_name = validators.String(not_empty=True)
    email_address = validators.Email(resolve_domain=True)
    display_name = validators.String()
    password = validators.String()
#    password_confirm = validators.String()
#    group = validators.String()
#    chained_validators = [validators.FieldsMatch('password', 'password_confirm')]
