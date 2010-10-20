# -*- coding: utf-8 -*-
#

""" Logs parsers."""

import re


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

    # create a list of dictionaries from the log file
    log = []
    for line in open(logfile):
        match = pattern.search(line)
        if match is None:
            continue
        result = match.groupdict()
        log.append(result)
    return log

