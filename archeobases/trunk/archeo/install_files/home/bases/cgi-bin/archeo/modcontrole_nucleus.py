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
# $Id: modcontrole_nucleus.py,v 1.4 2001/07/05 15:29:23 rachel Exp $
#
# $Log: modcontrole_nucleus.py,v $
# Revision 1.4  2001/07/05 15:29:23  rachel
# plein de modifs
#
# Revision 1.3  2001/03/20 19:59:43  jerome
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
#afficheclefs.ajoute_ligne(page, "100%", "1", "10", "4")
page.tr()
page.td(align="center")
page.insert_text(" Contrôles des champs de l'écran nucléus ")
page.pop()

page.tr()
page.td()
page.table(border= "0")# , bgcolor = archeoconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
#page.br()
page.br()
page.td(align = "center", valign = "center")
page.push()
cpt = 0
for chaine in ("n_type","n_forme", "n_orientation", "n_epuisement", "n_cortotal"):
        if (cpt == 6 ) :
                page.pop()
                page.push()
                page.tr()
                page.td(align = "center")
                cpt = 1
        else :
                cpt = cpt + 1

        dico = {"champ": chaine}

        page.button(value = string.capitalize(dico["champ"]) , onclick='parent.bas.location="' + archeoconf.script_location("controle_general") + "?" + urllib.urlencode(dico) + '"')

page.pop()

page.output()
