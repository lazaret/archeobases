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

import sys
import time
import string
import cgi
import urllib
import collectionconf
import afficheclefs

page = collectionconf.Controle("Controles")
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
page.table(border= "0")# , bgcolor = collectionconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

page.br()
page.br()

page.button(name="controle_collection", value="Modifier les contrôles",onclick='parent.bas.location="' + collectionconf.script_location("modcontrole_collection") + '"')
page.pop()
page.output()

