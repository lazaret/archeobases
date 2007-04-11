#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 1999      Jerome ALET <alet@unice.fr>
#                1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
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
import annuaireconf
import afficheclefs
import annuairedata

doc = annuaireconf.Bas("Modification des param�tres", "Modification d'une zone")
db = annuaireconf.ArcheoDataBase()
form = cgi.FieldStorage()
doc.br()
doc.br()
doc.br()
doc.br()


doc.button(name="entree", value="Entree", onclick='parent.bas.location="' + annuaireconf.script_location("modcontrole_entree.py") + '"')

doc.output()




