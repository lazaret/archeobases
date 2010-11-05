# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for photos."""

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base


class Photo(Base):
    """ Photo model definition."""
    __tablename__ = 'photo'
    __table_args__  = (UniqueConstraint('path'), {})

    photo_id = Column(Integer, autoincrement=True, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.person_id'))
    # hash generated image file path on the filesystem
    path = Column(Unicode(255), nullable=False)

    # Special methods
    def __repr__(self):
        return ('<Photo: path=%r>' % (self.path)).encode('utf-8')

    def __unicode__(self):
         return '%s' % (self.path)
