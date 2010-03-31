# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" SQLAlchemy model definition for persons and voluntary members.

`voluntary_member` is a joined table inheritance of `person`.
"""

from sqlalchemy import Column, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relation
from sqlalchemy.types import Date, Integer, Unicode

from archeologicaladdressbook.model.meta import Base

from archeologicaladdressbook.model.address import Address
from archeologicaladdressbook.model.email import Email
from archeologicaladdressbook.model.excavation import Excavation
from archeologicaladdressbook.model.phone import Phone
from archeologicaladdressbook.model.photo import Photo


class Person(Base):
    """ Person model definition."""
    __tablename__ = 'person'
    __table_args__  = (UniqueConstraint('last_name', 'first_name', 'birth_date'), {})

    person_id = Column(Integer, autoincrement=True, primary_key=True)
    last_name = Column(Unicode(25), nullable=False, index=True)
    first_name = Column(Unicode(25), nullable=False)
    title = Column(Unicode(25))                         # Mrs/Ms/Mr/Pr/Dr/Esq...
    birth_date = Column(Date, nullable=False)
    activity = Column(Unicode(25), nullable=False)     # Work/studies...
    # discriminator used for inheritance and polymorphism
    person_type = Column(Unicode(16), nullable=False)

    # child relations
    addresses = relation(Address, backref='person', cascade='all, delete-orphan')
    emails = relation(Email, backref='person', cascade='all, delete-orphan')
    excavations = relation(Excavation, backref='person', cascade='all, delete-orphan')
    phones = relation(Phone, backref='person', cascade='all, delete-orphan')
    photos = relation(Photo, backref='person', cascade='all, delete-orphan')

    # add polymorphism args for joined table inheritance with `VoluntaryMember`
    __mapper_args__ = {'polymorphic_on': person_type, 'polymorphic_identity': u'person'}


class VoluntaryMember(Person):
    """ VoluntaryMember model definition."""
    __tablename__ = 'voluntary_member'
    __table_args__  = (UniqueConstraint('member_number'), {})
    __mapper_args__ = {'polymorphic_identity': u'voluntary_member'}

    person_id = Column(Integer, ForeignKey('person.person_id'), primary_key=True)
    member_number = Column(Integer, nullable=False)
    last_fee_date = Column(Date, nullable=False)
