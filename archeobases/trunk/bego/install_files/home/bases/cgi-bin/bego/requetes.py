#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import sys
import time
import string
import cgi
import urllib
import csv
try :
        import threading
        havethreads = 1
except :
        havethreads = 0
import begoconf
import jahtml


elabore = "Elaboré"
simplifie = "Simplifié"
telechargecsv = "Texte format CSV"
liste_affichage = [ simplifie, elabore, telechargecsv ]
affichage_default = elabore


def cherche_requete(db, nom) :
        resultat = db.query("SELECT * FROM requete WHERE nomrequete = " + db.quote(nom, "text"))
        resultat = resultat.dictresult()
        if len(resultat) == 1 :
                return resultat[0]

def display_field(doc, form, pkeys, champ, lgmax, enreg) :
        link = None
        if champ in pkeys :
                if (champ == "coderequete") :
                        dico = { "requete" : enreg["coderequete"], "presentation" : form["presentation"].value, "lue" : 1 }
                        if enreg.has_key("nomrequete") :
                                dico["nomrequete"] = enreg["nomrequete"]
                        link = doc.script_name() + '?' + urllib.urlencode(dico)
                elif champ != "nomrequete" :
                        dico = { "action" : "Chercher" }
                        for nom_champ in pkeys :
                                dico[nom_champ] = enreg[nom_champ]
                                if nom_champ == champ :
                                        break
                        if (champ == "secteur") :
                                table = "zone"
                        elif (champ == "groupe") :
                                table = "roche"
                        else :
                                table = champ
                        link = begoconf.script_location("mod" + table) + '?' + urllib.urlencode(dico)

        value = enreg[champ]
        if type(value) == type("") :
                if value != "" :
                        if form["presentation"].value != simplifie :
                                doc.push()
                                doc.td(bgcolor="#FFFFCC")
                                if link :
                                        doc.a(value, href = link)
                                else :
                                        doc.insert_text(value)
                                doc.pop()
                        else :
                                lg = len(value)
                                doc.insert_text(value + "&nbsp;" * (lgmax - lg + 1))
                else :
                        if form["presentation"].value != simplifie :
                                doc.td("&nbsp;", bgcolor="#FFFFCC")
                        else :
                                doc.insert_text("&nbsp;" * (lgmax + 1))
        else :
                if form["presentation"].value != simplifie :
                        doc.push()
                        doc.td(align="right", bgcolor="#FFFFCC")
                        if link :
                                doc.a(`value`, href = link)
                        else :
                                doc.insert_text(`value`)
                        doc.pop()
                else :
                        value = `value`
                        lg = len(value)
                        doc.insert_text(value + "&nbsp;" * (lgmax - lg + 1))

class PageRequete(begoconf.Bas) :
        def ecran_requetes(self, coulfond, coultete, coulhaut, coulpartie, coulmenu, requete = "") :
                self.center()
                self.push()
                self.table(border = 1, cellpadding = 0, cellspacing =5)
                self.push()
                self.tr( bgcolor = coultete )
                self.th("Saisissez votre requête")
                self.pop()
                self.tr(bgcolor = coultete)
                self.td(align="center")
                self.form(method = "POST", action = self.script_name())

                self.push()
                self.textarea(name = "requete", rows = "10", cols = "70", wrap = "physical")
                if requete != "" :
                        self.insert_text( requete)
                self.pop()
                self.br()
                self.insert_text("Nom de la requete:")
                if form.has_key("nomrequete") :
                        self.text(name = "nomrequete", value = form["nomrequete"].value, size=50, maxlength=50)
                else :
                        self.text(name = "nomrequete", value = "", size=50, maxlength=50)
                self.br()
                self.table(border = 0, cellpadding = 0, cellspacing = 5)
                self.tr()
                self.push()
                self.td()
                self.insert_text("Affichage:")
                self.push()
                self.select(name = "presentation")
                if form.has_key("presentation") :
                        for a in liste_affichage :
                                if form.has_key("presentation") and (form["presentation"].value == a) :
                                        self.option_selected(a, value = a)
                                else :
                                        self.option(a, value = a)
                else :
                        self.option_selected(affichage_default, value = affichage_default)
                        for a in liste_affichage :
                                if a != affichage_default :
                                        self.option(a, value = a)
                self.pop()

                self.submit(name = "action", value = "ENVOYER")
                self.reset(value = "ANNULER")
                self.pop()
                dico = { "requete" : "SELECT nomrequete,coderequete FROM requete ORDER BY nomrequete ASC;", "presentation" : elabore }
                self.td(align = "center", valign = "middle")
                self.a("Liste des Requêtes", href = self.script_name() + '?' + urllib.urlencode(dico))
                self.br()
                self.a("Aide", href = begoconf.help_location, target = "top")
                self.pop()

        def output(self, file = "-") :
                global master
                global endpart

                self.pop()
                begoconf.copyright(self)
                if master :
                        doc.insert_text("\n--" + endpart + "--\n")
                jahtml.CGI_document.output(self, file)


def mixed_part_handler(parent, indicateur, timer) :
        global endpart
        global heure_debut
        global master
        global premier_decalage
        global max_timer

        while parent.isAlive() :
                indicateur.wait(timeout = timer)
                if indicateur.isSet() :
                        begoconf.log_message("La requete s'est terminee sans probleme", level = "info")
                        break   # Requète terminée sans problème
                else :
                        if parent.isAlive() :
                                heure_courante = time.time()

                                if not master :
                                        master = jahtml.CGI_document("multipart/x-mixed-replace;boundary=" + endpart)
                                        master.insert_text("--" + endpart)
                                        master.output()
                                        timer= max_timer

                                part = jahtml.CGI_document()
                                part.push()
                                part.default_header(title = "Veuillez patienter...")
                                part.body()
                                part.h3("Veuillez patienter...")
                                part.insert_text("Durée écoulée: %02.2f secondes" % (time.time() - heure_debut))
                                part.pop()
                                part.insert_text("\n--" + endpart)
                                part.output()
                        else :
                                begoconf.log_message("La requete est tombee en erreur", level = "notice")
        sys.exit(0)

master = None
heure_debut = 0
premier_timer = 5.0             # 5 secondes
max_timer = 30.0                # 30 secondes
endpart = "rachelvaudron"

form=cgi.FieldStorage()   #recupere tous les param passes par le script precedent
doc=PageRequete("Requètes SQL", "Requètes SQL")
ruser = doc.remote_user()
if ruser in begoconf.superusers :
        db = begoconf.BegoDataBase(debuglevel = 1) 
        if (not form.has_key("nomrequete")) and (not form.has_key("requete")) :
                doc.ecran_requetes("#CCCCCC","#CCFFFF","#FFFFCC","#CCCCCC","#FFFFCC")
        else :
                if form.has_key("nomrequete") and not form.has_key("lue") :
                        nomrequete = string.strip(string.lower(form["nomrequete"].value))
                        if nomrequete :
                                res = cherche_requete(db, nomrequete)
                                if form.has_key("requete") :
                                        quequette = string.strip(string.replace(form["requete"].value, "\r", ""))
                                        quotequette = db.quote(quequette, "text")
                                        if quequette :
                                                if res :
                                                        db.query("UPDATE requete SET coderequete = " + quotequette + " WHERE nomrequete = " + db.quote(nomrequete, "text"))
                                                else :
                                                        db.query("INSERT INTO requete (nomrequete, coderequete) VALUES (" + db.quote(nomrequete, "text") + ", " + quotequette + ")")
                                        else :
                                                nomrequete = ""
                                else :
                                        if res :
                                                quequette = res["coderequete"]
                                                nomrequete = res["nomrequete"]
                                        else :
                                                begoconf.fatalerror_message("La requète %s n'existe pas" % form["nomrequete"].value)
                        else :
                                quequette = ""
                        doc.set_redirect(doc.script_name() + '?' + urllib.urlencode({"requete" : quequette, "nomrequete" : nomrequete, "presentation" : form["presentation"].value, "lue": 1 }))
                elif form.has_key("requete") :
                        quequette = string.strip(string.replace(form["requete"].value, "\r", ""))
                        doc.ecran_requetes("#CCCCCC","#CCFFFF","#FFFFCC","#CCCCCC","#FFFFCC", requete = quequette)

                        # la premiere alerte doit etre lancee assez tot pour
                        # que l'utilisateur ne s'impatiente pas
                        # mais assez tard pour qu'une erreur sur la requete ait ete recuperee
                        # par fatalerror_message()
                        # 5 secondes c'est plutot pas mal.
                        heure_debut = time.time()
                        if havethreads :
                                rendezvous = threading.Event()
                                threading.Thread(target = mixed_part_handler, kwargs = { "parent" : threading.currentThread(), "indicateur" : rendezvous, "timer" : premier_timer}).start()
                        resultat = db.query(quequette)
                        if (resultat != None) and string.upper(quequette[:6]) == "SELECT" :
                                doc.div(align="center")
                                resultat = resultat.dictresult()
                                if len(resultat) :
                                        # attention: on a ajouté ici des champs de la table requete afin d'avoir un traitement
                                        # generique, c'est degueulasse et IL FAUDRA le réécrire !!!
                                        entetes = ["secteur", "zone", "groupe", "roche", "face", "figure", "association", "nomrequete", "coderequete"]
                                        maliste = []
                                        for champ in entetes :
                                                if resultat[0].has_key(champ) :
                                                        maliste.append(champ)

                                        # on recupere la liste des clefs primaires presentes
                                        primarykeys = maliste[0:]

                                        for champ in resultat[0].keys() :
                                                if maliste.count(champ) == 0 :
                                                        maliste.append(champ)

                                        lgchamps = {}
                                        for champ in maliste :
                                                lgchamps[champ] = len(champ)
                                        for enregistrement in resultat :
                                                for champ in maliste :
                                                        val = enregistrement[champ]
                                                        if type(val) != type("") :
                                                                val = `val`
                                                        lg = len(val)
                                                        if lgchamps[champ] < lg :
                                                                lgchamps[champ] = lg

                                        if form["presentation"].value == telechargecsv :
                                        # export au format CSV
                                            csv.register_dialect("csvrfc", quotechar = '"', doublequote = True, quoting=csv.QUOTE_ALL)
                                            # CSV all quoted, delimited by double quotes with quote escaped
                                            # We quote all in collection because we can have comas, retur line insisde fields
                                            # see RFC-4180 CVS format section 2.7
                                            csv_file = open("/home/bases/bego/resultat_requete.csv", "wb")
                                            csvwriter = csv.writer(csv_file, dialect="csvrfc")
                                            #write the first row
                                            csvwriter.writerow(maliste)
                                            for enregistrement in resultat :
                                                begoconf.log_message(enregistrement)
                                                row =[] # liste
                                                for champ in maliste :
                                                    row.append(enregistrement[champ])

                                                #for row in resultat :
                                                #    #write each rows
                                                csvwriter.writerow(row)
                                            csv_file.close()
                                            doc = jahtml.CGI_document(content_type = "text/csv;")
                                            doc.set_redirect("/bego/resultat_requete.csv")

                                        else :
                                                nbrecords = len(resultat)
                                                if nbrecords > 1 :
                                                        esse = 's'
                                                else :
                                                        esse = ''
                                                doc.font(`nbrecords` + " enregistrement%s trouvé%s" % (esse, esse), color="red")

                                                if form["presentation"].value != simplifie:
                                                        doc.table(border = "1", lines = len(resultat) + 1, cols = len(resultat[0].keys()))
                                                        doc.push()
                                                        doc.tr()
                                                        for champ in maliste :
                                                                doc.th(champ, bgcolor="#CCFFFF")
                                                        doc.pop()
                                                else :
                                                        doc.br()
                                                        doc.pre()
                                                        ligne = ""
                                                        lgligne = 0
                                                        for champ in maliste :
                                                                ligne = ligne + champ + "&nbsp;" * (lgchamps[champ] - len(champ) + 1)
                                                                lgligne = lgligne + lgchamps[champ] + 1
                                                        doc.insert_text(ligne + "\n")
                                                        doc.insert_text('-' * (lgligne - 1) + "\n")

                                                for enregistrement in resultat:
                                                        if form["presentation"].value != simplifie:
                                                                doc.push()
                                                                doc.tr()

                                                        for champ in maliste:
                                                                display_field(doc, form, primarykeys, champ, lgchamps[champ], enregistrement)

                                                        if form["presentation"].value != simplifie:
                                                                doc.pop()
                                                        else :
                                                                #
                                                                # c'est plus facile pour voir le source de la page HTML
                                                                # et en plus ca passe à la ligne si affichage simplifié
                                                                doc.insert_text("\n")
                                else :
                                        doc.font("Aucun enregistrement ne correspond", color="red")
                        else:
                                doc.push()
                                doc.pre()
                                doc.insert_text("Résultat de la requète: " + `resultat`)
                                doc.pop()
                        if havethreads :
                                rendezvous.set()
        doc.output()
else:
        begoconf.fatalerror_message("Vous n'avez pas l'autorisation d'accèder à cet écran")
