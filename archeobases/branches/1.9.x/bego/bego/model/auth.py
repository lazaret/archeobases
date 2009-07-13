"""SQLAlchemy model definition for authentification and authorization with
the repoze.what SQL plugin.

This model definition has been taken from a quickstarted TurboGears 2 project.
"""
from os import urandom
from hashlib import sha1
from datetime import datetime

import sqlalchemy as sa
from sqlalchemy import orm

from bego.model import meta


# many-to-many relation table between groups and users
user_group_table = sa.Table("tg_user_group", meta.metadata,
    sa.Column("user_id", sa.types.Integer, sa.ForeignKey("tg_user.user_id", onupdate="CASCADE", ondelete="CASCADE")),
    sa.Column("group_id", sa.types.Integer, sa.ForeignKey("tg_group.group_id", onupdate="CASCADE", ondelete="CASCADE"))
)

# many-to-many relation table between groups and permisions
group_permission_table = sa.Table("tg_group_permission", meta.metadata,
    sa.Column("group_id", sa.types.Integer,
             sa.ForeignKey("tg_group.group_id", onupdate="CASCADE", ondelete="CASCADE")),
    sa.Column("permission_id", sa.types.Integer,
             sa.ForeignKey("tg_permission.permission_id", onupdate="CASCADE", ondelete="CASCADE"))
)


class User(meta.DeclarativeBase):
    """User definition"""
    __tablename__ = "tg_user"

    user_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    user_name = sa.Column(sa.types.Unicode(16), unique=True, nullable=False)
    #email_address = sa.Column(sa.types.Unicode(255), unique=True)
    display_name = sa.Column(sa.types.Unicode(255))
    created = sa.Column(sa.types.DateTime, default=datetime.now)
    # password stuff
    _password = sa.Column("password", sa.types.Unicode(80))

    def _set_password(self, password):
        """Encrypt password on the fly."""
        if isinstance(password, unicode):
            password_8bit = password.encode("UTF-8")
        else:
            password_8bit = password
        salt = sha1()
        salt.update(urandom(60))
        sha1_hash = sha1()
        sha1_hash.update(password_8bit + salt.hexdigest())
        hashed_password = salt.hexdigest() + sha1_hash.hexdigest()
        if not isinstance(hashed_password, unicode):
            hashed_password = hashed_password.decode("UTF-8")
        self._password = hashed_password

    def _get_password(self):
        """Return the password hashed"""
        return self._password

    password = orm.synonym("_password", descriptor=property(_get_password, _set_password))

    def validate_password(self, password):
        """Check the password against existing credentials."""
        hashed_pass = sha1()
        hashed_pass.update(password + self.password[:40])
        return self.password[40:] == hashed_pass.hexdigest()


class Group(meta.DeclarativeBase):
    """Group definition"""
    __tablename__ = "tg_group"

    group_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    group_name = sa.Column(sa.types.Unicode(16), unique=True, nullable=False)
    display_name = sa.Column(sa.types.Unicode(255))
    #created = sa.Column(sa.types.DateTime, default=datetime.now)
    users = orm.relation(User, secondary=user_group_table, backref="groups")


class Permission(meta.DeclarativeBase):
    """A relationship that determines what each Group can do"""
    __tablename__ = "tg_permission"

    permission_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    permission_name = sa.Column(sa.types.Unicode(16), unique=True, nullable=False)
    description = sa.Column(sa.types.Unicode(255))
    groups = orm.relation(Group, secondary=group_permission_table, backref="permissions")
