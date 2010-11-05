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

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base
from archeologicaladdressbook.lib.history_meta import VersionedMeta


class Address(Base):
    """ Address model definition."""
    __metaclass__ = VersionedMeta # add 'version' and 'timestamp' columns
    __tablename__ = 'address'
    __table_args__  = (UniqueConstraint('person_id', 'address_type'), {})

    address_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    address_line1 = Column(Unicode(100), nullable=False)
    address_line2 = Column(Unicode(100))
    address_line3 = Column(Unicode(100))
    zip_code = Column(Unicode(15), nullable=False)
    city = Column(Unicode(25), nullable=False)
    country = Column(Unicode(25))
    # Type: home/business/correspondent
    address_type = Column(Unicode(13), nullable=False)

    # Special methods
    def __repr__(self):
        return ('Address: street=%r, city=%r>' % (
                self.address_line1, self.city)).encode('utf-8')

    def __unicode__(self):
         return '%s %s' % (self.address_line1, self.city)
