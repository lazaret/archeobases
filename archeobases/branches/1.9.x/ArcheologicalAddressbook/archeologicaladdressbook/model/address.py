# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for addresses."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Address(meta.DeclarativeBase):
    """ Address model definition."""
    __tablename__ = 'address'
    __table_args__  = (sa.UniqueConstraint('person_id', 'address_type'), {})

    address_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    address_line1 = sa.Column(sa.types.Unicode(100), nullable=False)
    address_line2 = sa.Column(sa.types.Unicode(100))
    address_line3 = sa.Column(sa.types.Unicode(100))
    zip_code = sa.Column(sa.types.Unicode(15), nullable=False)
    city = sa.Column(sa.types.Unicode(25), nullable=False)
    country = sa.Column(sa.types.Unicode(25))
    # Type: home/business/correspondent
    address_type = sa.Column(sa.types.Unicode(13), nullable=False)
