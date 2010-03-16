# -*- coding: utf-8 -*-
""" Testing fixtures used to test the application model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta

# data fixtures imports
from archeologicaladdressbook.tests.model.fixtures.person import PersonData
from archeologicaladdressbook.tests.model.fixtures.voluntary_member import VoluntaryMemberData
from archeologicaladdressbook.tests.model.fixtures.address import AddressData
from archeologicaladdressbook.tests.model.fixtures.email import EmailData
from archeologicaladdressbook.tests.model.fixtures.excavation import ExcavationData
from archeologicaladdressbook.tests.model.fixtures.phone import PhoneData
from archeologicaladdressbook.tests.model.fixtures.photo import PhotoData


def commit():
    """ Try to save the datas fixtures in the test database."""
    try:
        meta.Session.commit()
    except sa.exc.IntegrityError:
        meta.Session.rollback()
        raise AssertionError('The model may have changed.')


def person_fixture():
    """ Add a person test fixture in the database."""
    test_person = PersonData.JohnDoe()
    person = model.Person(
        last_name = test_person.last_name,
        first_name = test_person.first_name,
        title = test_person.title,
        birth_date = test_person.birth_date,
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


def email_fixture():
    """ Add an email test fixture in the database."""
    test_email = EmailData.JohnDoeMail()
    person = meta.Session.query(model.Person).filter_by().first()
    # person.emails is a list of objects
    person.emails.append(
        model.Email(
            email_address = test_email.email_address,
            email_type = test_email.email_type
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


def phone_fixture():
    """ Add a phone test fixture in the database."""
    test_phone = PhoneData.JohnDoePhone()
    person = meta.Session.query(model.Person).filter_by().first()
    person.phones.append(
        model.Phone(
            phone_number = test_phone.phone_number,
            phone_type = test_phone.phone_type
        )
    )
    commit()


def photo_fixture():
    """ Add a photo test fixture in the database."""
    test_photo = PhotoData.JohnDoePhoto()
    person = meta.Session.query(model.Person).filter_by().first()
    person.photos.append(
        model.Photo(
            path = test_photo.path
        )
    )
    commit()


