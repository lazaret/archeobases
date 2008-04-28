#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Annuaire - (c) 2000-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import cgi
import annuaireconf
import photo
import afficheclefs


photo = photo.Photo("bas","fiche")
f = photo.getcurform()
if f.has_key("action") :

        if f["action"].value == "Modifier" :
                photo.modifier()
        elif f["action"].value == "Supprimer" :
                photo.supprimer()
        elif f["action"].value[:7] == "Ajouter" :
                photo.creer()
        elif f["action"].value[:8] == "Nouvelle" :
                page = photo.getcurdoc()

                page.push()
                page.div(align = "center")
                page.form(action = page.script_name(), method = "POST", enctype = "multipart/form-data")
                page.table(border = 5, cellpadding = 5, cellspacing = 5, bgcolor = annuaireconf.basform_bgcolorleft)
                page.tr()
                page.td()
                page.table(border = 0, cellpadding = 0, cellspacing = 0)

                page.push()
                page.tr()
                dico = afficheclefs.form_to_enreg(f)
                afficheclefs.display_zone(photo.__db__, page, dico)
                #afficheclefs.display_zone(page, dico)
                afficheclefs.display_numero(page, dico)
                afficheclefs.display_bis(photo.__db__, page, dico)
                nbcols = 3
                if f.has_key("outil"):
                        afficheclefs.display_o_ordre(page, dico)
                        nbcols = 4

                page.pop()

                page.push()
                page.tr()
                page.td("Fichier:", align = "right", valign = "middle", size="20%")
                page.td(align = "left", valign = "middle", colspan = nbcols - 1)
                page.file(name = "fichier_photo", size = 64)
                page.pop()

                page.push()
                page.tr()
                page.td("Taille des images:", valign = "middle", align = "right")
                page.td(align = "left", valign = "middle", colspan = nbcols - 1)
                listetaille = [ "Moyenne" , "petite","Grande"]
                page.select(name = "taille")
                for x in listetaille :
                        page.option(x, value = x)
                page.pop()

                page.push()
                page.tr()
                page.p()
                page.td("Légende:", align = "right", valign = "top")
                page.td(align = "left", valign = "top", colspan = nbcols - 1)
                page.textarea(name = "legende", rows="4", cols="50", wrap="physical")
                page.pop()

                page.tr()
                page.td(align = "center", valign = "middle", colspan = nbcols)
                referer = os.environ["HTTP_REFERER"]
                inter = string.find(referer, '?')
                if inter != -1 :
                        referer = referer[:inter]
                inter = string.find(referer, '#')
                if inter != -1 :
                        referer = referer[:inter]
                page.hidden(name = "referer", value = referer)
                page.submit(name = "action", value = "Ajouter la photo")
                page.reset(value = "Effacer")
                page.pop()

                page.output()
        else :
                annuaireconf.log_message("%s: Action [%s] inconnue" % (photo.getcurdoc().script_name(), f["action"].value))







