This files are used to lauch a bitten-slave inside a virtualenv environment.


Prerequistes :
 - python --> http://www.python.org/
 - setuptools --> http://peak.telecommunity.com/DevCenter/setuptools
 - a working Bitten master --> http://bitten.edgewall.org/

Files :
- boostrap.py is used to create a virtualenv environment with developement packages
(bitten, nose, pylint, etc.) and required packages for the Pylons application
(babel, pylons, sqlalchemy, etc.).

- bitten-recipe.xml is the bitten recipe used to build the application with Trac+Bitten.

- bitten-slave.ini is a basic config file for bitten slaves.


Usage :
1) Create a build directory and put inside boostrap.py and bitten-slave.ini

2) Update bitten-slave.ini with you user/password and softwares versions

3) Prepare a virtualenv environment with boostrap.py
$ python boostrap.py --no-site-package buildenv

4) Activate the environment
$ source buildenv/bin/activate

5) Finaly lauch the bitten-slave
$ bitten-slave --config=bitten-slave.ini --no-loop http://lazaret.unice.fr/opensource/builds


The bitten slave use the recipe witch :
- get the project revision
- build sources and egg packages
- run the tests
- rune pylint and cheesecake


Note:
Is better to do builds project by projects, so is preferable to
activate only one recipe in Trac admin.
