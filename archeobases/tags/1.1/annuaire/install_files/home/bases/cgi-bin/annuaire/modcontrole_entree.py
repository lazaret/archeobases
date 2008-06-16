#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Annuaire - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
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
import string


page = annuaireconf.Controle("Controles")
page.div(align="center")
page.table(border="0")
page.tr()

page.push()
page.push()
page.td()
page.br()
page.br()
page.tr()
page.td(align="center")
page.insert_text(" Contrôles des champs de l'annuaire  ")
page.pop()

page.tr()
page.td()
page.table(border= "0")
page.form(method="POST")
page.push()
page.tr()

page.br()
page.td(align = "center", valign = "center")
page.push()
cpt = 0
for chaine in ("type_entree","type_personne","civilite","association","cotisation","type_adresse"):
        if (cpt == 6 ) :
                page.pop()
                page.push()
                page.tr()
                page.td(align = "center")
                cpt = 1
        else :
                cpt = cpt + 1

        dico = {"champ": chaine}

        page.button(value = string.capitalize(dico["champ"]) , onclick='parent.bas.location="' + annuaireconf.script_location("controle_general") + "?" + urllib.urlencode(dico) + '"')

page.pop()

page.output()
