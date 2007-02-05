#! /usr/bin/python

import sys
import string
sys.path.append("../cgi")

#numero_depart = sys.argv[0]
lignes = sys.stdin.readlines()

i = 0 
j = numero_depart = 6000
result = ''
for ligne in lignes:
        
        if ligne.find('@') != -1:
            j = j+1
            print ligne +  'DRET-BIBLIO-' + str(j) + ',' 
        else:
            ligne = ligne.lstrip(' ')
            #result = result + ligne
            print '   ' + ligne[:-1]

#        print result








