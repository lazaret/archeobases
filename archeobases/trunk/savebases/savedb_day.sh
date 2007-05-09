#! /usr/bin/env python
# -*- coding: utf-8 -*-

# Savebases - Lazaret archaeological laboratory - Free sowtware under GPL v2
# Savebdb_day.sh is a Python script called by cron to install it create a symbolic link :
# > ln -s /usr/local/bin/savedb_day.sh /etc/cron.daily/savedb_day.sh
# The script dump databases into 'to_directory'.
# See http://lazaret.unice.fr/opensource/ for more infos


from savebases import *

to_directory = "/home/bases/sauvegarde_jours/"
weeks_old = 1


####### Main #######
# check if there are previous backups into 'to_directory' and send a warning if not
check_backups(to_directory)
# delete backups older than 'week_old' week(s)
delete_old_backups(to_directory, weeks_old)
# pg_dump & pg_dumpall the databases into 'to_directory'
create_postgresql_backup(to_directory)

