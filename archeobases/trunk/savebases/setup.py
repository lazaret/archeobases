#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install script for savebases package based on Distutils
"""


import sys
from distutils.core import setup
import savebases as package


#Chek if first PyGreSQL is already installed
if "install" in sys.argv:
    try:
        import pg
    except ImportError:
        print "\nError : Module PyGreSQL is not installed"
        print "Please get it first from http://www.pygresql.org/"
        raise SystemExit("Exiting install...")


setup(
    # Setuptools-Distutils Meta-datas
    name = package.__name__,
    version = package.__version__,
    description = "Module and scripts for database regular saving",
    long_description = "Savetape is a set Python scripts and a module used to regulary save with cron specified databases into folders",
    author = package.__author__,
    author_email = package.__author_email__,
    url = package.__url__,
    license = package.__license__,
    platforms = "Unix",
    classifiers = [
        "Development Status :: 4 - Beta",
        "Environment :: Console",
        "Intended Audience :: System Administrators",
        "License :: OSI Approved :: GNU General Public License (GPL)",
        "Operating System :: Unix",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python",
        "Topic :: System :: Archiving :: Backup",
        "Topic :: Database",
        ],
    # Distributed module and scripts
    py_modules = ['savebases'],
    scripts =['savedb_day.sh', 'savedb_week.sh', 'savedb_month.sh'],
    data_files =[("/etc",["savebases.conf"])]
    )

