# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for excavation sites."""

from sqlalchemy import Column
from sqlalchemy import ForeignKey
from sqlalchemy import UniqueConstraint
from sqlalchemy.types import Date
from sqlalchemy.types import Integer
from sqlalchemy.types import Unicode

from archeologicaladdressbook.model.meta import Base


class Excavation(Base):
    """ Excavation model definition."""
    __tablename__ = 'excavation'

    excavation_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    site_name = Column(Unicode(25), nullable=False)
    start_date = Column(Date, nullable=False)
    end_date = Column(Date, nullable=False)
    appreciation = Column(Unicode(25))

    # Special methods
    def __repr__(self):
        return ("<Excavation: site=%r, date=%r>" % (
                self.site_name, self.start_date)).encode('utf-8')

    def __unicode__(self):
         return "%s %s" % (self.site_name, self.start_date)
