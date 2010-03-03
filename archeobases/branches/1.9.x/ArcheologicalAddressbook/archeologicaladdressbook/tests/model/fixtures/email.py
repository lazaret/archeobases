""" Datas used for testing the `Email` model of the application."""



class EmailData:
    """Datas used for testing the `Email` model"""

    class john_doe_mail:
        email_address = u'john.doe@work.com'
        email_type = u'Work'


class DuplicateEmailData:
    """Datas used for testing unique constrain on the `Email` model."""

    class john_doe_mail:
        email_address = EmailData.john_doe_mail.email_address
        email_type = u'Business'


class OrphanEmailData:
    """Datas used for testing orphans constrain on the `Email` model."""

    class john_smith_mail:
        email_address = u'john.smith@home.net'
        email_type = u'Home'
