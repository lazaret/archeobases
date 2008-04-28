#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org

# recupere les images d'un cd pour les inserer dans la base


import sys
import os
import string
import database
import archeoconf


def transfere_fichier(infile, taille, mogrify) :
        """Stocke le fichier sur le disque et lance la commande mogrify appropriée"""
        inf = open(infile, "rb")
        fout = open(taille, "wb")
        fout.write(inf.read())
        fout.close()
        inf.close()
        cmd = mogrify + ' "' + taille + '" >/dev/null'
        if os.system(cmd) :
                raise "Erreur"

def creer_image(z = "", n = "", b = "") :
        # on commence par créer le repertoire destination s'il n'existe pas déjà
        (zone, numero, bis) = (z, n, b)
        try :
                z = "Z" + z
                rep = archeoconf.image_fullname(z)
                if not os.path.isdir(rep) :
                        os.mkdir(rep, 0755)

                if n :
                        n = "N" + n
                        rep = archeoconf.image_fullname(z + os.sep + n)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                if b :
                        b = "B" + b
                        rep = archeoconf.image_fullname(z + os.sep + n + os.sep + b)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)
        except OSError, msg:
                sys.stderr.write("Impossible de créer le repertoire [%s] ou l'un de ses composants: %s" % (rep, msg))

        #
        idphoto = db.query("select nextval('seq_photoindustrie');").dictresult()[0]['nextval']
        fname = rep + os.sep + `idphoto`
        small = fname + "s.jpeg"
        big = fname + ".jpeg"
        normale = fname + ".tiff"

        # on insère maintenant la photo dans la base
        # mais seulement si le chargement des images a fonctionné
        try :
                transfere_fichier("tempo.tiff", normale, archeoconf.mogrify_normale)
                transfere_fichier("tempo.tiff", small, archeoconf.mogrify_small)
                transfere_fichier("tempo.tiff", big, archeoconf.mogrify_Moyenne)

                req = "INSERT INTO photoindustrie(idphoto, zone, numero, bis) VALUES (" + db.quote(idphoto, "decimal") + ", " + db.quote(zone, "text") + ", " + db.quote(numero, "decimal") + ", " + db.quote(bis, "text") + ");"
                print(req)
                print idphoto
                sys.stdout.flush()
        except :
                sys.stderr.write("Impossible de transferer la photo [%s]\n"  % (fname))
                sys.stderr.flush()

def parcours(param, dirname, names) :
        (db, sf) = param
        sf.write("")

        for filename in names :
                if (string.find(filename,"Locus") == -1) and (string.find(filename,"LAZARET") == -1):
                        fichier = os.path.join(dirname, filename)
                        print("filename : ", filename)
                        if os.path.isfile(fichier) :

                                # on decoupe le nom du fichier en z,n,b
                                sf.write("[%s]\n" % (filename))
                                fields = string.split(filename, " ")

                                z = fields[0]

                                if len(fields) == 3:
                                        n = fields[2][:-4]
                                        if string.find(filename, "bis"):
                                                n = string.replace(fields[2][:-4],"bis","")
                                                b = "R"
                                        else:
                                                n = fields[2][:-4] #sauf les 4 derniers caracteres
                                                b = "--"

                                        print ("zone:",z, " numero:",n, " bis:",b)
                                        requete = "SELECT count(*) FROM industrie WHERE zone=%s AND numero=%s AND bis=%s;" % (db.quote(z,"text"), db.quote(n,"decimal"), db.quote(b, "text"))
                                        resultat = db.query(requete).dictresult()
                                        if len(resultat) :
                                                #on insere la nouvelle photo dans la table photofigure
                                                creer_image(z,n,b)
                                        else :
                                                        sf.write("[%s] => [%s %s %s %s] pas de parent\n" % (fichier, z, n,b))

                                else:
                                        sf.write("[%s] => non recupere\n" % (fichier, z, n,b))



db = database.DataBase(database = "lazaret", username = "rachel", debuglevel = 0)


sf = open("sansparent.lst", "w")
os.path.walk("/cdrom", parcours, (db, sf))
sf.close()





