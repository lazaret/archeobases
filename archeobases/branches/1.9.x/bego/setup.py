# -*- coding: utf-8 -*-
"""  Install script for The `Bego` package."""

try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name="Bego",
    version="1.9.a1",
    description="Web application for the studies of the stone age petroglyphs \
                 of the 'vallée des Merveilles'.",
    author="LDPL - Laboratoire Départemental de Préhistoire du Lazaret",
    author_email="opensource@lazaret.unice.fr",
    url="http://lazaret.unice.fr/opensource/",
    install_requires=[
        "Pylons>=0.9.7",
        "SQLAlchemy>=0.5",
        "Mako>=0.2.4",
        "WebHelpers>=1.0b1dev",
        "Babel>=0.9.4 ",
        "repoze.what-pylons>=1.0",
        "repoze.what-quickstart>=1.0",
        "iw.thumbs>=1.2",
    ],
    setup_requires=["PasteScript>=1.6.3"],
    packages=find_packages(exclude=["ez_setup"]),
    include_package_data=True,
    test_suite="nose.collector",
    package_data={"bego": ["i18n/*/LC_MESSAGES/*.mo"]},
    message_extractors = {"bego": [
            ("**.py", "python", None),
            ("templates/**.mako", "mako", {'input_encoding': 'utf-8'}),
            ("public/**", "ignore", None)]},
    zip_safe=False,
    paster_plugins=["PasteScript", "Pylons"],
    entry_points="""
    [paste.app_factory]
    main = bego.config.middleware:make_app

    [paste.app_install]
    main = pylons.util:PylonsInstaller
    """,
)
