#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# montbego - (c) 1999      Jerome ALET <alet@unice.fr>
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
# $Id: modface.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: modface.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.2  2000/05/27 13:59:00  jerome
# Integration du message de Log
#
#

import begoconf
import face

face.Face("bas").traite_saisie(["zone", "groupe", "roche", "face"], parent = begoconf.getparent())
