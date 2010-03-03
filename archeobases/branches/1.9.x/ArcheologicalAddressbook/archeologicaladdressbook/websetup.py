"""Setup the ArcheologicalAddressbook application"""
import logging

from archeologicaladdressbook.config.environment import load_environment
from archeologicaladdressbook import model
from archeologicaladdressbook.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup archeologicaladdressbook here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    log.info("Creating tables")
    meta.metadata.create_all(meta.engine)
    log.info("Table creation done.")

    # Add default values in the tables
    log.info("Add default user, group and permission")

    u = model.User()
    u.user_name = u'manager'
    u.display_name = u'Example manager'
    u.email_address = u'manager@somedomain.com'
    u.password = u'managepass'
    meta.Session.add(u)

    g = model.Group()
    g.group_name = u'managers'
    g.display_name = u'Managers Group'
    g.users.append(u)
    meta.Session.add(g)

    p = model.Permission()
    p.permission_name = u'manage'
    p.description = u'This permission give an administrative right to the bearer'
    p.groups.append(g)
    meta.Session.add(p)

    meta.Session.flush()
    meta.Session.commit()
    log.info("Adding default user, group and permission done.")


