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

#################################
#        LISTE DEROULANTE
#################################
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

################################
        # AJOUTE_LIGNE
################################
def ajoute_ligne(objet, largeur, epaisseur, hauteur, nb) :
        objet.__doc__.push()
        objet.__doc__.tr()
        objet.__doc__.td(colspan = nb, height = hauteur)
        objet.__doc__.hr(width = largeur, size = epaisseur)
        objet.__doc__.pop()

def ajoute_ligne_vide(objet, hauteur, nb):
    objet.__doc__.push()
    objet.__doc__.tr()
    objet.__doc__.push()
    objet.__doc__.td(colspan = nb, height = hauteur)
    objet.__doc__.pop()
    objet.__doc__.pop()


################################
        # DISPLAY ZONE
################################

def display_zone(objet, enreg, penreg = None, alignement = "right") :
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="0")
    objet.__doc__.b()
    objet.__doc__.font(size=begoconf.font_size)
    objet.__doc__.insert_text("Zone : ")
    listezones = {}
    for i in range(0, 22) :
        listezones[i] = i
    if penreg and penreg.has_key("zone") :
        liste_deroulante(objet.__doc__, "zone", listezones, penreg, dontchange = 1)
    elif objet.__form__.has_key("action") and (objet.__form__["action"].value == "Chercher")  and objet.__form__.has_key("zone") and enreg == None:
        val = objet.__form__["zone"].value
        objet.__doc__.select(name = "zone") #crée l'objet liste deroulante
        objet.__doc__.option(val, value = val) #affiche la valeur dans la liste
    else :
        liste_deroulante(objet.__doc__, "zone", listezones, enreg, dontchange = 1)
    objet.__doc__.pop()


def display_groupe(objet, enreg, penreg = None, alignement = "right"):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="0")
    objet.__doc__.b()
    objet.__doc__.font(size=begoconf.font_size)
    objet.__doc__.insert_text("Groupe : ")
    listegroupes = {}
    for i in range(0, 11): # 10 groupes
        listegroupes[i] = i
    if penreg and penreg.has_key("groupe"):
        liste_deroulante(objet.__doc__, "groupe", listegroupes, penreg, dontchange = 1)
    elif objet.__form__.has_key("action") and (objet.__form__["action"].value == "Chercher")  and objet.__form__.has_key("groupe") and enreg == None:
        val = objet.__form__["groupe"].value
        objet.__doc__.select(name = "groupe") #crée l'objet liste deroulante
        objet.__doc__.option(val, value = val) #affiche la valeur dans la liste
    else:
        liste_deroulante(objet.__doc__, "groupe", listegroupes, enreg, dontchange = 1)
    objet.__doc__.pop()


def display_roche(objet, enreg, penreg = None, alignement = "right") :
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="0")
    objet.__doc__.b()
    objet.__doc__.font(size=begoconf.font_size)
    objet.__doc__.insert_text("Roche : ")
    if penreg and penreg.has_key("roche"):
        objet.__doc__.insert_text(penreg["roche"])
        objet.__doc__.hidden(name = "roche", value = penreg["roche"])
    elif enreg != None:
        objet.__doc__.insert_text(enreg["roche"])
        objet.__doc__.hidden(name = "roche", value = enreg["roche"])
    elif objet.__form__.has_key("action") and (objet.__form__["action"].value == "Chercher") and objet.__form__.has_key("roche") and enreg == None:
        val = objet.__form__["roche"].value
        objet.__doc__.insert_text(val)
        objet.__doc__.hidden(name = "roche", value = val)
    else:
        objet.__doc__.text(name = "roche", size = "10", maxlength = "10")
    objet.__doc__.pop()


def display_face(objet, enreg, penreg = None, alignement = "right") :
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="0")
    objet.__doc__.b()
    objet.__doc__.font(size=begoconf.font_size)
    objet.__doc__.insert_text("Face : ")
    listeface = {}
    for lettre in range(ord('a'), ord('z') + 1) :
        listeface[chr(lettre)] = chr(lettre)
    if penreg and penreg.has_key("face"):
        liste_deroulante(objet.__doc__, "face", listeface, penreg, dontchange = 1)
    elif objet.__form__.has_key("action") and (objet.__form__["action"].value == "Chercher") and objet.__form__.has_key("face") and enreg == None:
        val = objet.__form__["face"].value
        objet.__doc__.select(name = "face") #crée l'objet liste deroulante
        objet.__doc__.option(val, value = val) #affiche la valeur dans la liste
    else :
        liste_deroulante(objet.__doc__, "face", listeface, enreg, dontchange = 1)
    objet.__doc__.pop()


def display_face_2(objet, enreg, penreg = None, alignement = "right") :
    # utilisé dans les figures, on veut pouvoir changer le face
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="0")
    objet.__doc__.b()
    objet.__doc__.font(size=begoconf.font_size)
    objet.__doc__.insert_text("Face : ")
    listeface = {}
    for lettre in range(ord('a'), ord('z') + 1) :
        listeface[chr(lettre)] = chr(lettre)
    if penreg and penreg.has_key("face"):
        liste_deroulante(objet.__doc__, "face", listeface, penreg)
    elif objet.__form__.has_key("action") and (objet.__form__["action"].value == "Chercher") and objet.__form__.has_key("face") and enreg == None:
        val = objet.__form__["face"].value
        objet.__doc__.select(name = "face") #crée l'objet liste deroulante
        objet.__doc__.option(val, value = val) #affiche la valeur dans la liste
    else :
        liste_deroulante(objet.__doc__, "face", listeface, enreg)
    objet.__doc__.pop()


def display_association(doc, enreg, penreg = None, alignement = "right") :
        doc.push()
        doc.td(align=alignement, valign="middle")
        doc.b()
        doc.font(size=begoconf.font_size)
        doc.insert_text("Association : ")
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
        doc.insert_text("Figure : ")
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
