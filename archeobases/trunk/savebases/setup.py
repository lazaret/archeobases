#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install Script for savebases module based on setuptools
"""


# automatic install of setuptools id necessary
from ez_setup import use_setuptools
use_setuptools()

# Begin of the install script using setuptools
from setuptools import setup

setup(
    # Setuptools-Distutils Meta-datas
    name= "savebases",
    version= "0.6",
    description= "Module and scripts for database regular saving",
    author= "Bertrand Lecervoisier",
    author_email= "opensource@lazaret.unice.fr",
    url= "http://lazaret.unice.fr/opensource/",
    license= "GNU GPL v2",
    # Distributed module and scripts
    py_modules = ['savebases'],
    scripts=['sauvedb_day.sh', 'sauvedb_week.sh', 'sauvedb_month.sh'],
    # Prerequistes
    install_requires = ['PyGreSQL>=3.0'],
    )

