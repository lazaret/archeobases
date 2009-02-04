# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from bego.lib.base import BaseController, render
from pylons.i18n.translation import _
#from bego import model

log = logging.getLogger(__name__)


class AdminController(BaseController):
    """Help controler witch serve the Help page and the About page
    """

    def index(self):
        #return the main Admin page
        return render("/derived/admin/admin.mako")

