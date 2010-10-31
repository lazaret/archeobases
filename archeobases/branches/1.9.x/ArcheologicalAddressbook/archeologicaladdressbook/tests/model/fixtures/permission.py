# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `User` model of the application."""


class PermissionData:
    """ Data used for testing the `Permission` model."""

    class View:
        """ Test values for a permission."""
        permission_name = u'view'
        description = u'This permission give a viewing right'


class DuplicatePermissionData:
    """ Data used for testing the unique constraint on the `Permission` model."""

    class View:
        """ Duplicate tests values for a permission."""
        permission_name = PermissionData.View.permission_name
        description = u'This permission give a viewing right 2'

