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
page.tr()
page.td(align="center")
page.insert_text(" Contrôles des champs de l'écran faune  ")
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
for chaine in ("f_classe", "f_ordre", "f_famille", "f_ssfamille", "f_affgenre", "f_genre", "f_affespece", "f_espece", "f_ssespece", "f_typos1", "f_typos2", "f_typos3", "f_typos4", "f_typos5", "f_typos6", "f_lateralite", "f_sexe", "f_taille", "f_agecl", "f_stserie", "f_stdent", "f_epins", "f_pathologie", "f_couleur", "f_caltype", "f_calcouleur", "f_concretion", "f_oxyde", "f_coraspect", "f_corfissure", "f_fossilisation", "f_tissu", "f_typedos", "f_ilongueur", "f_icirconference", "f_eclat", "f_agent", "f_photo", "f_dessin", "f_traitement", "f_datation", "f_moulage", "f_conservation", "f_restauration", "f_responsable"):
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
