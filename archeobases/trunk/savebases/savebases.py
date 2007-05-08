#! /usr/bin/env python
# -*- coding: utf-8 -*-


"""  Module savebases - Lazaret archaeological laboratory - Free sowtware under GPL v2
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


##TODO : add testing for pg_dump ; pg_dumpall & bz2


def verbose_message(message):
    """ write to standart output verboses messages if verbose option is ON.
    """
    if options.verbose==True:
        print message


def create_postgresql_backup(to_directory):
    """  pg_dump all the the databases (except system ones) with -C option.
    then pg_dumpall th PostgreSQL cluster.
    Databases dumps are compresed with bzip and saved under 'to_directory'
    """
    # crée une chaine a partir de la date du jour
    today = "-"+str(datetime.date.today())
    boolean = 0 # compteur pour avertir si pas de bases à sauvegarder
    # recuperation de la liste des bases
    #db = pg.connect("template1")
    db = pg.connect(dbname="template1", host="localhost", user="postgres")
    bases = [ r["datname"] for r in db.query("SELECT * FROM pg_database;").dictresult() ]
    db.close()
    # sauvegarde des bases de données avec 'today' (date du jour) dans le nom du fichier
    verbose_message("* Sauvegarde des bases PostgresSQL en cours :")
    for base in bases :
        # les bases systemes et phpPgAdmin ne sont pas sauvées
        if base=="postgres" or base=="phppgadmin" or base=="template0" or base=="template1" or base=="test":
            continue
        # sauvegarde des bases avec l'option creation de base (-C) et ajout de la date dans le nom
        os.system("pg_dump -C -U postgres "+base+" | bzip2 > "+to_directory+base+today+".sql.bz2")
        verbose_message("  -> Sauvegarde de : "+base+today+".sql.bz2")
        boolean += 1
    if boolean==0:

        verbose_message("  -> Pas de base PotgreSQL à sauvegarder")
    # dumpall du cluster : les bases systemes, les bases normales, les utilisateurs, etc...
    verbose_message("* Dumpall du cluster PostgreSQL en cours :")
    os.system("pg_dumpall -U postgres | bzip2 > "+to_directory+"pg_dumpall"+today+".sql.bz2")
    verbose_message("  -> Savegarde de : pg_dumpall"+today+".sql.bz2")


def delete_old_backups(to_directory, weeks_old):
    """  Supprime les anciens fichiers de sauvegarde qui finissent par '.sql.bz2'
    qui sont anterieures a 'weeks_old' semaines et qui sont situées dans le repertoire 'to_directory'
    """
    # calcul de la date d'il y a 'weeks_old' semaines ?
    weeksago = datetime.date.today() - datetime.timedelta(weeks=weeks_old)
    boolean = 0 # compteur pour avertir si pas de fichiers à supprimer
    verbose_message("* Suppression des fichiers antérieurs à "+str(weeks_old)+" semaines :")
    # liste tous les fichiers du repertoire 'directory'
    files = os.listdir(to_directory)
    for file in files:
        # recupère le timestamp de la derniere modif du fichier analysé
        mtime = os.stat(to_directory+file)[8]
        # si le nom du fichier contient ".sql.bz2" et si la date de derniere modif
        # est anterieure (inferieure à) a 'weeks_old' semaines alors on le supprime
        if bool(re.search(".sql.bz2", file))==True and datetime.date.fromtimestamp(mtime)<weeksago:
            os.remove(to_directory+file)
            verbose_message("  -> Suppression de : "+file)
	    boolean += 1
    # message d'avertissement si pas de suppression
    if boolean==0:
        verbose_message("  -> Pas de fichiers à supprimer")


def copy_today_backups(from_directory, to_directory):
    """  Copie les fichiers de sauvegarde datées du jours qui finissent par '.sql.bz2'
    depuis dans le repertoire 'from_directory' vers le repertoire 'to_directory'
    """
    # Calcul de la date du jour
    today = datetime.date.today()
    boolean = 0 # compteur pour avertir si pas de fichiers à copier
    verbose_message("* Copie des fichiers de sauvegarde crées aujourd'hui :")
    # liste tous les fichiers du repertoire 'from_directory'
    files = os.listdir(from_directory)
    for file in files:
        #recupere le timestamp de la derniere modif du fichier
        mtime = os.stat(from_directory+file)[8]
        # si le nom du fichier contient ".sql.bz2" et date du jour
        # alors on en crée une copie depuis le dossier 'from_directory vers 'to_directory'
	if bool(re.search(".sql.bz2", file))==True and datetime.date.fromtimestamp(mtime)==today:
	    # copy2 conserve le timestamp du fichier original
	    shutil.copy2(from_directory+file, to_directory+file)
	    verbose_message("  -> Copie de : "+file)
	    boolean += 1
    # message d'avertissement si pas de copie
    if boolean==0:
        verbose_message("  -> Pas de fichiers à copier")

