# -*- coding: utf-8 -*-
""" Root controler fonctional tests."""

from archeologicaladdressbook.tests import *


class TestAdminController(TestController):
    """ Test the controller `AdminControler`."""

    def test_index(self):
        """ Test the url of the admin page."""
        response = self.app.get(url('admin'))
        # Test response...

