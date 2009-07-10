# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _

from bego.lib.base import BaseController, render


log = logging.getLogger(__name__)


class HelpController(BaseController):
    """ Help controler witch serve the Help pages."""

    def index(self):
        """ Display the main Help page."""
        return render("/derived/help/help.mako")

