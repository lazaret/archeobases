#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
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


doc.button(name="entree", value="Entree", onclick='parent.bas.location="' + collectionconf.script_location("modcontrole_collection.py") + '"')
doc.output()




