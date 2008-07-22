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

import os
import string
import archeoconf
import photo
import afficheclefs


photo = photo.Photo("bas","trace")
f = photo.getcurform()
page = photo.getcurdoc()

if f.has_key("action") :
    if f["action"].value == "Modifier":
        photo.modifier()
    elif f["action"].value == "Supprimer":
        photo.supprimer()
    elif f["action"].value[:7] == "Ajouter":
        photo.creer()
    elif f["action"].value[:8] == "Nouvelle":
        page.push()
        page.div(align="center")
        page.form(action=page.script_name(), method="POST", enctype="multipart/form-data")
        page.table(border=5, cellpadding=5, cellspacing=5, bgcolor=archeoconf.basform_bgcolorleft)
        page.tr()
        page.td()
        page.table(border=0, cellpadding=0, cellspacing=0)
        page.push()
        page.tr()
        dico = afficheclefs.form_to_enreg(f)
        afficheclefs.display_zone(photo.__db__, page, dico)
        afficheclefs.display_numero(page, dico)
        afficheclefs.display_bis(photo.__db__, page, dico)
        nbcols = 3
        if f.has_key("outil"):
            afficheclefs.display_o_ordre(page, dico)
            nbcols = 4
        page.pop()
        page.push()
        page.tr()
        page.td("Fichier:", align="right", valign="middle", width="20%")
        page.td(align="left", valign="middle", colspan=nbcols - 1)
        page.file(name="fichier_photo", size=40)
        page.pop()
        page.push()
        page.tr()
        page.td("Taille des images:", valign="middle", align="right", width="20%")
        page.td(align="left", valign="middle", colspan=nbcols - 1)
        listetaille = ("Moyenne", "Petite", "Grande")
        page.push()
        page.select(name="taille")
        for x in listetaille :
            page.option(x, value=x)
        page.pop()
        page.push()
        page.tr()
        page.p()
        page.td("Légende:", align="right", valign="top")
        page.td(align="left", valign="top", colspan=nbcols - 1)
        page.textarea(name="legende", rows="4", cols="40", wrap="physical")
        page.pop()
        page.tr()
        page.td(align="center", valign="middle", colspan=nbcols)
        referer = os.environ["HTTP_REFERER"]
        inter = string.find(referer, '?')
        if inter != -1 :
            referer = referer[:inter]
        inter = string.find(referer, '#')
        if inter != -1 :
            referer = referer[:inter]
        page.hidden(name="referer", value=referer)
        page.submit(name="action", value="Ajouter la photo")
        page.reset(value="Effacer")
        page.pop()
    else :
        archeoconf.log_message("%s: Action [%s] inconnue" % (photo.getcurdoc().script_name(), f["action"].value))
else:
    archeoconf.log_message("Aucun champ 'action' dans le formulaire: <%s>" % str(f))
    page.do_nothing()
page.output()
