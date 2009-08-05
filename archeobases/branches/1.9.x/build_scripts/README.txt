This files are used to lauch a bitten-slave with buildout.

This will install all the required packages for the project, and some more build
and testing packages (bitten, cheesecake, nose, pylint) and finaly run builds, lints and tests.


Prerequistes :
 - python --> http://www.python.org/
 - setuptools --> http://peak.telecommunity.com/DevCenter/setuptools
 - a working Bitten master --> http://bitten.edgewall.org/


usage :
$ python build.py


The buid.py script do :
- bootstrap zc.buildout
- lauch buildout with buildout.cfg + developement.cfg
- lauch the bitten slave

The bitten slave then :
- get the project revision
- create source and eggs builds
- run the pylint check

Notes :
 * You probably have to change the bitten-slave.ini file to adapt it to your needs
 * buildout.cfg is Pylons specific and install the project prerequistes
 * developement.cfg install the unstables part of the project and the build & test tools








