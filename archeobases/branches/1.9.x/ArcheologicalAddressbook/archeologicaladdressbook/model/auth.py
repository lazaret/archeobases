# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for authentification and authorization with
the repoze.what SQL plugin.
"""
# This model definition has been taken from a quickstarted TurboGears 2 project.

from os import urandom
from hashlib import sha1
from datetime import datetime

from sqlalchemy import Table, Column, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relation, synonym
from sqlalchemy.types import Date, DateTime, Integer, Unicode

from archeologicaladdressbook.model.meta import Base

__all__ = ['User', 'Group', 'Permission']


# Association tables

# This is the association table for the many-to-many relationship between
# groups and permissions. This is required by repoze.what.
group_permission_table = Table('tg_group_permission', Base.metadata,
    Column('group_id', Integer, ForeignKey('tg_group.group_id',
        onupdate="CASCADE", ondelete="CASCADE"), primary_key=True),
    Column('permission_id', Integer, ForeignKey('tg_permission.permission_id',
        onupdate="CASCADE", ondelete="CASCADE"), primary_key=True)
)

# This is the association table for the many-to-many relationship between
# groups and members - this is, the memberships. It's required by repoze.what.
user_group_table = Table('tg_user_group', Base.metadata,
    Column('user_id', Integer, ForeignKey('tg_user.user_id',
        onupdate="CASCADE", ondelete="CASCADE"), primary_key=True),
    Column('group_id', Integer, ForeignKey('tg_group.group_id',
        onupdate="CASCADE", ondelete="CASCADE"), primary_key=True)
)


class Group(Base):
    """ Group definition for :mod:`repoze.what`.

    Only the ``group_name`` column is required by :mod:`repoze.what`.
    """
    __tablename__ = 'tg_group'
    # Columns
    group_id = Column(Integer, autoincrement=True, primary_key=True)
    group_name = Column(Unicode(16), unique=True, nullable=False)
    display_name = Column(Unicode(255))
    # Relations
    users = relation('User', secondary=user_group_table, backref='groups')

    # Special methods
    def __repr__(self):
        return ('<Group: name=%s>' % self.group_name).encode('utf-8')

    def __unicode__(self):
        return self.group_name


class User(Base):
    """ User definition.

    This is the user definition used by :mod:`repoze.who`, which requires at
    least the ``user_name`` column.
    """
    __tablename__ = 'tg_user'
    # Columns
    user_id = Column(Integer, autoincrement=True, primary_key=True)
    user_name = Column(Unicode(16), unique=True, nullable=False)
    email_address = Column(Unicode(255), unique=True)
    display_name = Column(Unicode(255))
    _password = Column('password', Unicode(80))
    created = Column(DateTime, default=datetime.now)

    # Special methods
    def __repr__(self):
        return ('<User: name=%r, email=%r, display=%r>' % (
                self.user_name, self.email_address, self.display_name)).encode('utf-8')

    def __unicode__(self):
        return self.display_name or self.user_name

#    @property
#    def permissions(self):
#        """Return a set with all permissions granted to the user."""
#        perms = set()
#        for g in self.groups:
#            perms = perms | set(g.permissions)
#        return perms

    # password stuff
    def _set_password(self, password):
        """ Hash ``password`` on the fly and store its hashed version."""
        # Make sure password is a str because we cannot hash unicode objects
        if isinstance(password, unicode):
            password = password.encode('utf-8')
        salt = sha1()
        salt.update(urandom(60))
        sha1_hash = sha1()
        sha1_hash.update(password + salt.hexdigest())
        hashed_password = salt.hexdigest() + sha1_hash.hexdigest()
        # Make sure the hashed password is a unicode object at the end of the
        # process because SQLAlchemy _wants_ unicode objects for Unicode cols
        if not isinstance(hashed_password, unicode):
            hashed_password = hashed_password.decode('utf-8')
        self._password = hashed_password

    def _get_password(self):
        """ Return the hashed version of the password."""
        return self._password

    password = synonym('_password', descriptor=property(_get_password, _set_password))

    def validate_password(self, password):
        """ Check the password against existing credentials."""
        sha1_hash = sha1()
        if isinstance(password, unicode):
            password = password.encode('utf-8')
        sha1_hash.update(password + self.password[:40])
        return self.password[40:] == sha1_hash.hexdigest()


class Permission(Base):
    """
    Permission definition for :mod:`repoze.what`.

    Only the ``permission_name`` column is required by :mod:`repoze.what`.
    """
    __tablename__ = 'tg_permission'
    # Columns
    permission_id = Column(Integer, autoincrement=True, primary_key=True)
    permission_name = Column(Unicode(16), unique=True, nullable=False)
    description = Column(Unicode(255))
    # Relations
    groups = relation(Group, secondary=group_permission_table, backref='permissions')

    # Special methods
    def __repr__(self):
        return ('<Permission: name=%r>' % self.permission_name).encode('utf-8')

    def __unicode__(self):
        return self.permission_name
