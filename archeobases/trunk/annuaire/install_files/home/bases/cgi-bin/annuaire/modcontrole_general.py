#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Annuaire - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import cgi
import urllib
import annuaireconf


def enlever(database, form, liste, param):
    query = "DELETE FROM controle_" + param + " WHERE "
    for a in liste:
        query = query + param + " = %s OR " % (database.quote(a,"text"))
    query = query[:-4] + ";"
    return database.query(query)

def recupere_liste(nomliste):
    liste = []
    if type(form[nomliste]) == type([]) : # plusieurs options sélectionnées
        for a in form[nomliste]:
            liste.append(a.value)
    else:
        liste.append(form[nomliste].value)
    return liste

def ajouter(database, form, param):
    modif_param = database.quote(form["modif_param"].value, "text")
    modif_description = database.quote(form["modif_description"].value, "text")
    query = "INSERT INTO controle_" + param + " (" + param + ",description) VALUES (" + modif_param + "," + modif_description + ");"
    return database.query(query)

def ajouter_param(database, form, param):
    modif_param = database.quote(form["modif_param"].value, "text")
    query = "INSERT INTO controle_" + param + " (" + param + ") VALUES (" + modif_param + ");"
    return database.query(query)

doc = annuaireconf.Bas("Modification des paramètres", "Modification d'une zone")
db = annuaireconf.AnnuaireDataBase()
form = cgi.FieldStorage()

if form.has_key("param"):
    param = form["param"].value
else:
    modif_param = None
if form["action"].value == "ENLEVER":
    if param and form.has_key(param):
        enlever(db, form, recupere_liste(param), param)
    else:
        annuaireconf.log_message("aucun " + param + " a supprimer ", level="info")
    dico = {"champ": param}
    doc.set_redirect(annuaireconf.script_location("controle_general") + "?" + urllib.urlencode(dico))
elif form["action"].value == "AJOUTER":
    if form.has_key("modif_param"):
        if param:
            if form.has_key("modif_description"):
                ajouter(db, form, param)
            else:
                ajouter_param(db, form, param)
        dico = {"champ": param}
        doc.set_redirect(annuaireconf.script_location("controle_general") + "?" + urllib.urlencode(dico))
        annuaireconf.log_message("Rien a rajouter", level = "info")
    else:
        annuaireconf.log_message("Rien a rajouter", level="info")
        dico = {"champ": param}
        doc.set_redirect(annuaireconf.script_location("controle_general") + "?" + urllib.
urlencode(dico))
else:
    annuaireconf.fatalerror_message("Aucune action à effectuer !")
doc.output()



