# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for emails."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Email(meta.DeclarativeBase):
    """ Email model definition."""
    __tablename__ = 'email'
    __table_args__  = (sa.UniqueConstraint('person_id', 'email_address'), {})

    email_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    email_address = sa.Column(sa.types.Unicode(100), nullable=False)
    # Type: home/business
    email_type = sa.Column(sa.types.Unicode(8), nullable=False)

