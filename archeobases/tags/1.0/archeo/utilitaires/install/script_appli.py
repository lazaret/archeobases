#! /usr/bin/python
#
# archeoo - (c)  1999-2003 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


#==========================================================
#	Programme qui permet de creer les reprtoires et copie les fichiers necessaire a l'application acheo
#==========================================================
import os
import sys
import string
import database
sys.path.append("../cgi")


db = database.DataBase(database=sys.argv[1], username = "postgres")

premiere = raw_input('Souhaitez-vous installer l'application archeo O/N ?')

if string.upper(premiere) == "O"

#CREATION DES REPERTOIRES ET DROITS NECESSAIRES A L'APPLICATION
#==============================================================
	os.system("mkdir -p /home/bases/auth")

	os.system("mkdir -p /home/bases/archeo/decors")
	os.system("cp -R /cdrom/decors/* /home/bases/archeo/")

#	os.system("mkdir -p /home/bases/archeo/help")
#	os.system("cp -R /cdrom/help/* /home/bases/archeo/")

	os.system("mkdir -p /home/bases/archeo/lexique")
	os.system("cp -R /cdrom/help/* /home/bases/archeo/")

	os.system("mkdir -p /home/bases/archeo/manuel")
	os.system("cp -R /cdrom/manuel/* /home/bases/archeo/)

# COPIE DES PROGRAMMES DE L'APPLICATION
#======================================
	os.system("mkdir -p /home/bases/cgi-bin")
	os.system("cp /cdrom/prog_cgi/* /home/bases/archeo/cgi-bin")
	os.system("chmod +x /home/bases/cgi-bin/archeo/*py")

# FAIRE LES LIENS SYMBOLIQUE DANS /usr/lib/cgi
#=============================================
	os.system ("mkdir -p /usr/lib/cgi-bin")
	os.system ("ln -s /home/bases/archeo/cgi-bin /usr/lib/cgi-bin/archeo")
	os.system ("ln -s /home/bases/archeo/cgi-bin/archeo.py /usr/lib/cgi-binarcheo.py")

# CREER LE FICHIER D'AUTHENTIFICATION ET Y AJOUTER LES UTILISATEURS ET MOTS DE PASSE
==============================================================================
	os.system ("mkdir -p /home/bases/auth")


# CREER LE REPERTOIRE IMAGE S'IL N'EXISTE PAS ENCORE
# Y AJOUTER LE NOM DE LA BASE ET METTRE LES DROITS A www-data www-data
#=====================================================================
	os.system("htpasswd -c authentification super%s"%sys.argv[1])
	os.system("htpasswd  authentification %s"%sys.argv[1])
	os.system("htpasswd  authentification visiteur%s"%sys.argv[1])
	
else:
	os.system("htpasswd  authentification super%s"%sys.argv[1])
	os.system("htpasswd  authentification %s"%sys.argv[1])
	os.system("htpasswd  authentification visiteur%s"%sys.argv[1])
	

os.system("mkdir /home/bases/archeo/%s/images"%nom_base)
os.system("chown -R www-data.www-data /home/bases/archeo/%s/images"%nom_base)




