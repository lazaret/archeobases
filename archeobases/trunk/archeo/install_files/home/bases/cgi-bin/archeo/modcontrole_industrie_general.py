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
# $Id: modcontrole_industrie_general.py,v 1.5 2001/07/10 13:45:47 rachel Exp $
#
# $Log: modcontrole_industrie_general.py,v $
# Revision 1.5  2001/07/10 13:45:47  rachel
# pleins de modifs: nouveau+1 ok, lien vers enfants ok
#
# Revision 1.4  2001/07/05 15:29:22  rachel
# plein de modifs
#
# Revision 1.3  2001/03/20 19:59:43  jerome
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

page.button(name="controle_industrie", value="Industrie",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_industrie") + '"')


page.button(name="controle_eclat", value="Eclat",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_eclat") + '"')

page.button(name="controle_bord", value="Bord",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_bord") + '"')


page.button(name="controle_outil", value="Outil",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_outil") + '"')

page.button(name="controle_galet_amenage", value="G.Aménagé",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_galet_amenage") + '"')

page.button(name="controle_enlevement_galet_amenage", value="Enlevement des GA",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_enlevement_galet_amenage") + '"')
page.pop()

page.push()
page.tr()
page.td(align = "center")

page.br()


page.button(name="controle_nucleus", value="Nucléus",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_nucleus") + '"')

page.button(name="controle_enlevement_galet_nucleus", value="Enlevement des nucléus",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_enlevement_nucleus") + '"')

page.button(name="controle_biface", value="Biface",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_biface") + '"')

page.button(name="controle_hachereau", value="Hachereau",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_hachereau") + '"')

page.button(name="controle_retouche", value="Retouche",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_retouche") + '"')

page.button(name="controle_fracture_industrie", value="Fracture",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_fracture_industrie") + '"')

page.button(name="controle_stigmate", value="Stigmate",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_stigmate") + '"')


page.pop()
page.output()

