#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2004-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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

for fichier in os.listdir("."):
    if fichier.endswith(".datas"):
        nom = fichier[:-6]
        print "Traitement de %s..." % fichier,
        sys.stdout.flush()
        os.system("../genmap --titre %s config-arago-transversale %s >%s.pdf 2>erreurs-%s.html" % (nom, fichier, nom, nom))
        print
