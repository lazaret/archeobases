#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


#==========================================================
# Programme qui permet de changer les mots de passes des utilisateurs en appellant la commande htaccess
#==========================================================
import os
import sys
import string
import database
sys.path.append("../cgi")


db = database.DataBase(database=sys.argv[1], username = "postgres")

modif = raw_input('Souhaitez-vous modifier les mots de passe de cette base O/N ?  ')

if string.upper(modif) == "O":
        print "mot de passe super%s"%sys.argv[1]
	os.system("htpasswd  authentification super%s"%sys.argv[1])
        print "mot de passe %s"%sys.argv[1]
	os.system("htpasswd  authentification %s"%sys.argv[1])
        print "mot de passe visiteur%s"%sys.argv[1]
	os.system("htpasswd  authentification visiteur%s"%sys.argv[1])
	





