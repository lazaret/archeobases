#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install Script for savebases module based on setuptools
"""


# automatic install of setuptools id necessary
from ez_setup import use_setuptools
use_setuptools()

# Begin of the install script using setuptools
from setuptools import setup
from savebases import __version__
from savebases import __author__


setup(
    # Setuptools-Distutils Meta-datas
    name = "savebases",
    version = __version__,
    description = "Module and scripts for database regular saving",
    long_description = "Savetape is a set Python scripts and a module used to regulary save with cron specified databases into folders",
    author = __author__,
    author_email = "opensource@lazaret.unice.fr",
    url = "http://lazaret.unice.fr/opensource/",
    license = "GNU GPL v2",
    platforms = "UNIX",
    # Prerequistes
    install_requires = ['PyGreSQL>=3.0'],
    # Distributed module and scripts
    py_modules = ['savebases'],
    scripts =['savedb_day.sh', 'savedb_week.sh', 'savedb_month.sh']
    )

