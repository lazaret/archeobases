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

import os

import formencode
from formencode import Schema, validators

from archeologicaladdressbook.model.auth import User
from archeologicaladdressbook.model import Session
from archeologicaladdressbook.lib.converters import *
from archeologicaladdressbook.lib.badpasswords import bad_password_list


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
        'no_username': "Please do not use same password than username",
        'no_email': "Please do not use password based on your email address",
        'no_displayname': "Please do not use password based on your display name",
        'no_dico': "Please do not base your password on a dictionary word",
        'no_samechar': "Please do not use to much the same character",
        'no_verybad': "Please do not use a so bad password",
    }

    unix_words1 = '/usr/share/dict/words'
    unix_words2 = '/usr/dict/words'

    def validate_python(self, values, state):
        """ Password security checker.

        Try to compare with other fields and with dictionaries"""
        password = values['password'].lower()
        # compare password with user_name
        user_name = values['user_name'].lower()
        if password == user_name:
            errors = {'password': self.message('no_username', state)}
            raise formencode.Invalid(self.message('no_username', state), values, state, error_dict=errors)
        # compare password with email_address
        if values['email_address']:
            email_address = values['email_address'].lower()
            email_parts = email_address.split('@')
            if password == email_address or password in email_parts:
                errors = {'password': self.message('no_email', state)}
                raise formencode.Invalid(self.message('no_email', state), values, state, error_dict=errors)
        # compare password with display_name
        if values['display_name']:
            display_name = values['display_name'].lower()
            display_parts = display_name.split()
            if password == display_name or password in display_parts:
                errors = {'password': self.message('no_displayname', state)}
                raise formencode.Invalid(self.message('no_displayname', state), values, state, error_dict=errors)
        # test character occurences and fail if >= 6 of same char
        # this block password like '000000' or 'aaaaaa'
        for char in password:
            occur = password.count(char)
            if occur >= 6:
                errors = {'password': self.message('no_samechar', state)}
                raise formencode.Invalid(self.message('no_samechar', state), values, state, error_dict=errors)
        # TODO : Add a check for repetitives 2 or 3 lettres passwords like '010101', 'tototo' or '123123'
        # compare password with our list of common bad passwords
        bad_list = bad_password_list()
        for word in bad_list:
            if password == word:
                errors = {'password': self.message('no_verybad', state)}
                raise formencode.Invalid(self.message('no_verybad', state), values, state, error_dict=errors)
        # compare password with the unix word dictionary if available
        if os.path.isfile(self.unix_words1):
            file = open(self.unix_words1)
        elif os.path.isfile(self.unix_words1):
            file = open(self.unix_words2)
        if file:
            for line in file:
                if password == line.strip().lower():
                    errors = {'password': self.message('no_dico', state)}
                    raise formencode.Invalid(self.message('no_dico', state), values, state, error_dict=errors)


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
