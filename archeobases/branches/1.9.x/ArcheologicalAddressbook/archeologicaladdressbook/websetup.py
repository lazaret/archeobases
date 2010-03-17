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

from archeologicaladdressbook.config.environment import load_environment
from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta

log = logging.getLogger(__name__)


def setup_app(command, conf, vars):
    """ Setup archeologicaladdressbook."""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    log.info("Creating tables")
    meta.metadata.create_all(meta.engine)
    log.info("Table creation done.")

    # Add default values in the tables
    log.info("Add default user, group and permission")

    user = model.User()
    user.user_name = u'manager'
    user.display_name = u'Example manager'
    user.email_address = u'manager@somedomain.com'
    user.password = u'managepass'
    meta.Session.add(user)

    group = model.Group()
    group.group_name = u'managers'
    group.display_name = u'Managers Group'
    group.users.append(user)
    meta.Session.add(group)

    permission = model.Permission()
    permission.permission_name = u'manage'
    permission.description = u'This permission give an administrative right to the bearer'
    permission.groups.append(group)
    meta.Session.add(permission)

    meta.Session.flush()
    meta.Session.commit()
    log.info("Adding default user, group and permission done.")


