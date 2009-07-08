#! /usr/bin/env python
# -*- coding: utf-8 -*-

"""Build script used by the Trac/Bitten build tool"""

# This is just a convenien scripts i use with Bitten build tool
# to prepare silently an isolated environement with the necessary
#packages of the Bego Project.
#
# THIS SCRIPT IS FOR BUILDING AND TESTING PURPOSE ONLY !
#
# This script install the following packages and may be used in
# a virtualemnv  isolated environment
# nose
# Pylons
# SQLalchemy
# repoze.what-pylons
# repoze.what-quickstart
# Python Imaging Library
# iw.thumbs


__version__ = "0.2"

import os
import subprocess
from optparse import OptionParser


def install_deps(option, opt_str, value, parser):
    """Install the project dependencies for build and test purpose"""
    print "Setup nose, Pylons, SQLAlchemy, repoze.what, PIL, iw.thumbs"
    devnull = open(os.devnull, 'w')
    result = subprocess.call("env/bin/easy_install nose", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/easy_install Pylons", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/easy_install SQLalchemy", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/easy_install repoze.what-pylons", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/easy_install repoze.what-quickstart", shell=True, stdout=devnull, stderr=devnull)
    # TODO : comment this when webhelper 1.0 will be stable
    result = subprocess.call("env/bin/easy_install http://bitbucket.org/bbangert/webhelpers/get/8658ea32d22a.gz",
                            shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("wget http://effbot.org/downloads/Imaging-1.1.6.tar.gz",
                            shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("tar zxvf Imaging-1.1.6.tar.gz", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/python Imaging-1.1.6/setup.py install", shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call("env/bin/easy_install iw.thumbs", shell=True, stdout=devnull , stderr=devnull)
    devnull.close()


def main():
    """Create a virtualenv environment and install the
    project dependencies"""
    parser = OptionParser(version="%prog - "+__version__, description="Build script used by the Bitten build tool.")
    parser.add_option("-i", "--install-deps", action="callback", callback=install_deps,
                     help="Install the project dependencies", dest="mandatory")
    (options, args) = parser.parse_args()
    if not options.mandatory:
        parser.error("One option is requiered")


if __name__ == "__main__":
    main()
