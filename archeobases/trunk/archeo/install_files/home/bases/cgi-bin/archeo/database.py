#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# database.py - (c) 1999 Jerome ALET <alet@unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: database.py,v 1.3 2001/07/05 15:29:11 rachel Exp $
#
#
# $Id: database.py,v 1.3 2001/07/05 15:29:11 rachel Exp $
#
# $Log: database.py,v $
# Revision 1.3  2001/07/05 15:29:11  rachel
# plein de modifs
#
# Revision 1.2  2001/03/20 19:59:31  jerome
# Ajout des tags CVS Id et Log
#
#
#

import sys
import os
import time
import pg

__version__ = "1.0"

#
# Définition d'une classe d'accès à une base de données PostrgreSQL sous Python
# Cette classe encapsule les fonctions importantes du modules Pg et ajoute
# la possibilite de tracer toutes les requetes en les envoyant sur stderr.
# Dans le cas de l'utilisation de cette classe dans un script CGI alors les
# messages d'erreurs et de trace sont recuperables dans le fichier de log du
# logiciel serveur WEB (teste uniquement avec Apache).
class DataBase :
        __database  = None
        __debuglevel = 0 # mettre à 1 pour le debug

        def __init__(self, host = None, database = None, username = None, debuglevel = 0) :
                self.set_debug(debuglevel)
                try :
                        self.__database = pg.connect(host = host, dbname = database, user = username)
                        if self.__debuglevel > 0 :
                                self.sql_message("Connected to Host [%s] DataBase [%s] Username [%s]" % (host, database, username))
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
            if self.__debuglevel > 0 :
                return self.log_message(msg, level = "sql")

        def error_message(self, msg) :
                return self.log_message(msg, level = "error")

        def fatal_message(self, msg) :
                self.log_message(msg, "fatal")
                sys.exit(-1)

        def set_debug(self, debuglevel) :
                self.__debuglevel = debuglevel

        def quote(self, field, typ) :
                return pg._quote(field, typ)

        def query(self, q) :
                if self.__database != None :
                        if self.__debuglevel > 0 :
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
