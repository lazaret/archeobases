# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for log changes in the database."""

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base


# Table provided for managing logs later but not yet implemented

class HistoryLog(Base):
    """ HistoryLog model definition."""
    __tablename__ = 'history_log'

    log_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    username = Column(Unicode(25), nullable=False)
    involved_table = Column(Unicode(10), nullable=False)
    log_date = Column(Date, nullable=False)
