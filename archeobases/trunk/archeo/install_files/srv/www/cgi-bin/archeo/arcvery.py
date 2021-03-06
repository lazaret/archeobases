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

import archeoconf


def petit_logo(page, logo, lien):
    if logo != None:
        page.push()
        page.td()
        page.a(href=lien, target="_top")
        page.img(src=archeoconf.decor_location(logo), border="0")
        page.pop()

def bouton(page, module, image):
    page.push()
    page.a(href=archeoconf.script_location(module), target="bas")
    page.img(src=archeoconf.decors_location + image + ".jpg", border=0)
    page.pop()

page = archeoconf.Menu("Menu")
page.div(align="center")
page.table(border="0")
page.push()
page.td()
page.img(src=archeoconf.decor_location("logo-12_130.jpg"), alt="Archeo", border=0)
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
bouton(page, "modcarnet", "carnet")
bouton(page, "requetes", "sql")
if archeoconf.utilisateur_courant in archeoconf.superusers:
    bouton(page, "controle", "controles")
    bouton(page, "sauvegarde", "sauvegarde")
page.a("Déconnexion", href="/cgi-bin/archeo.py?base=aucune", target="_top")
page.a("Aide", href=archeoconf.help_location + "manuel.pdf", target="_top")
page.a("Lexique Industrie", href=archeoconf.lexique_location + "/lexique-industrie.pdf", target="_top")
page.a("Lexique Faune", href=archeoconf.lexique_location + "/lexique-faune.pdf", target="_top")
page.pop()
page.tr()
page.td(align="center")
bouton(page, "modfaune", "faune")
bouton(page, "modmicrofaune", "microfaune")
bouton(page, "moddent", "mesures_dent")
bouton(page, "modnonos", "mesures_os")
bouton(page, "modfracture_faune", "fracture_faune")
bouton(page, "modtrace", "traces")
bouton(page, "modcoprolithe", "coprolithes")
page.tr()
page.td(align="center")
bouton(page, "modindustrie", "industrie")
bouton(page, "modoutil", "petit_outil")
bouton(page, "modeclat", "eclat")
bouton(page, "modgalet_amenage", "galet_amenage")
bouton(page, "modnucleus", "nucleus")
bouton(page, "modbiface", "biface")
bouton(page, "modhachereau", "hachereau")
page.pop()
petit_logo(page, archeoconf.petit_logo_bas, archeoconf.petit_logo_bas_link)
page.output()
