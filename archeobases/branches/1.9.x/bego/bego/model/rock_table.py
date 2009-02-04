# -*- coding: utf-8 -*-

"""The rock model object"""
import sqlalchemy as sa
from sqlalchemy import orm

from bego.model import meta

# Rock table definition
# See: http://www.sqlalchemy.org/docs/05/sqlexpression.html
rock_table = sa.Table("rock", meta.metadata,
    sa.Column("id", sa.types.Integer, primary_key=True, autoincrement=True),

    #sa.Column("geo_sector", sa.types.Unicode(24), nullable=False),#TODO decider si dans table ou si lie a zone
    sa.Column("geo_zone", sa.types.Integer, nullable=False), #TODO faire une table ?
    sa.Column("geo_group", sa.types.Integer, nullable=False),
    sa.Column("rock_number", sa.types.Unicode(24), nullable=False),

    #sa.UniqueConstraint("geo_zone", "geo_group", "rock"),

    sa.Column("rock_name", sa.types.Unicode(152), default=""),

    sa.Column("x", sa.types.Unicode(24)),     #TODO X PostGis
    sa.Column("y", sa.types.Unicode(24)),    #TODO Y PostGis
    sa.Column("z", sa.types.Unicode(24)),     #TODO Z PostGis

    sa.Column("length", sa.types.Integer), #longueur de la roche
    sa.Column("width", sa.types.Integer), #largeur de la roche

    sa.Column("geo_context_torrent", sa.types.Boolean, default=False), #torrent
    sa.Column("geo_context_lake", sa.types.Boolean, default=False), #lac
    sa.Column("geo_context_bog", sa.types.Boolean, default=False), #tourbière
    sa.Column("geo_context_pass", sa.types.Boolean, default=False), #col
    sa.Column("geo_context_summit", sa.types.Boolean, default=False), #sommet

    sa.Column("rock_type", sa.types.Unicode(24)),
    sa.Column("outcrop_type", sa.types.Unicode(24)),
    sa.Column("provision", sa.types.Unicode(24)), #disposition

    sa.Column("description", sa.types.Unicode, default=""),

    #TODO ajouter les comptages automatiques (trigers ?)
    #TODO ajouter one to many vers faces
    )

# Python class definition
class Rock(object):
    pass

# Mapper
orm.mapper(Rock, rock_table)
