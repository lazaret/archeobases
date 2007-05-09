#! /usr/bin/env python
# -*- coding: utf-8 -*-


# Savebases - Lazaret archaeological laboratory - Free sowtware under GPL v2
# Savedb_week.sh is a Python script called by cron to install it create a symbolic link :
# > ln -s /usr/local/bin/savedb_week.sh /etc/cron.daily/savedb_week.sh
# The script copy databases saves fron 'from_directory' into 'to_directory'
# See http://lazaret.unice.fr/opensource/ for more infos


from savebases import *

from_directory = "/home/bases/sauvegarde_jours/"
to_directory = "/home/bases/sauvegarde_semaine/"
weeks_old = 5


####### Main #######
# check if there are previous backups into 'to_directory' and send a warning if not
check_backups(to_directory)
# delete backups older than 'week_old' week(s)
delete_old_backups(to_directory, weeks_old)
# copy today backups 'from_diretory' into 'to_directory'
copy_today_backups(from_directory, to_directory)

