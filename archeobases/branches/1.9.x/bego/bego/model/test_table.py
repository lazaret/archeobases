# -*- coding: utf-8 -*-

import sqlalchemy as sa
from sqlalchemy import orm

from bego.model import meta

# Database table definition
# See: http://www.sqlalchemy.org/docs/05/sqlexpression.html
dictionary_table = sa.Table("Dictionary", meta.metadata,
    sa.Column("id", sa.types.Integer, primary_key=True, autoincrement=True),
    sa.Column("term", sa.types.Unicode(100), default=""),
    sa.Column("definition", sa.types.Unicode, default=""),
    )

# Python class definition
class Dictionary(object):
    pass

# Mapper
# See: http://www.sqlalchemy.org/docs/05/mappers.html
orm.mapper(Dictionary, dictionary_table)
