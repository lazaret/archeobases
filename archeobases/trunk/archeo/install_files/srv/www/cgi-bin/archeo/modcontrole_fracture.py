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

import urllib
import archeoconf
import afficheclefs
import string


page = archeoconf.Controle("Controles")
page.div(align="center")
page.table(border="0")
page.tr()
page.push()
page.push()
page.td()
page.br()
page.br()
afficheclefs.ajoute_ligne(page, "100%", "1", "10", "4")
page.tr()
page.td(align="center")
page.insert_text(" Contrôles des champs de l'écran Fractures ")
page.pop()
page.tr()
page.td()
page.table(border="0")
page.form(method="POST")
page.push()
page.tr()
page.br()
page.td(align="center", valign="center")
page.push()
cpt = 0
for chaine in ("f_type", "f_percussion", "f_mode", "f_tranchant", "f_anciennete"):
    if (cpt == 6 ):
        page.pop()
        page.push()
        page.tr()
        page.td(align="center")
        cpt = 1
    else:
        cpt = cpt + 1
    dico = {"champ": chaine}
    page.button(value=string.capitalize(dico["champ"]), onclick='parent.bas.location="' + archeoconf.script_location("controle_general") + "?" + urllib.urlencode(dico) + '"')
page.pop()
page.output()
