#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install Script for sauve_bases module based on setuptools
"""


# automatic install of setuptools id necessary
from ez_setup import use_setuptools
use_setuptools()

# Begin of the install script using setuptools
from setuptools import setup

setup(
    # Setuptools-Distutils Meta-datas
    name= "sauve_bases",
    version= "0.5",
    description= "Module and scripts for database regular saving",
    author= "Bertrand Lecervoisier",
    author_email= "opensource@lazaret.unice.fr",
    url= "http://lazaret.unice.fr/opensource/",
    license= "GNU GPL v2",
    # Distributed module and scripts
    py_modules = ['sauve_bases'],
    scripts=['sauvedb_jour.sh', 'sauvedb_mois.sh', 'sauvedb_semaine.sh'],
    # Prerequistes
    install_requires = ['PyGreSQL>=3.0'],
    )

