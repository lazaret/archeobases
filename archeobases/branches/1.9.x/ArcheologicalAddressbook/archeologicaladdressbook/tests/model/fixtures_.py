""" Testing datas and database fixtures used to test the application model."""

import datetime

from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta


from archeologicaladdressbook.tests.model.fixtures.person import PersonData


#class PersonData:
#    """ Datas used for testing the `Person` model."""
#
#    class john_doe:
#        last_name = u'Doe'
#        first_name = u'John'
#        title = u'Mr'
#        birth_date = datetime.date(1969, 9, 6)
#        activity = u'Test person 1'
#        person_type = u'Voluntary Member'


#class DuplicatePersonData:
#    """ Datas used for testing unique constrain on the `Person` model."""
#
#    class john_doe:
#        last_name = PersonData.john_doe.last_name
#        first_name = PersonData.john_doe.first_name
#        title = u'Mrs'
#        birth_date = PersonData.john_doe.birth_date
#        activity = u'Test person 2'
#        person_type = u'Voluntary Member'


#class EmailData:
#    """Datas used for testing the `Email` model"""
#
#    class john_doe_mail:
#        email_address = u'john.doe@work.com'
#        email_type = u'Work'

#class DuplicateEmailData:
#    """Datas used for testing unique constrain on the `Email` model."""
#
#    class john_doe_mail:
#        email_address = EmailData.john_doe_mail.email_address
#        email_type = u'Business'


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


