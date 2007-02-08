#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import collectionconf
import collectiondata
import sys
import string
import cgi
#import cgifuncs
import os


def getLanguagePreference() :
    """Returns the preferred language."""
    languages = os.environ.get("HTTP_ACCEPT_LANGUAGE", "")
    langs = [l.strip().split(';')[0] for l in languages.split(",")]
    return "%s_%s" % (langs[0], langs[0].upper())


def getCharsetPreference() :
    """Returns the preferred charset."""
    charsets = os.environ.get("HTTP_ACCEPT_CHARSET", "UTF-8")
    charsets = [l.strip().split(';')[0] for l in charsets.split(",")]
    return charsets[0]


#cgi.test()
#
# Fonctions pour afficher les clefs toujours de la meme maniere
#


def form_to_enreg(form) :
        dic = {}
        if form.has_key("identifiant") :
                dic["identifiant"] = form["identifiant"].value
        else:
                if form.has_key("identifiant_1"):
                        dic["identifiant_1"] = form["identifiant_1"].value
                if form.has_key("identifiant_2"):
                        dic["identifiant_2"] = form["identifiant_2"].value
        return dic


#################################
#        LISTE DEROULANTE
#################################
def liste_deroulante(objet, nom_champs, liste_valeurs, val, dontchange = None, tri = 1) :
        objet.__doc__.push()
        objet.__doc__.select(name = nom_champs)
        l = liste_valeurs.keys()
        if val :
                if tri:
                        l.sort()
                if dontchange :
                        objet.__doc__.option_selected(val, value = val)
                else :
                        # attention, ce push et ce pop sont obligatoires car sinon le
                        # option encadre les autres options car le texte est vide (voir jahtml.py)
                        objet.__doc__.push()
                        objet.__doc__.option(" ", value = ' ')
                        objet.__doc__.pop()
                        for p in l :
                                if val == liste_valeurs[p] :
                                        objet.__doc__.option_selected(p, value = liste_valeurs[p])
                                else :
                                        objet.__doc__.option(p, value = liste_valeurs[p])
        elif val == 0:
                if dontchange :
                        objet.__doc__.option_selected(val, value = val)
                else :
                        # attention, ce push et ce pop sont obligatoires car sinon le
                        # option encadre les autres options car le texte est vide (voir jahtml.py)
                        objet.__doc__.push()
                        objet.__doc__.option(" ", value = ' ')
                        objet.__doc__.pop()
                        for p in l :
                                if val == liste_valeurs[p] :
                                        objet.__doc__.option_selected(p, value = liste_valeurs[p])
                                else :
                                        objet.__doc__.option(p, value = liste_valeurs[p])
        else :
                if tri:
                        l.sort()
                # attention, ce push et ce pop sont obligatoires car sinon le
                # option_selected encadre les autres options car le texte est vide (voir jahtml.py)
                objet.__doc__.push()
                objet.__doc__.option_selected("", value = '')
                objet.__doc__.pop()
                for p in l :
                        objet.__doc__.option(p, value = liste_valeurs[p])
        objet.__doc__.pop()


#################################
        # GETVAL
#################################
def getval(objet, nomchamp, enreg, penreg = None) :
        car = getCharsetPreference()
        #print "Jeux caractere", car
        if enreg != None and enreg.has_key(nomchamp) :
                if enreg[nomchamp] != None:
                        return enreg[nomchamp]#.encode(car)
                else:
                        return enreg[nomchamp]

        elif penreg != None and penreg.has_key(nomchamp) :
                return penreg[nomchamp] #or ""
        elif objet.__form__.has_key("action") and  ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Nouveau")or (objet.__form__["action"].value == "Nouvel")or (objet.__form__["action"].value == "Nouvelle")) :
                if objet.__form__.has_key(nomchamp)  :
                        if objet.__champs__[nomchamp].has_key("memory") and objet.__champs__[nomchamp]["memory"] :
                                return objet.__form__[nomchamp].value
        return ""


#################################
        # CHAMP LISTE
#################################
def champ_liste(objet, nom_champ, libelle, enreg, penreg, titre,dontchange = None) :
        if titre != "":
                objet.__doc__.tr(align = "right")
                objet.__doc__.push()
                objet.__doc__.td(align="left")
                objet.__doc__.u()
                objet.__doc__.font(titre, size=collectionconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()

        objet.__doc__.push()
        objet.__doc__.td(align="left", width="40")
        objet.__doc__.font(libelle, size=collectionconf.font_size)
        objet.__doc__.pop()
        objet.__doc__.push()
        objet.__doc__.td(align="left")
        objet.__doc__.font(size=collectionconf.font_size)

        query = "SELECT *  FROM controle_" + nom_champ + ";"
        res = objet.__db__.query(query).dictresult()
        liste ={}
        for ctrl in res:
                #if (not ctrl["description"]) or (len(ctrl["description"]) >10):
                liste[ctrl[nom_champ]] = ctrl[nom_champ]
         #       else:
         #               liste[ctrl[nom_champ] + " " + ctrl["description"]]= ctrl[nom_champ]
        liste_deroulante(objet, nom_champ, liste, getval(objet, nom_champ, enreg, penreg), dontchange = 0)
        objet.__doc__.pop()


########################################
        # CHAMP_NLISTE
########################################
def champ_nliste(objet, nom_champ, libelle, enreg, penreg, titre, colonne, dontchange = None) :
        if titre != "":
                        objet.__doc__.tr(align = "right")
                        objet.__doc__.push()
                        objet.__doc__.td(align="left")
                        objet.__doc__.u()
                        objet.__doc__.font(titre, size=collectionconf.font_size)
                        objet.__doc__.pop()
                        #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="left", colspan = colonne)
        objet.__doc__.font(libelle, size=collectionconf.font_size)
        objet.__doc__.font(size=collectionconf.font_size)
        query = "SELECT *  FROM controle_" + nom_champ + ";"
        res = objet.__db__.query(query).dictresult()
        liste ={}
        for ctrl in res:
                #if (not ctrl["description"]) or (len(ctrl["description"])>10):
                liste[ctrl[nom_champ]] = ctrl[nom_champ]
        #        else:
        #                liste[ctrl[nom_champ] + " " + ctrl["description"]]= ctrl[nom_champ]
        liste_deroulante(objet, nom_champ, liste, getval(objet, nom_champ, enreg, penreg), dontchange = 0)
        objet.__doc__.pop()


##################################################
        # CHAMP_SIMPLE_SAISIE
##################################################
def champ_simple_saisie(objet, nom_champ, libelle,longueur, maxlongueur, enreg, penreg):
        objet.__doc__.push()
        valeur = getval(objet, nom_champ, enreg, penreg)
        if valeur != None:
                objet.__doc__.text(name = nom_champ, value = valeur, size = longueur, maxlength = maxlongueur)

        objet.__doc__.pop()


##################################################
        # CHAMP_SAISIE
##################################################
def champ_saisie(objet, nom_champ, libelle,longueur, maxlongueur, titre, enreg, penreg):
        car = getCharsetPreference()
        #print "Jeux caractere", car
        if titre != "":
                objet.__doc__.tr(align="right")
                objet.__doc__.push()
                objet.__doc__.td(align="left", valign="middle")
                objet.__doc__.u()
                objet.__doc__.font(titre, size=collectionconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="left", valign="middle", width="40")
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text(libelle)
        objet.__doc__.pop()
        objet.__doc__.push()
        objet.__doc__.td(align="left", valign="middle" )
        objet.__doc__.font(size=collectionconf.font_size)
        valeur = getval(objet, nom_champ, enreg, penreg)
        if valeur != None:
                try:
                        valeur = unicode(valeur,"UTF-8").encode(car)
                except:
                        valeur = valeur
                objet.__doc__.text(name = nom_champ, value = valeur, size = longueur, maxlength = maxlongueur)
        else:
                objet.__doc__.text(name = nom_champ, value = "", size = longueur, maxlength = maxlongueur)

        objet.__doc__.pop()


##############################
        # CHAMP_SAISIE_SIMPLE
##############################
def champ_saisie_simple(objet, nom_champ,longueur, maxlongueur, enreg, penreg):
        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle")
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.text(name = nom_champ, value = getval(objet, nom_champ, enreg, penreg), size = longueur, maxlength = maxlongueur)
        objet.__doc__.pop()


###############################################
        # CHAMP_NSAISIE
###############################################
def champ_nsaisie(objet, nom_champ, libelle,longueur, maxlongueur, titre, colonne, enreg, penreg):
        if titre != "":
                objet.__doc__.tr(align="right")
                objet.__doc__.push()
                objet.__doc__.td(align="left", valign="middle")#, colspan=colonne)
                objet.__doc__.u()
                objet.__doc__.font(titre, size=collectionconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle", colspan=colonne)
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text(libelle)

        objet.__doc__.text(name = nom_champ, value = getval(objet, nom_champ, enreg, penreg), size = longueur, maxlength = maxlongueur)
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
                objet.__doc__.font(size=collectionconf.font_size)
                objet.__doc__.u()
                objet.__doc__.insert_text(titre)
                objet.__doc__.pop()

        objet.__doc__.push()
        objet.__doc__.td(align="left", width="40")
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text(libelle)
        objet.__doc__.pop()

        objet.__doc__.push()
        objet.__doc__.td(align="left", colspan = nbcel)
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.textarea(name = nom_champ, rows=nbligne, cols=nbcol, wrap="physical")
        objet.__doc__.insert_text(getval(objet, nom_champ, enreg, penreg))
        objet.__doc__.pop()
        objet.__doc__.pop()


################################
        # AJOUTE_LIGNE
################################
def ajoute_ligne(objet, largeur, epaisseur, hauteur, nb) :
        objet.__doc__.push()
        objet.__doc__.tr()
        objet.__doc__.td(colspan = nb, height = hauteur)
        objet.__doc__.hr(width = largeur, size = epaisseur)
        objet.__doc__.pop()


###################################
        # DISPLAY IDENTIFIANT
###################################
def display_identifiant(objet, enreg, penreg = None, inc = 0, alignement = "left", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col, width="80")
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("  Identifiant  ")
        objet.__doc__.pop()

        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)

        val = getval(objet, "identifiant", enreg, penreg)
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle"):
                        if inc:
                                try :
                                        objet.__doc__.text(name = "identifiant", value = val, size = 20, maxlength = 40)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                        else:
                                try :
                                        objet.__doc__.text(name = "identifiant", value = val, size = 20, maxlength = 15)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "identifiant", value = val, size = 20, maxlength = 40)
                elif val :
                        objet.__doc__.insert_text(val)
                        objet.__doc__.hidden(name = "identifiant", value = val)
                else :
                        objet.__doc__.text(name = "identifiant", size = "20",maxlength = "40")
        else :
                objet.__doc__.text(name = "identifiant", size = "20",maxlength="40")
        objet.__doc__.pop()


###################################
        # DISPLAY IDENTIFIANT_1
###################################
def display_identifiant_1(objet, enreg, penreg = None, inc = 0, alignement = "left", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col, width="40")
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("Identifiant1")
        objet.__doc__.pop()

        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)

        val = getval(objet, "identifiant_1", enreg, penreg)
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle"):
                        if inc:
                                try :
                                        objet.__doc__.text(name = "identifiant_1", value = val, size = 20, maxlength = 40)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                        else:
                                try :
                                        objet.__doc__.text(name = "identifiant_1", value = val, size = 20, maxlength = 15)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "identifiant_1", value = val, size = 20, maxlength = 40)
                elif val :
                        objet.__doc__.insert_text(val)
                        objet.__doc__.hidden(name = "identifiant_1", value = val)
                else :
                        objet.__doc__.text(name = "identifiant_1", size = "20",maxlength = "40")
        else :
                objet.__doc__.text(name = "identifiant_1", size = "20",maxlength="40")
        objet.__doc__.pop()


###################################
        # DISPLAY IDENTIFIANT_2
###################################
def display_identifiant_2(objet, enreg, penreg = None, inc = 0, alignement = "left", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col, width="40")
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("Identifiant2")
        objet.__doc__.pop()

        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)

        val = getval(objet, "identifiant_2", enreg, penreg)
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle"):
                        if inc:
                                try :
                                        objet.__doc__.text(name = "identifiant_2", value = val, size = 20, maxlength = 40)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                        else:
                                try :
                                        objet.__doc__.text(name = "identifiant_2", value = val, size = 20, maxlength = 15)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        collectionconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "identifiant_2", value = val, size = 20, maxlength = 40)
                elif val :
                        objet.__doc__.insert_text(val)
                        objet.__doc__.hidden(name = "identifiant_2", value = val)
                else :
                        objet.__doc__.text(name = "identifiant_2", size = "20",maxlength = "40")
        else :
                objet.__doc__.text(name = "identifiant_2", size = "20",maxlength="40")
        objet.__doc__.pop()


#####################################
        # DISPLAY_X_ORDRE
#####################################
def display_x_ordre(objet, nom_champ, imin, imax, enreg, penreg = None, alignement = "left", col=1, change=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("  Ordre ")
        listeordres = {}
        val = getval(objet, nom_champ, enreg, penreg)
        try :
            val = int(val)
        except ValueError :
            pass

        #indice=1
        #if not val:
        #        val=0
        for i in range(imin, imax) :
                listeordres[i] = i

        #for i in range(imin, imax):
         #       tmp= listeordres[i]
          #      listeordres[i] = listeordres[imax -i]
           #     listeordres[imax -i] = tmp

        if objet.__form__.has_key("action"):
                if ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Chercher")):
                        liste_deroulante(objet, nom_champ, listeordres, val, dontchange = change)
                elif (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle"):
                        #for i in range(imin, imax):
                        #        if val == listeordres[i]:
                        #                indice = i + 1
                        #liste_deroulante(objet, nom_champ, listeordres,  listeordres[indice]) #ajouter+1
                        liste_deroulante(objet, nom_champ, listeordres,  val+1) #ajouter+1
                else :
                        liste_deroulante(objet, nom_champ, listeordres, val )
        else:
                liste_deroulante(objet, nom_champ, listeordres, val )
        objet.__doc__.pop()


#====================================
#           DISPLAY_X_RANG
#====================================
def display_x_rang(objet, nom_champ, n, enreg, penreg = None, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("  Rang ")
        #listeordres = {"1":"1","2":"2","3":"3","4":"4","5":"5","6":"6","7":"7","8":"8","9":"9","10":"10","11":"11","12":"12","13":"13","14":"14","15":"15","16":"16","17":"17","18":"18","19":"19","20":"20","21":"21","22":"22","23":"23","24":"24","25":"25","26":"26","27":"27","28":"28","29":"29","30":"30"}
        #listeordres = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
        listeordres = {}
        for i in range(1, int(n)+1) :
                listeordres.update({i : str(i)})
        if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouvel")) :
                liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg) , dontchange = 0)
        else:
                liste_deroulante(objet, nom_champ, listeordres, getval(objet, nom_champ, enreg, penreg), dontchange = 1)
        objet.__doc__.pop()


######################################
        # DISPLAY_TYPE
######################################
def display_type(objet, nom_champ, enreg, penreg = None, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=collectionconf.font_size)
        objet.__doc__.insert_text("  Type ")

        query = "SELECT *  FROM controle_" + nom_champ + " ;"
        res = objet.__db__.query(query).dictresult()
        liste_types ={}
        for ctrl_type in res:
##                 if not ctrl_type["description"]:
                liste_types[ctrl_type[nom_champ]] = ctrl_type[nom_champ]
##                 else:
##                         liste_types[ctrl_type[nom_champ] + " " + ctrl_type["description"]] = ctrl[nom_champ]


        if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")or (objet.__form__["action"].value == "Chercher")) :
                liste_deroulante(objet, nom_champ, liste_types, getval(objet, nom_champ, enreg, penreg), dontchange = 0)
        else:
                liste_deroulante(objet, nom_champ, liste_types, getval(objet, nom_champ, enreg, penreg), dontchange = 1)
        objet.__doc__.pop()


