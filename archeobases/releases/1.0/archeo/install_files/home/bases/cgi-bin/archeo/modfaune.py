#! /usr/bin/python
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
# $Id: modfaune.py,v 1.6 2002/09/16 14:23:02 rachel Exp $
#
# $Log: modfaune.py,v $
# Revision 1.6  2002/09/16 14:23:02  rachel
# i dernieres modifs
#
# ----------------------------------------------------------------------
#
# Revision 1.5  2001/07/06 13:28:45  rachel
# *** empty log message ***
#
# Revision 1.4  2001/07/05 15:29:27  rachel
# plein de modifs
#
# Revision 1.3  2001/05/29 22:11:03  jerome
# Correction de beaucoup de bugs que l'on n'avait pas pu decouvrir avant
# a cause du blocage sur le champ "numero"
#
# Revision 1.2  2001/03/20 19:59:46  jerome
# Ajout des tags CVS Id et Log
#
#
#

import archeoconf
import faune
import cgi
#cgi.test()

faune.Faune("bas").traite_saisie(["zone", "numero", "bis"])
