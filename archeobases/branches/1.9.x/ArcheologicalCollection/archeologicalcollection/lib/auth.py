"""Auth & Auth middleware."""

from repoze.what.plugins.quickstart import setup_sql_auth

from archeologicalcollection.model.meta import Session
from archeologicalcollection.model.auth import User, Group, Permission


def add_auth(app):
    """Add authentication and authorization middleware to the ``app``.

    We're going to define post-login and post-logout pages to do some cool things.
    """
    return setup_sql_auth(app, User, Group, Permission, Session,
                          logout_handler='/logout',
                          post_login_url='/post_login',
                          post_logout_url='/post_logout')

