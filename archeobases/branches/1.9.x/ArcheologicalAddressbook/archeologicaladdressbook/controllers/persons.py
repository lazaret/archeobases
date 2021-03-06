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

#from pylons import request
#from pylons import response
#from pylons import session
from pylons import tmpl_context as c
from pylons import url
#from pylons.controllers.util import abort
from pylons.controllers.util import redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_any_permission
from repoze.what.predicates import has_permission
#from sqlalchemy.sql import desc

from archeologicaladdressbook.lib.base import BaseController
from archeologicaladdressbook.lib.base import render
from archeologicaladdressbook.lib.base import validate
from archeologicaladdressbook.lib.base import authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.lib.helpers import paginate
from archeologicaladdressbook.lib.auth import ProtectController
from archeologicaladdressbook.lib.auth import ProtectAction

from archeologicaladdressbook.model import Session
from archeologicaladdressbook.model import Person
from archeologicaladdressbook.model import VoluntaryMember
from archeologicaladdressbook.model import forms

#from archeologicaladdressbook.model import Audit


log = logging.getLogger(__name__)


@ProtectController(has_any_permission('edit', 'view'))
class PersonsController(BaseController):
    """ `Persons` Controller."""

    def _check_duplicate(self, form_result=None, id=None):
        """ Check for a person duplicate entry in the database.

        Check than there is not already an entry with the same `last_name`
        and `first_name` with another `person_id`. If there is one redirect to
        the `show` action for this entry.
        """
        # Limitation : Database model actualy forbid homonyms
        # We prefer do to this manualy instead of using FormEncode so it's more
        # easy to redirect to the already existing record
        last_name = form_result['last_name']
        first_name = form_result['first_name']
        person = Session.query(Person). \
            filter(Person.person_id != id). \
            filter(Person.last_name == last_name). \
            filter(Person.first_name == first_name).first()
        if person:
            flash_message(_("This record already exist, redirecting to it"), 'warning')
            return redirect(url.current(action='show', id=person.person_id))

# index, stats and list actions

    @ProtectAction(has_permission('view'))
    def index(self):
        """ Render the persons index template."""
        # get last changes for persons
        #c.person = Session.query(Person).order_by(desc(Person.timestamp)).limit(10)
        return render('/persons/index.mako')

    @ProtectAction(has_permission('view'))
    def stats(self):
        """ Perform basic countings on `Person` records and display them."""
        c.person_count = Session.query(Person).count()
        c.v_member_count = Session.query(VoluntaryMember).count()
        return render('/persons/stats.mako')

    @ProtectAction(has_permission('view'))
    def list(self, id=None):
        """ Display a paged list of persons.

        Use the `paginate` webhelper to display the list of persons.
        `id` is used for page listing number.
        """
        c.page = paginate.Page(Session.query(Person),
                                page=id,
                                items_per_page=20)
        return render('/persons/list.mako')

# CRUD actions ###

    @ProtectAction(has_permission('view'))
    def show(self, id=None):
        """ Display a person record."""
        c.person = Session.query(Person).get(id)
        #c.audit = Session.query(Audit).filter(Audit.modelname=='Person').all()
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
        return redirect(url.current(action='show', id=person.person_id))

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
            self._check_duplicate(self.form_result, person.person_id)
            # update record attributes
            for key, value in self.form_result.items():
                setattr(person, key, value)
            Session.commit()
            flash_message(_("Person record updated"), 'success')
            return redirect(url.current(action='show', id=person.person_id))
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
