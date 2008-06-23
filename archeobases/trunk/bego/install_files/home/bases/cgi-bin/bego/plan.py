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

import sys
import os
import string
import database
import begoconf


def transfere_fichier(infile, taille, mogrify):
    ### BUG indentations
    """Stocke le fichier sur le disque et lance la commande mogrify appropriée"""
    inf = open(infile, "rb")
    fout = open(taille, "wb")
    fout.write(inf.read())
    fout.close()
    inf.close()
    cmd = mogrify + ' "' + taille + '" >/dev/null'
    if os.system(cmd):
        raise "Erreur"

def creer_image(z="", g="", r="", f=""):
    # on commence par créer le repertoire destination s'il n'existe pas déjà
    (zone, groupe, roche, face) = (z, g, r, f)
    try:
        z = "Z" + z
        rep = begoconf.image_fullname(z)
        if not os.path.isdir(rep):
            os.mkdir(rep, 0755)
        if g:
            g = "G" + g
            rep = begoconf.image_fullname(z + os.sep + g)
            if not os.path.isdir(rep):
                os.mkdir(rep, 0755)
        if r:
            r = "R" + r
            rep = begoconf.image_fullname(z + os.sep + g + os.sep + r)
            if not os.path.isdir(rep):
                os.mkdir(rep, 0755)
        if f:
            f = "F" + f
            rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f)
            if not os.path.isdir(rep):
                os.mkdir(rep, 0755)
    except OSError, msg:
        sys.stderr.write("Impossible de créer le répertoire [%s] ou l'un de ses composants: %s" % (rep, msg))
    #
    idphoto = db.query("select nextval('seq_photoface');").dictresult()[0]['nextval']
    fname = rep + os.sep + `idphoto`
    small = fname + "s.jpeg"
    big = fname + ".jpeg"
    normale = fname + ".tiff"
    # on insère maintenant la photo dans la base
    # mais seulement si le chargement des images a fonctionné
    try:
        transfere_fichier("tempo.tiff", normale, begoconf.mogrify_normale)
        transfere_fichier("tempo.tiff", small, begoconf.mogrify_small)
        transfere_fichier("tempo.tiff", big, begoconf.mogrify_Moyenne)
        req = "INSERT INTO photoface(idphoto, zone, groupe, roche, face) VALUES (" + db.quote(idphoto, "decimal") + ", " + db.quote(zone, "decimal") + ", " + db.quote(groupe, "decimal") + ", " + db.quote(roche, "text") + ", " + db.quote(face, "text") + ");"
        db.query(req)
        print idphoto
        sys.stdout.flush()
    except:
        sys.stderr.write("Impossible de transferer la photo [%s]\n"  % (fname))
    sys.stderr.flush()

def parcours(db, dirname, names):
    arabe = {"I": "1", "II": "2", "III": "3", "IV": "4", "V": "5", "VI": "6", "VII": "7", "VIII": "8", "IX": "9",
        "X": "10", "XI": "11", "XII": "12", "XIII": "13", "XIV": "14", "XV": "15", "XVI": "16", "XVII": "17",
        "XVIII": "18", "XIX": "19", "XX": "20", "XXI": "21"}
    grec = {"a": "@a", "b": "@b", "c": "@c", "d": "@d", "e": "@e", "f": "@f", "g": "@g", "h": "@h", "i": "@i", "j": "@j",
        "k": "@k", "l": "@l", "m": "@m", "n": "@n", "o": "@o", "p": "@p", "q": "@q", "r": "@r", "s": "@s", "t": "@t",
        "u": "@u", "v": "@v", "w": "@w", "x": "@x", "y": "@y", "z": "@z"}
    for filename in names:
        fichier = os.path.join(dirname, filename)
        if os.path.isfile(fichier):
            z = string.find(filename, 'Z')
            g = string.find(filename, 'G')
            r = string.find(filename, 'R')
            t1 = string.find(filename, '-')
            f = string.find(filename, 'F')
            t2 = string.rfind(filename, '-')
# on convertit les chiffres romain en chiffres arabes
            zone = arabe[filename[z+1:g]]
            groupe = arabe[filename[g+1:r]]
            roche  = filename[r+1:t1]
            # on remplace les petites lettres par @petite lettre pour la roche
            for i in grec.keys():
                #print roche,i,grec[i]
                if string.find(roche, 'bis') < 0:
                    roche = string.replace(roche, i, grec[i])
        if f >= 0:
            face = filename[f+1:t2]
        else:
            face = 'a'
        print ("[%s]" % filename), zone, groupe, roche, face
                    #on insere la nouvelle photo dans la table photofigure

db = database.DataBase(database = "bego", username = "bego", debuglevel = 0)
os.path.walk("/home/rachel/cdrom", parcours, db)
