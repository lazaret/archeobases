""" Unit test suite for the models of the application."""

from unittest import TestCase

from archeologicaladdressbook.model import meta
from archeologicaladdressbook.tests.model.fixtures import person_fixture



def setup():
    """ Detroy a possibly remaining test database."""
    meta.metadata.drop_all(meta.engine)


class TestModel(TestCase):
    """ Base unit test case for the models."""

    def setUp(self):
        """ Method used to build a test database."""
        meta.metadata.create_all(meta.engine)
        person_fixture()

    def tearDown(self):
        """ Method used to destroy the test database."""
        meta.metadata.drop_all(meta.engine)


