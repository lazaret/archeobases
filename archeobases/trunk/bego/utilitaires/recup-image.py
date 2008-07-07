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

# recupere les images d'un cd pour les inserer dasn la base

import sys
import os
import string
import database
import archeoconf


def transfere_fichier(infile, taille, mogrify) :
    """Stocke le fichier sur le disque et lance la commande mogrify appropriee"""
    inf = open(infile, "rb")
    fout = open(taille, "wb")
    fout.write(inf.read())
    fout.close()
    inf.close()
    cmd = mogrify + ' "' + taille + '" >/dev/null'
    if os.system(cmd) :
        raise "Erreur"

def creer_image(z = "", n = "", b = "") :
    # on commence par creer le repertoire destination s'il n'existe pas deja
    (zone, numero, bis, face) = (z, n, b)
    try :
        z = "Z" + z
        rep = archeoconf.image_fullname(z)
        if not os.path.isdir(rep) :
                os.mkdir(rep, 0755)
        if n :
            n = "N" + n
            rep = archeooconf.image_fullname(z + os.sep + n)
            if not os.path.isdir(rep) :
                os.mkdir(rep, 0755)
        if b :
            b = "B" + b
            rep = archeooconf.image_fullname(z + os.sep + n + os.sep + b)
            if not os.path.isdir(rep) :
                os.mkdir(rep, 0755)
    except OSError, msg:
        sys.stderr.write("Impossible de créer le répertoire [%s] ou l'un de ses composants: %s" % (rep, msg))
    #
    idphoto = db.query("select nextval('seq_photoindustrie');").dictresult()[0]['nextval']
    fname = rep + os.sep + `idphoto`
    small = fname + "s.jpeg"
    big = fname + ".jpeg"
    normale = fname + ".tiff"
    # on insere maintenant la photo dans la base
    # mais seulement si le chargement des images a fonctionne
    try :
        transfere_fichier("tempo.tiff", normale, archeoconf.mogrify_normale)
        transfere_fichier("tempo.tiff", small, archeoconf.mogrify_small)
        transfere_fichier("tempo.tiff", big, archeoconf.mogrify_Moyenne)

        req = "INSERT INTO photoindustrie(idphoto, zone, numero, bis) VALUES (" + db.quote(idphoto, "decimal") + ", " + db.quote(zone, "text") + ", " + db.quote(numero, "decimal") + ", " + db.quote(bis, "text") + ");"
        db.query(req)
        print idphoto
    sys.stdout.flush()
    except :
        sys.stderr.write("Impossible de transf�rer la photo [%s]\n"  % (fname))
    sys.stderr.flush()

def parcours(param, dirname, names) :
    (db, sf) = param
    sf.write("")
        for filename in names :
            fichier = os.path.join(dirname, filename)
            if os.path.isfile(fichier) :
                # on decoupe le nom du fichier en z,n,b
                if string.find(fichier, 'Gravure') >= 0 :
            sf.write("[%s]\n" % (filename))
            fields = string.split(fichier, " ")
                z = fields[0]
            if string.find(filename, 'bis'):
                n = string.replace(fields[2],"bis","")
                bis = "R"
            else:
                n = fields[2]
                bis = "--"
            print ("zone:",z, " numero:",n, " bis:",b)

os.path.walk("/cdrom", parcours, (db, sf))
sf.close()
