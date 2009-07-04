# -*- coding: utf-8 -*-
"""SQLAlchemy model definition for the rock table"""

import sqlalchemy as sa
from sqlalchemy import orm

from bego.model import meta


class Rock(meta.DeclarativeBase):
    """rock table model"""
    __tablename__ = "rock"
    __table_args__  = (sa.UniqueConstraint("geo_zone", "geo_group", "rock_number"), {})


    rock_id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    # general rock infos
    geo_zone = sa.Column(sa.types.Integer, nullable=False)
    geo_group = sa.Column(sa.types.Integer, nullable=False)
    rock_number = sa.Column(sa.types.Unicode(24), nullable=False)
    rock_name = sa.Column(sa.types.Unicode(255))
    # Lambert III coordinates
    point_x = sa.Column(sa.types.Unicode(24))
    point_y = sa.Column(sa.types.Unicode(24))
    point_z = sa.Column(sa.types.Unicode(24))
    # rock measures
    length = sa.Column(sa.types.Integer)
    width = sa.Column(sa.types.Integer)
    # geographical context
    geo_context_torrent = sa.Column(sa.types.Boolean, default=False)
    geo_context_lake = sa.Column(sa.types.Boolean, default=False)
    geo_context_bog = sa.Column(sa.types.Boolean, default=False)
    geo_context_pass = sa.Column(sa.types.Boolean, default=False)
    geo_context_summit = sa.Column(sa.types.Boolean, default=False)
    #
    rock_type = sa.Column(sa.types.Unicode(24))
    oucrop_type = sa.Column(sa.types.Unicode(24))
    provision = sa.Column(sa.types.Unicode(24))
    # description
    description_fr = sa.Column(sa.types.Unicode())
    #description_en = sa.Column(sa.types.Unicode())
    #description_it = sa.Column(sa.types.Unicode())


    #TODO ajouter les comptages automatiques (trigers ?)
    #TODO ajouter one to many vers faces

# See: http://www.sqlalchemy.org/docs/05/sqlexpression.html

