# -*- coding: utf-8 -*-
"""SQLAlchemy model definition for the image table"""

import sqlalchemy as sa
from sqlalchemy import orm

from bego.model import meta


class Image(meta.DeclarativeBase):
    """image table model"""
    __tablename__ = "image"

    id = sa.Column(sa.types.Integer, autoincrement=True, primary_key=True)
    # image file paths in filesystem
    path = sa.Column(sa.types.Unicode(255), nullable=False)
    filename = sa.Column(sa.types.Unicode(255), nullable=False)
    # image metadatas
    description = sa.Column(sa.types.Unicode())
