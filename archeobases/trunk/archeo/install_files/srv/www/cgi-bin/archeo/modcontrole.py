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

import cgi
import archeoconf


doc = archeoconf.Bas("Modification des paramètres", "Modification d'une zone")
db = archeoconf.ArcheoDataBase()
form = cgi.FieldStorage()

doc.br()
doc.br()
doc.br()
doc.br()
doc.button(name="carnet", value="Carnet", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_carnet.py") + '"')
doc.output()




