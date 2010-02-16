"""SQLAlchemy model definition for persons"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


# person and voluntary_member tables definition

class Person(meta.DeclarativeBase):
    """person table model"""
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
    person_type = sa.Column(sa.types.Unicode(16), nullable=False)
    
    __mapper_args__ = {'polymorphic_on': person_type,
                       'polymorphic_identity': 'Person'}

                       
class VoluntaryMember(meta.DeclarativeBase):
    """voluntary_member table model"""
    __tablename__ = 'voluntary_member'
    __mapper_args__ = {'polymorphic_identity': 'voluntary_member'}
    #mapper(Person, person, properties={
    #    'excavation':relation(Excavation, cascade='all, delete-orphan')
    #    })
    #mapper(Excavation, excavation)
    
    # Child table
    
    member_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id', onupdate="CASCADE", ondelete="CASCADE"))
    member_number = sa.Column(sa.types.Integer, nullable=False)
    last_fee_date = sa.Column(sa.types.Date, nullable=False)
