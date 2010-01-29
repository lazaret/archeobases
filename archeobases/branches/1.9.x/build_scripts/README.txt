This files are used to lauch a bitten-slave with a virtualenv environment.

This will install all the required packages for the project, and some more build
and testing packages (bitten, nose, pylint) and finaly run builds, lints and tests.


Prerequistes :
 - python --> http://www.python.org/
 - setuptools --> http://peak.telecommunity.com/DevCenter/setuptools
 - a working Bitten master --> http://bitten.edgewall.org/


usage :
$ python build.py --no-site-package buildenv

This script is based on the virtualenv bootscrapt, so his usage is nearly the same.


The buid.py script do :
- bootstrap the virtualenv environment
- install the necessary prerequistes
- lauch the bitten slave

The bitten slave then :
- get the project revision
- create source and eggs builds
- run the pylint check
- run the tests

Notes :
 * You probably have to change the bitten-slave.ini file to adapt it to your needs
