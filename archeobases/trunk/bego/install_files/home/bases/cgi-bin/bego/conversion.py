#! /usr/bin/env python
# -*- coding: utf-8 -*-
#

import sys
import os

def conversion(romain):
	if len(romain) >= 1:
		if romain[1] == 'I':
			arabe = 1
		else:
			if romain[1] == 'V':
				arabe = 5
			if romain[1] == 'X':
				arabe = 10
	if len(romain) >= 2:
		if romain[2] == 'I':
			arabe = arabe + 1
		else:
			if romain[1] == 'V':
				arabe = 4
			if romain[1] == 'X':
				arabe = 9

	if len(romain) == 3:
		arabe = arabe + 1

	return arabe

def parcours(arg, dirname, names) :
	for filename in names :
		fichier = os.path.join(dirname, filename)
		if os.path.isfile(fichier) :

			for car in filename:
				if (filename[car == 'Z'):
			 		while filename[car] != 'G':
						romain = romain + filename[car]
						zone   = conversion(romain)
						print "zone:",zone

			# ici tu dois decomposer filename
			# (pas fichier pour ne pas avoir le nom de rep)
			# pour en extraire Z, G, R, F, f
			# et faire ce qui t'interesse
			# et taiter cette fois-ci fichier avec mogrify
			print filename,"est un fichier"
		else :
			# ici normalement tu ne fais rien
			print fichier,"est un repertoire"

# le None ici est en fait le arg de parcours,
# mais on n'en a pas besoin
os.path.walk("/mnt/cdrom", parcours, None)


