# -*- coding: utf-8 -*-

"""The base Controller API

Provides the BaseController class for subclassing.
"""
from pylons import c, request, config
from pylons.controllers import WSGIController
from pylons.templating import render_mako as render
from pylons.i18n import add_fallback, set_lang

from bego import __version__
from bego.model import meta

class BaseController(WSGIController):

    def __call__(self, environ, start_response):
        """Invoke the Controller"""
        # set the language fallback to english
        add_fallback("en")
        # define the language based on browser preference
        user_agent_language = request.languages[0][0:2]
        set_lang(user_agent_language)

        # common values mostly inherited from config file
        c.version = __version__
        c.site_full_name = config["site_full_name"]
        c.site_short_name = config["site_short_name"]

        # controler and action named for use in templates
        #c.controller = request.environ['pylons.routes_dict']['controller']
        #c.action = request.environ['pylons.routes_dict']['action']

        # WSGIController.__call__ dispatches to the Controller method
        # the request is routed to. This routing information is
        # available in environ['pylons.routes_dict']
        try:
            return WSGIController.__call__(self, environ, start_response)
        finally:
            meta.Session.remove()
