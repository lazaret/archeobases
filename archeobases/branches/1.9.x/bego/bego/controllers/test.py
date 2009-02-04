# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from bego.lib.base import BaseController, render
from pylons.i18n.translation import _

from bego import model
from routes import url_for

log = logging.getLogger(__name__)


class TestController(BaseController):
    """test controler who work on test table
    """
### FIXME ajouter des flashoulles

    def index(self):
        """Display a test index page"""
        return render("/derived/test/test.mako")

    def view(self, id=None):
        """Display the datas"""
        dico_q = model.meta.Session.query(model.Dictionary)
        c.dico = dico_q.filter_by(id=id).first()
        if c.dico:
            return render("/derived/test/view.mako")
        abort(404)

    def edit(self, id=None):
        """Edit the datas of an existing record"""
        dico_q = model.meta.Session.query(model.Dictionary)
        c.dico = dico_q.filter_by(id=id).first()
        if c.dico:
            return render('/derived/test/edit.mako')
        abort(404)

    def new(self):
        """display a new record formulary ans redirect to save"""
        return render('/derived/test/new.mako')

    def save(self, id=None):
        """Save a record and redirect to view or new"""
        dico_q = model.meta.Session.query(model.Dictionary)
        dico = dico_q.filter_by(id=id).first()
        if not dico:
            # if the record did not exist yet
            dico = model.Dictionary()
        dico.term = request.POST.get("term", "")
        dico.definition = request.POST.get("definition", "")
        model.meta.Session.save_or_update(dico)
        model.meta.Session.commit()
        # Issue a redirect based on the button
        if "save_button" in request.POST.keys():
            return redirect_to(url_for(action="view", id=dico.id))
        elif "new_button" in request.POST.keys():
            return redirect_to(url_for(action="new", id=None))
        elif "edit_button" in request.POST.keys():
            return redirect_to(url_for(action="edit", id=dico.id))
        elif "delete_button" in request.POST.keys():
            return redirect_to(url_for(action="delete", id=dico.id))

    def delete(self, id=None):
        """Delete a record """
        dico_q = model.meta.Session.query(model.Dictionary)
        dico = dico_q.filter_by(id=id).first()
        if dico :
            model.meta.Session.delete(dico)
            model.meta.Session.commit()
            return render('/derived/test/list.html') ###FIXME rediriger ailleurs peut-être
        abort(404)

    def search(self):
        """display a formulary to search the records and redirect to a filtred list"""
        return render('/derived/test/search.mako')

    def list(self):
        ###FIXME pas encore de recherche, donne tous les resultats
        ###FIXME ajouter paginator
        """list the searchead records"""
        c.dico = model.meta.Session.query(model.Dictionary).all()
        return render('/derived/test/list.mako')




