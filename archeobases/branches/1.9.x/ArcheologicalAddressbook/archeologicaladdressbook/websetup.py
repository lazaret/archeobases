# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Setup the ArcheologicalAddressbook application."""

import logging
import pylons.test

from archeologicaladdressbook.config.environment import load_environment
from archeologicaladdressbook import model
from archeologicaladdressbook.model.meta import Session, Base

log = logging.getLogger(__name__)


def setup_app(command, conf, vars):
    """ Setup archeologicaladdressbook.

    Set default values in the database for managers and editors.
    """
    # Don't reload the app if it was loaded under the testing environment
    if not pylons.test.pylonsapp:
        load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    log.info("Creating tables")
    Base.metadata.create_all(bind=Session.bind)
    log.info("Table creation done.")

    # Add default values in the tables
    log.info("Add default users, groups and permissions")

    # add rights for administrative tasks
    manage_user = model.User()
    manage_user.user_name = u'manager'
    manage_user.display_name = u'Example manager'
    manage_user.email_address = u'manager@somedomain.com'
    manage_user.password = u'managepass'
    Session.add(manage_user)

    manage_group = model.Group()
    manage_group.group_name = u'managers'
    manage_group.display_name = u'Managers Group'
    manage_group.users.append(manage_user)
    Session.add(manage_group)

    manage_permission = model.Permission()
    manage_permission.permission_name = u'manage'
    manage_permission.description = u'This permission give an administrative right'
    manage_permission.groups.append(manage_group)
    Session.add(manage_permission)

    # add rights for editing
    edit_user = model.User()
    edit_user.user_name = u'editor'
    edit_user.display_name = u'Example editor'
    edit_user.email_address = u'editor@somedomain.com'
    edit_user.password = u'editorpass'
    Session.add(edit_user)

    edit_group = model.Group()
    edit_group.group_name = u'editors'
    edit_group.display_name = u'editors Group'
    edit_group.users.append(edit_user)
    Session.add(edit_group)

    edit_permission = model.Permission()
    edit_permission.permission_name = u'edit'
    edit_permission.description = u'This permission give an editing right'
    edit_permission.groups.append(edit_group)
    edit_permission.groups.append(manage_group)
    Session.add(edit_permission)

#    view_permission = model.Permission()
#    view_permission.permission_name = u'view'
#    view_permission.description = u'This permission give a viewing right'
#    view_permission.groups.append(manage_group)
#    Session.add(view_permission)

    Session.flush()
    Session.commit()
    log.info("Adding default users, groups and permissions done.")


