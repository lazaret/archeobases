# -*- coding: utf-8 -*-
""" Data used for testing the `Email` model of the application."""


class EmailData:
    """ Data used for testing the `Email` model."""

    class JohnDoeMail:
        """ Test values for a mail."""
        email_address = u'john.doe@work.com'
        email_type = u'Work'


class DuplicateEmailData:
    """ Data used for testing the unique constraint on the `Email` model."""

    class JohnDoeMail:
        """ Duplicate tests values for a mail."""
        email_address = EmailData.JohnDoeMail.email_address
        email_type = u'Business'


class OrphanEmailData:
    """ Data used for testing the orphans constraint on the `Email` model."""

    class JohnSmithMail:
        """ Orphan tests values for a mail."""
        email_address = u'john.smith@home.net'
        email_type = u'Home'
