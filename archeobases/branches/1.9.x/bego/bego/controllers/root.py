"""Main controler for the application"""

import logging

from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _
from routes.util import url_for

from bego.lib.base import BaseController, render
from bego.lib.helpers import flash_message


log = logging.getLogger(__name__)


class RootController(BaseController):
    """Main controler witch serve the main index page."""

    def index(self):
        """Render the default index page."""
        return render("/derived/index.mako")

    def login(self):
        """Render the authentification login form."""
        login_counter = request.environ['repoze.who.logins']
        if login_counter > 0:
            flash_message('Wrong credentials')
        c.login_counter = login_counter
        c.came_from = request.params.get('came_from') or url_for('/')
        return render('login.mako') #TODO update this
