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
    messages = {
        'not_unique': "That email address is already used"
    }

    def validate_python(self, value, state):
        """ Check for the uniqueness of an `email_address`."""
        email = Session.query(User).filter(User.email_address==value).first()
        if email:
            raise formencode.Invalid(self.message('not_unique', state), value, state)
            return value


class UniqueEmail2(validators.FancyValidator):
    """ """
    messages = {
        'not_unique': "That email address is already used"
    }

    def validate_python(self, values, state):
        """ Check for the uniqueness of an `email_address`."""
        u_email = values['email_address']
        u_id = values['user_id']
        email = Session.query(User).filter(User.user_id!=u_id).filter(User.email_address==u_email).first()
        if email:
            errors = {'email_address': self.message('not_unique', state)}
            raise formencode.Invalid(self.message('not_unique', state), values, state, error_dict=errors)


class NewUserForm(Schema):
    """ Form validation schema for new users."""
    allow_extra_fields = True
    filter_extra_fields = True

    user_name = formencode.All(validators.String(not_empty=True), UniqueUsername())
    email_address = formencode.All(validators.Email(resolve_domain=True), UniqueEmail())
    display_name = validators.String()
    password = validators.String(not_empty=True)
    password_confirm = validators.String(not_empty=True)
    group_name = validators.String()
    chained_validators = [validators.FieldsMatch('password', 'password_confirm')]


class EditUserForm(Schema):
    """ Form validation schema for user edition."""
    allow_extra_fields = True
#    filter_extra_fields = True

    email_address = validators.Email(resolve_domain=True)
    display_name = validators.String()
    group_name = validators.String()
    chained_validators = [UniqueEmail2()]
