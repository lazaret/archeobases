try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name='Bego',
    version='1.9.alpha',
    description='',
    author='LDPL - Laboratoire Departemental de Prehistoire du Lazaret',
    author_email='opensource@lazaret.unice.fr',
    url='http://lazaret.unice.fr/opensource/',
    install_requires=[
        "Pylons>=0.9.7",
        "SQLAlchemy>=0.5",
        "Mako>=0.2.4",
        "WebHelpers>=1.0b1dev",
        "repoze.what-pylons>=1.0",
        "repoze.what-quickstart>=1.0",
        "iw.thumbs>=1.2",
    ],
    setup_requires=["PasteScript==dev,>=1.6.3dev-r7326"],
    packages=find_packages(exclude=['ez_setup']),
    include_package_data=True,
    test_suite='nose.collector',
    package_data={'bego': ['i18n/*/LC_MESSAGES/*.mo']},
    message_extractors = {'bego': [
            ('**.py', 'python', None),
            ('templates/**.mako', 'mako', None),
            ('public/**', 'ignore', None)]},
    zip_safe=False,
    paster_plugins=['PasteScript', 'Pylons'],
    entry_points="""
    [paste.app_factory]
    main = bego.config.middleware:make_app

    [paste.app_install]
    main = pylons.util:PylonsInstaller
    """,
)
