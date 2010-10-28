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
from archeologicaladdressbook.lib.converters import *


class UniqueUsername(formencode.FancyValidator):
    """ Unique username validator.

    Check than there is not already someone with the same `user_name`
    in the database.
    """
    messages = {
        'not_unique': "That user name already exists"
    }

    def validate_python(self, value, state):
        """ Check for the uniqueness of an `user_name`."""
        user = Session.query(User).filter(User.user_name==value).first()
        if user:
            raise formencode.Invalid(self.message('not_unique', state), value, state)
            return value


class UniqueEmail(validators.FancyValidator):
    """ Unique email validator.

    Check than there is not already someone with the same `email_address`
    in the database.
    """
    # `user_id` is used to not raise error if an `email_adress` is not
    # modified for an user
    messages = {
        'not_unique_email': "That email address is already used"
    }

    def validate_python(self, values, state):
        """ Check for the uniqueness of an `email_address`."""
        u_email = values['email_address']
        if u_email != '': # do not check for empty email_adress
            if values.has_key('user_id'):
                u_id = values['user_id']
                email = Session.query(User).filter(User.user_id!=u_id).filter(User.email_address==u_email).first()
            else:
                email = Session.query(User).filter(User.email_address==u_email).first()
            if email:
                errors = {'email_address': self.message('not_unique_email', state)}
                raise formencode.Invalid(self.message('not_unique_email', state), values, state, error_dict=errors)


class NewUserForm(Schema):
    """ Form validation schema for new users."""
    allow_extra_fields = True
    filter_extra_fields = True

    user_name = formencode.All(
        validators.String(not_empty=True),
        UniqueUsername(),
        validators.Wrapper(to_python=lower_string))
    email_address = formencode.All(
        validators.Email(resolve_domain=True),
        validators.Wrapper(to_python=lower_string))
    display_name = formencode.All(
        validators.String(),
        validators.Wrapper(to_python=capitalize_string))
    password = validators.String(not_empty=True)
    password_confirm = validators.String(not_empty=True)
    group_name = validators.OneOf(['managers', 'editors'])
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm'),
        UniqueEmail(),
    ]


class EditUserForm(Schema):
    """ Form validation schema for user edition."""
    # `user_name` cannot be changed
    # `password` are changeable separatly
    allow_extra_fields = True
#    filter_extra_fields = True

    email_address = formencode.All(
        validators.Email(resolve_domain=True),
        validators.Wrapper(to_python=lower_string))
    display_name = formencode.All(
        validators.String(),
        validators.Wrapper(to_python=capitalize_string))
    group_name = validators.OneOf(['managers', 'editors'])
    chained_validators = [UniqueEmail()]
