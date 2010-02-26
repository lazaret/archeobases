"""SQLAlchemy model definition for photos"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Photo(meta.DeclarativeBase):
    """photo table model"""
    __tablename__ = 'photo'
    __table_args__  = (sa.UniqueConstraint('path'), {})
    
    photo_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    # Path of the photo on the file server
    path = sa.Column(sa.types.Unicode(255), nullable=False)
