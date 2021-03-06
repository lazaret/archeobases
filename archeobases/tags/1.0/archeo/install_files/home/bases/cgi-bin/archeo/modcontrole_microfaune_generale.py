#!  /usr/bin/python
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
page.table(border= "0")# , bgcolor = archeoconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

page.br()
page.br()

page.button(name="controle_microfaune", value="Microfaune",onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_microfaune") + '"')

page.pop()

page.push()
page.tr()
page.td(align = "center")

page.br()


page.pop()
page.output()

