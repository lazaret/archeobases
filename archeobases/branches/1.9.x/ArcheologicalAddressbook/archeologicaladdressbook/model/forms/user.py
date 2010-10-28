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


class UniqueEmail(validators.FancyValidator):
    """ Unique email validator.

    Check than there is not already someone with the same `email_address`
    in the database.
    """
    # `user_id` is used to not raise an error if an `email_adress` is not
    # modified for an user
    messages = {
        'not_unique_email': "That email address is already used"
    }

    def validate_python(self, values, state):
        """ Check for the uniqueness of an `email_address`."""
        email_address = values['email_address']
        if email_address != None: # do not check for empty `email_adress`
            if values.has_key('user_id'):
                user_id = values['user_id']
                email = Session.query(User).filter(User.user_id!=user_id). \
                    filter(User.email_address==email_address).first()
            else:
                email = Session.query(User).filter(User.email_address==email_address).first()
            if email:
                errors = {'email_address': self.message('not_unique_email', state)}
                raise formencode.Invalid(self.message('not_unique_email', state), values, state, error_dict=errors)


class SecurePassword(formencode.FancyValidator):
    """ Try to secure a bit the user password."""
    messages = {
        'no_username': "Do not use same password than username",
        'no_email': "Do not use password based on your email address",
    }

    def validate_python(self, values, state):
        """ Password comparison with other fields."""
        user_name = values['user_name'].lower()
        if values['email_address']:
            email_address = values['email_address'].lower()
            email_parts = email_address.split('@')
        else:
            email_address = None
        password = values['password'].lower()

        if password == user_name:
            errors = {'password': self.message('no_username', state)}
            raise formencode.Invalid(self.message('no_username', state), values, state, error_dict=errors)
        if password == email_address or password in email_parts:
            errors = {'password': self.message('no_email', state)}
            raise formencode.Invalid(self.message('no_email', state), values, state, error_dict=errors)


class NewUserForm(Schema):
    """ Form validation schema for new users."""
    allow_extra_fields = True
    filter_extra_fields = True

    user_name = formencode.All(
        validators.String(min=6, max=16),
        validators.Wrapper(to_python=lower_string))
    email_address = formencode.All(
        validators.Email(resolve_domain=True),
        validators.Wrapper(to_python=lower_string))
    display_name = formencode.All(
        validators.String(),
        validators.Wrapper(to_python=capitalize_string))
    password = formencode.All(
        validators.String(min=6, max=80),
        validators.Wrapper(to_python=strip_string))
    password_confirm = formencode.All(
        validators.String(min=6, max=80),
        validators.Wrapper(to_python=strip_string))
    group_name = validators.OneOf(['guests', 'editors', 'managers'])
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm'),
        UniqueEmail(),
        SecurePassword()
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
    group_name = validators.OneOf(['guests', 'editors', 'managers'])
    chained_validators = [UniqueEmail()]


class ChangeUserPassword(Schema):
    """ Form validation schema for password change."""
    allow_extra_fields = True

    password = validators.String(min=6, max=80)
    password_confirm = validators.String(min=6, max=80)
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm'),
    ]