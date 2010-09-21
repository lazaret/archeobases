# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.model import Session
from archeologicaladdressbook import model
from archeologicaladdressbook.model import forms


log = logging.getLogger(__name__)


#TODO move _before and _error in the Base controller ?
from formencode import htmlfill

#TODO check flash messages and error handling
#TODO check validation schema -> date & unique constrain
#TODO try jgrid+json ???

#TODO pagination
import webhelpers.paginate


class PersonsController(BaseController):
    """ """

    #TODO Auth & Auth
    #def __before__(self):
    #    """ """
    #    credentials = request.environ.get('repoze.what.credentials', False)
    #    if credentials:
    #        c.userid = credentials['repoze.what.userid']
    #    else:
    #        c.userid = None

    def _error_formatter(error):
        """ """
        return """<div id="error-message"><img src="/images/exclamation.png"/> %s</div>""" % (
            htmlfill.html_quote(error))

    def index(self):
        """ Render the index template."""
        return render('/persons/index_person.mako')

    def list(self, id=None):
        """ Display a paged list of records.""" #TODO better docstring
        # id is used here for page number
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
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/show_person.mako')
        else:
            #flash_message('This record did not exist', 'warning')
            #return redirect(url.current(action='index'))
            abort(404)

    def new(self, id=None):
        """ display a form to create a new record."""
        #if id:
        #    # if someone mistype /persons/new/id
        #    redirect(url('new_person'))
        #else:
        if hasattr(c, 'form_errors'):
            # flash a message warning in case of validation errors
            flash_message('form errors', 'warning')
        return render('/persons/new_person.mako')

#    @authenticate_form
    @validate(schema=forms.PersonForm(), form='new', auto_error_formatter=_error_formatter)
    def create(self):
        """ """
        person = model.Person(**self.form_result)
        Session.add(person)
        Session.commit()
        flash_message('success message', 'success')
        return redirect(url.current(action='show', id=person.id))

    def edit(self, id=None):
        """ """
        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/edit_person.mako')
        else:
            #TODO flash message
            abort(404)

    @validate(schema=forms.PersonForm(), form='edit', auto_error_formatter=_error_formatter)
    def update(self, id=None):
        """ """
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

        c.person = Session.query(model.Person).get(id)
        if c.person:
            return render('/persons/confirm_delete_person.mako')
        else:
            #TODO flash message
            abort(404)
