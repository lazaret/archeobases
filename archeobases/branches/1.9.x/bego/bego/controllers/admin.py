"""Admin controler"""

import logging

from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _

from bego.lib.base import BaseController, render


log = logging.getLogger(__name__)


class AdminController(BaseController):
    """Admin controler witch serve the adminstrative tasl pages."""

    def index(self):
        """Display the main admin page."""
        return render("/derived/admin/admin.mako")

