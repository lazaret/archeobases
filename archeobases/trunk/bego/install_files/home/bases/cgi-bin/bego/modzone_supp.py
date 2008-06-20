#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import begoconf
import afficheclefs


def liste_multiple_acces(doc, nom, valeurs):
    doc.push()
    doc.select_multiple(name=nom, size=10)
    for a in valeurs:
        doc.option(a["acces"], value=a["acces"])
    doc.pop()

def liste_acces(database, doc, form):
    (z) = recupere_champs(database, form)
    #
    where = "WHERE zone = %s" % (z)
    #
    # liste des figures faisant partie de l'association
    qassoc = "SELECT idacces FROM zone_acces " + where
    #
    # liste des figures n'en faisant pas partie
    # on pourrait aussi toutes les selectionner et faire le test par programme.
    qautres = "SELECT acces FROM acces WHERE  acces  NOT IN (" + qassoc
    #
    # on recupere les deux listes
    resacces = database.query(qassoc + ";").dictresult()
    resautres = database.query(qautres + ");").dictresult()
    doc.push()
    doc.form(method="POST", action=doc.script_name())
    doc.table(border=5, cellpadding=5, cellspacing=5, bgcolor=begoconf.basform_bgcolorleft)
    doc.tr()
    doc.td()
    doc.table(border=0, cellpadding=0, cellspacing=0)
    doc.push()
    doc.tr()
    dico = afficheclefs.form_to_enreg(form)
    afficheclefs.display_zone(doc, dico)
    doc.pop()
    doc.tr()
    doc.push()
    doc.td(align="center", valign="middle")
    doc.insert_text("Acces de la zone")
    doc.pop()
    doc.push()
    doc.td(align="center", valign="middle")
    liste_multiple_acces(doc, "accesautres", resautres)
    doc.pop()
    doc.push()
    doc.td(align="center", valign="middle")
    doc.submit(name="action", value="Ajouter -->")
    doc.br()
    doc.submit(name="action", value="<-- Enlever")
    doc.pop()
    doc.push()
    doc.td(align="center", valign="middle")
    liste_multiple_acces(doc, "zone_supp", ressup)
    doc.pop()
    doc.td(align="center", valign="middle")
    doc.insert_text("acces de la zone")
    doc.pop()

def menu_zone_sup(database, doc, form):
    doc.push()
    doc.tr()
    doc.td(bgcolor = begoconf.basform_bgcolormiddle, colspan="2")
    doc.font(size = begoconf.font_size)
    doc.div(align="center")
    liste_zone_acces(database, doc, form)
    doc.pop()

def recupere_champs(database, form):
    zone = database.quote(form["zone"].value, "decimal")
    return (zone)

def enlever_zone_acces(database, form, liste):
    (z) = recupere_champs(database, form)
    where = "WHERE zone = " + z
    query = "DELETE FROM zone_acces " + where + " AND ("
    for a in liste:
        query = query + "acces" = " + database.quote(a, "text") + " OR "
    query = query[:-4] + ");"
    return database.query(query)

def ajouter_zone_acces(database, form, liste) :
    (z) = recupere_champs(database, form)
    # on fait une transaction pour que si l'un des insert echoue on fasse comme si tous ont
    # echoué
    # je ne sais pas si c'est vraiment utile ou pas.
    query = "BEGIN TRANSACTION;\n"
    for a in liste :
        query = query + "INSERT INTO zone_acces (zone) VALUES (%s);\n" % (z, database.quote(a, "text"))
    query = query + "COMMIT TRANSACTION;"
    return database.query(query)

def recupere_liste_zone_acces(nomliste):
    liste = []
    if type(form[nomliste]) == type([]) : # plusieurs acces sélectionnés
        for fig in form[nomliste] :
            liste.append(a.value)
    else :
        liste.append(form[nomliste].value)
    return liste

doc = begoconf.Bas("Modification d'une zone", "Modification d'une zone")
db = begoconf.BegoDataBase(username="bego")
form = cgi.FieldStorage()
if form.has_key("action"):
    dico = {"action": "Chercher"}
    for champ in ["zone"]:
        dico[champ] = form[champ].value
    urlretour = urllib.urlencode(dico)
    if form["action"].value == "<-- Enlever":
        if form.has_key("zone_acces"):
            enlever_acces(db, form, recupere_liste_zone_acces("zone_acces"))
        else:
            begoconf.log_message("aucun acces a supprimer de la zone", level="info")
        doc.set_redirect(begoconf.script_location("modzone") + '?' + urlretour)
    elif form["action"].value == "Ajouter -->":
        if form.has_key("accesautres"):
            ajouter_figures(db, form, recupere_liste_zone_acces("accesautres"))
        else:
            begoconf.log_message("Aucune figure à Ajouter à l'Association", level="info")
        doc.set_redirect(begoconf.script_location("modzone") + '?' + urlretour)
    elif form["action"].value == "Modifier":
        menu_zone_supp(db, doc, form)
    else:
        begoconf.log_message("%s: Action %s non reconnue" % (doc.script_name(), form["action"].value), level = "info")
        doc.set_redirect(begoconf.script_location("modassociation") + '?' + urlretour)
else:
    begoconf.fatalerror_message("Aucune action à effectuer !")
doc.output()
