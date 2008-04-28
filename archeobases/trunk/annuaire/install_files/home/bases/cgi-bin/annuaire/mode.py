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


import os
import cgi
import urllib
import annuaireconf
import afficheclefs
import annuairedata


doc = annuaireconf.Bas("Modification des paramètres", "Modification d'une zone")
db = annuaireconf.ArcheoDataBase()
form = cgi.FieldStorage()

doc.button(name="entrée", value="Entrée", onclick='parent.bas.location="' + annuaireconf.script_location("modcontrole_entree.py") + '"')

doc.output()



