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

from repoze.what.plugins.quickstart import setup_sql_auth

from archeologicaladdressbook.model.meta import Session
from archeologicaladdressbook.model.auth import User, Group, Permission


def add_auth(app):
    """ Add authentication and authorization middleware to the ``app``.

    We're going to define post-login and post-logout pages to do some cool things.
    """
    return setup_sql_auth(app, User, Group, Permission, Session,
                          logout_handler='/logout',
                          post_login_url='/post_login',
                          post_logout_url='/post_logout')

