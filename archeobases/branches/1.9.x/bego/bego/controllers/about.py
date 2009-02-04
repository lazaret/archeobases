# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from bego.lib.base import BaseController, render
from pylons.i18n.translation import _
#from bego import model

log = logging.getLogger(__name__)


class AboutController(BaseController):
    """About controler witch serve the About page
    """

    def index(self):
        #return the About page
        return render("/derived/about/about.mako")

