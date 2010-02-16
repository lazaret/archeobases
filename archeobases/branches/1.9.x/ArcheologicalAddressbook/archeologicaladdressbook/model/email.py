"""SQLAlchemy model definition for emails"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Email(meta.DeclarativeBase):
    """email table model"""
    __tablename__ = 'email'
    
    email_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    email_address = sa.Column(sa.types.Unicode(100), nullable=False)
    # Type: home/business
    email_type = sa.Column(sa.types.Unicode(8), nullable=False)

