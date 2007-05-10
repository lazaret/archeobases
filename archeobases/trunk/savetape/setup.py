#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""  Install script for savetape package based on Distutils/Setuptools
"""


# Begin of the install script using setuptools
import sys
import string
from distutils.core import setup

import savetape


# Ask to confirm the installation on other platforms than linux v2
if sys.platform != "linux2" and "install" in sys.argv:
    print "This software have only be tested on Linux2 platform."
    print "Your detected platform is : "+sys.platform
    install = raw_input("If you whant to install this software anyway please type 'YES' : ")
    if string.upper(install)!= "YES":
        raise SystemExit("Exiting install...")


setup(
    # Distutils Meta-datas
    name = "savetape",
    version = savetape.__version__,
    description = "Module and script for saving directories on unix tape",
    long_description = "Savetape is a Python script and a module used to regulary save with cron specified folders on unix tape",
    author = savetape.__author__,
    author_email = "opensource@lazaret.unice.fr",
    url = savetape.__url__,
    license = savetape.__license__,
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
    ],

    # test suite
    #test_suite = "",

    # Distributed files (module, scripts & data files)
    py_modules = ["savetape"],
    scripts =["savetotape.sh"],
    data_files =[("/etc",["savetape.conf"])]
    )

