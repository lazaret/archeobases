"""Setup the bego application"""
import logging

from bego.config.environment import load_environment
from bego.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup bego here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they aren't there already
    log.info("Creating tables")
    meta.metadata.create_all(bind=meta.engine)
    log.info("Table creation done.")
    log.info("Successfully set up.")


    # Add default values in thetables
    #from bego import model
    #log.info("Adding a test definition...")
    #dico = model.Dictionary()
    #meta.Session.add(dico)
    #dico.term=u"Bouquin"
    #dico.definition = u"Un bouquin est un livre."
    #meta.Session.commit()
    #log.info("Done.")

