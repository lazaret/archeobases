"""SQLAlchemy model definition for phones"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Phone(meta.DeclarativeBase):
    """phone table model"""
    __tablename__ = 'phone'
    
    phone_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    prefix = sa.Column(sa.types.Integer, nullable=False)
    phone_number = sa.Column(sa.types.Unicode(15), nullable=False)
    # Type: home/business/mobile/fax
    phone_type = sa.Column(sa.types.Unicode(8), nullable=False)

