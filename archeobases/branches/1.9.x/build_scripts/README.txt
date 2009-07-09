This files are used to lauch a bitten-slave inside a virtualenv environment
with all the required packages for testing and building our Pylons projects

You need :
 - setuptools --> http://peak.telecommunity.com/DevCenter/setuptools
 - virtualenv --> http://pypi.python.org/pypi/virtualenv
 - a working Bitten master --> http://bitten.edgewall.org/


You may change the bitten-slave.ini file to adapt it to you build-slave machine

You may change the the `after_install` section inside the build_boostrap.py to
 - add/remove python packages
 - change the bitten-slave script options to adjust it to you Bitten master
see : http://bitten.edgewall.org/wiki/BittenSlaveOptions

usage :
$ python build_boostrap.py ENV

This will :
- create the virtualenv `ENV` environment
- install Pylons, nose, pylint & Bitten and additional packages inside this environment
- run the bitten-slave script

You do not need to activate the environment and you can safely remove the ENV folder




