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


def liste_multiple_figures(doc, nom, valeurs):
    doc.push()
    doc.select_multiple(name=nom, size=10)
    for fig in valeurs:
        doc.option(fig["figure"], value=fig["figure"])
    doc.pop()

def liste_figures(database, doc, form):
    (z, g, r, f, a) = recupere_champs(database, form)
    #
    where = "WHERE zone = %s AND groupe = %s AND roche = %s AND face = %s" % (z, g, r, f)
    # liste des figures faisant partie de l'association
    q = "SELECT figure FROM figassoc " + where + " AND association = %s " % a
    qassoc = q + "ORDER BY ordre"
    # liste des figures n'en faisant pas partie
    # on pourrait aussi toutes les selectionner et faire le test par programme.
    qautres = "SELECT figure FROM figure " + where + " and figure NOT IN (" + q
    # on recupere les deux listes
    resassoc = database.query(qassoc + ";").dictresult()
    resautres = database.query(qautres + ");").dictresult()
    doc.form(method="POST", action=doc.script_name())
    doc.push()
    doc.table(border=5, cellpadding=5, cellspacing=5, bgcolor=begoconf.basform_bgcolorleft)
    doc.tr()
    doc.push()
    doc.td(colspan=3, align="center", valign="center")
    doc.table(border=0, cellpadding=5, cellspacing=5)
    doc.tr()
    doc.td()
    dico = afficheclefs.form_to_enreg(form)
    afficheclefs.display_zone(doc, dico)
    afficheclefs.display_groupe(doc, dico)
    afficheclefs.display_roche(doc, dico)
    afficheclefs.display_face(doc, dico)
    afficheclefs.display_association(doc, dico)
    doc.pop()
    doc.push()
    doc.tr()
    doc.td(valign="center", align="center", colspan=3 )
    doc.submit(name="action",  value="Fin Modif")
    doc.pop()
    doc.tr()
    doc.push()
    doc.td(align="center", valign="middle")
    doc.insert_text("Figures hors de l'association")
    doc.br()
    liste_multiple_figures(doc, "figautres", resautres)
    doc.pop()
    doc.push()
    doc.td(align="center", valign="middle")
    doc.submit(name="action", value="Ajouter -->")
    doc.br()
    doc.submit(name="action", value="<-- Enlever")
    doc.br()
    doc.submit(name="action", value="Monter")
    doc.br()
    doc.submit(name="action", value="Descendre")
    doc.pop()
    doc.push()
    doc.td(align="center", valign="middle")
    doc.insert_text("Figures de l'association")
    doc.br()
    liste_multiple_figures(doc, "figassoc", resassoc)
    doc.pop()

def menu_figassoc(database, doc, form):
    doc.push()
    doc.tr()
    doc.td(bgcolor=begoconf.basform_bgcolormiddle, colspan="2")
    doc.font(size=begoconf.font_size)
    doc.div(align="center")
    liste_figures(database, doc, form)
    doc.pop()

def recupere_champs(database, form):
    zone   = database.quote(form["zone"].value, "decimal")
    groupe = database.quote(form["groupe"].value, "decimal")
    roche  = database.quote(form["roche"].value, "text")
    face   = database.quote(form["face"].value, "text")
    association = database.quote(form["association"].value, "decimal")
    return (zone, groupe, roche, face, association)

def enlever_figures(database, form, liste):
    (z, g, r, f, a) = recupere_champs(database, form)
    where = "WHERE zone = " + z + " AND groupe = " + g + " AND roche = " + r + " AND face = " + f + " AND association = " + a
    query = "BEGIN TRANSACTION;\n"
    for fig in liste :
        ordre_fig = ordre_figure(database, z, g, r, f, fig, a)
        query = query + "DELETE FROM figassoc " + where + " AND  figure = " + database.quote(fig, "text") + " ;\n"
        query = query + "UPDATE figassoc SET ordre=(ordre - 1) " + where + " AND ordre > " + database.quote(ordre_fig, "decimal") + ";\n"
    query = query + "COMMIT TRANSACTION;"
    return database.query(query)

def max_ordre(database):
    (z, g, r, f, a) = recupere_champs(database, form)
    where = "WHERE zone = " + z + " AND groupe = " + g + " AND roche = " + r + " AND face = " + f + " AND association = " + a
    maximum = database.query("SELECT MAX(ordre) FROM figassoc " + where + ";")
    return maximum.dictresult()[0]["max"]

def ajouter_figures(database, form, liste):
    (z, g, r, f, a) = recupere_champs(database, form)
    # on fait une transaction pour que si l'un des insert echoue on fasse comme si tous ont
    # echoué
    # je ne sais pas si c'est vraiment utile ou pas.
    query = "BEGIN TRANSACTION;\n"
    no_ordre = max_ordre(database)
    for fig in liste:
        no_ordre = no_ordre + 1
        query    = query + "INSERT INTO figassoc (zone, groupe, roche, face, association, figure, ordre) VALUES (%s, %s, %s, %s, %s, %s, %s);\n" % (z, g, r, f, a, database.quote(fig, "text"), database.quote(no_ordre, "decimal"))
    query = query + "COMMIT TRANSACTION;"
    return database.query(query)

def ordre_figure(database, z, g, r, f,fg, a):
    ordre = database.query("SELECT ordre FROM figassoc WHERE zone=%s AND groupe=%s AND roche=%s AND face=%s AND figure=%s and association=%s; \n" %(z,g,r,f,database.quote(fg, "text"),a))
    return ordre.dictresult()[0]["ordre"]

def monter_figures(database, form, liste):
    (z, g, r, f, a) = recupere_champs(database, form)
    # on fait une transaction pour que si l'un des insert echoue on fasse comme si tous ont
    # echoué
    # je ne sais pas si c'est vraiment utile ou pas.
    query = "BEGIN TRANSACTION;\n"
    for fig in liste:
        ordre_courant   = ordre_figure(database,z,g,r,f,fig,a)
        ordre_precedant = ordre_courant - 1
        if ordre_courant > 1 :
            #ordre_precedant
            query = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND ordre=%s ;\n"  % (database.quote(999999,"decimal"),z, g, r, f, a, database.quote(ordre_precedant, "decimal"))
            query    = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND figure=%s ;\n" % (database.quote(ordre_precedant,"decimal"),z, g, r, f, a, database.quote(fig, "text"))
            query = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND ordre=%s; \n" % (database.quote(ordre_courant,"decimal"),z,g,r,f,a,database.quote(999999,"decimal"))
        else:
            break
    query = query + "COMMIT TRANSACTION;"
    return database.query(query)


def descendre_figures(database, form, liste):
    (z, g, r, f, a) = recupere_champs(database, form)
    # on fait une transaction pour que si l'un des insert echoue on fasse comme si tous ont
    # echoué
    # je ne sais pas si c'est vraiment utile ou pas.
    query = "BEGIN TRANSACTION;\n"
    liste.reverse()
    for fig in liste :
            ordre_courant   = ordre_figure(database,z,g,r,f,fig,a)
            ordre_suivant = ordre_courant + 1
            if ordre_courant < max_ordre(database):
                #ordre_precedant
                query = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND ordre=%s ;\n"  % (database.quote(999999,"decimal"),z, g, r, f, a, database.quote(ordre_suivant, "decimal"))
                query = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND figure=%s ;\n" % (database.quote(ordre_suivant,"decimal"),z, g, r, f, a, database.quote(fig, "text"))
                query = query + " UPDATE figassoc SET ordre=%s WHERE zone=%s AND  groupe=%s AND  roche=%s AND face=%s AND  association=%s AND ordre=%s; \n" % (database.quote(ordre_courant,"decimal"),z,g,r,f,a,database.quote(999999,"decimal"))
            else:
                break
    query = query + "COMMIT TRANSACTION;"
    return database.query(query)


def recupere_liste_figures(nomliste):
    liste = []
    if type(form[nomliste]) == type([]) : # plusieurs figures sélectionnées
        for fig in form[nomliste]:
            liste.append(fig.value)
    else:
        liste.append(form[nomliste].value)
    return liste

doc = begoconf.Bas("Modification d'une Association", "Modification d'une Association")
db = begoconf.BegoDataBase(username="bego")
form = cgi.FieldStorage()
if form.has_key("action"):
    dico = {"action": "Modifier"}
    for champ in ["zone", "groupe", "roche", "face", "association"]:
        dico[champ] = form[champ].value
    urlretour = urllib.urlencode(dico)
    if form["action"].value == "<-- Enlever":
        if form.has_key("figassoc"):
            enlever_figures(db, form, recupere_liste_figures("figassoc"))
        else:
            begoconf.log_message("Aucune figure à Supprimer de l'Association", level="info")
        doc.set_redirect(begoconf.script_location("modfigassoc") + '?' + urlretour)
    elif form["action"].value == "Ajouter -->":
        if form.has_key("figautres"):
            ajouter_figures(db, form, recupere_liste_figures("figautres"))
        else :
            begoconf.log_message("Aucune figure à ajouter à l'association", level="info")
        doc.set_redirect(begoconf.script_location("modfigassoc") + '?' + urlretour)
    elif form["action"].value == "Monter":
        if form.has_key("figassoc")
            monter_figures(db, form, recupere_liste_figures("figassoc"))
        else:
            begoconf.log_message("Aucune figure à Monter dans l'Association", level="info")
        doc.set_redirect(begoconf.script_location("modfigassoc") + '?' + urlretour)
    elif form["action"].value == "Descendre":
        if form.has_key("figassoc"):
            descendre_figures(db, form, recupere_liste_figures("figassoc"))
        else:
            begoconf.log_message("Aucune figure à Descnedre dans l'Association", level="info")
        doc.set_redirect(begoconf.script_location("modfigassoc") + '?' + urlretour)
    elif form["action"].value == "Modifier":
        menu_figassoc(db, doc, form)
    elif form["action"].value == "Fin Modif":
        doc.set_redirect(begoconf.script_location("modassociation") + '?' + urlretour)
    else:
        begoconf.log_message("%s: Action %s non reconnue" % (doc.script_name(), form["action"].value), level="info")
        doc.set_redirect(begoconf.script_location("modassociation") + '?' + urlretour)
else:
    begoconf.fatalerror_message("Aucune action à effectuer !")
doc.output()
