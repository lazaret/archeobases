""" SQLAlchemy model definition for persons and voluntary members.

`voluntary_member` is a joined table inheritence of `person`.
"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta
from archeologicaladdressbook.model.address import Address
from archeologicaladdressbook.model.email import Email
from archeologicaladdressbook.model.excavation import Excavation
from archeologicaladdressbook.model.phone import Phone
from archeologicaladdressbook.model.photo import Photo

from sqlalchemy.orm import relation, backref


class Person(meta.DeclarativeBase):
    """ Person model definition."""
    __tablename__ = 'person'
    __table_args__  = (sa.UniqueConstraint('last_name', 'first_name', 'birth_date'), {})

    person_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    last_name = sa.Column(sa.types.Unicode(25), nullable=False, index=True)
    first_name = sa.Column(sa.types.Unicode(25), nullable=False)
    title = sa.Column(sa.types.Unicode(25))                         # Mrs/Ms/Mr/Pr/Dr/Esq...
    birth_date = sa.Column(sa.types.Date, nullable=False)
    activity = sa.Column(sa.types.Unicode(25), nullable=False)     # Work/studies...
    # discriminator used for inheritance and polymorphism
    person_type = sa.Column(sa.types.Unicode(16), nullable=False)

    # child relations
    addresses = relation(Address, backref='person', cascade='all, delete-orphan')
    emails = relation(Email, backref='person', cascade='all, delete-orphan')
    excavations = relation(Excavation, backref='person', cascade='all, delete-orphan')
    phones = relation(Phone, backref='person', cascade='all, delete-orphan')
    photos = relation(Photo, backref='person', cascade='all, delete-orphan')

    # add polymorphism args for joined table inheritence with `VoluntaryMember`
    __mapper_args__ = {'polymorphic_on': person_type, 'polymorphic_identity': u'person'}


class VoluntaryMember(Person):
    """ VoluntaryMember model definition."""
    __tablename__ = 'voluntary_member'
    __table_args__  = (sa.UniqueConstraint('member_number'), {})
    __mapper_args__ = {'polymorphic_identity': u'voluntary_member'}

    person_id = sa.Column(sa.types.Integer,sa.ForeignKey('person.person_id'), primary_key=True)
    member_number = sa.Column(sa.types.Integer, nullable=False)
    last_fee_date = sa.Column(sa.types.Date, nullable=False)
