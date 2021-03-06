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
# $Id: begodata.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: begodata.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.4  2000/05/28 17:01:14  jerome
# Mise en place des liens parents/enfants et suppression (par test uniquement,
# le code reste en place) de l'affichage complet tel qu'il existait avant
#
# Revision 1.3  2000/05/27 13:58:57  jerome
# Int�gration du message de Log
#
#

import string
import cgi
import urllib
import begoconf

class Data :
        def __init__(self, parent) :
                t = " des " + string.capitalize(self.__tablename__)
                if t[-1] != 's' :
                        t = t + 's'

                if parent == "bas" :
                        self.__doc__ = begoconf.Bas("Saisie" + t, "Saisie" + t)
                        self.__form__ = cgi.FieldStorage()
                        self.__db__ = begoconf.BegoDataBase()
                        self.__parent__ = self.__tablename__ # est son propre parent
                else :
                        # si ca ne vaut pas "bas" on consid�re que c'est
                        # une instance de la classe "parent"
                        # donc on simule l'heritage
                        self.__doc__ = parent.getcurdoc()
                        self.__form__ = parent.getcurform()
                        self.__db__ = parent.getcurdb()
                        self.__parent__ = parent.gettablename()

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
                                        rebuiltform[f] = self.__form__[f].value
                        return urllib.urlencode(rebuiltform)
                else :
                        return ""

        def __getfield__(self, fieldname) :
                """Renvoie la valeur d'un champ pour l'ecrire dans la base"""
                if self.__form__.has_key(fieldname) :
                        # le champ existe dans le formulaire
                        value = self.__form__[fieldname].value
                else :
                        # le champ n'est pas dans le formulaire => valeur par defaut
                        value = self.__champs__[fieldname]["default"]

                # transforme si besoin la valeur du champ pour l'ecrire dans la base
                if hasattr(self, fieldname + "_form_to_base") :
                        value = getattr(self, fieldname + "_form_to_base")(value)
                return self.__db__.quote(value, self.__champs__[fieldname]["type"])

        def __createwhere__(self, fields) :
                """Cr�e une clause WHERE en fonction de la liste de champs passee en param�tre"""
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
                                aumoinsun = 1
                        return where[:-5]       # on supprime le dernier " AND "
                else :
                        return ""

        def __verify_mandatory__(self) :
                """V�rifie que les champs obligatoires sont bien remplis, et sinon affiche une boite d'alerte"""
                not_ok = 0
                for champ in self.__champs__.keys() :
                        try :
                                if self.__champs__[champ]["mandatory"] :
                                        if not (self.__form__.has_key(champ) and (string.strip(self.__form__[champ].value) != "")) :
                                                not_ok = not_ok + 1
                                                self.__doc__.script('alert("Champ ' + champ + ' obligatoire !!!")')
                                        else :
                                                if hasattr(self, champ + "_verify") :
                                                        if getattr(self, champ + "_verify")(self.__form__[champ].value) :
                                                                not_ok = not_ok + 1
                                                                self.__doc__.script('alert("Le champ ' + champ + ' a un contenu invalide !!!")')
                        except AttributeError, msg :
                                begoconf.fatalerror_message("Erreur sur la v�rification du champ obligatoire %s : %s [%s]" % (champ, msg, self.__form__[champ]))
                return not_ok

        def __formgenerique__(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td( bgcolor = begoconf.basform_bgcolorleft, width = "85%")
                self.__doc__.div(align="center")
                self.__doc__.table(border = "0", cellpadding = "0", cellspacing = "0")

                for champ in self.__ordrechamps__ :
                        if hasattr(self, champ + "_base_to_form") :
                                getattr(self, champ + "_base_to_form")(enreg, penreg)
                self.__doc__.pop()

        def __menugenerique__(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(bgcolor = begoconf.basform_bgcolorright, valign = "Middle", align = "center")
                self.__doc__.font(size = begoconf.font_size)
                if enreg != None :
                        self.__doc__.submit(name = "action", value = "Modifier")
                        self.__doc__.br()
                        self.__doc__.submit(name = "action", value = "Supprimer")
                        if self.__parent__ == self.__tablename__ :
                                self.__doc__.br()
                                self.__doc__.submit(name = "action", value = self.__new_record__)
                else :
                        self.__doc__.push()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Chercher")
                        self.__doc__.pop()
                        self.__doc__.p()
                        self.__doc__.submit(name = "action", value = "Cr�er")
                        self.__doc__.br()
                        self.__doc__.reset(value = "R-�-Z�ro")
                self.__doc__.pop()

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
                """Teste si un enregistrement existe avec la valeur value pour le champ field, renvoie le nbre d'enregistrements concernes, ou 0 sinon"""
                if table == None :
                        table = self.__tablename__

                query = "SELECT COUNT(*) FROM " + table + self.__createwhere__(champs) + ";"
                res = self.__db__.query(query)
                res = res.dictresult()
                return res[0]["count"]

        def get_records(self, primarykeys = None, table = None) :
                """Renvoie les enregistrements correspondant � la liste des clefs pass�e en param�tre"""
                if table == None :
                        table = self.__tablename__
                res = self.__db__.query("SELECT * FROM " + table + self.__createwhere__(primarykeys) + ";")
                return res.dictresult()

        def delete_records(self, primarykeys, table = None) :
                if table == None :
                        table = self.__tablename__
                return self.__db__.query("DELETE FROM " + table + self.__createwhere__(primarykeys) + ";")

        def make_update_query(self, primarykeys, table = None):
                """Calcule la requete de mise a jour"""
                if table == None :
                        table = self.__tablename__
                query = "UPDATE " + table + " SET "
                for champ in self.__listechamps__ :
                        #
                        # attention, dans cette application on ne peut pas modifier
                        # les clefs primaires, donc on optimise en n'ajoutant
                        # aucune de celles-ci � la requete de mise � jour.
                        # si on veut l'autoriser, il faut enlever le if ci-dessous
                        if champ not in primarykeys :
                                query = query + champ + "=" + self.__getfield__(champ) + ", "
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
                        query = query + champ + ", "

                query = query[:-2] + ") VALUES ("

                for primarykey in primarykeys.keys() :
                        if type(primarykeys[primarykey]) == type("") :
                                query = query + self.__db__.quote(primarykeys[primarykey], "text")
                        else :
                                query = query + `primarykeys[primarykey]`
                        query = query + ", "

                for champ in self.__listechamps__ :
                        query = query + self.__getfield__(champ) + ", "
                query = query[:-2] + ");"
                return query

        def formulaire_hook(self, enreg = None, current = 0, maximum = 0, penreg = None) :
                self.__doc__.push()
                self.__doc__.div(align="center")

                self.__doc__.table(border = "5", cellpadding = "5", cellspacing = "5")

                if enreg :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(colspan = 2, valign="middle", align="center")
                        self.__doc__.font(size = begoconf.font_size)

                        if maximum :
                                self.__doc__.a("Premi�re", href = "#anchor_" + self.__tablename__ + "0")
                                self.__doc__.insert_text("&nbsp;" * 5)
                                if current :
                                        self.__doc__.a("Pr�c�dente", href = "#anchor_" + self.__tablename__ + `current - 1`)
                                else :
                                        self.__doc__.insert_text("Pr�c�dente")
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
                                self.__doc__.a("Derni�re", href = "#anchor_" + self.__tablename__ + `maximum`)
                                
                        self.__doc__.br()
                        self.__doc__.font(size = begoconf.font_size)
                        if self.__vraiparent__ != None :        
                                dico = { "action" : "Chercher" }
                                for clef in self.__clefsparent__() :
                                        dico[clef] = enreg[clef]
                                self.__doc__.a(string.capitalize(self.__vraiparent__), href = begoconf.script_location("mod" + self.__vraiparent__) + "?" + urllib.urlencode(dico))
                                
                        if hasattr(self, "__listenfants__") :
                                dico = { "action" : "Chercher" }
                                for clef in self.__listeclefs__ :
                                        dico[clef] = enreg[clef]
                                for enfant in self.__listenfants__ :
                                        self.__doc__.insert_text("&nbsp;" * 5)
                                        self.__doc__.a(string.capitalize(enfant) + 's', href = begoconf.script_location("mod" + enfant) + "?" + urllib.urlencode(dico))
                                
                        self.__doc__.pop()
                        

                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.form(method = "POST", action = begoconf.script_location("mod" + self.__tablename__))
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

        def compte_theme(self,  nom_champs, critere, enreg) :
                nb = self.__db__.query("SELECT COUNT(*) FROM figure WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text") + " AND " +  nom_champs  + " LIKE " + self.__db__.quote(critere, "text") + ";" )
                nb = nb.dictresult()
                nb = nb[0]["count"]
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.insert_text(`nb`)
                return nb

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
                                #
                                # A NE REACTIVER QU'EN CAS DE BESOIN (recherche non stricte)
                                #
                                vc = self.__form__[c].value
                                if hasattr(self, c + "_form_to_base") :
                                        vc = getattr(self, c + "_form_to_base")(vc)
                                val = self.__db__.quote(vc, self.__champs__[c]["type"])
                                w = w + "(" + c + " = " + val + ") AND "
                        elif penreg and penreg.has_key(c) :
                                val = self.__db__.quote(penreg[c], self.__champs__[c]["type"])
                                w = w + "(" + c + " = " + val + ") AND "
                if w :
                        q = (q + " WHERE " + w)[:-5]
                if hasattr(self, "__orderby__") :
                        q = q + getattr(self, "__orderby__")
                res = self.__db__.query(q)
                return res.dictresult()

        def have_primarykeys(self, pkeys) :
                for pk in pkeys :
                        if not self.__form__.has_key(pk) :
                                return 0
                return 1

        def traite_saisie(self, primarykeys, parent = None, penreg = None) :
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
                                        self.__doc__.font("Aucun enregistrement trouv�", color = "red")
                                        self.__doc__.pop()
                                        self.formulaire_hook(penreg = penreg)
                elif self.have_primarykeys(primarykeys) :
                        #
                        # si le champ action existe alors on veut supprimer ou modifier ou cr�er
                        if self.__form__.has_key("action") :
                                if self.__form__["action"].value == "Modifier" :
                                        if not self.__verify_mandatory__() :
                                                if self.modifier() :
                                                        # l'utilisateur tente de dupliquer un enregistrement
                                                        # self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                        self.__doc__.script('alert("Enregistrement d�j� existant !!!")')
                                                        self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else :
                                                        # tout c'est bien pass�, on r�affiche la liste
                                                        # et on passe en modif sur l'enregistrement courant
                                                        #self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                        self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                #self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value == "Supprimer" :
                                        if self.supprimer() :
                                                # il reste des enregistrements dans d'autres tables qui d�pendent de celui-ci
                                                self.__doc__.script('alert("Suppression impossible !!!")')
                                                #self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                # la suppression a bien eu lieu
                                                if not parent :
                                                        self.formulaire_hook(penreg = penreg)
                                                else :
                                                        self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value == "Cr�er" :
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()
                                                if retour == -1:
                                                        self.__doc__.script('alert("Enregistrement d�j� existant !!!")')
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                elif retour == -2:
                                                        self.__doc__.script("""alert("Enregistrement impossible � cr�er car il n'a aucun parent !!!")""")
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                                else :
                                                        # tout c'est bien pass�, on r�affiche la liste
                                                        # et on passe en modif sur l'enregistrement courant
                                                        # self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                        self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        if not parent :
                                                                self.formulaire_hook(penreg = penreg)
                                                        else :
                                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                elif self.__form__["action"].value != self.__new_record__ :
                                        begoconf.log_message("Action " + self.__form__["action"].value + " non reconnue")
                                        self.formulaire_hook(penreg = penreg)
                                else :
                                        #if not parent :
                                        self.formulaire_hook(penreg = penreg)
                                        #else :
                                        #        begoconf.fatalerror_message("On ne devrait pas arriver ici: %s %s" % (self.__new_record__, self.__tablename__))
                        else :
                                #
                                # la requete ne doit retourner qu'un enregistrement sinon la base est pourrie
                                # mais ce n'est pas grave, on fait "g�n�rique"
                                enregs = self.get_records(primarykeys)
                                if len(enregs) :
                                        for enreg in enregs :
                                                self.formulaire_hook(enreg, penreg = penreg)
                                else :
                                        begoconf.log_message("Tentative d'acc�s � un enregistrement d'identifiant inexistant")
                                        self.formulaire_hook(penreg = penreg)
                else :
                        # je me demande ce qui reste execute dans ce qui est ci-dessous
                        # il est grand temps de faire le menage !!!
                        #
                        #
                        # si le champ action existe alors on veut cr�er ou avoir un formulaire vide
                        if self.__form__.has_key("action") :
                                if self.__form__["action"].value == "Cr�er" :
                                        # toutes les clefs primaires ne sont pas remplies, on ne
                                        # vient ici (code dupliqu�) que pour que les messages d'erreur ad�quats s'affichent
                                        # en effet verify_mandatory devrait tomber tout le temps en erreur car les clefs
                                        # primaires sont aussi des champs obligatoires (sinon y'a un bleme)
                                        # dans l'avenir mettre tout ca sous forme de fonction
                                        if not self.__verify_mandatory__() :
                                                (retour, pkeys) = self.creer()
                                                if retour :
                                                        self.__doc__.script('alert("Enregistrement d�j� existant !!!")')
                                                        self.formulaire_hook(penreg)
                                                else :
                                                        # tout c'est bien pass�
                                                        # et on passe en modif sur l'enregistrement courant
                                                        #self.__doc__.script('parent.bas.location = "' + self.__doc__.script_name() + '?' + self.__make_url__(primarykeys) + '"')
                                                        self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                        else :
                                                        self.formulaire_hook(penreg = penreg)
                                elif self.__form__["action"].value == self.__new_record__ :
                                        if not parent :
                                                self.formulaire_hook(penreg = penreg)
                                        else :
                                                self.__doc__.script('parent.bas.location = "' + begoconf.script_location("mod" + parent) + '?action=Chercher&' + self.__make_url__(primarykeys) + '"')
                                else :
                                        begoconf.log_message("Action [" + self.__form__["action"].value + "] non reconnue")
                                        self.formulaire_hook(penreg = penreg)
                        else :
                                # sinon affichage de l'�cran de saisie vide
                                self.formulaire_hook(penreg = penreg)

                # si c'est une table "mere" (ex: roche")                                
                # on sort le document
                if self.__parent__ == self.__tablename__ :
                        self.__doc__.output()
                else :
                        #
                        # sinon on ajoute en plus un formulaire vide pour pouvoir ajouter
                        self.formulaire_hook(penreg = penreg)
