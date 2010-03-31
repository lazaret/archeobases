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

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base


class Email(Base):
    """ Email model definition."""
    __tablename__ = 'email'
    __table_args__  = (UniqueConstraint('person_id', 'email_address'), {})

    email_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    email_address = Column(Unicode(100), nullable=False)
    # Type: home/business
    email_type = Column(Unicode(8), nullable=False)

