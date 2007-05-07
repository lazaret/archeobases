#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install Script for savetape module based on setuptools
"""


# automatic install of setuptools if necessary
from ez_setup import use_setuptools
use_setuptools()

# Begin of the install script using setuptools
from setuptools import setup

setup(
    # Setuptools-Distutils Meta-datas
    name= "savetape",
    version= "0.5",
    description= "Module and script for savinf directories on unix tape",
    author= "Bertrand Lecervoisier",
    author_email= "opensource@lazaret.unice.fr",
    url= "http://lazaret.unice.fr/opensource/",
    license= "GNU GPL v2",
    # Distributed module and scripts
    py_modules = ['savetape'],
    scripts=['savetotape.sh']
    )

