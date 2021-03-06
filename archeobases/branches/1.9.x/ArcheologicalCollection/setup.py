# -*- coding: utf-8 -*-
""" Install script for The `Archeological Collection` package."""

try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name='ArcheologicalCollection',
    version='1.9.a1',
    description='Web application for the inventory of archeological artifacts collection.',
    author='LDPL - Laboratoire Départemental de Préhistoire du Lazaret',
    author_email='opensource@lazaret.unice.fr',
    url='http://lazaret.unice.fr/opensource/',
    install_requires=[
        "Pylons>=0.9.7",
        "SQLAlchemy>=0.5",
        "formalchemy>=1.2",
        "Mako>=0.2.4",
        "Babel>=0.9.4 ",
        "repoze.what-pylons>=1.0",
        "repoze.what-quickstart>=1.0",
    ],
    setup_requires=["PasteScript>=1.6.3"],
    packages=find_packages(exclude=['ez_setup']),
    include_package_data=True,
    test_suite='nose.collector',
    package_data={'archeologicalcollection': ['i18n/*/LC_MESSAGES/*.mo']},
    message_extractors={'archeologicalcollection': [
            ('**.py', 'python', None),
            ('templates/**.mako', 'mako', {'input_encoding': 'utf-8'}),
            ('public/**', 'ignore', None)]},
    zip_safe=False,
    paster_plugins=['PasteScript', 'Pylons'],
    entry_points="""
    [paste.app_factory]
    main = archeologicalcollection.config.middleware:make_app

    [paste.app_install]
    main = pylons.util:PylonsInstaller
    """,
)
