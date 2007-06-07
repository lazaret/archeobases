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
# $Id: afficheclefs.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: afficheclefs.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.5  2000/05/27 13:58:56  jerome
# Integration du message de Log
#
#

import begoconf

#
# Fonctions pour afficher les clefs toujours de la meme maniere
#
def form_to_enreg(form) :
        dic = {}
        if form.has_key("zone") :
                dic["zone"] = form["zone"].value
        if form.has_key("groupe") :
                dic["groupe"] = form["groupe"].value
        if form.has_key("roche") :
                dic["roche"] = form["roche"].value
        if form.has_key("face") :
                dic["face"] = form["face"].value
        if form.has_key("figure") :
                dic["figure"] = form["figure"].value
        if form.has_key("association") :
                dic["association"] = form["association"].value
        if form.has_key("historique") :
                dic["historique"] = form["historique"].value
        return dic

def liste_deroulante(doc, nom_champs, liste_valeurs, enreg, dontchange = None) :
        doc.push()
        doc.select(name = nom_champs)
        l = liste_valeurs.keys()
        l.sort()
        if enreg != None :
                if dontchange :
                        doc.option_selected(enreg[nom_champs], value = enreg[nom_champs])
                else :
                        # attention, ce push et ce pop sont obligatoires car sinon le
                        # option encadre les autres options car le texte est vide (voir jahtml.py)
                        doc.push()
                        doc.option("", value = '')
                        doc.pop()
                        for p in l :
                                if enreg[nom_champs] == liste_valeurs[p] :
                                        doc.option_selected(p, value = liste_valeurs[p])
                                else :
                                        doc.option(p, value = liste_valeurs[p])
        else :
                # attention, ce push et ce pop sont obligatoires car sinon le
                # option_selected encadre les autres options car le texte est vide (voir jahtml.py)
                doc.push()
                doc.option_selected("", value = '')
                doc.pop()
                for p in l :
                        doc.option(p, value = liste_valeurs[p])
        doc.pop()

def display_zone(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Zone: ")
        listezones = {}
        for i in range(0, 22) :
                listezones[i] = i
        if penreg and penreg.has_key("zone") :
                liste_deroulante(doc, "zone", listezones, penreg, dontchange = 1)
        else :
                liste_deroulante(doc, "zone", listezones, enreg, dontchange = 1)
        doc.pop()

def display_groupe(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle", border="2")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Groupe: ")
        listegroupes = {}
        for i in range(0, 11) :
                listegroupes[i] = i
        if penreg and penreg.has_key("groupe"):
                liste_deroulante(doc, "groupe", listegroupes, penreg, dontchange = 1)
        else :
                liste_deroulante(doc, "groupe", listegroupes, enreg, dontchange = 1)
        doc.pop()

def display_roche(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle", border="2")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Roche: ")
        if penreg and penreg.has_key("roche") :
                doc.insert_text(penreg["roche"])
                doc.hidden(name = "roche", value = penreg["roche"])
        elif enreg != None :
                doc.insert_text(enreg["roche"])
                doc.hidden(name = "roche", value = enreg["roche"])
        else :
                doc.text(name = "roche", size = "6", maxlength = "6")
        doc.pop()

def display_face(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle", border="2")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Face: ")
        listeface = {}
        for lettre in range(ord('a'), ord('z') + 1) :
                listeface[chr(lettre)] = chr(lettre)
        if penreg and penreg.has_key("face"):
                liste_deroulante(doc, "face", listeface, penreg, dontchange = 1)
        else :
                liste_deroulante(doc, "face", listeface, enreg, dontchange = 1)
        doc.pop()

def display_association(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Association: ")
        if enreg != None :
                doc.insert_text(enreg["association"])
                doc.hidden(name = "association", value = enreg["association"])
        else :
                doc.text(name = "association", size = "3", maxlength = "3")
        doc.pop()

def display_figure(doc, enreg, penreg = None, alignement = "center") :
        doc.push()
        doc.td(align=alignement, valign="middle")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Figure: ")
        if enreg != None :
                doc.insert_text(enreg["figure"])
                doc.hidden(name = "figure", value = enreg["figure"])
        else :
                doc.text(name = "figure", size = "8", maxlength = "8")
        doc.pop()

def display_historique(doc, enreg, penreg = None, alignement = "center") :
        doc.push()
        doc.td(align=alignement, valign="middle")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Historique: ")
        if enreg != None :
                doc.insert_text(enreg["historique"])
                doc.hidden(name = "historique", value = enreg["historique"])
        else :
                doc.text(name = "historique", size = "8", maxlength = "8")
        doc.pop()
