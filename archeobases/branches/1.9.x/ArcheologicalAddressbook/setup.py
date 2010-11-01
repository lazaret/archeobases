# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Install script for The `ArchaeologicalAdressbook` package."""


try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages
from archeologicaladdressbook import __version__


setup(
    name='ArcheologicalAddressbook',
    version=__version__,
    author='LDPL - Laboratoire Départemental de Préhistoire du Lazaret',
    author_email='opensource@lazaret.unice.fr',
    url='http://lazaret.unice.fr/opensource/',
    license='Affero GPL 3',
    description=('Web application for contact address management '
                 'specific to archaelogical excavations and volontary association.'),
    long_description=open('README.txt').read(),
    install_requires=[
        'Paste>=1.7.5.1',
        'Pylons>=1.0',
        'Mako>=0.3.2',
        'SQLAlchemy>=0.5.8',
        'FormAlchemy>=1.3.2',
        'Babel>=0.9.4',
        'repoze.what-pylons>=1.0',
        'repoze.what-quickstart>=1.0.6',
        'pydns>=2.3.4',
    ],
    setup_requires=['PasteScript>=1.7.3'],
    packages=find_packages(exclude=['ez_setup']),
    include_package_data=True,
    test_suite='nose.collector',
    package_data={'archeologicaladdressbook': ['i18n/*/LC_MESSAGES/*.mo']},
    #message_extractors={'archeologicaladdressbook': [
    #        ('**.py', 'python', None),
    #        ('templates/**.mako', 'mako', {'input_encoding': 'utf-8'}),
    #        ('public/**', 'ignore', None)]},
    zip_safe=False,
    paster_plugins=['PasteScript', 'Pylons'],
    entry_points="""
    [paste.app_factory]
    main = archeologicaladdressbook.config.middleware:make_app

    [paste.app_install]
    main = pylons.util:PylonsInstaller
    """,
)
