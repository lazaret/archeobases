#! /usr/bin/env python
# -*- coding: utf-8 -*-

"""Create a virtualenv environment and install packages mandatory
for the building and testing of the Bego"""

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
# Webhelpers developement version


__version__ = "0.1"

import os
import subprocess

def install_deps():
    """Install the project dependencies for build
    and test purpose"""
    devnull = open(os.devnull, 'w')
    result = subprocess.call('env/bin/easy_install nose', shell=True, stdout=None, stderr=devnull)
    result = subprocess.call('env/bin/easy_install Pylons', shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call('env/bin/easy_install SQLalchemy', shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call('env/bin/easy_install repoze.what-pylons', shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call('env/bin/easy_install repoze.what-quickstart', shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call('wget http://effbot.org/downloads/Imaging-1.1.6.tar.gz',
                            shell=True, stdout=devnull, stderr=devnull)
    result = subprocess.call('tar zxvf Imaging-1.1.6.tar.gz', shell=True, stdout=devnull, stderr=devnull)
    devnull.close()
    #os.system('wget http://effbot.org/downloads/Imaging-1.1.6.tar.gz')
    #os.system('tar zxvf Imaging-1.1.6.tar.gz')
    #os.system('env/bin/easy_install nose')
    print "test"


def main():
    """Create a virtualenv environment and install the
    project dependencies"""
    install_deps()


if __name__ == "__main__":
    main()
