# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Persons` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_any_permission, has_permission

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.auth import ProtectController, ProtectAction

from archeologicaladdressbook.model import Session, Person, forms


log = logging.getLogger(__name__)


@ProtectController(has_any_permission('edit', 'view'))
class PersonsController(BaseController):
    """ `Persons` Controller."""

    def _check_duplicate(self, form_result=None, id=None):
        """ Check for a person duplicate entry in the database.

        Check than there is not already an entry with the same `last_name`
        and `first_name` with another `id`. If there is one redirect to the
        `show` action for this entry.
        """
        # Limitation : This check actualy forbid homonyms
        # We prefer do to this manualy instead of using FormEncode so it's more
        # easy to redirect to the already existing record
        f_name = form_result['first_name']
        l_name = form_result['last_name']
        person = Session.query(Person). \
            filter(Person.id!=id). \
            filter(Person.first_name==f_name). \
            filter(Person.last_name==l_name).first()
        if person:
            flash_message(_("This record already exist, redirecting to it"), 'warning')
            return redirect(url.current(action='show', id=person.id))

# index and list actions

    @ProtectAction(has_permission('view'))
    def index(self):
        """ Render the persons index template."""
        return render('/persons/index.mako')

    @ProtectAction(has_permission('view'))
    def list(self, id=None): #TODO try jqgrid+json
        """ Display a paged list of persons.

        Use the `paginate` webhelper to display the list of persons.
        `id` is used for page listing number.
        """
        c.page = paginate.Page(Session.query(Person),
                                page=id,
                                items_per_page = 20) #TODO make it configurable ?
        return render('/persons/list.mako')

# CRUD actions ###

    @ProtectAction(has_permission('view'))
    def show(self, id=None):
        """ Display a person record."""
        c.person = Session.query(Person).get(id)
        if c.person:
            return render('/persons/show.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def new(self, id=None):
        """ Display a form to create a new person record."""
        if id:
            # if someone mistype /new/id
            return redirect(url.current(action='new', id=None))
        else:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/persons/new.mako')

    @validate(schema=forms.PersonForm(), form='new')
    @authenticate_form
    def create(self):
        """ Add a new person record in the database."""
        # check first for a duplicate entry
        self._check_duplicate(self.form_result)
        # create the record
        person = Person(**self.form_result)
        Session.add(person)
        Session.commit()
        flash_message(_("New person record added"), 'success')
        return redirect(url.current(action='show', id=person.id))

    @ProtectAction(has_permission('edit'))
    def edit(self, id=None):
        """ Display a form to edit an existing person record."""
        c.person = Session.query(Person).get(id)
        if c.person:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/persons/edit.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.PersonForm(), form='edit')
    @authenticate_form
    def update(self, id=None):
        """ Update an existing person record."""
        person = Session.query(Person).get(id)
        if person:
            # check first for a duplicate entry
            self._check_duplicate(self.form_result, person.id)
            # update record attributes
            for key, value in self.form_result.items():
                setattr(person, key, value)
            Session.commit()
            flash_message(_("Person record updated"), 'success')
            return redirect(url.current(action='show', id=person.id))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def confirm_delete(self, id=None):
        """ Show a person record and ask to confirm deletion."""
        c.person = Session.query(Person).get(id)
        if c.person:
            return render('/persons/confirm_delete.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @authenticate_form
    def delete(self, id=None):
        """ Delete an existing person record."""
        person = Session.query(Person).get(id)
        if person:
            Session.delete(person)
            Session.commit()
            flash_message(_("Person record deleted"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))
