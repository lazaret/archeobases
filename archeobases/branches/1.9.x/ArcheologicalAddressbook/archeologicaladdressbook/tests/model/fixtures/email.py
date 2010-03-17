# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
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
