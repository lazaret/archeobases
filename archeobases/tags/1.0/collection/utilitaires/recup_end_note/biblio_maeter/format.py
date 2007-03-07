#! /usr/bin/python

import sys
import string
sys.path.append("../cgi")

#numero_depart = sys.argv[0]
lignes = sys.stdin.readlines()

i = 0 
j = 1000#int(numero_depart) 
result = ''
new=0
for ligne in lignes:
        
        if ligne.find('@') != -1:
            j = j+1
            #print ligne +  'DRET-BIBLIO-' + str(j) + ',' 
            new=1
        else:
            ligne = ligne.lstrip(' ')
            #result = result + ligne
            if new: 
                if (ligne[:-1]).find('Author'):
                    champs = ligne[:-1].strip(',')
                    print 'auteur trouve: '+ champs[1]
                    #print (ligne[:-1]).find('Author')
                    #print  '   ' + ligne[:-1]
                else:
                    print '   ' + ligne[:-1]
            new = 0    
                    
#        print result








