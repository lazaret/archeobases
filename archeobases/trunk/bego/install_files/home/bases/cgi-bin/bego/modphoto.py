#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# montbego - (c) 1999      Jerome ALET <alet@unice.fr>
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
# $Id: modphoto.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: modphoto.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.5  2000/05/30 15:24:08  rachel
# ajout de champs dans bego.sql concerant le type d'association et
# la description d'elements naturels
# mise de taille moyenne par defaut dans photo
# modif de roche pour que remarquable fonctionne
# modif de zone ?
# modif de face ( ajout des elements naturels, et du contenu de direction
# modif de figure modif style, dimension, direction=orientation
#
# Revision 1.4  2000/05/27 13:59:02  jerome
# Integration du message de Log
#
#

import os
import string
import cgi
import begoconf
import photo
import afficheclefs

photo = photo.Photo("bas")
f = photo.getcurform()
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
        page.table(border = 5, cellpadding = 5, cellspacing = 5, bgcolor = begoconf.basform_bgcolorleft)
        page.tr()
        page.td()
        page.table(border = 0, cellpadding = 0, cellspacing = 0)

        page.push()
        page.tr()
        dico = afficheclefs.form_to_enreg(f)
        afficheclefs.display_zone(page, dico)
        nbcols = 1
        if f.has_key("roche"):
                afficheclefs.display_groupe(page, dico)
                afficheclefs.display_roche(page, dico)
                nbcols = 3
                if f.has_key("face") :
                        afficheclefs.display_face(page, dico)
                        nbcols = nbcols + 1

                if f.has_key("association") :
                        afficheclefs.display_association(page, dico)
                        nbcols = nbcols + 1

                elif f.has_key("figure") :
                        afficheclefs.display_figure(page, dico)
                        nbcols = nbcols + 1

                elif f.has_key("historique") :
                        afficheclefs.display_historique(page, dico)
                        nbcols = nbcols + 1

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
        begoconf.log_message("%s: Action [%s] inconnue" % (photo.getcurdoc().script_name(), f["action"].value))







