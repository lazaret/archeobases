#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import sys
import os
import time
import pg


#
# Definition d'une classe d'acces a une base de donnees PostrgreSQL sous Python
# Cette classe encapsule les fonctions importantes du modules Pg et ajoute
# la possibilite de tracer toutes les requetes en les envoyant sur stderr.
# Dans le cas de l'utilisation de cette classe dans un script CGI alors les
# messages d'erreurs et de trace sont recuperables dans le fichier de log du
# logiciel serveur WEB (teste uniquement avec Apache).
class DataBase:
    __database  = None
    __debuglevel = 0

    def __init__(self, host=None, database=None, username=None, debuglevel=0):
        self.set_debug(debuglevel)
        try:
            self.__database = pg.connect(host=host, dbname=database, user=username)
            if self.__debuglevel > 0:
                self.sql_message("Connected to Host [%s] DataBase [%s] Username [%s]" % (host, database, username))
        except pg.error, msg:
            self.fatal_message("Unable to connect to Host [%s] DataBase [%s] Username [%s] ==> [%s]" % (host, database, username, msg))

    def log_message(self, msg, level):
        if os.environ.has_key("REMOTE_USER"):
            message = "[%s] [%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, os.environ["REMOTE_USER"], msg)
        else:
            message = "[%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, msg)
        sys.stderr.write(message)
        sys.stderr.flush()
        return message

    def sql_message(self, msg):
        return self.log_message(msg, level="sql")

    def error_message(self, msg):
        return self.log_message(msg, level="error")

    def fatal_message(self, msg):
        self.log_message(msg, "fatal")
        sys.exit(-1)

    def set_debug(self, debuglevel):
        self.__debuglevel = debuglevel

    def quote(self, field, typ):
        return pg._quote(field, typ)

    def query(self, q):
        if self.__database != None:
            if self.__debuglevel > 0:
                self.sql_message(q)
            try:
                return self.__database.query(q)
            except pg.error, msg:
                if msg and (msg[-1] == '\n'):
                    msg = msg[:-1]
                self.__database.query("ROLLBACK;")      # auto rollback
                self.fatal_message("%s ==>> [%s]" % (q, msg))
        else:
            self.error_message("No DataBase connection available")
