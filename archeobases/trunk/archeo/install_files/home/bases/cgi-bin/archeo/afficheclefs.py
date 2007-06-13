#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#archeo- (c) 1999      Jerome ALET <alet@unice.fr>
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
#
# Revision 1.19  2001/06/01 08:28:14  rachel
# petites modifs pour entre autres permettre de verouiler les champs de la clef. Le nouveau+1 fonctionne pour le carnet mais il pose pb pour les autres ecrans ou les champs ne sont pas memorise(essais faits sur faune)
#
# Revision 1.18  2001/05/29 22:11:01  jerome
# Correction de beaucoup de bugs que l'on n'avait pas pu decouvrir
# a cause du blocage sur le champ "numero"
#
# Revision 1.17  2001/05/29 15:22:48  rachel
# ajout de trois ecran :mesure des os, mesure des dent, microfaune
#
# Revision 1.16  2001/04/09 14:23:30  rachel
# tout doit fonctionner sauf le int(val) dans afficheclefs
#
# Revision 1.15  2001/04/05 15:27:43  rachel
# je sais ce que c'est tous ces fichiers
#
# Revision 1.14  2001/04/05 09:44:25  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.


import archeoconf
import archeodata
import sys
import string
import cgi
#cgi.test()
#
# Fonctions pour afficher les clefs toujours de la meme maniere
#

def form_to_enreg(form) :
        dic = {}
        if form.has_key("zone") :
                dic["zone"] = form["zone"].value
        if form.has_key("numero") :
                dic["numero"] = form["numero"].value
        if form.has_key("bis") :
                dic["bis"] = form["bis"].value
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
        if enreg != None and enreg.has_key(nomchamp) :
                return enreg[nomchamp] #or ""
        elif penreg != None and penreg.has_key(nomchamp) :
                return penreg[nomchamp] #or ""
        elif objet.__form__.has_key("action") and  ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Nouveau")or (objet.__form__["action"].value == "Nouvel")or (objet.__form__["action"].value == "Nouvelle")) :
                if objet.__form__.has_key(nomchamp)  :
                        if objet.__champs__[nomchamp].has_key("memory") and objet.__champs__[nomchamp]["memory"] :
                                return objet.__form__[nomchamp].value
        return "" # ??? fonction qui sert à rien ?

def champ_liste(objet, nom_champ, libelle, enreg, penreg, titre,dontchange = None) :
        if titre != "":
                objet.__doc__.tr(align = "right")
                objet.__doc__.push()
                objet.__doc__.td(align="left")
                objet.__doc__.u()
                objet.__doc__.font(titre, size=archeoconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()

        objet.__doc__.push()
        objet.__doc__.td(align="right")
        objet.__doc__.font(libelle, size=archeoconf.font_size)
        objet.__doc__.font(size=archeoconf.font_size)
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
                        objet.__doc__.font(titre, size=archeoconf.font_size)
                        objet.__doc__.pop()
                        #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="right", colspan = colonne)
        objet.__doc__.font(libelle, size=archeoconf.font_size)
        objet.__doc__.font(size=archeoconf.font_size)
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
        # CHAMP_SAISIE_typos
##################################################
def champ_saisie_typos(objet, nom_champ, libelle,longueur, maxlongueur, titre, enreg, penreg):
        if titre != "":
                objet.__doc__.tr(align="right")
                objet.__doc__.push()
                objet.__doc__.td(align="left", valign="middle")
                objet.__doc__.u()
                objet.__doc__.font(titre, size=archeoconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle", colspan=3)
        objet.__doc__.font(size=archeoconf.font_size)
        valeur = getval(objet, nom_champ, enreg, penreg)
        if valeur != None:
                objet.__doc__.text(name = nom_champ, value = valeur, size = longueur, maxlength = maxlongueur)
        #objet.__doc__.pop()

##################################################
        # CHAMP_SAISIE
##################################################
def champ_saisie(objet, nom_champ, libelle,longueur, maxlongueur, titre, enreg, penreg):
        if titre != "":
                objet.__doc__.tr(align="right")
                objet.__doc__.push()
                objet.__doc__.td(align="left", valign="middle")
                objet.__doc__.u()
                objet.__doc__.font(titre, size=archeoconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle")
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text(libelle)
        valeur = getval(objet, nom_champ, enreg, penreg)
        if valeur != None:
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
        objet.__doc__.font(size=archeoconf.font_size)
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
                objet.__doc__.font(titre, size=archeoconf.font_size)
                objet.__doc__.pop()
                #objet.__doc__.td()
        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle", colspan=colonne)
        objet.__doc__.font(size=archeoconf.font_size)
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
        objet.__doc__.td(align="left", colspan = nbcel)
        objet.__doc__.font(size=archeoconf.font_size)
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

################################
        # DISPLAY ZONE
################################
def display_zone(objet, enreg, penreg = None, inc = 0, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("Zone ")
        val = string.upper(getval(objet, "zone", enreg, penreg))
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
                        try :
                                objet.__doc__.text(name = "zone", value = val, size = 6, maxlength = 15)
                        except ValueError,msg :
                                # ne devrait pas se produire
                                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "zone", value = val, size = 6, maxlength = 30)
                elif val :
                        #objet.__doc__.insert_text(val)
                        objet.__doc__.text(name = "zone", value = val, size = 6, maxlength = 15)
                        #objet.__doc__.hidden(name = "zone", value = val)
                else :
                        objet.__doc__.text(name = "zone", size = "6",maxlength = "15")
        else :
                objet.__doc__.text(name = "zone", size = "6",maxlength="15")
        objet.__doc__.pop()



###################################
        # DISPLAY_XZONE
###################################
def display_xzone(objet, enreg, penreg = None, alignement = "right") :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", width="75")
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("Zone ")

        query = "SELECT *  FROM controle_zone ;"
        res = objet.__db__.query(query).dictresult()
        listezones ={}
        for ctrlzone in res:
                #if not ctrlzone["description"]:
                listezones[ctrlzone["zone"]] = ctrlzone["zone"]
                #else:
                #        listezones[ctrlzone["zone"] + " " + ctrlzone["description"]] = ctrlzone["zone"]
        if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")):
                liste_deroulante(objet, "zone", listezones, getval(objet, "zone", enreg, penreg), dontchange = 0)
        else:
                liste_deroulante(objet, "zone", listezones, getval(objet, "zone", enreg, penreg), dontchange = 1)
        objet.__doc__.pop()

###################################
        # DISPLAY NUMERO
###################################
def display_numero(objet, enreg, penreg = None, inc = 0, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("  Numéro ")
        val = getval(objet, "numero", enreg, penreg)
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle"):
                        if inc:
                                try :
                                        objet.__doc__.text(name = "numero", value = int(val) + 1, size = 6, maxlength = 15)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                        else:
                                try :
                                        objet.__doc__.text(name = "numero", value = int(val), size = 6, maxlength = 15)
                                except ValueError,msg :
                                        # ne devrait pas se produire
                                        archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "numero", value = val, size = 6, maxlength = 30)
                elif val :
                        objet.__doc__.insert_text(val)
                        objet.__doc__.hidden(name = "numero", value = val)
                else :
                        objet.__doc__.text(name = "numero", size = "6",maxlength = "30")
        else :
                objet.__doc__.text(name = "numero", size = "6",maxlength="30")
        objet.__doc__.pop()

###################################
        # DISPLAY NUMERO FAUNE
###################################
def display_numero_faune(objet, enreg, penreg = None, inc = 0, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", border="2", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("  Numéro ")
        val = getval(objet, "numero", enreg, penreg)
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
                        try :
                                objet.__doc__.text(name = "numero", value = int(val) + 1, size = 6, maxlength = 15)
                        except ValueError,msg :
                                # ne devrait pas se produire
                                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                #elif (objet.__form__["action"].value == "Chercher") or (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "numero", value = val, size = 6, maxlength = 15)
                elif val :
                        objet.__doc__.text(name = "numero", value = val, size = 6, maxlength = 15)
                        #objet.__doc__.insert_text(val)
                        objet.__doc__.hidden(name = "numero", value = val)
                else :
                        objet.__doc__.text(name = "numero", size = "6",maxlength = "15")
        else :
                objet.__doc__.text(name = "numero", size = "6",maxlength="15")
        objet.__doc__.pop()

########################################
        # DISPLAY BIS
########################################
def display_bis(objet, enreg, penreg = None, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("  Bis ")

        query = "SELECT *  FROM controle_bis ;"
        res = objet.__db__.query(query).dictresult()
        listebiss ={}
        for ctrlbis in res:
                #if not ctrlbis["description"]:
                listebiss[ctrlbis["bis"]] = ctrlbis["bis"]
                #else:
                #        listebiss[ctrlbis["bis"] + " " + ctrlbis["description"]] = ctrlbis["bis"]

        if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")): #or (objet.__form__["action"].value == "Chercher")) :
                liste_deroulante(objet, "bis", listebiss, getval(objet, "bis", enreg, penreg), dontchange = 0)
        else:
                liste_deroulante(objet, "bis", listebiss, getval(objet, "bis", enreg, penreg), dontchange = 1)
        objet.__doc__.pop()

###################################
        # DISPLAY_X_SERIE
###################################
def display_x_serie(objet, nom_champ, n, enreg, penreg = None, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text(" Série")
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
#####################################
        # DISPLAY_X_ORDRE
#####################################
def display_x_ordre(objet, nom_champ, imin, imax, enreg, penreg = None, alignement = "right", col=1, change=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
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
        objet.__doc__.font(size=archeoconf.font_size)
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
        objet.__doc__.font(size=archeoconf.font_size)
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

#=====================================
#         DISPLAY ENSEMBLE
#=====================================
def display_ensemble(objet, nom_champ, enreg, penreg = None, alignement = "right", col=1) :
        objet.__doc__.push()
        objet.__doc__.td(align=alignement, valign="middle", colspan=col)
        objet.__doc__.b()
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("  Ensemble ")

        query = "SELECT *  FROM controle_" + nom_champ + " ;"
        res= objet.__db__.query(query).dictresult()
        liste_ensembles ={}
        for ctrl_ensemble in res:
##                 if not ctrl_ensemble["description"]:
                liste_ensembles[ctrl_ensemble[nom_champ]] = ctrl_ensemble[nom_champ]
##                 else:
##                         liste_ensembles[ctrl_ensemble[nom_champ] + " " + ctrl_ensemble["description"]] = ctrl[nom_champ]


        if objet.__form__.has_key("action") and ((objet.__form__["action"].value == "Compter") or (objet.__form__["action"].value == "Nouveau") or (objet.__form__["action"].value == "Nouvel") or (objet.__form__["action"].value == "Nouvelle")or (objet.__form__["action"].value == "Chercher")) :
                liste_deroulante(objet, nom_champ, liste_ensembles, getval(objet, nom_champ, enreg, penreg), dontchange = 0)
        else:
                liste_deroulante(objet, nom_champ, liste_ensembles, getval(objet, nom_champ, enreg, penreg), dontchange = 1)
        objet.__doc__.pop()

#=========================================
#             DISPLAY ZABS
#=========================================
def display_zabs(objet, enreg, penreg = None, alignement = "right") :
        if ((objet.__form__["action"].value == "Créer") or (objet.__form__["action"].value == "modifier")) :
                update ="UPDATE CARNET SET zabsolu = zrelatif+zabsolu WHERE zone=" + objet.__db__.quote(enreg["zone"], "text") + " AND numero=" + objet.__db__.quote(enreg["numero"],"int") + " AND bis=" + objet.__db__.quote(enreg["bis"], "text") + ";"
                objet.__db__.query(update)

        objet.__doc__.push()
        objet.__doc__.td(align="right", valign="middle")
        objet.__doc__.font(size=archeoconf.font_size)
        objet.__doc__.insert_text("zabs: ")
        valeur = getval(objet, zabs, enreg, penreg)
        if valeur != None:
                objet.__doc__.text(name = z_abs, value = valeur, size = longueur, maxlength = maxlongueur)

        objet.__doc__.pop()


################################
        # DISPLAY TYPOS
################################
def display_f_typos1(objet, titre,longueur,nom_champ, enreg, penreg = None, inc = 0, alignement = "right", col=1) :
        val = string.upper(getval(objet, nom_champ, enreg, penreg))
        objet.__doc__.push()
        if objet.__form__.has_key("action"):
                if (objet.__form__["action"].value == "Nouveau" or objet.__form__["action"].value == "Nouvel" or objet.__form__["action"].value == "Nouvelle") and inc:
                        try :
                                objet.__doc__.text(name = "nom_champ", value = val, size = longueur, maxlength = 15)
                        except ValueError,msg :
                                # ne devrait pas se produire
                                archeoconf.fatalerror_message("Erreur sur incrémentation d'un numéro, valeur=%s, message=%s" % (repr(val), msg))
                elif (objet.__form__["action"].value == "Compter") :
                        objet.__doc__.text(name = "nom_champ", value = val, size = longueur, maxlength = 15)
                elif val :
                        objet.__doc__.text(name = "nom_champ", value = val, size = longueur, maxlength = 15)
                else :
                        objet.__doc__.text(name = "nom_champ", size = longueur,maxlength = "15")
        else :
                objet.__doc__.text(name = "nom_champ", size = longueur,maxlength="15")

        objet.__doc__.pop()





