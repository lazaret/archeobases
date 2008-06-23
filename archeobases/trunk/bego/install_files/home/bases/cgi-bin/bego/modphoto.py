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

""" Permet de modifier/supprimer et ajouter des photographies dans la base.

Le photographies sont entrée directement dans un repertoire,
et le chemin du repertoire est enregistré dans la base.
"""

import os
import string
import begoconf
import afficheclefs
import photo


photo = photo.Photo("bas")
f = photo.getcurform()
if f["action"].value == "Modifier":
    photo.modifier()
elif f["action"].value == "Supprimer":
    photo.supprimer()
elif f["action"].value == "Ajouter":
    photo.creer()
elif f["action"].value == "Nouvelle":
    page = photo.getcurdoc()
    page.div(align = "center")
    page.form(action=page.script_name(), method="POST", enctype="multipart/form-data")
    page.table(border=1, cellpadding=3, cellspacing=3, bgcolor=begoconf.basform_bgcolorleft)
    page.tr()
    page.td()
    page.push()
    page.table(border=0, cellpadding=3, cellspacing=3, width="100%") # une soustable dans la table
    page.tr()
    dico = afficheclefs.form_to_enreg(f)
    afficheclefs.display_field_photo(page, dico, field="zone", alignement="center")
    if f.has_key("roche"):
        afficheclefs.display_field_photo(page, dico, field="groupe", alignement="center")
        afficheclefs.display_field_photo(page, dico, field="roche", alignement="center")
        if f.has_key("face"):
            afficheclefs.display_field_photo(page, dico, field="face")
        else:
            page.td(width="20%", bgcolor="#FFFFFF")
        if f.has_key("association"):
            afficheclefs.display_field_photo(page, dico, field="association")
        elif f.has_key("figure"):
            afficheclefs.display_field_photo(page, dico, field="figure")
        elif f.has_key("historique"):
            afficheclefs.display_field_photo(page, dico, field="historique")
        else:
            page.td(width="20%", bgcolor="#FFFFFF")
    page.pop()
    page.push()
    page.table(border=0, cellpadding=2, cellspacing=2, width="100%") # autre soustable dans la table
    page.push()
    page.tr()
    page.td(height=7)
    page.pop()
    page.push()
    page.tr()
    page.td("&nbsp;Fichier&nbsp;:&nbsp;", align="right")
    page.td(align="left", colspan=3)
    page.file(name="fichier_photo", size=58)
    page.pop()
    page.push()
    page.tr()
    page.td("&nbsp;Taille&nbsp;de&nbsp;l'image&nbsp;:&nbsp;", align="right")
    page.td(align="left")
    listetaille = ["Moyenne", "Petite", "Grande"]
    page.select(name="taille")
    for x in listetaille:
        page.option(x, value=x)
    page.pop()
    page.push()
    page.tr()
    page.td("&nbsp;Légende&nbsp;:&nbsp;", align="right", valign="top")
    page.td(align="left", valign="top")
    page.textarea(name="legende", rows="3", cols="70", wrap="physical")
    page.pop()
    page.push()
    page.tr()
    page.td(height=7)
    page.pop()
    page.push()
    page.tr()
    page.td(align="center", colspan=2)
    referer = os.environ["HTTP_REFERER"]
    inter = string.find(referer, '?')
    if inter != -1:
        referer = referer[:inter]
    inter = string.find(referer, '#')
    if inter != -1:
        referer = referer[:inter]
    page.hidden(name="referer", value=referer)
    page.submit(name="action", value="Ajouter")
    page.insert_text("&nbsp;")
    page.reset(value="Effacer")
    page.pop()
    page.pop()
    page.output()
else:
    begoconf.log_message("%s: Action [%s] inconnue" % (photo.getcurdoc().script_name(), f["action"].value))

