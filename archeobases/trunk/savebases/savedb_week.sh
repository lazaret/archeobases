#! /usr/bin/env python
# -*- coding: utf-8 -*-

### B. Lecervoisier 2007 - Source libre sous GPL2
# Script lancé par cron qui supprime les anciennes copie de sauvegardes anterieurs à
# cinq semaines et copie celles du jours faites par sauvedb_jour.sh dans
# le dossier des sauvegardes de la semaine
# C'est cron qui determine l'intervale de lancement (toutes les semaines)
# pour ce faire le fichier doit être executable et installé sous /etc/cron.weekly

from savebases import *


####### Main #######
verbose_message("  Sauvegarde de la semaine en cours ...\n")
# supprime les sauvegardes de la semaine anterieures à 5 semaines
delete_old_backups('/home/bases/sauvegarde_semaine/', 5)
# crée une copie des sauvegardes du jour dans le dossier des sauvegardes de la semaine
copy_today_backups('/home/bases/sauvegarde_jours/', '/home/bases/sauvegarde_semaine/')

