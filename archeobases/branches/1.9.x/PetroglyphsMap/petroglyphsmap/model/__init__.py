"""The application's model objects"""
from sqlalchemy import *
from sqlalchemy.orm import *
from sqlalchemy.ext.declarative import declarative_base
from geoalchemy import *

from petroglyphsmap.model.meta import Session, Base


def init_model(engine):
    """Call me before using any of the tables or classes in the model"""
    Session.configure(bind=engine)

## Data model Zone - Group - Rock - Figure
## The acronym ZGRF means Zone - Group - Rock - Figure, and will be used for functions and variables

# Import table classes
from petroglyphsmap.model.zone import Zone
from petroglyphsmap.model.group import Group
from petroglyphsmap.model.rock import Rock
from petroglyphsmap.model.figure import Figure

# Functions to find ID from Zone, Group, Rock, Figure names
def groupid_from_zg(zonenum, groupnum):
    """Gives the ID of a group knowing its group number and zone number"""
    gp = session.query(Group).filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).one()
    return gp.group_id

def rockid_from_zgr(zonenum, groupnum, rocknum):
    """Gives the ID of a rock knowing its rock number, group number and zone number"""
    rck = session.query(Rock).filter(Rock.rock_number==rocknum).\
        filter(Rock.group_id==Group.id).\
        filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).one()
    return rck.rock_id

def figureid_from_zgrf(zonenum, groupnum, rocknum, figurenumb):
    """Gives the ID of a figure knowing its figure number, rock number, group number and zone number"""
    fg = session.query(Figure).\
        filter(Figure.figure_number==figurenumb).\
        filter(Figure.rock_id==Rock.rock_id).\
        filter(Rock.rock_number==rocknum).\
        filter(Rock.group_id==Group.id).\
        filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).one()
    return fg.figure_id

## Statistics on Zone, Group, Rock, Figure
def countrock_by_z(zonenum):
    """Counts the number of rocks in a given zone, knowing the zone number"""
    rcks = session.query(Rock).\
        filter(Rock.group_id==Group.id).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).all()
    nbRcks = session.query(func.count(rcks))
    return nbRcks
    
def countrock_by_zg(zonenum, groupnum):
    """Counts the number of rocks in a given group, knowing the ZG numbers"""
    rcks = session.query(Rock).\
        filter(Rock.group_id==Group.id).\
        filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).all()
    nbRcks = session.query(func.count(rcks))
    return nbRcks

def countfig_by_z(zonenum):
    """Counts the number of figures in a given zone, knowing the zone numbers"""
    figs = session.query(Figure).\
        filter(Figure.rock_id==Rock.rock_id).\
        filter(Rock.group_id==Group.id).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).all()
    nbFigs = session.query(func.count(figs))
    return nbFigs

def countfig_by_zg(zonenum, groupnum):
    """Counts the number of figures in a given group, knowing the ZG numbers"""
    figs = session.query(Figure).\
        filter(Figure.rock_id==Rock.rock_id).\
        filter(Rock.group_id==Group.id).\
        filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).all()
    nbFigs = session.query(func.count(figs))
    return nbFigs

def countfig_by_zgr(zonenum, groupnum, rocknum):
    """Counts the number of figures on a given rock, knowing the ZGR numbers"""
    figs = session.query(Figure).\
        filter(Figure.rock_id==Rock.rock_id).\
        filter(Rock.rock_number==rocknum).\
        filter(Rock.group_id==Group.id).\
        filter(Group.group_number==groupnum).\
        filter(Group.zone_id==Zone.zone_id).\
        filter(Zone.zone_number==zonenum).all()
    nbFigs = session.query(func.count(figs))
    return nbFigs

## Load Geometry functions
GeometryDDL(Zone.__table__)
GeometryDDL(Group.__table__)
GeometryDDL(Rock.__table__)