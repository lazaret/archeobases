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
import string


#
# Fonctions pour afficher les clefs toujours de la meme maniere

def form_to_enreg(form):
    dic = {}
    if form.has_key("zone"):
        dic["zone"] = form["zone"].value
    if form.has_key("numero"):
        dic["numero"] = form["numero"].value
    if form.has_key("bis"):
        dic["bis"] = form["bis"].value
    return dic

#################################
#        LISTE DEROULANTE
#################################
def liste_deroulante(objet, nom_champs, liste_valeurs, val, dontchange=None, tri=1):
    objet.__doc__.push()
    objet.__doc__.select(name=nom_champs)
    l = liste_valeurs.keys()
    if val:
        if tri:
            l.sort()
        if dontchange:
            objet.__doc__.option_selected(val, value=val)
        else:
            # attention, ce push et ce pop sont obligatoires car sinon le
            # option encadre les autres options car le texte est vide (voir jahtml.py)
            objet.__doc__.push()
            objet.__doc__.option(" ", value=' ')
            objet.__doc__.pop()
            for p in l:
                if val == liste_valeurs[p]:
                    objet.__doc__.option_selected(p, value=liste_valeurs[p])
                else:
                    objet.__doc__.option(p, value=liste_valeurs[p])
    elif val == 0:
        if dontchange:
            objet.__doc__.option_selected(val, value=val)
        else:
            # attention, ce push et ce pop sont obligatoires car sinon le
            # option encadre les autres options car le texte est vide (voir jahtml.py)
            objet.__doc__.push()
            objet.__doc__.option(" ", value=' ')
            objet.__doc__.pop()
            for p in l:
                if val == liste_valeurs[p]:
                    objet.__doc__.option_selected(p, value=liste_valeurs[p])
                else:
                    objet.__doc__.option(p, value=liste_valeurs[p])
    else:
        if tri:
            l.sort()
        # attention, ce push et ce pop sont obligatoires car sinon le
        # option_selected encadre les autres options car le texte est vide (voir jahtml.py)
        objet.__doc__.push()
        objet.__doc__.option_selected("", value='')
        objet.__doc__.pop()
        for p in l:
            objet.__doc__.option(p, value=liste_valeurs[p])
    objet.__doc__.pop()

#################################
        # GETVAL
#################################
def getval(objet, nomchamp, enreg, penreg=None):
    if enreg != None and enreg.has_key(nomchamp):
        return enreg[nomchamp] #or ""
    elif penreg != None and penreg.has_key(nomchamp):
        return penreg[nomchamp] #or ""
    elif objet.__form__.has_key("action") and  ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Nouveau")or (objet.__form__["action"].value == "Nouvel")or (objet.__form__["action"].value == "Nouvelle")):
        if objet.__form__.has_key(nomchamp) :
            if objet.__champs__[nomchamp].has_key("memory") and objet.__champs__[nomchamp]["memory"]:
                return objet.__form__[nomchamp].value
    return "" # ??? fonction qui sert à rien ?

def champ_liste(objet, nom_champ, libelle, enreg, penreg, titre, dontchange=None):
    if titre != "":
        objet.__doc__.tr(align="right")
        objet.__doc__.push()
        objet.__doc__.td(align="left")
        objet.__doc__.u()
        objet.__doc__.font(titre, size=archeoconf.font_size)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right")
    objet.__doc__.font(libelle, size=archeoconf.font_size)
    objet.__doc__.font(size=archeoconf.font_size)
    query = "SELECT *  FROM controle_" + nom_champ + ";"
    res = objet.__db__.query(query).dictresult()
    liste = {}
    for ctrl in res:
        liste[ctrl[nom_champ]] = ctrl[nom_champ]
    liste_deroulante(objet, nom_champ, liste, getval(objet, nom_champ, enreg, penreg), dontchange=0)
    objet.__doc__.pop()

########################################
        # CHAMP_NLISTE
########################################
def champ_nliste(objet, nom_champ, libelle, enreg, penreg, titre, colonne, dontchange=None):
    if titre != "":
        objet.__doc__.tr(align="right")
        objet.__doc__.push()
        objet.__doc__.td(align="left")
        objet.__doc__.u()
        objet.__doc__.font(titre, size=archeoconf.font_size)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right", colspan=colonne)
    objet.__doc__.font(libelle, size=archeoconf.font_size)
    objet.__doc__.font(size=archeoconf.font_size)
    query = "SELECT *  FROM controle_" + nom_champ + ";"
    res = objet.__db__.query(query).dictresult()
    liste = {}
    for ctrl in res:
        liste[ctrl[nom_champ]] = ctrl[nom_champ]
    liste_deroulante(objet, nom_champ, liste, getval(objet, nom_champ, enreg, penreg), dontchange=0)
    objet.__doc__.pop()

##################################################
        # CHAMP_SIMPLE_SAISIE
##################################################
def champ_simple_saisie(objet, nom_champ, libelle, longueur, maxlongueur, enreg, penreg):
    objet.__doc__.push()
    valeur = getval(objet, nom_champ, enreg, penreg)
    if valeur != None:
        objet.__doc__.text(name=nom_champ, value=valeur, size=longueur, maxlength=maxlongueur)
    objet.__doc__.pop()

##################################################
        # CHAMP_SAISIE_typos
##################################################
def champ_saisie_typos(objet, nom_champ, libelle, longueur, maxlongueur, titre, enreg, penreg):
    if titre != "":
        objet.__doc__.tr(align="right")
        objet.__doc__.push()
        objet.__doc__.td(align="left", valign="middle")
        objet.__doc__.u()
        objet.__doc__.font(titre, size=archeoconf.font_size)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right", valign="middle", colspan=3)
    objet.__doc__.font(size=archeoconf.font_size)
    valeur = getval(objet, nom_champ, enreg, penreg)
    if valeur != None:
        objet.__doc__.text(name=nom_champ, value=valeur, size=longueur, maxlength=maxlongueur)

##################################################
        # CHAMP_SAISIE
##################################################
def champ_saisie(objet, nom_champ, libelle, longueur, maxlongueur, titre, enreg, penreg):
    if titre != "":
        objet.__doc__.tr(align="right")
        objet.__doc__.push()
        objet.__doc__.td(align="left", valign="middle")
        objet.__doc__.u()
        objet.__doc__.font(titre, size=archeoconf.font_size)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right", valign="middle")
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text(libelle)
    valeur = getval(objet, nom_champ, enreg, penreg)
    if valeur != None:
        objet.__doc__.text(name=nom_champ, value=valeur, size=longueur, maxlength=maxlongueur)
    else:
        objet.__doc__.text(name=nom_champ, value="", size=longueur, maxlength=maxlongueur)
    objet.__doc__.pop()

##############################
        # CHAMP_SAISIE_SIMPLE
##############################
def champ_saisie_simple(objet, nom_champ, longueur, maxlongueur, enreg, penreg):
    objet.__doc__.push()
    objet.__doc__.td(align="right", valign="middle")
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.text(name=nom_champ, value=getval(objet, nom_champ, enreg, penreg), size=longueur, maxlength=maxlongueur)
    objet.__doc__.pop()

###############################################
        # CHAMP_NSAISIE
###############################################
def champ_nsaisie(objet, nom_champ, libelle, longueur, maxlongueur, titre, colonne, enreg, penreg):
    if titre != "":
        objet.__doc__.tr(align="right")
        objet.__doc__.push()
        objet.__doc__.td(align="left", valign="middle")
        objet.__doc__.u()
        objet.__doc__.font(titre, size=archeoconf.font_size)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right", valign="middle", colspan=colonne)
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text(libelle)
    objet.__doc__.text(name=nom_champ, value=getval(objet, nom_champ, enreg, penreg), size=longueur, maxlength=maxlongueur)
    objet.__doc__.pop()

################################################
        # CHAMP_SAISIE_AREA
################################################
def champ_saisie_area(objet, nom_champ, libelle, nbligne, nbcol, nbcel, titre, enreg, penreg):
    objet.__doc__.push()
    if titre != "":
        objet.__doc__.tr(valign="middle")
        objet.__doc__.push()
        objet.__doc__.td()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.u()
        objet.__doc__.insert_text(titre)
        objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="right")
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text(libelle)
    objet.__doc__.pop()
    objet.__doc__.push()
    objet.__doc__.td(align="left", colspan=nbcel)
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.textarea(name=nom_champ, rows=nbligne, cols=nbcol, wrap="physical")
    objet.__doc__.insert_text(getval(objet, nom_champ, enreg, penreg))
    objet.__doc__.pop()
    objet.__doc__.pop()

################################
        # AJOUTE_LIGNE
################################
def ajoute_ligne(objet, largeur, epaisseur, hauteur, nb):
    objet.__doc__.push()
    objet.__doc__.tr()
    objet.__doc__.td(colspan=nb, height=hauteur)
    objet.__doc__.hr(width=largeur, size=epaisseur)
    objet.__doc__.pop()

################################
        # DISPLAY ZONE
################################
def display_zone(objet, enreg, penreg=None, inc=0, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("Zone ")
    val = string.upper(getval(objet, "zone", enreg, penreg))
    if objet.__form__.has_key("action"):
        if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
            try:
                objet.__doc__.text(name="zone", value=val, size=6, maxlength=15)
            except ValueError,msg:
                # ne devrait pas se produire
                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
        elif (objet.__form__["action"].value == "Compter"):
            objet.__doc__.text(name="zone", value=val, size=6, maxlength=30)
        elif val:
            objet.__doc__.text(name="zone", value=val, size=6, maxlength=15)
        else:
            objet.__doc__.text(name="zone", size="6", maxlength="15")
    else:
        objet.__doc__.text(name="zone", size="6", maxlength="15")
    objet.__doc__.pop()

###################################
        # DISPLAY_XZONE
###################################
def display_xzone(objet, enreg, penreg=None, alignement="right"):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", width="75")
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("Zone ")
    query = "SELECT *  FROM controle_zone ;"
    res = objet.__db__.query(query).dictresult()
    listezones = {}
    for ctrlzone in res:
        listezones[ctrlzone["zone"]] = ctrlzone["zone"]
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")):
        liste_deroulante(objet, "zone", listezones, getval(objet, "zone", enreg, penreg), dontchange=0)
    else:
        liste_deroulante(objet, "zone", listezones, getval(objet, "zone", enreg, penreg), dontchange=1)
    objet.__doc__.pop()

###################################
        # DISPLAY NUMERO
###################################
def display_numero(objet, enreg, penreg=None, inc=0, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Numéro ")
    val = getval(objet, "numero", enreg, penreg)
    if objet.__form__.has_key("action"):
        if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle"):
            if inc:
                try:
                    objet.__doc__.text(name="numero", value=int(val) + 1, size=6, maxlength=15)
                except ValueError,msg:
                    # ne devrait pas se produire
                    archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
            else:
                try:
                    objet.__doc__.text(name="numero", value=int(val), size=6, maxlength=15)
                except ValueError,msg:
                    # ne devrait pas se produire
                    archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
        elif (objet.__form__["action"].value == "Compter"):
            objet.__doc__.text(name="numero", value=val, size=6, maxlength=30)
        elif val:
            objet.__doc__.insert_text(val)
            objet.__doc__.hidden(name="numero", value=val)
        else:
            objet.__doc__.text(name="numero", size="6", maxlength="30")
    else:
        objet.__doc__.text(name="numero", size="6", maxlength="30")
    objet.__doc__.pop()

###################################
        # DISPLAY NUMERO FAUNE
###################################
def display_numero_faune(objet, enreg, penreg=None, inc=0, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Numéro ")
    val = getval(objet, "numero", enreg, penreg)
    if objet.__form__.has_key("action"):
        if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
            try:
                objet.__doc__.text(name="numero", value=int(val) + 1, size=6, maxlength=15)
            except ValueError,msg:
                # ne devrait pas se produire
                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
        elif (objet.__form__["action"].value == "Compter"):
            objet.__doc__.text(name="numero", value=val, size=6, maxlength=15)
        elif val:
            objet.__doc__.text(name="numero", value=val, size=6, maxlength=15)
            objet.__doc__.hidden(name="numero", value=val)
        else:
            objet.__doc__.text(name="numero", size="6", maxlength="15")
    else:
        objet.__doc__.text(name="numero", size="6", maxlength="15")
    objet.__doc__.pop()

########################################
        # DISPLAY BIS
########################################
def display_bis(objet, enreg, penreg=None, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Bis ")
    query = "SELECT *  FROM controle_bis ;"
    res = objet.__db__.query(query).dictresult()
    listebiss = {}
    for ctrlbis in res:
        listebiss[ctrlbis["bis"]] = ctrlbis["bis"]
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")):
        liste_deroulante(objet, "bis", listebiss, getval(objet, "bis", enreg, penreg), dontchange=0)
    else:
        liste_deroulante(objet, "bis", listebiss, getval(objet, "bis", enreg, penreg), dontchange=1)
    objet.__doc__.pop()

###################################
        # DISPLAY_X_SERIE
###################################
def display_x_serie(objet, nom_champ, n, enreg, penreg=None, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text(" Série")
    listeordres = {}
    for i in range(1, int(n)+1):
        listeordres.update({i: str(i)})
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouvel")):
        liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg) , dontchange=0)
    else:
        liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg), dontchange=1)
    objet.__doc__.pop()

#####################################
        # DISPLAY_X_ORDRE
#####################################
def display_x_ordre(objet, nom_champ, imin, imax, enreg, penreg=None, alignement="right", col=1, change=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Ordre ")
    listeordres = {}
    val = getval(objet, nom_champ, enreg, penreg)
    try:
        val = int(val)
    except ValueError:
        pass
    for i in range(imin, imax):
        listeordres[i] = i
    if objet.__form__.has_key("action"):
        if ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Chercher")):
            liste_deroulante(objet, nom_champ, listeordres, val, dontchange=change)
        elif (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle"):
            liste_deroulante(objet, nom_champ, listeordres,  val+1)
        else:
            liste_deroulante(objet, nom_champ, listeordres, val)
    else:
        liste_deroulante(objet, nom_champ, listeordres, val)
    objet.__doc__.pop()

#====================================
#           DISPLAY_X_RANG
#====================================
def display_x_rang(objet, nom_champ, n, enreg, penreg=None, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Rang ")
    listeordres = {}
    for i in range(1, int(n)+1):
        listeordres.update({i: str(i)})
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouvel")):
        liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg) , dontchange=0)
    else:
        liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg), dontchange=1)
    objet.__doc__.pop()

######################################
        # DISPLAY_TYPE
######################################
def display_type(objet, nom_champ, enreg, penreg=None, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Type ")
    query = "SELECT *  FROM controle_" + nom_champ + " ;"
    res = objet.__db__.query(query).dictresult()
    liste_types = {}
    for ctrl_type in res:
        liste_types[ctrl_type[nom_champ]] = ctrl_type[nom_champ]
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")or (objet.__form__["action"].value == "Chercher")):
        liste_deroulante(objet, nom_champ, liste_types, getval(objet, nom_champ, enreg, penreg), dontchange=0)
    else:
        liste_deroulante(objet, nom_champ, liste_types, getval(objet, nom_champ, enreg, penreg), dontchange=1)
    objet.__doc__.pop()

#=====================================
#         DISPLAY ENSEMBLE
#=====================================
def display_ensemble(objet, nom_champ, enreg, penreg=None, alignement="right", col=1):
    objet.__doc__.push()
    objet.__doc__.td(align=alignement, valign="middle", colspan=col)
    objet.__doc__.b()
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("  Ensemble ")
    query = "SELECT *  FROM controle_" + nom_champ + " ;"
    res = objet.__db__.query(query).dictresult()
    liste_ensembles = {}
    for ctrl_ensemble in res:
        liste_ensembles[ctrl_ensemble[nom_champ]] = ctrl_ensemble[nom_champ]
    if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")or (objet.__form__["action"].value == "Chercher")):
        liste_deroulante(objet, nom_champ, liste_ensembles, getval(objet, nom_champ, enreg, penreg), dontchange=0)
    else:
        liste_deroulante(objet, nom_champ, liste_ensembles, getval(objet, nom_champ, enreg, penreg), dontchange=1)
    objet.__doc__.pop()

#=========================================
#             DISPLAY ZABS
#=========================================
def display_zabs(objet, enreg, penreg=None, alignement="right"):
    if ((objet.__form__["action"].value == "Créer") or (objet.__form__["action"].value == "modifier")):
        update ="UPDATE CARNET SET zabsolu = zrelatif+zabsolu WHERE zone=" + objet.__db__.quote(enreg["zone"], "text") + " AND numero=" + objet.__db__.quote(enreg["numero"],"int") + " AND bis=" + objet.__db__.quote(enreg["bis"], "text") + ";"
        objet.__db__.query(update)
    objet.__doc__.push()
    objet.__doc__.td(align="right", valign="middle")
    objet.__doc__.font(size=archeoconf.font_size)
    objet.__doc__.insert_text("zabs: ")
    valeur = getval(objet, zabs, enreg, penreg)
    if valeur != None:
        objet.__doc__.text(name=z_abs, value=valeur, size=longueur, maxlength=maxlongueur)
    objet.__doc__.pop()

################################
        # DISPLAY TYPOS
################################
def display_f_typos1(objet, titre, longueur, nom_champ, enreg, penreg=None, inc=0, alignement="right", col=1):
    val = string.upper(getval(objet, nom_champ, enreg, penreg))
    objet.__doc__.push()
    if objet.__form__.has_key("action"):
        if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
            try:
                objet.__doc__.text(name="nom_champ", value=val, size=longueur, maxlength=15)
            except ValueError,msg:
                # ne devrait pas se produire
                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
        elif (objet.__form__["action"].value == "Compter"):
            objet.__doc__.text(name="nom_champ", value=val, size=longueur, maxlength=15)
        elif val:
            objet.__doc__.text(name="nom_champ", value=val, size=longueur, maxlength=15)
        else:
            objet.__doc__.text(name="nom_champ", size=longueur, maxlength="15")
    else:
        objet.__doc__.text(name="nom_champ", size=longueur, maxlength="15")
    objet.__doc__.pop()
