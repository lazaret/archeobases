# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from bego.lib.base import BaseController, render
from pylons.i18n.translation import _
#from bego import model

log = logging.getLogger(__name__)


class MainController(BaseController):
    """Main controler witch serve the main Index page
    """

    def index(self):
        #return the main Index page
        return render("/derived/index.mako")

