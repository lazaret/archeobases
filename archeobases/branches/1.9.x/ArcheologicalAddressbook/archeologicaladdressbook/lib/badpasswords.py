# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#


def bad_password_list():
    """ return a list of very common bad passwords."""
    # contain a very short list of popular bad password taken from various
    # 'top bad password' web pages
    # words already included in /usr/shar/dict/words are not listed here except
    # very common fews like 'password'
    list = ['112233', '121212', '123123', '123321', '123456', '123abc',
        '123aze', '123qwe', '131313', '1a2z3e', '1q2w3e', '232323', '654321',
        '696969', '8675309', '987654', 'a12345', 'a1b2c3', 'abc123', 'abcdef',
        'abgrtyu', 'asdfgh','badboy', 'bartman', 'beavis', 'bigcock', 'bigdaddy',
        'bigdick', 'bigdog', 'bigtits', 'biteme', 'blabla', 'blahblah', 'blowme',
        'bond007', 'camaro', 'changeme', 'cocacola', 'cumshot', 'eminem', 'foobar',
        'fuckme', 'fuckyou', 'gandalf', 'goodluck', 'hahaha', 'hansolo', 'helpme',
        'hentai', 'ilovegod', 'iloveyou', 'iwantu', 'letmein', 'maddog', 'mylove',
        'nascar', 'ncc1701', 'newpass', 'newuser', 'newyork', 'onelove', 'password',
        'passw0rd', 'passwd', 'pokemon', 'pookie', 'qazwsx', 'red123', 'reddog',
        'redsox', 'rotimi', 'rush2112', 'scooby', 'sexsex', 'simpsons', 'spanky',
        'srinivas', 'startrek', 'starwars', 'steelers', 'suckit', 'superuser',
        'tequiero', 'test12', 'testtest', 'theman', 'thx1138', 'tigger', 'topgun',
        'trustno1', 'wargames', 'zxcvbn']
    return list