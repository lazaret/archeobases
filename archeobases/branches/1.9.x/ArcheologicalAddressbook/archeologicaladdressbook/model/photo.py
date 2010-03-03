""" SQLAlchemy model definition for photos."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Photo(meta.DeclarativeBase):
    """ Photo model definition."""
    __tablename__ = 'photo'
    __table_args__  = (sa.UniqueConstraint('path'), {})

    photo_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    # hash generated image file path on the filesystem
    path = sa.Column(sa.types.Unicode(255), nullable=False)

