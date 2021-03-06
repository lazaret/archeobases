#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Anuuiare  - (c) 2006 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
import annuaireconf
import database

def petit_logo(page, logo, lien) :
        if logo != None :
                page.push()
                page.td()
                page.a(href = lien, target = "_top")
                page.img(src = annuaireconf.decor_location(logo), border = "0")
                page.pop()


def bouton(page, module, image) :
        page.push()
        page.a(href=annuaireconf.script_location(module), target="bas")
        #page.a(href="'parent.bas.location=%s'"  %annuaireconf.script_location(module))
        page.img(src=annuaireconf.decors_location + image + ".jpg", border=0)
        page.pop()
        
page = annuaireconf.Menu("Menu")
"""page.button(name="menu", value="Entree",onclick='parent.bas.location="'+ annuaireconf.script_location("modentree")        + '"')"""

nombase = annuaireconf.getBase()

page.div(align="center")
page.table(border="0")
page.push()
page.td()
page.img(src = annuaireconf.decor_location("logo-12_130.jpg"), alt= "", border=0)
page.pop()
page.td()
page.table(border="0")
page.tr()

page.push()
page.td()
page.table(border= "0")# , bgcolor = annuaireconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td(align = "center")

#bouton(page, "", "entree")
bouton(page, "requetes", "sql")
if annuaireconf.utilisateur_courant in annuaireconf.superusers :
        bouton(page, "controle", "controles")
page.a("Aide", href = annuaireconf.site_location, target = "_top") 
page.a("Deconnexion", href =  "/cgi-bin/annuaire.py?base=aucune", target = "_top")
page.pop()

page.tr()
page.td(align = "center")
#bouton(page, "modentree", "entree")
bouton(page, "modfiche", "fiche")
bouton(page, "modadresse", "adresse")

page.pop()

petit_logo(page, annuaireconf.petit_logo_bas, annuaireconf.petit_logo_bas_link)

page.output()
