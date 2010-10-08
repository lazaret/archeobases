# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Persons controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_any_permission, has_permission

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.auth import ProtectController, ProtectAction

from archeologicaladdressbook.model import Session
from archeologicaladdressbook import model
from archeologicaladdressbook.model import forms

from sqlalchemy import update #TODO chack

log = logging.getLogger(__name__)


#TODO check validation schema -> date
#TODO try jgrid+json ???


@ProtectController(has_any_permission('edit', 'view'))
class PersonsController(BaseController):
    """ Persons Controller."""

    @ProtectAction(has_permission('view'))
    def index(self):
        """ Render the index template."""
        c.page_title = _("Persons")
        return render('/persons/index_person.mako')

    @ProtectAction(has_permission('view'))
    def list(self, id=None):
        """ Display a paged list of records.

        Use the `paginate` webhelper to display the list of persons.
        `id` is used for page listing number.
        """
        c.page_title = _("List persons")
        c.page = paginate.Page(Session.query(model.Person),
                                page=id,
                                items_per_page = 20) #TODO make it configurable ?
        return render('/persons/list_person.mako')

# CRUD actions ###

    @ProtectAction(has_permission('view'))
    def show(self, id=None):
        """ Display an individual record."""
        c.page_title = _("Display person") #TODO move in templates ?
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/show_person.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def new(self, id=None):
        """ Display a form to create a new record."""
        c.page_title = _("Add a person")
        if id:
            # if someone mistype /persons/new/id
            return redirect(url.current(action='new', id=None))
        else:
            if hasattr(c, 'form_errors'):
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/persons/new_person.mako')

    @validate(schema=forms.PersonForm(), form='new')
    @authenticate_form
    def create(self):
        """ Add a new record in the database."""
        # check first than there is not already a record with the same
        # `first_name` and `last_name` then redirect to edit if it's the case
        f_name = self.form_result['first_name']
        l_name = self.form_result['last_name']
        person = Session.query(model.Person). \
            filter(model.Person.first_name==f_name). \
            filter(model.Person.last_name==l_name).first()
        if person :
            flash_message(_("This record exist, redirecting to it"), 'warning')
            return redirect(url.current(action='edit', id=person.id))
        else:
            person = model.Person(**self.form_result)
            Session.add(person)
            Session.commit()
            flash_message(_("Record added"), 'success')
            return redirect(url.current(action='show', id=person.id))

    @ProtectAction(has_permission('edit'))
    def edit(self, id=None):
        """ Display a form to edit an existing record."""
        c.page_title = _("Edit a person")
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/edit_person.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))



    @validate(schema=forms.PersonForm(), form='edit')
    @authenticate_form
    def update(self, id=None):
        """ Update an existing record.""" #TODO add a check in case of name change ?
        person = Session.query(model.Person).get(id)
        if person:
            for key, value in self.form_result.items():
                setattr(person, key, value)
            Session.commit()
            flash_message(_("Record updated"), 'success')
            return redirect(url.current(action='show', id=person.id))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def confirm_delete(self, id=None):
        """ Show a specific item and ask to confirm deletion."""
        c.page_title = _("Delete a person")
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/confirm_delete_person.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @authenticate_form
    def delete(self, id=None):
        """ Delete an existing record."""
        person = Session.query(model.Person).get(id)
        if person:
            Session.delete(person)
            Session.commit()
            flash_message(_("Record deleted"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))
