#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import collectionconf
import database
import urllib

def petit_logo(page, logo, lien) :
        if logo != None :
                page.push()
                page.td()
                page.a(href = lien, target = "_top")
                page.img(src = collectionconf.decor_location(logo), border = "0")
                page.pop()


def bouton(page, module, image) :
        page.push()
        page.a(href=collectionconf.script_location(module), target="bas")
        #page.a(href="'parent.bas.location=%s'"  %collectionconf.script_location(module))
        page.img(src=collectionconf.decors_location + image + ".jpg", border=0)
        page.pop()

page = collectionconf.Menu("Menu")
"""page.button(name="menu", value="Entree",onclick='parent.bas.location="'+ collectionconf.script_location("modentree")        + '"')"""

nombase = collectionconf.getBase()

page.div(align="center")
page.table(border="0")
page.push()
page.td()
page.img(src = collectionconf.decor_location("logo-12_130.jpg"), alt= "", border=0)
page.pop()
page.td()
page.table(border="0")
page.tr()

page.push()
page.td()
page.table(border= "0")
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")
bouton(page, "modbiblio", "bibliographie") #1
bouton(page, "modmateriel", "materiel") #2
bouton(page, "modanthropologie", "anthropologie") #3
bouton(page, "modfaune_comparaison", "faune_comparaison") #4
bouton(page, "modmoulages", "moulages") #5
bouton(page, "modscan", "scan") #6
bouton(page, "modaudio_video", "audio_video") #7
bouton(page, "modvue", "vue") #8
page.pop()

page.tr()
page.td(align = "center")
bouton(page, "moddessin", "dessin") #9
bouton(page, "modreleve", "releve") #10
bouton(page, "modcarte", "carte") #11

bouton(page, "modassociation", "association") #12

if collectionconf.utilisateur_courant not in collectionconf.visitorusers :
        bouton(page, "requetes", "sql") #13
if collectionconf.utilisateur_courant in collectionconf.superusers :
        bouton(page, "controle", "controles") #14

page.push()
page.a(href = collectionconf.site_location, target = "_top")
page.img(src=collectionconf.decors_location + "aide.jpg", border=0) #15
page.pop()
page.push()
page.a(href =  "/cgi-bin/collection.py?base=aucune", target = "_top")
page.img(src=collectionconf.decors_location + "deconnexion.jpg", border=0) #16
page.pop()


petit_logo(page, collectionconf.petit_logo_bas, collectionconf.petit_logo_bas_link)

page.output()
