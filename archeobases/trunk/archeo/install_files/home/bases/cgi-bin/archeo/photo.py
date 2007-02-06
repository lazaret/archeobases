#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# archeo - (c) 1999      Jerome ALET <alet@unice.fr>
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
#
# $Id: photo.py,v 1.4 2001/07/05 15:29:33 rachel Exp $
#
# $Log: photo.py,v $
# Revision 1.4  2001/07/05 15:29:33  rachel
# plein de modifs
#
# Revision 1.3  2001/03/20 19:59:51  jerome
# Ajout des tags CVS Id et Log
#
#
#
import os
import string
import cgi
import archeoconf
import archeodata

class Photo(archeodata.Data) :
        #
        # les champs minimum de la table photoxx
        __color__ = archeoconf.bas_bgcolor
        __champs__ = { \
                        "idphoto" : { "type" : "seq", "default": "nextval('seq_idphoto')", "mandatory" : 1, "longueur" : 0}, \
                        "zone"    : { "type" : "text", "default": 0, "mandatory" : 1 ,"longueur" : 0}, \
                        "numero"  : { "type" : "decimal", "default" : 0, "mandatory" : 1, "longueur" : 0 }, \
                        "bis"     : { "type" : "text", "default" : "", "mandatory" : 1, "longueur" : 0 }, \
                        "legende" : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 50}, \
                    }

        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = [ "zone", "numero", "bis" ]

        def __init__(self, parent, nomtable) :
                self.__tablename__ = nomtable
                archeodata.Data.__init__(self, parent)

                # determine le nom de la table et les champs necessaires
                de = "de "
                if self.__tablename__ == "industrie" :
                        de = "d'"

                elif self.__tablename__ == "carnet" :
                        de = "du"
 
                else :     
                        de = "de"

                self.__listechamps__.append("legende")

                t = " des Photos " + de + string.capitalize(self.__tablename__) + 's'

                self.__tablename__ = "photo" + self.__tablename__

        def transfere_fichier(self, taille, mogrify) :
                """Stocke le fichier sur le disque et lance la commande mogrify appropriée"""
                fout = open(taille, "w")
                fout.write(self.__form__["fichier_photo"].value)
                fout.close()
                cmd = mogrify + ' "' + taille + '" >/dev/null'
                archeoconf.log_message(cmd, level = "notice")
                os.system(cmd)

        def retour(self) :
                if not self.__form__.has_key("referer") :
                        prog = archeoconf.script_location("mod" + self.__tablename__)   
                else :
                        prog = self.__form__["referer"].value
                self.__doc__.script('parent.bas.location = "' + prog + '?action=Chercher&' + self.__make_url__(self.__listechamps__) + '"')
                self.__doc__.output()

        def modifier(self) :
                """Met a jour la photo courante"""
                # maintenant on effectue la requete de mise a jour
                liste = ["idphoto"]
                for c in self.__listechamps__ :
                        if c != "legende" :
                                liste.append(c)
                self.__db__.query(self.make_update_query(liste))
                #
                # si on veut que l'ecran soit rafraichi completement
                # alors il faut decommenter la ligne suivante
                # et commenter les 2 suivantes
                # sinon la modification est effectuee mais rien n'est reaffiche.
                # self.retour()
                self.__doc__.do_nothing()
                self.__doc__.output()

        def supprimer(self) :
                #
                # pas de confirmation pour les photos: pas la peine a mon avis
                # on commence par effacer les fichiers concernes
                fname = "Z" + self.__form__["zone"].value + os.sep + "N" + self.__form__["numero"].value + os.sep + "B" + self.__form__["bis"].value

                fname = fname + os.sep + self.__form__["idphoto"].value

                small = archeoconf.image_fullname(fname + "s.jpeg")
                big = archeoconf.image_fullname(fname + ".jpeg")
                normale = archeoconf.image_fullname(fname + ".tiff")
                try :
                        os.unlink(small)
                        os.unlink(big)
                        os.unlink(normale)
                except :
                        archeoconf.fatalerror_message("Impossible d'effacer la photo " + fname)

                self.delete_records(["idphoto"])
                self.retour()

        def creer(self) :
                # on commence par créer le répertoire destination s'il n'existe pas déjà
                try :
                        z  = "Z" + self.__form__["zone"].value
                        rep = archeoconf.image_fullname(z)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                        n  = "N" + self.__form__["numero"].value
                        rep = archeoconf.image_fullname(z + os.sep + n)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                        b  = "B" + self.__form__["bis"].value
                        rep = archeoconf.image_fullname(z + os.sep + n + os.sep + b)
                        if not os.path.isdir(rep) :
                                os.mkdir(rep, 0755)

                except OSError, msg:
                        archeoconf.fatalerror_message("Impossible de créer le répertoire [%s] ou l'un de ses composants: %s" % (rep, msg))

                #
                idphoto = self.get_nextval()
                fname = rep + os.sep + `idphoto`
                small = fname + "s.jpeg"
                big = fname + ".jpeg"
                normale = fname + ".tiff"

                # on insère maintenant la photo dans la base
                # mais seulement si le chargement des images a fonctionné
                try :
                        t = self.__form__["taille"].value
                        t = "mogrify_" + t
                        self.transfere_fichier(normale, archeoconf.mogrify_normale)
                        self.transfere_fichier(small, archeoconf.mogrify_small)
                        self.transfere_fichier(big, getattr(archeoconf, t))
                except :
                        archeoconf.fatalerror_message("Impossible de transférer la photo " + fname)

                self.__db__.query(self.make_insert_query({ "idphoto": idphoto }))
                self.retour()
