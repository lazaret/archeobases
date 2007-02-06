#! /usr/bin/python
# -*- coding: utf-8 -*-
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
#
# $Id: modcontrole.py,v 1.5 2002/01/10 21:32:39 jerome Exp $
#
# $Log: modcontrole.py,v $
# Revision 1.5  2002/01/10 21:32:39  jerome
# Debuggage de pas mal de merdouilles
#
# Revision 1.4  2001/07/05 15:29:18  rachel
# plein de modifs
#
# Revision 1.3  2001/03/20 19:59:38  jerome
# Ajout des tags CVS Id et Log
#
#
#
import os
import cgi
import urllib
import archeoconf
import afficheclefs
import archeodata

doc = archeoconf.Bas("Modification des paramètres", "Modification d'une zone")
db = archeoconf.ArcheoDataBase()
form = cgi.FieldStorage()
doc.br()
doc.br()
doc.br()
doc.br()


doc.button(name="carnet", value="Carnet", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_carnet.py") + '"')

doc.output()




