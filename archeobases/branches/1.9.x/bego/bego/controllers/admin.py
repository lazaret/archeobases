# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _

from bego.lib.base import BaseController, render


log = logging.getLogger(__name__)


class AdminController(BaseController):
    """ Help controler witch serve the Help page and the About page.""" #TODO about page

    def index(self):
        """ Display the main Admin page."""
        return render("/derived/admin/admin.mako")

