#! /usr/bin/python
# -*- coding: UTF-8 -*-
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

import annuaireconf
import adresse

adresse.Adresse("bas").traite_parametre(["identifiant", "ordre"])#,  parent = annuaireconf.getparent())
