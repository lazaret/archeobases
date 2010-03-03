""" SQLAlchemy model definition for excavation sites."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


class Excavation(meta.DeclarativeBase):
    """ Excavation model definition."""
    __tablename__ = "excavation"

    excavation_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    person_id = sa.Column(sa.types.Integer, sa.ForeignKey('person.person_id'))
    site_name = sa.Column(sa.types.Unicode(25), nullable=False)
    start_date = sa.Column(sa.types.Date, nullable=False)
    end_date = sa.Column(sa.types.Date, nullable=False)
    appreciation = sa.Column(sa.types.Unicode(25))
