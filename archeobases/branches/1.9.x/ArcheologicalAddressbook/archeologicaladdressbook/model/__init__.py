# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" The application's model objects."""

import sqlalchemy as sa
from sqlalchemy import orm

from archeologicaladdressbook.model.meta import Session, Base


def init_model(engine):
    """ Call me before using any of the tables or classes in the model."""

    Session.configure(bind=engine)


# import tables classes
from archeologicaladdressbook.model.auth import User, Group, Permission
from archeologicaladdressbook.model.person import Person, VoluntaryMember
from archeologicaladdressbook.model.excavation import Excavation
from archeologicaladdressbook.model.address import Address
from archeologicaladdressbook.model.phone import Phone
from archeologicaladdressbook.model.email import Email
from archeologicaladdressbook.model.photo import Photo

