#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import begoconf


def petit_logo(page, logo, lien) :
        if logo != None :
                page.push()
                page.td()
                page.a(href = lien, target = "_top")
                page.img(src = begoconf.decor_location(logo), border = "0")
                page.pop()

def bouton(page, module, image) :
        page.push()
        page.a(href=begoconf.script_location(module), target="bas")
        page.img(src=begoconf.decors_location + image + ".png", border=0)
        page.pop()

page = begoconf.Menu("Menu")

page.div(align="center")
page.table(border="0")
page.tr()

petit_logo(page, begoconf.petit_logo_gauche, begoconf.petit_logo_gauche_link)

page.push()
page.td()
page.table(border= "0")
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")
bouton(page, "modzone", "zones")
bouton(page, "modroche", "roches")
bouton(page, "modface", "faces")
bouton(page, "modfigure", "figuresprotohistoriques")
bouton(page, "modhistorique", "gravureshistoriques")
bouton(page, "modassociation", "associations")
page.pop()
page.tr()
page.td(align = "center")
if page.remote_user() in begoconf.superusers :
    bouton(page, "requetes", "sql")
    bouton(page, "parametre", "parametres")

page.a(href = begoconf.help_general_location, target = "_top")
page.img(src=begoconf.decors_location + "aide.png", border=0)

page.pop()

petit_logo(page, begoconf.petit_logo_bas, begoconf.petit_logo_bas_link)

page.output()


