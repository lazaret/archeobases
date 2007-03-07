#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
import os
import cgi
import urllib
import collectionconf
import afficheclefs
import collectiondata

doc = collectionconf.Bas("Modification des paramètres", "Modification d'une zone")
db = collectionconf.CollectionDataBase()
form = cgi.FieldStorage()
doc.br()
doc.br()
doc.br()
doc.br()


doc.button(name="entree", value="Entree", onclick='parent.bas.location="' + collectionconf.script_location("modcontrole_collection.py") + '"')doc.output()




