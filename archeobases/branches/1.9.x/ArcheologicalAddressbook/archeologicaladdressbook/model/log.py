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

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


# Table provided for managing logs later but not yet implemented

class HistoryLog(meta.DeclarativeBase):
    """ HistoryLog model definition."""
    __tablename__ = 'history_log'

    log_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    username = sa.Column(sa.types.Unicode(25), nullable=False)
    involved_table = sa.Column(sa.types.Unicode(10), nullable=False)
    log_date = sa.Column(sa.types.Date, nullable=False)
