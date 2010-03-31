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

Provides the BaseController class for subclassing.

"""
from pylons.controllers import WSGIController
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
