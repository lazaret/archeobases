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
page.table(border= "0")# , bgcolor = collectionconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

bouton(page, "requetes", "sql")
if collectionconf.utilisateur_courant in collectionconf.superusers :
        bouton(page, "controle", "controles")
page.a("Aide", href = collectionconf.site_location, target = "_top") 
page.a("Déconnexion", href =  "/cgi-bin/collection.py?base=aucune", target = "_top")
page.pop()

page.tr()
page.td(align = "center")
bouton(page, "modbiblio", "bibliographie")
bouton(page, "modassociation", "association")
bouton(page, "modmateriel", "materiel")
bouton(page, "modanthropologie", "anthropologie")
bouton(page, "modfaune_comparaison", "faune_comparaison")
bouton(page, "modsepulture", "sepulture")
page.pop()

page.tr()
page.td(align = "center")
bouton(page, "modmoulage_sol", "moulage_sol")
bouton(page, "modmoulage_objet", "moulage_objet")
bouton(page, "modscan", "scan")
bouton(page, "modaudio_video", "audio_video")
bouton(page, "modvue", "vue")
bouton(page, "moddessin", "dessin")
bouton(page, "modreleve", "releve")
bouton(page, "modcarte", "carte")
page.pop()

petit_logo(page, collectionconf.petit_logo_bas, collectionconf.petit_logo_bas_link)

page.output()
