"""The application's model objects"""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model import meta


def init_model(engine):
    """Call me before using any of the tables or classes in the model"""

    meta.Session.configure(bind=engine)
    meta.engine = engine


# import tables classes
from archeologicaladdressbook.model.auth import User, Group, Permission
from archeologicaladdressbook.model.person import Person, VoluntaryMember
from archeologicaladdressbook.model.excavation import Excavation
from archeologicaladdressbook.model.address import Address
from archeologicaladdressbook.model.phone import Phone
from archeologicaladdressbook.model.email import Email
from archeologicaladdressbook.model.photo import Photo
