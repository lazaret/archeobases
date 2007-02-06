#! /usr/bin/python
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
# $Id: controle.py,v 1.6 2001/07/05 15:29:10 rachel Exp $
#
# $Log: controle.py,v $
# Revision 1.6  2001/07/05 15:29:10  rachel
# plein de modifs
#
# Revision 1.5  2001/04/05 09:44:28  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.4  2001/03/20 19:59:30  jerome
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

page.button(name="controle_carnet", value="Carnet",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_carnet") + '"')

page.button(name="controle_industrie", value="Industrie",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_industrie_general") + '"')

page.button(name="controle_faune", value="faune",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_faune_generale") + '"')
page.pop()
page.output()

