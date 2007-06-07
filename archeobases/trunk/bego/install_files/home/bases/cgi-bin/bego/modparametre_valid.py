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
# $Id: modparametre_valid.py,v 1.1.1.1 2000/11/06 08:33:18 jerome Exp $
#
# $Log: modparametre_valid.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:18  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.6  2000/05/27 13:59:01  jerome
# Integration du message de Log
#

import os
import cgi
import urllib
import begoconf
import afficheclefs
import begodata

def liste_multiple(doc, nom, valeurs, param) :
        doc.push()
        doc.select_multiple(name = nom, size = 4 )
        for a in valeurs :
                doc.option(a[param], value = a[param])
        doc.pop()

def enlever(database, form, liste, param) :
        query = "DELETE FROM " + param + " WHERE "
        for a in liste :
                id = "(SELECT id" + param + " FROM " + param + "  WHERE " + param + "= %s)" %(database.quote(a,"text"))
                query = query + param + " = %s OR " % (database.quote(a,"text"))
        query = query[:-4] + ";"
        return database.query(query)

def recupere_liste(nomliste) :
        liste = []
        if type(form[nomliste]) == type([]) : # plusieurs acces sélectionnés
                for a in form[nomliste] :
                        liste.append(a.value)
        else :
                liste.append(form[nomliste].value)
        return liste

def recupere_id(database, form, ac, param) :
        query = "SELECT id" + param + " FROM " + param + " WHERE " + param + "=%s" %(database.quote(ac,"text"))
        return (database.query(query).dictresult()[0]["id" + param])

def ajouter(database, form, param) :
        #idparam = doc.get_nextval()
        query   = "INSERT INTO " + param + " (" + param + ") VALUES ('" + form["modif"].value + "');"
        return database.query(query)

def recupere_liste(nomliste) :
        liste = []
        if type(form[nomliste]) == type([]) : # plusieurs acces sélectionnés
                for a in form[nomliste] :
                        liste.append(a.value)
        else :
                liste.append(form[nomliste].value)
        return liste

doc = begoconf.Bas("Modification des paramètres", "Modification d'une zone")
db = begoconf.BegoDataBase(username = "bego")
form = cgi.FieldStorage()

if form.has_key("param") :
        param = form["param"].value
else :
        param = None

if form["action"].value == "ENLEVER" :
        if param and form.has_key(param):
                enlever(db, form, recupere_liste(param), param)
        else :
                begoconf.log_message("aucun " + param + " a supprimer ", level = "info")
        doc.set_redirect(begoconf.script_location("parametre"))
elif form["action"].value == "AJOUTER" :
        if form.has_key("modif") :
                if param :
                        ajouter(db, form, param)
                doc.set_redirect(begoconf.script_location("parametre"))
        else :
                begoconf.log_message("Rien a rajouter", level = "info")
                doc.set_redirect(begoconf.script_location("parametre"))
else :
        begoconf.fatalerror_message("Aucune action  effectuer !")

doc.output()
