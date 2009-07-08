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
# This script create an 'env' virtual environment
# This script install the following packages in the isolated environment
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


def create_environment():
    """Create an isolated virtualenv environment"""
    pass

def install_deps():
    """Install the project dependencies for build
    and test purpose"""
    pass


def main():
    """Create a virtualenv environment and install the
    project dependencies"""
    create_environment()
    install_deps()
    print "test"


if __name__ == "__main__":
    main()
