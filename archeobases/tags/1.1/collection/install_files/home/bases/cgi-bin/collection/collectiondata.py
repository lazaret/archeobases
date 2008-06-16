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


import string
import cgi
import urllib
import collectionconf

class Data :
        def __init__(self, parent) :
                t = " des " + string.capitalize(self.__tablename__)
                pluriel = ''
                if t[-1] != 's' :
                        pluriel= 's'

                t = t + pluriel

                if parent == "bas" :
                        self.__doc__ = collectionconf.Bas("Saisie" + t, "Saisie" + t)
                        self.__form__ = cgi.FieldStorage()
                        self.__db__ = collectionconf.CollectionDataBase()
                        self.__parent__ = self.__tablename__ # est son propre parent
                else :
                        # si ca ne vaut pas "bas" on considère que c'est
                        # une instance de la classe "parent"
                        # donc on simule l'heritage
                        self.__doc__ = parent.getcurdoc()
                        self.__form__ = parent.getcurform()
                        self.__db__ = parent.getcurdb()
                        self.__parent__ = parent.gettablename()

##################################################################
#                       LISTE DES CLEFS DU PARENT
##################################################################
        def __clefsparent__(self) :
                if hasattr(self, "__vraiparent__") :
                        if not hasattr(self, "__parentkeys__") :
                                test = "import " + self.__vraiparent__ + "\n"
                                test = test + "instance = " + self.__vraiparent__ + "." + string.capitalize(self.__vraiparent__) + "(self).__listeclefs__\n"
                                code = compile(test, "", "exec")
                                exec(code)
                                self.__parentkeys__ = instance
                        return self.__parentkeys__


        def __make_url__(self, fields) :
                if (fields != None) and len(fields) :
                        rebuiltform = {}
                        for f in fields :
                                if self.__form__.has_key(f) :
                                    # Modifie par bertrand , clef primaire(s) en majuscule
                                    rebuiltform[f] = string.upper(self.__form__[f].value)
                        return urllib.urlencode(rebuiltform)
                else :
                        return ""

##################################################################
#       Renvoie la valeur d'un champ pour l'ecrire dans la base
##################################################################
        def __getfield__(self, fieldname) :
                """Renvoie la valeur d'un champ pour l'ecrire dans la base"""
                if self.__form__.has_key(fieldname) and string.strip(str(self.__form__[fieldname].value)) :
                    # le champ existe dans le formulaire
                        if fieldname == "identifiant" :
                            # Mise de l'identifiant en majuscule
                            value = string.upper(self.__form__[fieldname].value)
                        else :
                            # Les autres champs ne sont pas en majuscules
                            value = self.__form__[fieldname].value
                else :
                    # le champ est vide ou n'est pas dans le formulaire => valeur par defaut
                    # si il existe une valeur par defaut
                        if self.__champs__[fieldname].has_key("default") :
                                value = self.__champs__[fieldname]["default"]
                        else :
                                value = None

                # transforme si besoin la valeur du champ pour l'ecrire dans la base
                if hasattr(self, fieldname + "_form_to_base") :
#### pb si texte dans champs numeriques
                        value = getattr(self, fieldname + "_form_to_base")(value)
                try :
                        value = self.__db__.quote(value, self.__champs__[fieldname]["type"])
                        return value
                except ValueError, msg :
                        collectionconf.fatalerror_message("Texte saisi dans le champ de type numerique %s : %s" % (fieldname, msg))


####################################################################
#                Crée un WHERE en fct de la liste de champs en param
####################################################################
        def __createwhere__(self, fields) :
                """Crée une clause WHERE en fonction de la liste de champs passee en paramètre"""
                if fields != None :
                        where = " WHERE "
                        for field in fields :
                                paren = '('
                                if field[0] == '|' :
                                        field = field[1:]
                                        if where[-5:] == " AND " :
                                                where = where[:-6] + " OR "
                                                paren = ''
                                if field[0] == '!' :
                                        field = field[1:]
                                        test = "!="
                                else :
                                        test = "="
                                where = where + paren + field + test + self.__getfield__(field) + ") AND "
                        return where[:-5]       # on supprime le dernier " AND "
                else :
                        return ""
###################################################################
#               VERIFIE QUE LES CHAMPS OBLIGATOIRES SONT REMPLIS
##################################################################
        def __verify_mandatory__(self) :
                """Vérifie que les champs obligatoires sont bien remplis, et sinon affiche une boite d'alerte"""
                not_ok = 0
                for champ in self.__champs__.keys() :
                        try :
                                if self.__champs__[champ]["mandatory"] and (not (self.__form__.has_key(champ) and (string.strip(self.__form__[champ].value) != ""))) :
                                        not_ok = not_ok + 1
                                        self.__doc__.script('alert("Champ ' + champ + ' obligatoire !!!")')
                                else :
                                        if self.__form__.has_key(champ) :
                                                v = self.__form__[champ].value
                                        else :
                                                v = None
                                        if hasattr(self, champ + "_verify") :
                                                if getattr(self, champ + "_verify")(champ, v) :
                                                        not_ok = not_ok + 1
                                                        self.__doc__.script('alert("Le champ ' + champ + ' a un contenu invalide [%s])' % v)
                        except AttributeError, msg :
                                collectionconf.fatalerror_message("Erreur sur la vérification du champ obligatoire %s : %s [%s]" % (champ, msg, self.__form__[champ]))
                return not_ok

#######################################################################
#                               FORM GENERIQUE
#######################################################################

        def __formgenerique__(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td( bgcolor = self.__color__, width = "100%")
                self.__doc__.div(align="left")
                self.__doc__.table(border = "0", width="100%", cellpadding = "0", cellspacing = "0", column="7", )

                for champ in self.__ordrechamps__ :
                        if hasattr(self, champ + "_base_to_form") :
                                getattr(self, champ + "_base_to_form")(enreg, penreg)
                self.__doc__.pop()

#########################################################################
#                               MENU PARTIE DROITE
#########################################################################
        def __menugenerique__(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(bgcolor = collectionconf.basform_bgcolorright, valign="top",align = "center")
                self.__doc__.font(size = collectionconf.font_size)
                if enreg != None and (collectionconf.utilisateur_courant not in collectionconf.visitorusers) :
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Modifier")
                        self.__doc__.pop()
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Supprimer")
                        self.__doc__.pop()
                        if self.__parent__ == self.__tablename__ :
                                self.__doc__.push()
                                self.__doc__.p()
                                self.__doc__.submit(name = "action", value = self.__new_record__)
                                self.__doc__.pop()
                else :
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Chercher")
                        self.__doc__.pop()
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "ChercherPlus")
                        self.__doc__.pop()
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Compter")
                        self.__doc__.pop()
                        if collectionconf.utilisateur_courant not in collectionconf.visitorusers :
                            self.__doc__.push()
                            self.__doc__.p()
                            self.__doc__.submit(name = "action", value = "Créer")
                            self.__doc__.pop()
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.reset(value = "R-à-Zéro")
                        self.__doc__.pop()
                self.__doc__.pop()

###########################################################################
        def getcurdoc(self) :
                return self.__doc__

        def getcurform(self) :
                return self.__form__

        def getcurdb(self) :
                return self.__db__

        def gettablename(self) :
                return self.__tablename__

        def get_nextval(self, table = None) :
                """Renvoie la prochaine valeur libre de clef primaire, pour insertion"""
                if table == None :
                        table = self.__tablename__
                res = self.__db__.query("SELECT nextval('seq_" + table + "');")
                res = res.dictresult()
                return res[0]["nextval"]

        def exist(self, champs, table = None) :
                if table == None :
                        table = self.__tablename__
                query = "SELECT COUNT(*) FROM " + table + self.__createwhere__(champs) + ";"
                res = self.__db__.query(query)
                res = res.dictresult()
                return res[0]["count"]

        def exist_association(self, valeur) :
                query = "SELECT COUNT(*) FROM association WHERE identifiant_1 = " + valeur
                query = query + " OR identifiant_2= " + valeur + ";"
                res = self.__db__.query(query)
                res = res.dictresult()
                return res[0]["count"]

        def exist_association_identique(self, valeur1, valeur2, table) :
                query = "(SELECT COUNT(*) FROM association WHERE identifiant_1 = " + valeur1
                query = query + " AND identifiant_2= " + valeur2 + ")"
                query = query + " UNION "
                query = query + "(SELECT COUNT(*) FROM association WHERE identifiant_1 = " + valeur2
                query = query + " AND identifiant_2= " + valeur1 + ");"
                res = self.__db__.query(query)
                res = res.dictresult()
                return res[0]["count"]

        def exist_controle(self, champ, valeur, table = None) :
                if (not valeur) or (valeur == "''") :
                        return 1
                if table == None :
                        table = self.__tablename__
                query = "SELECT COUNT(*) FROM controle_%s WHERE %s=%s;" % (champ, champ, valeur)
                res = self.__db__.query(query)
                res = res.dictresult()
                return res[0]["count"]

        def exist_table(self, champs, table = None) :
                if table == None :
                        table = self.__tablename__

                query = "SELECT RELNAME FROM pg_class WHERE RELNAME=%s;" % self.__db__.quote(table, "text")
                res = self.__db__.query(query)
                res = res.dictresult()
                if len(res):
                        return 1
                else:
                        return 0

        def exist_table_controle(self, champ, table = None) :
                if table == None :
                        table = self.__tablename__

                query = "SELECT RELNAME FROM pg_class WHERE RELNAME=%s;" % self.__db__.quote("controle_" + champ, "text")
                res = self.__db__.query(query)
                res = res.dictresult()
                if len(res):
                        # certes la table de controle existe, mais si elle est vide,
                        # on fait comme si elle n'existait pas, alors que si elle
                        # contient au moins une valeur c'est bon.
                        return self.__db__.query("SELECT COUNT(*) FROM controle_%s;" % champ).dictresult()[0]["count"]
                else:
                        return 0

        def get_records(self, primarykeys = None, table = None) :
                """Renvoie les enregistrements correspondant à la liste des clefs passée en paramètre"""
                if table == None :
                        table = self.__tablename__
                res = self.__db__.query("SELECT * FROM " + table + self.__createwhere__(primarykeys) + ";")
                return res.dictresult()

        def count_records(self, liste_champs = None, table = None):
                """Renvoie le compte d'enregistrements correspondant à la liste des champs passes en parametre"""
                if table ==None :
                        table = self.__tablename__
                cpt = self.__db__.query( "SELECT count(*) FROM " + table + self.__createwhere__(liste_champs) + ";")
                cpt = cpt.dictresult()
                return (cpt["count"])

        def delete_records(self, primarykeys, table = None) :
                if table == None :
                        table = self.__tablename__
                return self.__db__.query("DELETE FROM " + table + self.__createwhere__(primarykeys) + ";")

        def make_update_query(self, primarykeys, table = None):
                """Calcule la requete de mise a jour"""
                # TODO: vérifier les valeurs des champs avant toute mise à jour
                if table == None :
                        table = self.__tablename__
                query = "UPDATE " + table + " SET "
                for champ in self.__listechamps__ :
                        #
                        # attention, dans cette collection on ne peut pas modifier
                        # les clefs primaires, donc on optimise en n'ajoutant
                        # aucune de celles-ci à la requete de mise à jour.
                        # si on veut l'autoriser, il faut enlever le if ci-dessous
                        if champ not in primarykeys :
                                query = query + champ + "=" + (self.__getfield__(champ)) + ", "
                query = query[:-2] + self.__createwhere__(primarykeys) + ";"
                return query


        def make_insert_query(self, primarykeys, table = None) :
                """Calcule la requete d'insertion"""
                if table == None :
                        table = self.__tablename__
                query = "INSERT INTO " + table + " ("
                for primarykey in primarykeys.keys() :
                        query = query + primarykey + ", "

                for champ in self.__listechamps__ :
                        query = query + (champ) + ", "

                query = query[:-2] + ") VALUES ("

                for primarykey in primarykeys.keys() :
                        if type(primarykeys[primarykey]) == type("") :
                                query = query + self.__db__.quote(primarykeys[primarykey], "text")
                        else :
                                query = query + `primarykeys[primarykey]`
                        query = query + ", "
                for champ in self.__listechamps__ :
                        v = (self.__getfield__(champ))
                        if self.exist_table_controle(champ) and self.__champs__[champ]["longueur"] != 0 :
                                if self.exist_controle(champ, v): #si la valeur est bien dans la table controle de ce champ
                                        ####TODO VERIFIER #####ATTENTION
                                        query = query + v + ", " # alors on verifie que la valeur cherchee s'y trouve bien

                                elif v :
                                        collectionconf.fatalerror_message("La valeur [%s] saisie dans le champ %s est invalide !" %(v, champ))
                                        return None

                        else:
                                query = query + v + ", "
                query = query[:-2] + ");"
                return query

        def dessine_lien(self,message,lien,couleur = "yellow") :
                self.__doc__.push()
                self.__doc__.a(href = lien)
                self.__doc__.font(message, style="color:%s;" % couleur)
                self.__doc__.pop()



#################################################################################
#                               FORMULAIRE HOOK
#################################################################################
        def formulaire_hook(self, enreg = None, current = 0, maximum = 0, penreg = None) :
                self.__doc__.push()
                self.__doc__.div(align="center")

                self.__doc__.table(border = "1", cellpadding = "5", cellspacing = "5")

                if enreg :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(colspan = 2, valign="middle", align="center")
                        self.__doc__.font(size = collectionconf.font_size)

                        if maximum :
                                self.__doc__.a("Première", href = "#anchor_" + self.__tablename__ + "0")
                                self.__doc__.insert_text("&nbsp;" * 5)
                                if current :
                                        self.__doc__.a("Précédente", href = "#anchor_" + self.__tablename__ + `current - 1`)
                                else :
                                        self.__doc__.insert_text("Précédente")
                                self.__doc__.insert_text("&nbsp;" * 5)

                        self.__doc__.push()
                        self.__doc__.font(color = "red")
                        self.__doc__.a(`current + 1` + " / " + `maximum + 1`, name = "anchor_" + self.__tablename__ + `current`)
                        self.__doc__.pop()

                        if maximum :
                                self.__doc__.insert_text("&nbsp;" * 5)
                                if current != maximum:
                                        self.__doc__.a("Suivante", href = "#anchor_" + self.__tablename__ + `current + 1`)
                                else :
                                        self.__doc__.insert_text("Suivante")
                                self.__doc__.insert_text("&nbsp;" * 5)
                                self.__doc__.a("Dernière", href = "#anchor_" + self.__tablename__ + `maximum`)

                        self.__doc__.br()
                        self.__doc__.font(size = collectionconf.font_size)
                        if hasattr(self, "__listeparents__"):
                                self.__doc__.font(size = collectionconf.font_size, style="color:%s;" % collectionconf.bas1_bgcolor)
                                dico = { "action" : "ChercherLien" }
                                for clef in self.__clefsparent__() :
                                        dico[clef] = enreg[clef]
                                for p in self.__listeparents__ :
                                        self.__doc__.insert_text("&nbsp;" * 5)
                                        pluriel = ''
                                        if p[-1] != 's' :
                                                pluriel = 's'
                                        if p == "hachereau":
                                                pluriel = 'x'

                                        elif p == "nucleus":
                                                self.dessine_lien(("Nucleus"), collectionconf.script_location("mod" + p) + "?" + urllib.urlencode(dico), collectionconf.lien_parent_bgcolor)
                                        elif p == "galet_amenage":
                                                self.dessine_lien(("Galets aménagés"), collectionconf.script_location("mod" + p) + "?" + urllib.urlencode(dico), collectionconf.lien_parent_bgcolor)
                                        elif p == "fracture_faune":
                                                self.dessine_lien(("Fractures faune"), collectionconf.script_location("mod" + p) + "?" + urllib.urlencode(dico), collectionconf.lien_parent_bgcolor)
                                        else:
                                                self.dessine_lien((string.capitalize(p)), collectionconf.script_location("mod" + p) + "?" + urllib.urlencode(dico), collectionconf.lien_parent_bgcolor)

                        #TODO RENVOYER SUR NOUVEAU AVEC CLEF PARENT
                        if hasattr(self, "__listenfants__") :
                                dico = { "action" : "ChercherLien" }
                                for clef in self.__listeclefs__ :
                                        dico[clef] = enreg[clef]
                                for enfant in self.__listenfants__ :
                                        self.__doc__.insert_text("&nbsp;" * 5)


                                        if enfant == "hachereau":
                                                pluriel = 'x'

                                        elif enfant == "nonos":
                                                self.dessine_lien(("Mesure des Os"), collectionconf.script_location("mod" + enfant) + "?" +urllib.urlencode(dico), collectionconf.lien_enfant_bgcolor)

                                        elif enfant == "fracture_faune":
                                                self.dessine_lien(("Fractures faunes"), collectionconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico), collectionconf.lien_enfant_bgcolor)
                                        elif enfant == "nucleus":
                                                self.dessine_lien(("Nucleus"), collectionconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico), collectionconf.lien_enfant_bgcolor)

                                        elif enfant == "galet_amenage":
                                                self.dessine_lien(("Galets aménagés"), collectionconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico), collectionconf.lien_enfant_bgcolor)

                                        else:
                                                pluriel = ''
                                                if enfant[-1] != 's' :
                                                        pluriel = 's'
                                                        self.dessine_lien((string.capitalize(enfant) + pluriel), collectionconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico), collectionconf.lien_enfant_bgcolor)

                        self.__doc__.pop()


                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.form(method = "POST", action = collectionconf.script_location("mod" + self.__tablename__))
                self.__formgenerique__(enreg, penreg)
                self.__menugenerique__(enreg, penreg)
                self.__doc__.pop()
                if enreg != None :
                        if hasattr(self, "__formsupp__") :
                                for f in self.__formsupp__ :
                                        # on vire l'eventuel 's' final et si on est dans __listenfants__ alors on n'affiche pas
                                        # trouver une meilleure solution un jour
                                        if (not hasattr(self, "__listenfants__")) or (f[:-1] not in self.__listenfants__) :
                                                if hasattr(self, f) :
                                                        getattr(self, f)(enreg, penreg)
                self.__doc__.pop()

###############################################################################
#                       HAVE PRIMARY KEYS
###############################################################################
        def have_primarykeys(self, pkeys) :
                for pk in pkeys :
                        if not self.__form__.has_key(pk) :
                                return 0
                return 1

################################################################################
#                       RECHERCHE COMPLETE
################################################################################
        def recherche_complete(self, table = None, penreg = None) :
                if table == None :
                        table = self.__tablename__
                q = "SELECT * FROM " + table
                w = ""
                for c in self.__champs__.keys() :
                        if self.__form__.has_key(c) :
                                #
                                # quel que soit le type du champ on le traite sous forme de chaine,
                                # ca permet de chercher ~* 33 sur un numerique pour trouver tous ceux contenant 33
                                # sauf pour les booleens qui ne reconnaissent pas l'operateur ~* malheureusement
                                #if self.__champs__[c]["type"] == "bool" :
                                #        fauxtype = "bool"
                                #else :
                                #        fauxtype = "text" # meme pour les numeriques
                                #val = self.__db__.quote(self.__form__[c].value, fauxtype)

                                # A NE REACTIVER QU'EN CAS DE BESOIN (recherche non stricte)
                                #
                                vc = self.__form__[c].value
                                if hasattr(self, c + "_form_to_base") :
                                        vc = getattr(self, c + "_form_to_base")(vc)
                                try :
                                        val = self.__db__.quote(vc, self.__champs__[c]["type"])
                                        w = w + "(" + c + " = " + val + ") AND "
                                except ValueError :
                                        self.__doc__.script('alert("Opération interdite !!!")')
                        elif penreg and penreg.has_key(c) :
                                val = self.__db__.quote(penreg[c], self.__champs__[c]["type"])
                                w = w + "(" + c + " = " + val + ") AND "
                if w :
                        q = (q + " WHERE " + w)[:-5]
                if hasattr(self, "__orderby__") :
                        q = q + getattr(self, "__orderby__")
                res = self.__db__.query(q)
                return res.dictresult()

################################################################################
#                       RECHERCHE COMPLETE +
################################################################################
        def recherche_complete_avancee(self, table = None, penreg = None) :
                if table == None :
                        table = self.__tablename__
                q = "SELECT * FROM " + table
                w = ""
                for c in self.__champs__.keys() :
                        if self.__form__.has_key(c) :
                                #
                                # quel que soit le type du champ on le traite sous forme de chaine,
                                # ca permet de chercher ~* 33 sur un numerique pour trouver tous ceux contenant 33
                                # sauf pour les booleens qui ne reconnaissent pas l'operateur ~* malheureusement
                                if self.__champs__[c]["type"] == "bool" :
                                        fauxtype = "bool"
                                else :
                                        fauxtype = "text" # meme pour les numeriques
                                val = self.__db__.quote(self.__form__[c].value, fauxtype)

                                # A NE REACTIVER QU'EN CAS DE BESOIN (recherche non stricte)
                                #
                                vc = self.__form__[c].value
                                if hasattr(self, c + "_form_to_base") :
                                        vc = getattr(self, c + "_form_to_base")(vc)
                                try :
                                        val = self.__db__.quote(vc, self.__champs__[c]["type"])
                                        w = w + "(" + c + " ~* " + val + ") AND "
                                except ValueError :
                                        self.__doc__.script('alert("Opération interdite !!!")')
                        elif penreg and penreg.has_key(c) :
                                val = self.__db__.quote(penreg[c], self.__champs__[c]["type"])
                                w = w + "(" + c + " ~* " + val + ") AND "
                if w :
                        q = (q + " WHERE " + w)[:-5]
                if hasattr(self, "__orderby__") :
                        q = q + getattr(self, "__orderby__")
                res = self.__db__.query(q)
                return res.dictresult()


        ################# RECHERCHE COMPLETE COMPTER ###############""
        def recherche_complete_compter(self, table = None, penreg = None) :
                if table == None :
                        table = self.__tablename__
                q = "SELECT count(*) FROM " + table
                w = ""
                for c in self.__champs__.keys() :
                        if self.__form__.has_key(c) :
                                #
                                # quel que soit le type du champ on le traite sous forme de chaine,
                                # ca permet de chercher ~* 33 sur un numerique pour trouver tous ceux contenant 33
                                # sauf pour les booleens qui ne reconnaissent pas l'operateur ~* malheureusement
                                if self.__champs__[c]["type"] == "bool" :
                                        fauxtype = "bool"
                                else :
                                        fauxtype = "text" # meme pour les numeriques

                                if (self.exist_table(c, table = "controle_" + c) and not(self.__champs__[c].has_key("compter"))) :
                                        val = self.__db__.quote(self.__form__[c].value, fauxtype)
                                        w = w + "(" + c + " = " + val + ") AND "
                                else:
                                        val = self.__db__.quote(self.__form__[c].value, fauxtype)
                                        w = w + "(" + c  + " = " + val + ") AND "
                        elif penreg and penreg.has_key(c) :
                                if self.exist_table(c, table = "controle_" + c) :
                                        val = self.__db__.quote(self.__form__[c].value, fauxtype)
                                        w = w + "(" + c + " = " + val + ") AND "
                                else:
                                        val = (self.__form__[c].value)
                                        w = w + "(" + c  + " "+ val + ") AND "
                if w :
                        q = (q + " WHERE " + w)[:-5]
                res = self.__db__.query(q)
                return res.dictresult()

        def have_primarykeys(self, pkeys) :
                for pk in pkeys :
                        if not self.__form__.has_key(pk) :
                                return 0
                return 1




################################################################################
#                       TRAITE SAISIE
################################################################################
        def traite_saisie(self, primarykeys, parent = None, sup = None, penreg = None) :
                if not parent :
                        parent = self.__tablename__
                ################# CHERCHER / CHERCHER LIEN #########

                if self.__form__.has_key("action") and ((self.__form__["action"].value == "Chercher") or (self.__form__["action"].value == "ChercherLien")) :
                        enregs = self.recherche_complete(penreg = penreg)
                        lg = len(enregs)
                        if lg :
                                i = 0
                                for enreg in enregs :
                                        self.formulaire_hook(enreg, current = i, maximum = lg - 1, penreg = penreg)
                                        i = i + 1
                        elif (self.__form__["action"].value == "Chercher"):
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.push()
                                        self.__doc__.div(align = "center")
                                        self.__doc__.font("Aucun enregistrement trouvé", color = "red")
                                        self.__doc__.pop()
                                        self.formulaire_hook(penreg = penreg)

                        elif (self.__form__["action"].value == "ChercherLien"):
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')

                ################# CHERCHER+ #########

                elif self.__form__.has_key("action") and ((self.__form__["action"].value == "ChercherPlus")) :
                        enregs = self.recherche_complete_avancee(penreg = penreg)
                        lg = len(enregs)
                        if lg :
                                i = 0
                                for enreg in enregs :
                                        self.formulaire_hook(enreg, current = i, maximum = lg - 1, penreg = penreg)
                                        i = i + 1
                        elif (self.__form__["action"].value == "ChercherPlus"):
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.push()
                                        self.__doc__.div(align = "center")
                                        self.__doc__.font("Aucun enregistrement trouvé", color = "red")
                                        self.__doc__.pop()
                                        self.formulaire_hook(penreg = penreg)


                #####################COMPTER################
                elif self.__form__.has_key("action")  and (self.__form__["action"].value == "Compter") :
                        enregs = self.recherche_complete_compter(penreg = penreg)
                        lg = len(enregs)
                        if not lg :
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.push()
                                        self.__doc__.div(align = "center")
                                        self.__doc__.font("Aucun enregistrement trouvé", color = "red")
                                        self.__doc__.pop()
                        else :
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.push()
                                        self.__doc__.div(align = "center")
                                        self.__doc__.font(enregs[0]["count"], color = "red")
                                        self.__doc__.font(" enregistrement(s) trouvé(s)", color = "red")
                                        self.__doc__.pop()
                        self.formulaire_hook(penreg = penreg)


                elif self.have_primarykeys(primarykeys) :
                        #
                        # si le champ action existe alors on veut supprimer ou modifier ou créer
                        if self.__form__.has_key("action") :

                                #################### MODIFIER ####################
                                if self.__form__["action"].value == "Modifier" :
                                        if not self.__verify_mandatory__() :
                                                if self.modifier() :
                                                        # l'utilisateur tente de dupliquer un enregistrement
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else :
                                                        # tout c'est bien passé, on réaffiche la liste
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')

                                ################## SUPPRIMER #########################
                                elif self.__form__["action"].value == "Supprimer" :
                                        if self.supprimer() :
                                                # il reste des enregistrements dans d'autres tables qui dépendent de celui-ci
                                                self.__doc__.script('alert("Suppression impossible !!!")')
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                # la suppression a bien eu lieu
                                                if not parent :
                                                        self.formulaire_hook(penreg = penreg)
                                                else :
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent)+ '"')

                                ################## CREER #############################
                                elif self.__form__["action"].value == "Créer" :
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()

                                                if retour == -1:
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                elif retour == -2:
                                                        self.__doc__.script("""alert("Enregistrement impossible à créer car il n'a aucun parent !!!")""")
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                elif retour == -3:
                                                        collectionconf.fatalerror_message("La zone saisie est inconnue")
                                                elif retour == 1 :
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else:
                                                        self.__doc__.script('alert("valeur inexistante pour le champ" + champ )')
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')

                                elif self.__form__["action"].value != self.__new_record__ :
                                        collectionconf.log_message("Action " + self.__form__["action"].value + " non reconnue")
                                        self.formulaire_hook(penreg = penreg)
                                else :
                                        self.formulaire_hook(penreg = penreg)
                        else :
                                #
                                # la requete ne doit retourner qu'un enregistrement sinon la base est pourrie
                                # mais ce n'est pas grave, on fait "générique"
                                enregs = self.get_records(primarykeys)
                                if len(enregs) :
                                        for enreg in enregs :
                                                self.formulaire_hook(enreg, penreg = penreg)
                                else :
                                        collectionconf.log_message("Tentative d'accès à un enregistrement d'identifiant inexistant")
                                        self.formulaire_hook(penreg = penreg)
                else :
                        # je me demande ce qui reste execute dans ce qui est ci-dessous
                        # il est grand temps de faire le menage !!!
                        #
                        #
                        # si le champ action existe alors on veut créer ou avoir un formulaire vide
                        if self.__form__.has_key("action") :
                                if self.__form__["action"].value == "Créer" :
                                        # toutes les clefs primaires ne sont pas remplies, on ne
                                        # vient ici (code dupliqué) que pour que les messages d'erreur adéquats s'affichent
                                        # en effet verify_mandatory devrait tomber tout le temps en erreur car les clefs
                                        # primaires sont aussi des champs obligatoires (sinon y'a un bleme)
                                        # dans l'avenir mettre tout ca sous forme de fonction
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()
                                                if retour :
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        self.formulaire_hook(penreg)
                                                else :
                                                        # tout c'est bien passé
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        self.formulaire_hook(penreg = penreg)
                                ##################### NOUVEAU #################
                                elif self.__form__["action"].value == self.__new_record__ :
                                        if not parent :
                                                self.formulaire_hook(penreg = penreg)
                                        else :
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')

                                else :
                                        collectionconf.log_message("Action [" + self.__form__["action"].value + "] non reconnue")
                                        self.formulaire_hook(penreg = penreg)
                        else :
                                # sinon affichage de l'écran de saisie vide
                                self.formulaire_hook(penreg = penreg)

                # si c'est une table "mere" (ex: roche")
                # on sort le document
                if self.__parent__ == self.__tablename__ :
                        self.__doc__.output()
                else :
                        #
                        # sinon on ajoute en plus un formulaire vide pour pouvoir ajouter
                        self.formulaire_hook(penreg = penreg)


#####################################################################################
#                               AFFICHAGE CHAMP TABLE
#####################################################################################
############################### RECUPERE VALEUR #####################################

        def recupere_valeur(self, nom_table, nom_champ, liste_clefs, enreg) :
                if enreg :
                        query = "SELECT " + nom_champ + " FROM " + nom_table + " WHERE identifiant=%s ;" %( self.__db__.quote(enreg["identifiant"], "text"))
                        valeur = self.__db__.query(query)
                        valeur = valeur.dictresult()
                        valeur = valeur[0][nom_champ]
                        return valeur

################################ CHAMP LISTE TABLE ##############################
        def champ_liste_table(self, nom_table, liste_clefs, nom_champ, libelle, enreg, penreg, titre, dontchange) :
                if titre != "":
                        self.__doc__.tr(align = "right")
                        self.__doc__.push()
                        self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="right")
                self.__doc__.font(libelle, size=collectionconf.font_size)
                self.__doc__.font(size=collectionconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left")
                id = self.recupere_valeur( nom_table, nom_champ, liste_clefs, enreg)
                query = "SELECT description FROM controle_" + nom_champ + " WHERE " + nom_champ + "=" + self.__db__.quote(id,"text") + ";"
                description = self.__db__.query(query).dictresult()
                if len(description) and  description == None:
                        description = description[0]["description"]
                else :
                        description = ""
                valeur = str(id) + " " + (description)
                if description != None:
                        self.__doc__.push()
                        self.__doc__.select(name = nom_champ)
                        if id != None :
                                self.__doc__.option_selected(valeur, value = str(id))
                        else :
                                self.__doc__.option_selected( "", value = str(id))

                        self.__doc__.pop()
                self.__doc__.pop()

        def champ_nliste_table(self, nom_table, liste_clefs, nom_champ, libelle, col,enreg, penreg, titre, dontchange) :
                if titre != "":
                        self.__doc__.tr(align = "right")
                        self.__doc__.push()
                        self.__doc__.td(align="left")
                        self.__doc__.u()
                        self.__doc__.font(titre, size=collectionconf.font_size)
                        self.__doc__.pop()
                        self.__doc__.td()

                self.__doc__.push()
                self.__doc__.td(align="right", colspan=col)
                self.__doc__.font(libelle, size=collectionconf.font_size)
                self.__doc__.font(size=collectionconf.font_size)

                id = self.recupere_valeur( nom_table, nom_champ, liste_clefs, enreg)
                query = "SELECT description FROM controle_" + nom_champ + " WHERE " + nom_champ + "=" + self.__db__.quote(id,"text") + ";"
                description = self.__db__.query(query).dictresult()
                if len(description) and  description == None:
                        description = description[0]["description"]
                else :
                        description = ""
                valeur = str(id) + " " + (description)
                if description != None:
                        self.__doc__.push()
                        self.__doc__.select(name = nom_champ)
                        if id != None :
                                self.__doc__.option_selected(valeur, value = str(id))
                        else :
                                self.__doc__.option_selected( "", value = str(id))

                        self.__doc__.pop()
                self.__doc__.pop()

############################### CHAMP SAISIE TABLE ##############################
        def champ_saisie_table(self, nom_table, liste_clefs, nom_champ, libelle, longueur, maxlongueur, titre, enreg, penreg):
                if titre != "":
                        self.__doc__.tr(align="right")
                        self.__doc__.push()
                        self.__doc__.td(align="left", valign="center")
                        self.__doc__.u()
                        self.__doc__.font(titre, size=collectionconf.font_size)
                        self.__doc__.pop()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font(size=collectionconf.font_size)
                libelle = libelle + ": "
                self.__doc__.insert_text(libelle)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                valeur = self.recupere_valeur( nom_table, nom_champ, liste_clefs, enreg)
                if enreg != None :
                        self.__doc__.insert_text(valeur)
                else :
                        self.__doc__.text(name = nom_champ, size = longueur, maxlength = maxlongueur, value = "")
                self.__doc__.pop()


        def champ_nsaisie_table(self, nom_table, liste_clefs, nom_champ, libelle, longueur, maxlongueur, titre, col, enreg, penreg):
                if titre != "":
                        self.__doc__.tr(align="right")
                        self.__doc__.push()
                        self.__doc__.td(align="left", valign="center")
                        self.__doc__.u()
                        self.__doc__.font(titre, size=collectionconf.font_size)
                        self.__doc__.pop()
                        self.__doc__.td()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle", colspan=col)
                self.__doc__.font(size=collectionconf.font_size)
                libelle = libelle + ": "
                self.__doc__.insert_text(libelle)

                valeur = self.recupere_valeur( nom_table, nom_champ, liste_clefs, enreg)
                if enreg != None :
                        self.__doc__.insert_text(valeur)
                else :
                        self.__doc__.text(name = nom_champ, size = longueur, maxlength = maxlongueur, value = "")
                self.__doc__.pop()


        def champ_saisie_table_simple(self, nom_table, liste_clefs, nom_champ, longueur, maxlongueur, titre, enreg, penreg):
                if titre != "":
                        self.__doc__.tr(align="right")
                        self.__doc__.push()
                        self.__doc__.td(align="left", valign="center")
                        self.__doc__.u()
                        self.__doc__.font(titre, size=collectionconf.font_size)
                        self.__doc__.pop()
                        self.__doc__.td()
                self.__doc__.push()
                self.__doc__.font(size=collectionconf.font_size)

                valeur = self.recupere_valeur( nom_table, nom_champ, liste_clefs, enreg)
                if valeur != None :
                        self.__doc__.insert_text(valeur)
                else :
                        self.__doc__.insert_text("&nbsp;&nbsp;&nbsp;")
                if nom_champ != "f_typos5":
                        self.__doc__.insert_text("-")
                self.__doc__.pop()



###########################################################
        def __menuparametre__(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(bgcolor = collectionconf.basform_bgcolorright, valign = "Middle", align = "center")
                self.__doc__.font(size = collectionconf.font_size)
                if enreg != None :
                        self.__doc__.submit(name = "action", value = "Modifier")
                        self.__doc__.br()
                        self.__doc__.submit(name = "action", value = "Supprimer")
                        if self.__parent__ == self.__tablename__ :
                                self.__doc__.br()
                                self.__doc__.submit(name = "action", value = self.__new_record__)
                else :
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Créer")
                        self.__doc__.br()
                        self.__doc__.reset(value = "R-à-Zéro")
                self.__doc__.pop()

        def formulaire_hook_parametre(self, enreg = None, current = 0, maximum = 0, penreg = None) :
                self.__doc__.push()
                self.__doc__.div(align="center")

                self.__doc__.table(border = "5", cellpadding = "5", cellspacing = "5")

                if enreg :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(colspan = 2, valign="middle", align="center")
                        self.__doc__.font(size = collectionconf.font_size)

                        if maximum :
                                self.__doc__.a("Première", href = "#anchor_" + self.__tablename__ + "0")
                                self.__doc__.insert_text("&nbsp;" * 5)
                                if current :
                                        self.__doc__.a("Précédente", href = "#anchor_" + self.__tablename__ + `current - 1`)
                                else :
                                        self.__doc__.insert_text("Précédente")
                                self.__doc__.insert_text("&nbsp;" * 5)

                        self.__doc__.push()
                        self.__doc__.font(color = "red")
                        self.__doc__.a(`current + 1` + " / " + `maximum + 1`, name = "anchor_" + self.__tablename__ + `current`)
                        self.__doc__.pop()

                        if maximum :
                                self.__doc__.insert_text("&nbsp;" * 5)
                                if current != maximum:
                                        self.__doc__.a("Suivante", href = "#anchor_" + self.__tablename__ + `current + 1`)
                                else :
                                        self.__doc__.insert_text("Suivante")
                                self.__doc__.insert_text("&nbsp;" * 5)
                                self.__doc__.a("Dernière", href = "#anchor_" + self.__tablename__ + `maximum`)

                        self.__doc__.br()
                        self.__doc__.font(size = collectionconf.font_size)
                        if self.__vraiparent__ != None :
                                dico = { "action" : "Chercher" }
                                for clef in self.__clefsparent__() :
                                        dico[clef] = enreg[clef]
                                self.__doc__.a(string.capitalize(self.__vraiparent__), href = collectionconf.script_location("mod" + self.__vraiparent__) + "?" + urllib.urlencode(dico))

                        if hasattr(self, "__listenfants__") :
                                dico = { "action" : "Chercher" }
                                for clef in self.__listeclefs__ :
                                        dico[clef] = enreg[clef]
                                for enfant in self.__listenfants__ :
                                        self.__doc__.insert_text("&nbsp;" * 5)
                                        self.__doc__.a(string.capitalize(enfant) + 's', href = collectionconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico))

                        self.__doc__.pop()


                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.form(method = "POST", action = collectionconf.script_location("mod" + self.__tablename__))
                self.__formgenerique__(enreg, penreg)
                self.__menuparametre__(enreg, penreg)
                self.__doc__.pop()
                if enreg != None :
                        if hasattr(self, "__formsupp__") :
                                for f in self.__formsupp__ :
                                        # on vire l'eventuel 's' final et si on est dans __listenfants__ alors on n'affiche pas
                                        # trouver une meilleure solution un jour
                                        if (not hasattr(self, "__listenfants__")) or (f[:-1] not in self.__listenfants__) :
                                                if hasattr(self, f) :
                                                        getattr(self, f)(enreg, penreg)
                self.__doc__.pop()

        def traite_parametre(self, primarykeys, parent = None, penreg = None) :
                if not parent :
                        parent = self.__tablename__

                if self.__form__.has_key("action") and (self.__form__["action"].value == "Chercher") :
                        enregs = self.recherche_complete(penreg = penreg)
                        lg = len(enregs)
                        if lg :
                                i = 0
                                for enreg in enregs :
                                        self.formulaire_hook(enreg, current = i, maximum = lg - 1, penreg = penreg)
                                        i = i + 1
                        else :
                                if self.__parent__ == self.__tablename__ :
                                        self.__doc__.push()
                                        self.__doc__.div(align = "center")
                                        self.__doc__.font("Aucun enregistrement trouvé", color = "red")
                                        self.__doc__.pop()
                                        self.formulaire_hook(penreg = penreg)
                elif self.have_primarykeys(primarykeys) :
                        #
                        # si le champ action existe alors on veut supprimer ou modifier ou créer
                        if self.__form__.has_key("action") :
                                if self.__form__["action"].value == "Modifier" :
                                        if not self.__verify_mandatory__() :
                                                if self.modifier() :
                                                        # l'utilisateur tente de dupliquer un enregistrement
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else :
                                                        # tout c'est bien passé, on réaffiche la liste
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value == "Supprimer" :
                                        if self.supprimer() :
                                                # il reste des enregistrements dans d'autres tables qui dépendent de celui-ci
                                                self.__doc__.script('alert("Suppression impossible !!!")')
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                # la suppression a bien eu lieu
                                                if not parent :
                                                        self.formulaire_hook_parametre(penreg = penreg)
                                                else :
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value == "Créer" :
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()
                                                if retour == -1:
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        if not parent :
                                                                self.formulaire_hook_parametre(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                elif retour == -2:
                                                        self.__doc__.script("""alert("Enregistrement impossible à créer car il n'a aucun parent !!!")""")
                                                        if not parent :
                                                                self.formulaire_hook_parametre(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else :
                                                        # tout c'est bien passé, on réaffiche la liste
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        if not parent :
                                                                self.formulaire_hook_parametre(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value != self.__new_record__ :
                                        collectionconf.log_message("Action " + self.__form__["action"].value + " non reconnue")
                                        self.formulaire_hook_parametre(penreg = penreg)
                                else :
                                        self.formulaire_hook_parametre(penreg = penreg)
                        else :
                                #
                                # la requete ne doit retourner qu'un enregistrement sinon la base est pourrie
                                # mais ce n'est pas grave, on fait "générique"
                                enregs = self.get_records(primarykeys)
                                if len(enregs) :
                                        for enreg in enregs :
                                                self.formulaire_hook_parametre(enreg, penreg = penreg)
                                else :
                                        collectionconf.log_message("Tentative d'accès à un enregistrement d'identifiant inexistant")
                                        self.formulaire_hook_parametre(penreg = penreg)
                else :
                        # je me demande ce qui reste execute dans ce qui est ci-dessous
                        # il est grand temps de faire le menage !!!
                        #
                        #
                        # si le champ action existe alors on veut créer ou avoir un formulaire vide
                        if self.__form__.has_key("action") :
                                if self.__form__["action"].value == "Créer" :
                                        # toutes les clefs primaires ne sont pas remplies, on ne
                                        # vient ici (code dupliqué) que pour que les messages d'erreur adéquats s'affichent
                                        # en effet verify_mandatory devrait tomber tout le temps en erreur car les clefs
                                        # primaires sont aussi des champs obligatoires (sinon y'a un bleme)
                                        # dans l'avenir mettre tout ca sous forme de fonction
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()
                                                if retour :
                                                        self.__doc__.script('alert("Enregistrement déjà existant !!!")')
                                                        self.formulaire_hook_parametre(penreg)
                                                else :
                                                        # tout c'est bien passé
                                                        # et on passe en modif sur l'enregistrement courant
                                                        self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        self.formulaire_hook_parametre(penreg = penreg)
                                elif self.__form__["action"].value == self.__new_record__ :
                                        if not parent :
                                                self.formulaire_hook_parametre(penreg = penreg)
                                        else :
                                                self.__doc__.script('parent.bas.location = "' + collectionconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                else :
                                        collectionconf.log_message("Action [" + self.__form__["action"].value + "] non reconnue")
                                        self.formulaire_hook_parametre(penreg = penreg)
                        else :
                                # sinon affichage de l'écran de saisie vide
                                self.formulaire_hook_parametre(penreg = penreg)

                # si c'est une table "mere" (ex: roche")
                # on sort le document
                if self.__parent__ == self.__tablename__ :
                        self.__doc__.output()
                else :
                        #
                        # sinon on ajoute en plus un formulaire vide pour pouvoir ajouter
                        self.formulaire_hook_parametre(penreg = penreg)
