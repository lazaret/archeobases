# -*- coding: utf-8 -*-
""" data used for testing the `Email` model of the application."""


class EmailData:
    """data used for testing the `Email` model"""

    class john_doe_mail:
        email_address = u'john.doe@work.com'
        email_type = u'Work'


class DuplicateEmailData:
    """data used for testing the unique constraint on the `Email` model."""

    class john_doe_mail:
        email_address = EmailData.john_doe_mail.email_address
        email_type = u'Business'


class OrphanEmailData:
    """data used for testing the orphans constraint on the `Email` model."""

    class john_smith_mail:
        email_address = u'john.smith@home.net'
        email_type = u'Home'
