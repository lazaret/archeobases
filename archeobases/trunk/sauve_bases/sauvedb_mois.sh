#! /usr/bin/env python
# -*- coding: utf-8 -*-

### B. Lecervoisier 2007 - Source libre sous GPL2
# Script lancé par cron qui supprime les anciennes copie de sauvegardes anterieurs à 
# une année (52 semaines) et copie celles du jours faites par sauvedb_jour.sh dans 
# le dossier des sauvegardes du mois
# C'est cron qui determine l'intervale de lancement (toutes les mois)
# pour ce faire le fichier doit être executable et installé sous /etc/cron.monthly

from sauve_bases import *


####### Main #######
print "  Sauvegarde du mois en cours ...\n"
# supprime les sauvegardes du mois anterieures à 1 an (=52 semaines)
delete_old_backups('/home/bases/sauvegarde_mois/', 52)
# crée une copie des sauvegardes du jour dans le dossier des sauvegardes du mois
copy_today_backups('/home/bases/sauvegarde_jours/', '/home/bases/sauvegarde_mois/')

