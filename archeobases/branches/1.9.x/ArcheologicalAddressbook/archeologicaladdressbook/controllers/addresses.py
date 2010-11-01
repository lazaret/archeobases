# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Addresses` controller for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_any_permission, has_permission

from archeologicaladdressbook.lib.base import BaseController, render, validate, authenticate_form
from archeologicaladdressbook.lib.helpers import flash_message, paginate
from archeologicaladdressbook.lib.auth import ProtectController, ProtectAction

from archeologicaladdressbook.model import Session, Address, Person, forms

log = logging.getLogger(__name__)


@ProtectController(has_any_permission('edit', 'view'))
class AddressesController(BaseController):
    """ `Addresses` Controller."""

# TODO add check personn + address_type uniqueness constrain
# See related person infos and/or include in person templates

# index and list actions

    @ProtectAction(has_permission('view'))
    def index(self):
        """ Render the addresses index template."""
        return render('/addresses/index.mako')

    @ProtectAction(has_permission('view'))
    def list(self, id=None):
        """ Display a paged list of addresses.

        Use the `paginate` webhelper to display the list of persons.
        `id` is used for page listing number.
        """
        c.page = paginate.Page(Session.query(Address),
                                page=id,
                                items_per_page = 20)
        return render('/addresses/list.mako')

# CRUD actions ###

    @ProtectAction(has_permission('view'))
    def show(self, id=None):
        """ Display a person address record."""
        c.address = Session.query(Address).get(id)
        if c.address:
            return render('/addresses/show.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def new(self, id=None):
        """ Display a form to create a new address record for a person."""
        # `id` is used here as the parent person.person_id
        c.person = Session.query(Person).get(id)
        if c.person:
            return render('/addresses/new.mako')
        else:
            # we arrive here if the person did not exist
            # TODO correct if None
            # most probably if someone mistyped addresses/new
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.AddressForm(), form='new')
    @authenticate_form
    def create(self):
        """ Add a new address record for a person in the database."""
        person_id = self.form_result['person_id']
        person = Session.query(Person).get(person_id)
        address = Address(**self.form_result)
        person.addresses.append(address)
        Session.commit()
        flash_message(_("New address record added"), 'success')
        return redirect(url.current(action='show', id=address.address_id))

    @ProtectAction(has_permission('edit'))
    def edit(self, id=None):
        """ Display a form to edit an existing address record."""
        c.address = Session.query(Address).get(id)
        if c.address:
            if c.form_errors:
                # flash a message warning in case of validation errors
                flash_message(_("Please check the form for errors"), 'warning')
            return render('/addresses/edit.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @validate(schema=forms.AddressForm(), form='edit')
    @authenticate_form
    def update(self, id=None):
        """ Update an existing address record."""
        address = Session.query(Address).get(id)
        if address:
            # update record attributes
            for key, value in self.form_result.items():
                setattr(address, key, value)
            Session.commit()
            flash_message(_("Address record updated"), 'success')
            return redirect(url.current(action='show', id=address.address_id))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @ProtectAction(has_permission('edit'))
    def confirm_delete(self, id=None):
        """ Show an address record and ask to confirm deletion."""
        c.address = Session.query(Address).get(id)
        if c.address:
            return render('/addresses/confirm_delete.mako')
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))

    @authenticate_form
    def delete(self, id=None):
        """ Delete an existing address record."""
        address = Session.query(Address).get(id)
        if address:
            Session.delete(address)
            Session.commit()
            flash_message(_("Address record deleted"), 'success')
            return redirect(url.current(action='index'))
        else:
            flash_message(_("This record did not exist"), 'warning')
            return redirect(url.current(action='index', id=None))
