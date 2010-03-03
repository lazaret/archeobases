""" Testing fixtures used to test the application model."""

import datetime
import sqlalchemy as sa

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta

from archeologicaladdressbook.tests.model.fixtures.person import *
from archeologicaladdressbook.tests.model.fixtures.email import *


def person_fixture():
    """ Add a person test fixture in the database."""
    test_person = PersonData.john_doe()
    person = model.Person(
        last_name = test_person.last_name,
        first_name = test_person.first_name,
        title = test_person.title,
        birth_date = test_person.birth_date,
        activity = test_person.activity,
        person_type = test_person.person_type
    )
    meta.Session.add(person)
    try:
        meta.Session.commit()
    except sa.exc.IntegrityError:
        meta.Session.rollback()
        raise AssertionError('The model may have changed.')


def email_fixture():
    """ Add an email test fixture in the database."""
    test_email = EmailData.john_doe_mail()
    person = meta.Session.query(model.Person).filter_by().first()
    # person.emails is a list of objects
    person.emails.append(
        model.Email(
            email_address = test_email.email_address,
            email_type = test_email.email_type
        )
    )
    try:
        meta.Session.commit()
    except sa.exc.IntegrityError:
        meta.Session.rollback()
        raise AssertionError('The model may have changed.')


