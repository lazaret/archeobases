"""The application's model objects"""
import sqlalchemy as sa
from sqlalchemy import orm

from uploadimages.model import meta


image_table = sa.Table("image", meta.metadata,
    sa.Column("id", sa.types.Integer, primary_key=True, autoincrement=True),
    sa.Column("image_path", sa.types.Unicode(), nullable=False),
    sa.Column("thumb_path", sa.types.Unicode(), nullable=False),
    sa.Column("description", sa.types.Unicode()),
    )
#
class Image(object):
    pass

orm.mapper(Image, image_table)
