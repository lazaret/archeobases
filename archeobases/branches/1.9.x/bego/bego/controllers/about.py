# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _

from bego.lib.base import BaseController, render

log = logging.getLogger(__name__)


class AboutController(BaseController):
    """About controler witch serve the About page
    """ #TODO move this into the help controler

    def index(self):
        #return the About page
        return render("/derived/about/about.mako")
