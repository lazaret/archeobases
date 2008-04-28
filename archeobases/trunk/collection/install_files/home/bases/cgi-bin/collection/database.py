#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import urllib

__version__ = "1.1"

#
# Définition d'une classe d'accès à une base de données PostrgreSQL sous Python
# Cette classe encapsule les fonctions importantes du modules Pg et ajoute
# la possibilite de tracer toutes les requetes en les envoyant sur stderr.
# Dans le cas de l'utilisation de cette classe dans un script CGI alors les
# messages d'erreurs et de trace sont recuperables dans le fichier de log du
# logiciel serveur WEB (teste uniquement avec Apache).

class DataBase :
        __database  = None
        __debuglevel = False # mettre à True pour le debug

        def __init__(self, host = None, database = None, username = None, debuglevel = 0) :
                try :
                        self.__database = pg.connect(host = host, dbname = database, user = username)
                        if self.__debuglevel :
                                self.sql_message("Connected to Host [%s] DataBase [%s] Username [%s]" % (host, database, username))
                        self.query("SET CLIENT_ENCODING TO 'UTF-8';")
                except pg.Error, msg :
                        self.fatal_message("Unable to connect to Host [%s] DataBase [%s] Username [%s] ==> [%s]" % (host, database, username, msg))

        def log_message(self, msg, level) :
                if os.environ.has_key("REMOTE_USER") :
                        message = "[%s] [%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, os.environ["REMOTE_USER"], msg)
                else :
                        message = "[%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, msg)
                sys.stderr.write(message)
                sys.stderr.flush()
                return message

        def sql_message(self, msg) :
            """affiche les requettes SQL dans les logs Apache si le niveau de debug est supperieur à 0"""
            if self.__debuglevel :
                return self.log_message(msg, level = "sql")

        def error_message(self, msg) :
                return self.log_message(msg, level = "error")

        def fatal_message(self, msg) :
                self.log_message(msg, "fatal")
                sys.exit(-1)

        def quote(self, field, typ) :
            # met le champs entre apostrophes et gère les appostrophes au sein d'une chaine
            # par exemple L'arnaque est transformé en  'L''arnaque'
                return pg._quote(field, typ)

        def query(self, q) :
                if self.__database != None :
                        if self.__debuglevel :
                                self.sql_message(q)
                        try :
                                return self.__database.query(q)
                        except pg.Error, msg:
                                if msg and (msg[-1] == '\n') :
                                        msg = msg[:-1]
                                self.__database.query("ROLLBACK;")      # auto rollback
                                self.fatal_message("%s ==>> [%s]" % (q, msg))
                else :
                        self.error_message("No DataBase connection available")
