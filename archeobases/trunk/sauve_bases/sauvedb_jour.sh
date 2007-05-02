#! /usr/bin/env python
# -*- coding: utf-8 -*-

### B. Lecervoisier 2007 - Source libre sous GPL2
# Script lancé par cron qui sauvegarde les bases de données PostgreSQL
# dans le dossier des sauvegardes du jour
# C'est cron qui determine l'intervale de lancement (toutes les semaines)
# pour ce faire le fichier doit être executable et installé sous /etc/cron.daily
# pour fonctionner doit etre appele par l'utilisateur postgres


from sauve_bases import *


####### Main #######
print "  Sauvegarde du jour en cours ...\n"
# supprime les sauvegardes journalières anterieures à 1 semaine
delete_old_backups('/home/bases/sauvegarde_jours/', 1)
# pg_dump et pg_dumpall des bases dans le repertoire /home/bases/sauvegarde_jours/
create_postgresql_backup('/home/bases/sauvegarde_jours/')