#! /usr/bin/python
#
# archeoo - (c)  1999-2003 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
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
        os.system("htpasswd -c authentification super%s"%sys.argv[1])
        print "mot de passe %s"%sys.argv[1]
        os.system("htpasswd -c authentification %s"%sys.argv[1])
        print "mot de passe visiteur%s"%sys.argv[1]
        os.system("htpasswd  -c authentification visiteur%s"%sys.argv[1])
        





