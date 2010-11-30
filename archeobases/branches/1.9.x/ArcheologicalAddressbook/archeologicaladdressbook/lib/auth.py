# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Auth & Auth middleware."""

from pylons import request, response, url
from pylons.controllers.util import redirect
from pylons.i18n.translation import _

from repoze.what.plugins.quickstart import setup_sql_auth
from repoze.what.plugins.pylonshq import ActionProtector
from repoze.what.plugins.pylonshq import ControllerProtector

from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.model.meta import Session
from archeologicaladdressbook.model.auth import User
from archeologicaladdressbook.model.auth import Group
from archeologicaladdressbook.model.auth import Permission


def add_auth(app):
    """ Add authentication and authorization middleware to the ``app``.

    Post-login and post-logout pages setup.
    """
    return setup_sql_auth(app, User, Group, Permission, Session,
                          logout_handler='/logout',
                          post_login_url='/post_login',
                          post_logout_url='/post_logout',
                          charset='utf-8')


def denial_handler(reason):
    """ Auth & Auth denial handler.

    When this handler is called, response.status has two possible values:
    401 or 403.
    """
    if response.status_int == 401:
        flash_message(_("Forbiden access: Authentification required"), 'error')
        redirect(url('/login'))
    else:
        credentials = request.environ.get('repoze.what.credentials')
        userid = credentials['repoze.what.userid']
        message = _("Forbiden for %s: Permission denied") % (userid)
        flash_message(message, 'error')
        redirect(url('/'))


class ProtectAction(ActionProtector):
    """ Decorator used to protect an action."""
    # Our denial handler should flash the denial reason:
    default_denial_handler = staticmethod(denial_handler)


class ProtectController(ControllerProtector):
    """ Decorator used to protect a controller."""
    protector = ProtectAction
