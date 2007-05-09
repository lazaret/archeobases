#! /usr/bin/env python
# -*- coding: utf-8 -*-


""" Module savebases - Lazaret archaeological laboratory - Free software under GPL v2
Savebases is a set of Python scripts and a module used to regulary save with cron
PostgreSQL databases dumps on specified folders.
"""

__version__ = "0.6"
__author__ = "R. Vaudron & B. Lecervoisier"


import os
import datetime
import re
import shutil
import logging
from optparse import OptionParser

import pg


### Command line options
# initiate the option parser
parser = OptionParser(usage="Usage: %prog [options]", version="%prog - "+__version__, description="Description: save selected PostgreSQL databases on specified directories.")
# define the verbose option
parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=False, help="produce a verbose output")
# populating the option parser
(options, args) = parser.parse_args()

#TODO import config file

### Loging options
logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s : %(message)s",
                    datefmt="%d-%m-%Y %H:%M",
                    filename="/var/log/savebases.log",
                    filemode='a')


def verbose_message(message):
    """ write to standart output verboses messages if verbose option is ON.
    """
    if options.verbose==True:
        print message


##TODO : add testing for pg_dump ; pg_dumpall & bz2

def check_backups(to_directory):
    """ check if there are backups under 'to_directory'
    if there is no backup then log a warning
    """
    boolean = 0 # counter used for warning message (logging)
    # list all the files into 'directory'
    files = os.listdir(to_directory)
    for file in files:
        if bool(re.search(".sql.bz2", file))==True:
            boolean += 1
    if boolean == 0:
        verbose_message("No database saves into "+to_directory)
        logging.warning("No database saves into "+to_directory)


def create_postgresql_backup(to_directory):
    """ pg_dump all the the databases (except system ones) with -C option.
    then pg_dumpall the PostgreSQL cluster.
    Databases dumps are compresed with bzip and saved under 'to_directory'
    """
    # string whith today date used for database filename saves
    today = "-"+str(datetime.date.today())
    boolean = 0 # counter used for warning messages (logging & verbose mode)
    # get the list of PostgreSQL databases
    db = pg.connect(dbname="template1", host="localhost", user="postgres")
    bases = [ r["datname"] for r in db.query("SELECT * FROM pg_database;").dictresult() ]
    db.close()
    # databases are saved into 'to_directory' and with 'today' in file name
    verbose_message("* Sauvegarde des bases PostgresSQL en cours :")
    for base in bases :
        # system databases are not saved
        if base=="postgres" or base=="phppgadmin" or base=="template0" or base=="template1" or base=="test":
            continue
        # save the databases with -C option
        os.system("pg_dump -C -U postgres "+base+" | bzip2 > "+to_directory+base+today+".sql.bz2")
        verbose_message("  -> Sauvegarde de : "+base+today+".sql.bz2")
        boolean += 1
    if boolean == 0:
        verbose_message("  -> Pas de base PotgreSQL à sauvegarder")
        logging.warning("No PostgreSQL database to save !.")
    # dumpall PostgreSQL databases : user names, system databases etc..
    verbose_message("* Dumpall du cluster PostgreSQL en cours :")
    #TODO testing
    os.system("pg_dumpall -U postgres | bzip2 > "+to_directory+"pg_dumpall"+today+".sql.bz2")
    verbose_message("  -> Sauvegarde de : pg_dumpall"+today+".sql.bz2")
    if boolean != 0:
        logging.info("Save of databases done.")


def delete_old_backups(to_directory, weeks_old):
    """ Delete old backups files into 'to_directory' older than 'week_old' weeks.
    """
    # calculation of the interval betwen today and 'weeks_old'
    weeksago = datetime.date.today() - datetime.timedelta(weeks=weeks_old)
    boolean = 0 # counter used for warning messages (verbose mode)
    verbose_message("* Suppression des fichiers antérieurs à "+str(weeks_old)+" semaines :")
    # list all the files into 'to_directory'
    files = os.listdir(to_directory)
    for file in files:
        # get the timestamp of the last modification of the file
        mtime = os.stat(to_directory+file)[8]
        # if the filename have ".sql.bz2"
        # and if the timestamp is older than 'weeks_old' then the file is deleted
        if bool(re.search(".sql.bz2", file))==True and datetime.date.fromtimestamp(mtime)<weeksago:
            os.remove(to_directory+file)
            verbose_message("  -> Suppression de : "+file)
            boolean += 1
    # verbose message if there is no old saves to delete
    if boolean==0:
        verbose_message("  -> Pas de fichiers à supprimer")


def copy_today_backups(from_directory, to_directory):
    """  Copy the today backups under 'from_directory' into 'to_directory'.
    """
    # get the today date
    today = datetime.date.today()
    boolean = 0 # counter used for warning messages (verbose mode)
    verbose_message("* Copie des fichiers de sauvegarde crées aujourd'hui :")
    # list all the files into 'from_directory'
    files = os.listdir(from_directory)
    for file in files:
        # get the timestamp of the last modification of the file
        mtime = os.stat(from_directory+file)[8]
        # if the filename have ".sql.bz2"
        # and if the timestamp is today then the file is copied into 'to_directory'
	if bool(re.search(".sql.bz2", file))==True and datetime.date.fromtimestamp(mtime)==today:
	    # (copy2 keep the file timestamp)
	    shutil.copy2(from_directory+file, to_directory+file)
	    verbose_message("  -> Copie de : "+file)
	    boolean += 1
    # verbose message if there is no backups to copy
    if boolean==0:
        verbose_message("  -> Pas de fichiers à copier")

