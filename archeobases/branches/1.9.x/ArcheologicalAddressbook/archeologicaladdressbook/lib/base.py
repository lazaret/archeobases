# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" The base Controller API.

Provides the `BaseController` class for subclassing.
"""

from pylons import request, tmpl_context as c
from pylons.controllers import WSGIController
from pylons.decorators import validate # TODO check this
from pylons.decorators.secure import authenticate_form # TODO test this
from pylons.templating import render_mako as render

from archeologicaladdressbook.model.meta import Session


class BaseController(WSGIController):
    """ Base WSGI controler."""

    def __call__(self, environ, start_response):
        """ Invoke the Controller."""
        # WSGIController.__call__ dispatches to the Controller method
        # the request is routed to. This routing information is
        # available in environ['pylons.routes_dict']
        try:
            return WSGIController.__call__(self, environ, start_response)
        finally:
            Session.remove()

    def __before__(self):
        """ Add credentails ans default values for the templates."""
        # Add Auth & Auth credentials for the templates.
        credentials = request.environ.get('repoze.what.credentials', False)
        if credentials:
            c.userid = credentials['repoze.what.userid']
        else:
            c.userid = None
