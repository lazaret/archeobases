#!  /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Annuaire  - (c) 1999      Jerome ALET <alet@unice.fr>
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
import sys
import time
import string
import cgi
import urllib
try :
        import threading
        havethreads = 1
except :
        havethreads = 0
import annuaireconf
import jahtml

elabore = "Elaboré"
simplifie = "Simplifié"
telecharget = "Texte + Tabs"
telechargev = "Texte + Virgules"
liste_affichage = [ simplifie, elabore, telecharget, telechargev ]
affichage_default = simplifie

def cherche_requete(db, nom) :
        resultat = db.query("SELECT * FROM requete WHERE nomrequete = " + db.quote(nom, "text"))
        resultat = resultat.dictresult()
        if len(resultat) == 1 :
                return resultat[0]

def display_field(doc, form, pkeys, champ, lgmax, enreg) :
        """Cette fonction ne sert plus à rien, sauf comme aide mémoire."""
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
                        link = annuaireconf.script_location("mod" + table) + '?' + urllib.urlencode(dico)
        value = enreg[champ]
        if type(value) == type("") :
                if value != "" :
                        if form["presentation"].value != simplifie :
                                doc.push()
                                doc.td(bgcolor=annuaireconf.bas1_bgcolor)#"#E1DCD6")#"#FFFFCC")
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
                                doc.td("&nbsp;", bgcolor=annuaireconf.bas1_bgcolor)#"#FFFFCC")
                        else :
                                doc.insert_text("&nbsp;" * (lgmax + 1))
        else :
                if form["presentation"].value != simplifie :
                        doc.push()
                        doc.td(align="right", bgcolor=annuaireconf.bas1_bgcolor)#"#FFFFCC")
                        if link :
                                doc.a(`value`, href = link)
                        else :
                                doc.insert_text(`value`)
                        doc.pop()
                else :
                        value = `value`
                        lg = len(value)
                        doc.insert_text(value + "&nbsp;" * (lgmax - lg + 1))

class PageRequete(annuaireconf.Bas) :
        def ecran_requetes(self, coulfond, coultete, coulhaut, coulpartie, coulmenu, requete = "") :
                self.center()
                self.push()
                self.table(border = "10")
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
                self.a("Aide", href = annuaireconf.help_location, target = "top")
                self.pop()

        def output(self, file = "-") :
                global master
                global endpart

                self.pop()
                annuaireconf.copyright(self)
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
                        annuaireconf.log_message("La requête s'est terminée sans problème", level = "info")
                        break   # Requête terminée sans problème
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
                                annuaireconf.log_message("La requête est tombée en erreur", level = "notice")
        sys.exit(0)

master = None
heure_debut = 0
premier_timer = 5.0             # 5 secondes
max_timer = 30.0                # 30 secondes
endpart = "rachelvaudron"

form=cgi.FieldStorage()   #recupere tous les param passes par le script precedent
doc=PageRequete("Requêtes SQL", "Requêtes SQL")
ruser = doc.remote_user()
if ruser:# in annuaireconf.superusers :
        db = annuaireconf.AnnuaireDataBase(debuglevel = 1)
        if (not form.has_key("nomrequete")) and (not form.has_key("requete")) :
                doc.ecran_requetes(annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor)
                #doc.ecran_requetes(annuaireconf.bas1_bgcolor,"#CCFFFF","#FFFFCC","#CCCCCC","#FFFFCC")
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
                                                annuaireconf.fatalerror_message("La requête %s n'existe pas" % form["nomrequete"].value)
                        else :
                                quequette = ""
                        doc.set_redirect(doc.script_name() + '?' + urllib.urlencode({"requete" : quequette, "nomrequete" : nomrequete, "presentation" : form["presentation"].value, "lue": 1 }))
                elif form.has_key("requete") :
                        quequette = string.strip(string.replace(form["requete"].value, "\r", ""))
                        #doc.ecran_requetes("#CCCCCC","#CCFFFF","#FFFFCC","#CCCCCC","#FFFFCC", requete = quequette)
                        doc.ecran_requetes(annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor,annuaireconf.bas1_bgcolor, requete = quequette)
                        
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
                        if (resultat != None) and (type(resultat) != type(0)) :
                                doc.div(align="center")
                                nbrecords = resultat.ntuples()
                                if nbrecords :
                                        liste_champs = resultat.listfields()
                                        liste_valeurs = resultat.getresult()
                                        if form["presentation"].value[:5] == "Texte" :
                                                #
                                                # on le fait en non bufferise pour ne pas avoir de timeout.
                                                # en effet, l'option d'ecriture des donnees dans un fichier
                                                # peut permettre de traiter de GROS volumes, mais le
                                                # mode entierement bufferise provoquerai un timeout
                                                doc = jahtml.CGI_document(content_type = "text/montannuaire")
                                                if form["presentation"].value == telechargev :
                                                        separateur = ','
                                                else :
                                                        separateur = '\t'

                                                # on sort l'entete
                                                doc.insert_text(separateur.join(liste_champs))

                                                # puis les enregistrements
                                                for enregistrement in liste_valeurs :
                                                        doc.insert_text(unicode(separateur.join([str(v) for v in enregistrement]), "utf-8").encode("iso-8859-15"))
                                                if master :
                                                        doc.insert_text("\n--" + endpart + "--\n")
                                        else :
                                                if nbrecords > 1 :
                                                        esse = 's'
                                                else :
                                                        esse = ''
                                                doc.font(`nbrecords` + " enregistrement%s trouvé%s" % (esse, esse), color="red")
                                                
                                                if form["presentation"].value != simplifie:
                                                        doc.table(border = "1", lines = nbrecords + 1, cols = len(liste_champs))
                                                        doc.push()
                                                        doc.tr()
                                                        for champ in liste_champs :
                                                                doc.th(champ, bgcolor=annuaireconf.bas1_bgcolor) #"#CCFFFF")
                                                        doc.pop()
                                                        for enregistrement in liste_valeurs :
                                                                line = ""
                                                                for i in range(len(liste_champs)) :
                                                                        value = enregistrement[i]
                                                                        if type(value) == type("") :
                                                                                align = "left"
                                                                        else :        
                                                                                align = "right"
                                                                        line = line + '<td align="%s" bgcolor="%s">%s</td>\n' % (align, annuaireconf.bas1_bgcolor, str(value))
                                                                doc.insert_text("<tr>%s</tr>\n" % line)
                                                else :
                                                        indice_champs = {}
                                                        for champ in liste_champs :
                                                                indice_champs[champ] = resultat.fieldnum(champ)
                                                        longueur_champs = {}
                                                        for champ in liste_champs :
                                                                longueur_champs[champ] = max([len(champ)] + map(lambda x: len(str(x[indice_champs[champ]])), liste_valeurs))

                                                        doc.br()
                                                        doc.pre()
                                                        ligne = ""
                                                        for champ in liste_champs :
                                                                ligne = ligne + champ + " " * (longueur_champs[champ] - len(champ) + 1)
                                                        doc.insert_text("%s\n%s\n" % (ligne, '-' * len(ligne)))
                                                        for enregistrement in liste_valeurs :
                                                                line = ""
                                                                for i in range(len(liste_champs)) :
                                                                        value = str(enregistrement[i])
                                                                        lg = len(value)
                                                                        lgmax = longueur_champs[liste_champs[i]]
                                                                        line = line + value + (" " * (lgmax - lg + 1))
                                                                doc.insert_text(line + "\n")
                                else :
                                        doc.font("Aucun enregistrement ne correspond", color="red")
                        else:
                                doc.push()
                                doc.pre()
                                doc.insert_text("Résultat de la requête: " + `resultat`)
                                doc.pop()
                        if havethreads :
                                rendezvous.set()
        doc.output()
else:
        annuaireconf.fatalerror_message("Vous n'avez pas l'autorisation d'accèder à cet écran")


