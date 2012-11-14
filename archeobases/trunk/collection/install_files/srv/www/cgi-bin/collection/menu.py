#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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


def petit_logo(page, logo, lien) :
    if logo != None :
        page.push()
        page.td()
        page.a(href=lien, target="_top")
        page.img(src=collectionconf.decor_location(logo), border="0")
        page.pop()

def bouton(page, module, image) :
    page.push()
    page.a(href=collectionconf.script_location(module), target="bas")
    page.img(src=collectionconf.decors_location + image + ".jpg", border=0)
    page.pop()

page = collectionconf.Menu("Menu")
nombase = collectionconf.getBase()

page.div(align="center")
page.table(border="0")
page.push()
page.td()
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
page.td(align="center")
bouton(page, "modbiblio", "bibliographie")
bouton(page, "modmateriel", "materiel")
bouton(page, "modanthropologie", "anthropologie")
bouton(page, "modfaune_comparaison", "faune_comparaison")
bouton(page, "modobjets_archeologiques", "objets_archeologiques")
bouton(page, "modscan", "scan")
bouton(page, "modaudio_video", "audio_video")
bouton(page, "modvue", "vue")
page.pop()
page.tr()
page.td(align="center")
bouton(page, "moddessin", "dessin")
bouton(page, "modreleve", "releve")
bouton(page, "modcarte", "carte")
bouton(page, "modassociation", "association")
if collectionconf.utilisateur_courant not in collectionconf.visitorusers :
    bouton(page, "requetes", "sql")
if collectionconf.utilisateur_courant in collectionconf.superusers :
    bouton(page, "controle", "controles")
page.push()
page.a(href=collectionconf.site_location, target="_top")
page.img(src=collectionconf.decors_location + "aide.jpg", border=0)
page.pop()
page.push()
page.a(href="/cgi-bin/collection.py?base=aucune", target="_top")
page.img(src=collectionconf.decors_location + "deconnexion.jpg", border=0)
page.pop()
petit_logo(page, collectionconf.petit_logo_bas, collectionconf.petit_logo_bas_link)
page.output()
