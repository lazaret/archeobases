# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Users` controller for the application."""

import logging

#from pylons import request
#from pylons import response
#from pylons import session
from pylons import tmpl_context as c, url
#from pylons.controllers.util import abort
from pylons.controllers.util import redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.lib.helpers import paginate
from archeologicaladdressbook.lib.base import BaseController
from archeologicaladdressbook.lib.base import render
from archeologicaladdressbook.lib.base import validate
from archeologicaladdressbook.lib.base import authenticate_form
from archeologicaladdressbook.lib.auth import ProtectController

from archeologicaladdressbook.model import Session, Group, User, forms

log = logging.getLogger(__name__)


@ProtectController(has_permission('manage'))
class UsersController(BaseController):
    """ `Users` Controller."""

    def _check_duplicate(self, form_result=None, id=None):
        """ Check for an user duplicate entry in the database.

        Check than there is not already an entry with the same `user_name`.
        If there is one redirect to the `show` action for this entry.
        """
        # We prefer do to this manualy instead of using FormEncode so it's more
        # easy to redirect to the already existing record
        u_name = form_result['user_name']
        user = Session.query(User).filter(User.user_name == u_name).first()
        if user:
            flash_message(_("This record already exist, redirecting to it"), 'warning')
            return redirect(url.current(action='show', id=user.user_id))

# index and list actions

    def index(self):
        """ Render the users index template."""
        return render('/users/index.mako')

    def list(self, id=None):
        """ Display a paged list of users.

        Use the `paginate` webhelper to display the list of users.
        `id` is used for page listing number.
        """
        c.page = paginate.Page(Session.query(User),
                                page=id,
                                items_per_page=20)
        return render('/users/list.mako')

# CRUD actions ###

    def show(self, id=None):
        """ Display an user record."""
        c.user = Session.query(User).get(id)
        if c.user:
            c.group = c.user.groups[0].group_name
            c.permissions = c.user.groups[0].permissions
            return render('/users/show.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    def new(self, id=None):
        """ Display a form to create a new user record."""
        if id:
            # if someone mistype /new/id
            return redirect(url.current(action='new', id=None))
        else:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/users/new.mako')

    @validate(schema=forms.NewUserForm(), form='new')
    @authenticate_form
    def create(self):
        """ Add a new user record in the database."""
        # check first for a duplicate entry
        self._check_duplicate(self.form_result)
        # create the record
        user = User(
            user_name=self.form_result['user_name'],
            email_address=self.form_result['email_address'],
            display_name=self.form_result['display_name'],
            password=self.form_result['password']
        )
        Session.add(user)
        g_name = self.form_result['group_name']
        group = Session.query(Group).filter(Group.group_name == g_name).one()
        user.groups.append(group)
        Session.commit()
        flash_message(_("New user record added"), 'success')
        return redirect(url.current(action='show', id=user.user_id))

    def edit(self, id=None):
        """ Display a form to edit an existing user record."""
        # we prefere to not allow edition of `user_name`
        c.user = Session.query(User).get(id)
        if c.user:
            c.group = c.user.groups[0].group_name
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/users/edit.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.EditUserForm(), form='edit')
    @authenticate_form
    def update(self, id=None):
        """ Update an existing user record."""
        user = Session.query(User).get(id)
        if user:
            # udate user record attributes
            for key, value in self.form_result.items():
                setattr(user, key, value)
            # change group
            old_g_name = user.groups[0].group_name
            new_g_name = self.form_result['group_name']
            if old_g_name != new_g_name:
                old_group = Session.query(Group).filter(Group.group_name == old_g_name).one()
                user.groups.remove(old_group)
                new_group = Session.query(Group).filter(Group.group_name == new_g_name).one()
                user.groups.append(new_group)
            Session.commit()
            flash_message(_("User record updated"), 'success')
            return redirect(url.current(action='show', id=user.user_id))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    def edit_password(self, id=None):
        """ Display a form to change an user password."""
        c.user = Session.query(User).get(id)
        if c.user:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/users/edit_password.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.ChangeUserPassword(), form='edit_password')
    @authenticate_form
    def update_password(self, id=None):
        """ Update an user password."""
        user = Session.query(User).get(id)
        if user:
            user.password = self.form_result['password']
            Session.commit()
            flash_message(_("Password updated"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    def confirm_delete(self, id=None):  # TODO: forbid delete of "manager" ?
        """ Show an user record and ask to confirm deletion."""
        c.user = Session.query(User).get(id)
        if c.user:
            return render('/users/confirm_delete.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @authenticate_form
    def delete(self, id=None):
        """ Delete an existing user record."""
        user = Session.query(User).get(id)
        if user:
            Session.delete(user)
            Session.commit()
            flash_message(_("User record deleted"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))
