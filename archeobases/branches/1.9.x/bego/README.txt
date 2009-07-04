This file is for you to describe the Bego application. Typically
you would include information such as the information below:

Prerequistes
======================
Easy_install will normaly get all the necessary Python packages prerequistes
from PyPI but the PIL library used by iw.thumbs (thumbnail generation middleware)
may not install so easily.


For JPEG support in the Python image library, you need the libjpeg development library

On Debian like distros :

    apt-get update libjpeg libjpeg-dev

On Red-hat like distros :

    rpm -Uvh libjpeg libjpeg-devel


The Python Image Library (PIL) is not well installed with easy_install
you have to download it from source from:

    http://effbot.org/downloads/
    http://dist.repoze.org/

and then make an install the old way (with distutils and not easy_install) :

    python setup.py install

or you install the Python-imaging library with your package manager.


Installation and Setup
======================

Install ``Bego`` using easy_install::

    easy_install Bego

Make a config file as follows::

    paster make-config Bego config.ini

Tweak the config file as appropriate and then setup the application::

    paster setup-app config.ini

Then you are ready to go.








----------------------------
In production environment :

* you may remove the config/environment.py config.stric_c option
