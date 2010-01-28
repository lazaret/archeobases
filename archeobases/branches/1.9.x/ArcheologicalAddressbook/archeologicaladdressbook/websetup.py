"""Setup the ArcheologicalAddressbook application"""
import logging

from archeologicaladdressbook.config.environment import load_environment
from archeologicaladdressbook.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup archeologicaladdressbook here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    log.info("Creating tables")
    meta.metadata.create_all(bind=meta.engine)
    log.info("Table creation done.")
