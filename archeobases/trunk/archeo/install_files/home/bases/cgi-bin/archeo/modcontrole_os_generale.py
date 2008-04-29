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
afficheclefs.ajoute_ligne(page, "100%", "1", "10", "4")
page.tr()
page.td()
page.table(border= "0")
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

page.br()
page.br()

page.button(name="controle_os", value="Os",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_os") + '"')

page.pop()

page.push()
page.tr()
page.td(align = "center")

page.br()


page.pop()
page.output()

