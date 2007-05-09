#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install Script for savetape module based on setuptools
"""


# automatic install of setuptools if necessary
from ez_setup import use_setuptools
use_setuptools()

# Begin of the install script using setuptools
from setuptools import setup
from savetape import __version__
from savetape import __author__


setup(
    # Setuptools-Distutils Meta-datas
    name = "savetape",
    version = __version__,
    description = "Module and script for saving directories on unix tape",
    long_description = "Savetape is a Python script and a module used to regulary save with cron specified folders on unix tape",
    author = __author__,
    author_email = "opensource@lazaret.unice.fr",
    url = "http://lazaret.unice.fr/opensource/",
    license = "GNU GPL v2",
    platforms = "UNIX",
    # Distributed module and scripts
    py_modules = ['savetape'],
    scripts =['savetotape.sh']
    )

