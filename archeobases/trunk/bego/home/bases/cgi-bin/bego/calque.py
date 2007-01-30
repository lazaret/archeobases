#! /usr/bin/env python

import sys
import os
import string
import database
import begoconf

def transfere_fichier(infile, taille, mogrify) :
        """Stocke le fichier sur le disque et lance la commande mogrify appropri�e"""
        inf = open(infile, "rb")
        fout = open(taille, "wb")
        fout.write(inf.read())
        fout.close()
        inf.close()
        cmd = mogrify + ' "' + taille + '" >/dev/null'
        if os.system(cmd) :
		raise "Erreur"

def creer_image(z = "", g = "", r = "", f = "", fg = "") :
        # on commence par cr�er le r�pertoire destination s'il n'existe pas d�j�
        (zone, groupe, roche, face, figure) = (z, g, r, f, fg)
        try :
                z = "Z" + z
                rep = begoconf.image_fullname(z)
                if not os.path.isdir(rep) :
                        os.mkdir(rep, 0755)

                if g :
                        g = "G" + g
                        rep = begoconf.image_fullname(z + os.sep + g)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                if r :
                        r = "R" + r 
                        rep = begoconf.image_fullname(z + os.sep + g + os.sep + r)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                if f : 
                        f = "F" + f
                        rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                if fg :
                        fg = "Fg" + fg
                        rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + fg)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)
        except OSError, msg:
                sys.stderr.write("Impossible de cr�er le r�pertoire [%s] ou l'un de ses composants: %s" % (rep, msg))

        #
        idphoto = db.query("select nextval('seq_photofigure');").dictresult()[0]['nextval']
        fname = rep + os.sep + `idphoto`
        small = fname + "s.jpeg"
        big = fname + ".jpeg"
        normale = fname + ".tiff"

        # on ins�re maintenant la photo dans la base
        # mais seulement si le chargement des images a fonctionn�
        try :
                transfere_fichier("tempo.tiff", normale, begoconf.mogrify_normale)
                transfere_fichier("tempo.tiff", small, begoconf.mogrify_small)
                transfere_fichier("tempo.tiff", big, begoconf.mogrify_Moyenne)
                
                req = "INSERT INTO photofigure(idphoto, zone, groupe, roche, face, figure) VALUES (" + db.quote(idphoto, "decimal") + ", " + db.quote(zone, "decimal") + ", " + db.quote(groupe, "decimal") + ", " + db.quote(roche, "text") + ", " + db.quote(face, "text") + ", " + db.quote(figure, "text") + ");"
                db.query(req)
                print idphoto
		sys.stdout.flush()
        except :
                sys.stderr.write("Impossible de transf�rer la photo [%s]\n"  % (fname))
		sys.stderr.flush()
                        
def parcours(param, dirname, names) :
        (db, sf) = param
        arabe = {"I":"1","II":"2","III":"3","IV":"4","V":"5","VI":"6","VII":"7","VIII":"8","IX":"9","X":"10","XI":"11","XII":"12","XIII":"13","XIV":"14","XV":"15","XVI":"16","XVII":"17","XVIII":"18","XIX":"19","XX":"20","XXI":"21"}         
        grec = {"a":"@a","b":"@b","c":"@c","d":"@d","e":"@e","f":"@f","g":"@g","h":"@h","i":"@i","j":"@j","k":"@k","l":"@l","m":"@m","n":"@n","o":"@o","p":"@p","q":"@q","r":"@r","s":"@s","t":"@t","u":"@u","v":"@v","w":"@w","x":"@x","y":"@y","z":"@z"}


	sf.write("") 


        for filename in names :
                fichier = os.path.join(dirname, filename)
                if os.path.isfile(fichier) :

                        filename = string.replace(filename,'Conti','') 
                        
                        # on decoupe le nom du fichier en z,g,r,f,fg
                        if string.find(fichier, 'Gravure') >= 0 :
				sf.write("[%s]\n" % (filename))
	
                                z = string.find(filename,'Z')
                                g = string.find(filename,'G')
                                r = string.find(filename,'R')
                                t1 = string.find(filename,'-')
                                f = string.find(filename,'F')
                                t2 = string.rfind(filename,'-')
                                pt = string.find(filename,'.')
                        
                                # on convertit les chiffres romain en chiffres arabes
                                zone = arabe[filename[z+1:g]]                   
                                groupe = arabe[filename[g+1:r]]
                                roche  = filename[r+1:t1]
                                
                                # on remplace les petites lettres par @petite lettre
                                for i in grec.keys():
                                        #print roche,i,grec[i]
                                        if string.find(roche, 'bis') < 0:
                                                roche = string.replace(roche,i,grec[i])
                                
                                if t2 != t1:
                                        figure = filename[t1+1:t2]                                      
                                else:
                                        figure = filename[t1+1:pt]
                                
                                # on recupere la face correspondante � la figure
                                requete = "SELECT face FROM figure WHERE zone=%s AND groupe=%s AND roche=%s AND figure=%s;" % (db.quote(zone,"decimal"), db.quote(groupe,"decimal"), db.quote(roche,"text"), db.quote(figure,"text")) 
                                resultat = db.query(requete).dictresult()
                                if len(resultat) :
                                        face = resultat[0]["face"]
                                        #on insere la nouvelle photo dans la table photofigure
                                        if not os.system('zcat <"%s" >%s' % (fichier, "tempo.tiff")) :
                                                creer_image(zone, groupe, roche, face, figure)
                                        else :
                                                sys.stderr.write("erreur sur [%s]\n" % fichier)
                                else :          
                                        sf.write("[%s] => [%s %s %s %s]\n" % (fichier, zone, groupe, roche, figure))



db = database.DataBase(database = "bego", username = "bego", debuglevel = 0)


sf = open("sansface.lst", "w")
sf.write("Liste des fichiers n'ayant pas de face correspondante\n") 
sf.write("-----------------------------------------------------\n\n") 
os.path.walk("cdrom", parcours, (db, sf))
sf.close()





