# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Logs parsers for the application."""

import re


def _log_parser(pattern=None, logfile=None):
    """ Create a list of dictionaries from the logfile with the pattern"""
    log = []
    for line in open(logfile):
        match = pattern.search(line)
        if match is None:
            continue
        result = match.groupdict()
        log.append(result)
    return log


def combined_log_parser(logfile=None):
    """ Parser for Combined Log Format logs."""
    pattern = re.compile(
        r'(?P<host>\S+)\s'
        + r'(?P<rfc931>\S+)\s'
        + r'(?P<userid>\S+)\s'
        + r'\[(?P<date>\S+):'
        + r'(?P<time>\d+:\d+:\d+)\s'
        + r'(?P<timezone>\S+)]\s'
        + r'"(?P<method>\S+)\s'
        + r'(?P<path>\S+)\s'
        + r'(?P<protocol>\S+)"\s'
        + r'(?P<statuscode>\d+)\s'
        + r'(?P<bytes>\d+)\s'
        + r'"(?P<refer>.*)"\s'
        + r'"(?P<useragent>.*)"'
        )
    log = _log_parser(pattern, logfile)
    return log


def error_log_parser(logfile=None):
    """ Parser for the error log.

    The error log filter must be defined with this options in the INI file
    format = [%(asctime)s] %(levelname)s [%(name)s] %(message)s
    datefmt = %d/%b/%Y:%H:%M:%S
    """
    pattern = re.compile(
        r'\[(?P<date>\S+):'
        + r'(?P<time>\d+:\d+:\d+)]\s'
        + r'(?P<levelname>\S+)\s'
        + r'\[(?P<modulename>\S+)]\s'
        + r'(?P<message>.*)'
        )
    log = _log_parser(pattern, logfile)
    return log
