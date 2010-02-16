import logging

from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to

from archeologicaladdressbook.lib.base import BaseController, render

from formalchemy.ext.pylons.controller import ModelsController
from webhelpers.paginate import Page

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta
from archeologicaladdressbook import forms



log = logging.getLogger(__name__)

class AdminController(BaseController):
    model = model # SQLAlchemy mappers
    forms = forms # module containing FormAlchemy fieldsets definitions
    def Session(self): # Session factory
        return meta.Session


AdminController = ModelsController(AdminController,
                                   prefix_name='admin',
                                   member_name='model',
                                   collection_name='models',
                                  )
