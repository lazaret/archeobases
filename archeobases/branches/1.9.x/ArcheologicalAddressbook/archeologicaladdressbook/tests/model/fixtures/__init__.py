# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Testing fixtures used to test the application model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta

# data fixtures imports
from archeologicaladdressbook.tests.model.fixtures.user import *
from archeologicaladdressbook.tests.model.fixtures.group import *
from archeologicaladdressbook.tests.model.fixtures.permission import *
from archeologicaladdressbook.tests.model.fixtures.person import *
from archeologicaladdressbook.tests.model.fixtures.voluntary_member import *
from archeologicaladdressbook.tests.model.fixtures.address import *
from archeologicaladdressbook.tests.model.fixtures.excavation import *
from archeologicaladdressbook.tests.model.fixtures.photo import *


def commit():
    """ Try to save the datas fixtures in the test database."""
    try:
        meta.Session.commit()
    except sa.exc.IntegrityError:
        meta.Session.rollback()
        raise AssertionError('The model may have changed, or check the tests fixtures.')


def user_fixture():
    """ Add an user test fixture in the database."""
    test_user = UserData.Guest()
    user = model.User(
        user_name = test_user.user_name,
        email_address = test_user.email_address,
        display_name = test_user.display_name,
        password = test_user.password
    )
    meta.Session.add(user)
    commit()

def group_fixture():
    """ Add a group test fixture in the database."""
    test_group = GroupData.Guests()
    user = meta.Session.query(model.User).filter_by().first()
    group = model.Group(
        group_name = test_group.group_name,
        display_name = test_group.display_name
    )
    group.users.append(user)
    meta.Session.add(group)
    commit()

def permission_fixture():
    """ Add a permission test fixture in the database."""
    test_permission = PermissionData.View()
    group = meta.Session.query(model.Group).filter_by().first()
    permission = model.Permission(
        permission_name = test_permission.permission_name,
        description = test_permission.description
    )
    permission.groups.append(group)
    meta.Session.add(permission)
    commit()


def person_fixture():
    """ Add a person test fixture in the database."""
    test_person = PersonData.JohnDoe()
    person = model.Person(
        last_name = test_person.last_name,
        first_name = test_person.first_name,
        title = test_person.title,
        birth_date = test_person.birth_date,
        email_address = test_person.email_address,
        phone = test_person.phone,
        mobile_phone = test_person.mobile_phone,
        activity = test_person.activity
    )
    meta.Session.add(person)
    commit()

def voluntary_member_fixture():
    """ Add a voluntary member test fixture in the database."""
    test_v_member = VoluntaryMemberData.JohnSmith()
    v_member = model.VoluntaryMember(
        last_name = test_v_member.last_name,
        first_name = test_v_member.first_name,
        title = test_v_member.title,
        birth_date = test_v_member.birth_date,
        activity = test_v_member.activity,
        member_number = test_v_member.member_number,
        last_fee_date = test_v_member.last_fee_date
    )
    meta.Session.add(v_member)
    commit()

def address_fixture():
    """ Add an address test fixture in the database."""
    test_address = AddressData.JohnDoeAddress()
    person = meta.Session.query(model.Person).filter_by().first()
    #person.addresses is a list of objects
    person.addresses.append(
        model.Address(
            address_line1 = test_address.address_line1,
            address_line2 = test_address.address_line2,
            address_line3 = test_address.address_line3,
            zip_code = test_address.zip_code,
            city = test_address.city,
            country = test_address.country,
            address_type = test_address.address_type
        )
    )
    commit()

def excavation_fixture():
    """ Add an excavation test fixture in the database."""
    test_excavation = ExcavationData.ExcavationSite1()
    person = meta.Session.query(model.Person).filter_by().first()
    person.excavations.append(
        model.Excavation(
            site_name = test_excavation.site_name,
            start_date = test_excavation.start_date,
            end_date = test_excavation.end_date,
            appreciation = test_excavation.appreciation
        )
    )
    commit()

def photo_fixture():
    """ Add a photo test fixture in the database."""
    test_photo = PhotoData.JohnDoePhoto()
    person = meta.Session.query(model.Person).filter_by().first()
    person.photo = model.Photo(
                        path = test_photo.path
                    )
    commit()
