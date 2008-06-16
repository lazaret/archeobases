#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import string
sys.path.append("../cgi")


lignes = sys.stdin.readlines()

i = 0 
j = 1000
result = ''
new=0
for ligne in lignes:
        
        if ligne.find('@') != -1:
            j = j+1
            new=1
        else:
            ligne = ligne.lstrip(' ')
            if new: 
                if (ligne[:-1]).find('Author'):
                    champs = ligne[:-1].strip(',')
                    print 'auteur trouve: '+ champs[1]
                else:
                    print '   ' + ligne[:-1]
            new = 0    
