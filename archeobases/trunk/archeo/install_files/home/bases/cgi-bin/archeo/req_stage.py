#! /usr/bin/python

import cgi
import pg
import jaxml

class Requete(jaxml.CGI_document) :
    def initialise(self, requete = "") :
        self._default_header(title="Requêtes SQL")
        self.body(bgcolor="white")
        self._push()
        self.h2("Initiation aux SGBDR  - Tester vos SELECT sur la Base d'exemple 'biblio' ")
        self.h3("Entrez vos requêtes ci-dessous:")
        self.form(action=self._script_name(), method="POST")
        self._push()
        self.textarea(requete, name = "requete", rows = "10", cols = "70", wrap = "physical")
        self._pop()
        self._br()
        self._submit(name = "action", value = "ENVOYER")
        self._reset(value = "ANNULER")
        self._pop()
        
    def affresultat(self, result) :
        self._push()
        self.h3("Résultat:")
        if type(result) == type("") :
            msg1 = "Permission denied."
            msg2 = "you do not own"
            if (result[-len(msg1):] == msg1) or (result.find(msg2) != -1) : 
                msg = "Alors, on s'amuse ?"
            else :    
                msg = "L'exécution de votre requête a provoqué une erreur :"
            self.h4(msg)
            self.p("%s" % result)
        else :    
            headers = result[0].keys()
            self.table(cols=len(headers))
            self._push()
            self.tr(bgcolor="gold")
            for h in headers :
                self.th(h)
            self._pop()    
            for i in range(len(result)) :
                r = result[i]
                if i % 2 :
                    color = "#CECECE"
                else :    
                    color = "#DEDEDE"
                self._push()    
                self.tr(bgcolor=color)
                for h in headers :
                    self.td(r[h])
                self._pop()
        self._pop()
        
out = Requete()
if (out._request_method() == "POST") or not out._query_string() :
    requete = ""
    resultat = None
    form = cgi.FieldStorage()
    if form.has_key("requete") :
        requete = form["requete"].value.strip()
        if requete :
            if requete.upper().count("CREATE") :
                resultat = "Désolée, ceci est interdit !"
            else :
                try :
                    db = pg.connect(host = "localhost", dbname = "stage", user = "stageuser", passwd = None)
                    resultat = db.query(requete).dictresult()
                except AttributeError :
                    resultat = []
                except pg.error, resultat :
                    if resultat and (resultat[-1] == '\n') :
                        resultat = resultat[:-1]
                
    out.initialise(requete)
    if requete and resultat :
        out.affresultat(resultat)
    out.p()
    out._text("Pour accèder à un aide mémoire SQL et des exercices corrigés, veuillez visiter")
    out.a("Mon Site", href="http://rachel.familinux.org/")
else :        
    out._do_nothing()
out._output()

