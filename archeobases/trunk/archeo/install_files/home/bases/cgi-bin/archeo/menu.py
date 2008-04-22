#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# Archeo  - (c) 1999      Jerome ALET <alet@unice.fr>
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
# $Id: menu.py,v 1.18 2002/09/16 11:27:55 rachel Exp $
#
import archeoconf
import database

def petit_logo(page, logo, lien) :
        if logo != None :
                page.push()
                page.td()
                page.a(href = lien, target = "_top")
                page.img(src = archeoconf.decor_location(logo), border = "0")
                page.pop()


def bouton(page, module, image) :
        page.push()
        page.a(href=archeoconf.script_location(module), target="bas")
        #page.a(href="'parent.bas.location=%s'"  %archeoconf.script_location(module))
        page.img(src=archeoconf.decors_location + image + ".jpg", border=0)
        page.pop()
        
page = archeoconf.Menu("Menu")
"""page.button(name="menu", value="Carnet",onclick='parent.bas.location="'+ archeoconf.script_location("modcarnet")        + '"')"""

nombase = archeoconf.getBase()

page.div(align="center")
page.table(border="0")
page.push()
page.td()
page.img(src = archeoconf.decor_location("logo-12_130.jpg"), alt= "Archeo", border=0)
page.pop()
page.td()
page.table(border="0")
page.tr()

page.push()
page.td()
page.table(border= "0")# , bgcolor = archeoconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")


bouton(page, "modcarnet", "carnet")

if archeoconf.utilisateur_courant not in archeoconf.visitorusers :
        bouton(page, "requetes", "sql") #13

if archeoconf.utilisateur_courant in archeoconf.superusers :
        bouton(page, "controle", "controles")
#        bouton(page, "sauvegarde", "sauvegarde")
page.a("Déconnexion", href =  "/cgi-bin/archeo.py?base=aucune", target = "_top")
page.a("Site", href = archeoconf.site_location, target = "_top") 
page.a("Aide", href =  archeoconf.help_location + "manuel.pdf", target = "_top")
page.a("Lexique Industrie", href =  archeoconf.lexique_location + "/lexique-industrie.pdf", target = "_top")
page.a("Lexique Faune", href =  archeoconf.lexique_location + "/lexique-faune.pdf", target = "_top")
page.pop()

page.tr()
page.td(align = "center")
bouton(page, "modfaune", "faune")
bouton(page, "modmicrofaune", "microfaune")
bouton(page, "moddent", "mesures_dent")
bouton(page, "modnonos", "mesures_os")
bouton(page, "modfracture_faune", "fracture_faune")
bouton(page, "modtrace", "traces")
bouton(page, "modcoprolithe", "coprolithes")

page.tr()
page.td(align = "center")
bouton(page, "modindustrie", "industrie")
#bouton(page, "modretouche", "retouche")
#bouton(page, "modfracture_industrie", "fracture_industrie")
#bouton(page, "modstigmate", "stigmate")
bouton(page, "modoutil", "petit_outil")
bouton(page, "modeclat", "eclat")
bouton(page, "modgalet_amenage", "galet_amenage")
bouton(page, "modnucleus", "nucleus")
bouton(page, "modbiface", "biface")
bouton(page, "modhachereau", "hachereau")


page.pop()

petit_logo(page, archeoconf.petit_logo_bas, archeoconf.petit_logo_bas_link)

page.output()
