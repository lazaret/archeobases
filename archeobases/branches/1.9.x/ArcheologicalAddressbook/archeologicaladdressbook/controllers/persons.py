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
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.lib.auth import protect_controller

from archeologicaladdressbook.model import Session
from archeologicaladdressbook import model
from archeologicaladdressbook.model import forms


log = logging.getLogger(__name__)


#TODO move _error in the Base controller ?
from formencode import htmlfill

#TODO check flash messages and error handling
#TODO check validation schema -> date & unique constrain
#TODO try jgrid+json ???

#TODO pagination
import webhelpers.paginate




#TODO separate and add 'view' and 'edit' permissions
@protect_controller(has_permission('edit', msg=_('Authentification required')))
class PersonsController(BaseController):
    """ Persons Controller."""

    def index(self):
        """ Render the index template."""
        c.page_title = _("Persons")
        return render('/persons/index_person.mako')

    def list(self, id=None):
        """ Display a paged list of records.""" #TODO better docstring
        # `id` used for page listing
        c.page_title = _("List persons")
#        c.persons = Session.query(model.Person).all()
        c.page = webhelpers.paginate.Page(
                        Session.query(model.Person),
                        page=id,
                        items_per_page = 5)
        return render('/persons/list_person.mako')

# CRUD actions

    def show(self, id=None):
        """ Display an individual record."""
        #flash_message('test success message', 'success') #TODO remove
        #flash_message('test warning message', 'warning') #TODO remove
        #flash_message('test error message', 'error') #TODO remove
        #flash_message('test notice message', 'notice') #TODO remove
        c.page_title = _("Display person")
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/show_person.mako')
        else:
            #flash_message('This record did not exist', 'warning')
            #return redirect(url.current(action='index'))
            abort(404)

    def new(self, id=None):
        """ Display a form to create a new record."""
        c.page_title = _("Add a person")
        #if id:
        #    # if someone mistype /persons/new/id
        #    redirect(url('new_person'))
        #else:
        if hasattr(c, 'form_errors'):
            # flash a message warning in case of validation errors
            flash_message('form errors', 'warning')
        return render('/persons/new_person.mako')


    @validate(schema=forms.PersonForm(), form='new', prefix_error=False)
    @authenticate_form
    def create(self):
        """ Add a new record in the database."""
        person = model.Person(**self.form_result)
        Session.add(person)
        Session.commit()
        flash_message('success message', 'success')
        return redirect(url.current(action='show', id=person.id))

    def edit(self, id=None):
        """ Display a form to edit an existing record."""
        c.page_title = _("Edit a person")
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/edit_person.mako')
        else:
            #TODO flash message
            abort(404)

    @validate(schema=forms.PersonForm(), form='edit', prefix_error=False)
    @authenticate_form
    def update(self, id=None):
        """ Update an existing record."""
# TODO no id error
        person = Session.query(model.Person).get(id)

# TODO shorter update
        person.last_name = self.form_result['last_name']
        person.first_name = self.form_result['first_name']
        person.title = self.form_result['title']
        person.birth_date = self.form_result['birth_date']
        person.email_address = self.form_result['email_address']
        person.phone = self.form_result['phone']
        person.mobile_phone = self.form_result['mobile_phone']
        person.activity = self.form_result['activity']

        Session.commit()
        flash_message('success message', 'success')
        return redirect(url.current(action='show', id=person.id))

    def delete(self, id=None):
        """ Delete an existing record."""
        person = Session.query(model.Person).get(id)
        if person:
            Session.delete(person)
            Session.commit()
            flash_message('success message', 'success')
            return redirect(url.current(action='index'))
        else:
            #TODO flash message
            abort(404)

    def confirm_delete(self, id=None):
        """ Show a specific item and ask to confirm deletion."""
        c.page_title = _("Delete a person")
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/confirm_delete_person.mako')
        else:
            #TODO flash message
            abort(404)
