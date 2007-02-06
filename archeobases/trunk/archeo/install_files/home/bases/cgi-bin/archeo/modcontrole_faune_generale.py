#!  /usr/bin/python
# -*- coding: utf-8 -*-
#
# Archeo - (c) 1999      Jerome ALET <alet@unice.fr>
#                   1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: modcontrole_faune_generale.py,v 1.6 2001/11/09 08:32:36 rachel Exp $
#
# $Log: modcontrole_faune_generale.py,v $
# Revision 1.6  2001/11/09 08:32:36  rachel
# tout plein de modifs pdt que CVS ne fonctionnait pas
#
# Revision 1.5  2001/07/17 14:02:27  rachel
# modif des ecrans existants
#
# Revision 1.4  2001/07/05 15:29:21  rachel
# plein de modifs
#
# Revision 1.3  2001/06/01 08:28:17  rachel
# petites modifs pour entre autres permettre de verouiler les champs de la clef. Le nouveau+1 fonctionne pour le carnet mais il pose pb pour les autres ecrans ou les champs ne sont pas memorise(essais faits sur faune)
#
# Revision 1.2  2001/03/20 19:59:41  jerome
# Ajout des tags CVS Id et Log
#
#
#

import sys
import time
import string
import cgi
import urllib
import archeoconf
import afficheclefs

page = archeoconf.Controle("Controles")
page.div(align="center")
page.table(border="0")
page.tr()

page.push()
page.td()
page.br()
page.br()
#afficheclefs.ajoute_ligne(page, "100%", "1", "10", "4")
page.tr()
page.td()
page.table(border= "0")# , bgcolor = archeoconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

page.br()
page.br()

page.button(name="controle_faune", value="Faune",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_faune") + '"')

page.button(name="controle_usure_dent", value="Usure des dents",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_usure_dent") + '"')

page.button(name="controle_microfaune", value="Microfaune",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_microfaune") + '"')

page.button(name="controle_dent", value="Mesure Dents",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_dent") + '"')

page.button(name="controle_os", value="Mesure Os",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_os") + '"')

page.button(name="controle_trace", value="Trace",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_trace") + '"')

page.button(name="controle_fracture_faune", value="Fracture",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_fracture_faune") + '"')

page.button(name="controle_coprolithe", value="Coprolithe",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_coprolithe") + '"')

page.pop()

page.push()
page.tr()
page.td(align = "center")

page.br()


page.pop()
page.output()

