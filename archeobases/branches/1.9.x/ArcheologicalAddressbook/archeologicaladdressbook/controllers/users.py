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

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.auth import ProtectController

from archeologicaladdressbook.model import Session
from archeologicaladdressbook import model
from archeologicaladdressbook.model import forms

log = logging.getLogger(__name__)


@ProtectController(has_permission('manage'))
class UsersController(BaseController):
    """ `Users` Controller."""

    def index(self):
        """ Render the users index template."""
        return render('/users/index.mako')

    def list(self, id=None):
        """ Display a paged list of records.

        Use the `paginate` webhelper to display the list of users.
        `id` is used for page listing number.
        """
        c.page = paginate.Page(Session.query(model.User),
                                page=id,
                                items_per_page = 20)
        return render('/users/list.mako')

# CRUD actions ###

    def show(self, id=None):
        """ Display an individual record."""
        c.user = Session.query(model.User).get(id)
        if c.user:
            return render('/users/show.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    def new(self, id=None):
        """ Display a form to create a new record."""
        if id:
            # if someone mistype /persons/new/id
            return redirect(url.current(action='new', id=None))
        else:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/users/new.mako')

    @validate(schema=forms.UserForm(), form='new')
    @authenticate_form
    def create(self):
        """ Add a new record in the database."""
        # check first for duplicate
        #self._check_duplicate(self.form_result)
        # create the record
        user = model.User(**self.form_result)
        Session.add(user)
        Session.commit()
        flash_message(_("Record added"), 'success')
        return redirect(url.current(action='show', id=user.user_id))

    def edit(self, id=None):
        """ Display a form to edit an existing record."""
        c.user = Session.query(model.User).get(id)
        if c.user:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/users/edit.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.UserForm(), form='edit')
    @authenticate_form
    def update(self, id=None):
        """ Update an existing record."""
        user = Session.query(model.User).get(id)
        if user:
            # check first for duplicate
            #self._check_duplicate(self.form_result, person.id)
            # update the record
            for key, value in self.form_result.items():
                setattr(user, key, value)
            Session.commit()
            flash_message(_("Record updated"), 'success')
            return redirect(url.current(action='show', id=user.user_id))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    def confirm_delete(self, id=None): #TODO forbid delete of "manager" ?
        """ Show a specific item and ask to confirm deletion."""
        c.user = Session.query(model.User).get(id)
        if c.user:
            return render('/users/confirm_delete.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @authenticate_form
    def delete(self, id=None):
        """ Delete an existing record."""
        user = Session.query(model.User).get(id)
        if user:
            Session.delete(user)
            Session.commit()
            flash_message(_("Record deleted"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))
