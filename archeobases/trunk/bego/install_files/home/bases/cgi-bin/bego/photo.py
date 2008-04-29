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


import os
import string
import cgi
import begoconf
import begodata


class Photo(begodata.Data) :
	#
	# les champs minimum de la table photoxx
	__champs__ = { \
			"idphoto" : { "type" : "seq", "default": "nextval('seq_idphoto')", "mandatory" : 1 }, \
			"zone" : { "type" : "decimal", "default": 0, "mandatory" : 1 }, \
			"legende" : { "type" : "text", "default" : "", "mandatory" : 1 }, \
		    }

	#
	# liste des seuls champs que l'on veut pouvoir modifier
	__listechamps__ = [ "zone" ]

	def __init__(self, parent) :
		self.__form__ = cgi.FieldStorage()
		self.__db__ = begoconf.BegoDataBase()

		# determine le nom de la table et les champs necessaires
		de = "de "
		if self.__form__.has_key("association") :
			self.__tablename__ = "association"
			self.__listechamps__.append("groupe")
			self.__listechamps__.append("roche")
			self.__listechamps__.append("face")
			self.__listechamps__.append("association")
			self.__champs__["groupe"] = { "type" : "decimal", "default" : 0, "mandatory" : 1 }
			self.__champs__["roche"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["face"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["association"] = { "type" : "decimal", "default" : 0, "mandatory" : 1 }
			de = "d'"
		elif self.__form__.has_key("figure") :
			self.__tablename__ = "figure"
			self.__listechamps__.append("groupe")
			self.__listechamps__.append("roche")
			self.__listechamps__.append("face")
			self.__listechamps__.append("figure")
			self.__champs__["groupe"] = { "type" : "decimal", "default" : 0, "mandatory" : 1 }
			self.__champs__["roche"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["face"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["figure"] = { "type" : "text", "default" : "", "mandatory" : 1 }
		elif self.__form__.has_key("historique") :
			self.__tablename__ = "historique"
			self.__listechamps__.append("groupe")
			self.__listechamps__.append("roche")
			self.__listechamps__.append("face")
			self.__listechamps__.append("historique")
			self.__champs__["groupe"] = { "type" : "decimal", "default" : 0, "mandatory" : 1 }
			self.__champs__["roche"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["face"] = { "type" : "text", "default" : "", "mandatory" : 1 }
			self.__champs__["historique"] = { "type" : "text", "default" : "", "mandatory" : 1 }
		elif self.__form__.has_key("face") :
			self.__tablename__ = "face"
			self.__listechamps__.append("face")
			self.__champs__["face"] = { "type" : "text", "default" : "", "mandatory" : 1 }
		elif self.__form__.has_key("roche") :
			self.__tablename__ = "roche"
			self.__listechamps__.append("groupe")
			self.__listechamps__.append("roche")
			self.__champs__["groupe"] = { "type" : "decimal", "default" : 0, "mandatory" : 1 }
			self.__champs__["roche"] = { "type" : "text", "default" : "", "mandatory" : 1 }
		else :		# zones
			self.__tablename__ = "zone"

		self.__listechamps__.append("legende")

		t = " des Photos " + de + string.capitalize(self.__tablename__) + 's'

		self.__tablename__ = "photo" + self.__tablename__

		self.__doc__ = begoconf.Bas("Saisie" + t, "Saisie" + t)
		self.__parent__ = self.__tablename__ # est son propre parent

	def transfere_fichier(self, taille, mogrify) :
		"""Stocke le fichier sur le disque et lance la commande mogrify appropriée"""
		fout = open(taille, "w")
		fout.write(self.__form__["fichier_photo"].value)
		fout.close()
		cmd = mogrify + ' "' + taille + '" >/dev/null'
		begoconf.log_message(cmd, level = "notice")
		os.system(cmd)

	def retour(self) :
		if not self.__form__.has_key("referer") :
			if "association" in self.__listechamps__ :
				prog = begoconf.script_location("modassociation")	# association n'est pas un descendant de roche (pas dans le meme ecran en tout cas)
			elif "roche" in self.__listechamps__ :
				prog = begoconf.script_location("modroche")
			elif "historique" in self.__listechamps__ :
				prog = begoconf.script_location("modhistorique")
			else :
				prog = begoconf.script_location("modzone")
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
		self.__doc__.do_nothing()
		self.__doc__.output()

	def supprimer(self) :
		#
		# pas de confirmation pour les photos: pas la peine a mon avis
		# on commence par effacer les fichiers concernes
		fname = "Z" + self.__form__["zone"].value

		if "groupe" in self.__listechamps__ :
			fname = fname + os.sep + "G" + self.__form__["groupe"].value
		if "roche" in self.__listechamps__ :
			fname = fname + os.sep + "R" + self.__form__["roche"].value
		if "face" in self.__listechamps__ :
			fname = fname + os.sep + "F" + self.__form__["face"].value
		if "association" in self.__listechamps__ :
			fname = fname + os.sep + "A" + self.__form__["association"].value
		elif "figure" in self.__listechamps__ :
			fname = fname + os.sep + "Fg" + self.__form__["figure"].value
		elif "historique" in self.__listechamps__ :
			fname = fname + os.sep + "H" + self.__form__["historique"].value

		fname = fname + os.sep + self.__form__["idphoto"].value

		small = begoconf.image_fullname(fname + "s.jpeg")
		big = begoconf.image_fullname(fname + ".jpeg")
		try :
			os.unlink(small)
			os.unlink(big)
		except :
			begoconf.fatalerror_message("Impossible d'effacer la photo " + fname)

		self.delete_records(["idphoto"])
		self.retour()

	def creer(self) :
		# on commence par créer le repertoire destination s'il n'existe pas déjà
		try :
			z  = "Z" + self.__form__["zone"].value
			rep = begoconf.image_fullname(z)
			if not os.path.isdir(rep) :
				os.mkdir(rep, 0755)

			if self.__form__.has_key("groupe") :
				g  = "G" + self.__form__["groupe"].value
				rep = begoconf.image_fullname(z + os.sep + g)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)

			if self.__form__.has_key("roche") :
				r  = "R" + self.__form__["roche"].value
				rep = begoconf.image_fullname(z + os.sep + g + os.sep + r)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)

			if self.__form__.has_key("face") :
				f  = "F" + self.__form__["face"].value
				rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)

			if self.__form__.has_key("association") :
				a = "A" + self.__form__["association"].value
				rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + a)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)

			elif self.__form__.has_key("figure") :
				fg = "Fg" + self.__form__["figure"].value
				rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + fg)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)

			elif self.__form__.has_key("historique") :
				h = "H" + self.__form__["historique"].value
				rep = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + h)
				if not os.path.isdir(rep) :
					os.mkdir(rep, 0755)
		except OSError, msg:
			begoconf.fatalerror_message("Impossible de créer le repertoire [%s] ou l'un de ses composants: %s" % (rep, msg))

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
			self.transfere_fichier(normale, begoconf.mogrify_normale)
			self.transfere_fichier(small, begoconf.mogrify_small)
			self.transfere_fichier(big, getattr(begoconf, t))
		except :
			begoconf.fatalerror_message("Impossible de transférer la photo " + fname)

		self.__db__.query(self.make_insert_query({ "idphoto": idphoto }))
		self.retour()
