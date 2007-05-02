#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Script d'installation du module sauve_bases.py
"""

#from distutils.core import setup
from setuptools import setup


setup(name= "sauve_bases",
      version= "0.5",
      description= "Module et script de sauvegarde de bases donnees",
      author= "Bertrand Lecervoisier",
      author_email= "opensource@lazaret.unice.fr",
      url= "http://lazaret.unice.fr/opensource/",
      license= "GNU GPL v2",
      
      py_modules = ['sauve_bases'],
      scripts=['sauvedb_jour.sh', 'sauvedb_mois.sh', 'sauvedb_semaine.sh'],
      
      install_requires = ['PyGreSQL>=0.1'],
      )