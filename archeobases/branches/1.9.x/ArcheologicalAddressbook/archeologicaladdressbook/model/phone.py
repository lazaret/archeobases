# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for phones."""

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base


class Phone(Base):
    """ Phone model definition."""
    __tablename__ = 'phone'
    __table_args__  = (UniqueConstraint('person_id', 'phone_number'), {})

    phone_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    phone_number = Column(Unicode(15), nullable=False)
    # Type: home/business/mobile/fax
    phone_type = Column(Unicode(8), nullable=False)

