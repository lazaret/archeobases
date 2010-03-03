""" SQLAlchemy model definition for persons and voluntary members."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model.email import Email
from archeologicaladdressbook.model import meta

from sqlalchemy.orm import relation, backref


class Person(meta.DeclarativeBase):
    """ Person model definition."""
    __tablename__ = 'person'
    __table_args__  = (sa.UniqueConstraint('last_name', 'first_name', 'birth_date'), {})

    # Parent table

    person_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    last_name = sa.Column(sa.types.Unicode(25), nullable=False, index=True)
    first_name = sa.Column(sa.types.Unicode(25), nullable=False)
    # Mrs/Ms/Mr/Pr/Dr/Esq...
    title = sa.Column(sa.types.Unicode(25))
    birth_date = sa.Column(sa.types.Date, nullable=False)
    # Work/studies...
    activity = sa.Column(sa.types.Unicode(25), nullable=False)
    person_type = sa.Column(sa.types.Unicode(16))

    # child relations
    emails = relation(Email, backref='person', cascade='all, delete-orphan')

    __mapper_args__ = {'polymorphic_on': person_type,
                       'polymorphic_identity': 'Person'}


class VoluntaryMember(Person):
    """ VoluntaryMember model definition."""
    __tablename__ = 'voluntary_member'
    __mapper_args__ = {'polymorphic_identity': 'voluntary_member'}

    # Child table

    member_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id', onupdate="CASCADE", ondelete="CASCADE"))
    member_number = sa.Column(sa.types.Integer, nullable=False)
    last_fee_date = sa.Column(sa.types.Date, nullable=False)
