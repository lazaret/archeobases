#! /usr/bin/env python
# -*- coding: utf-8 -*-


from savetape import *


## default config values ##
device = "/dev/st0" # save device
directory_list = "/home/bases/sauvegarde_jours /home/bases/sauvegarde_mois"
log_filename = "/var/log/savetape.log"


## Loging options
logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s : %(message)s",
                    datefmt="%d-%m-%Y %H:%M",
                    filename=log_filename,
                    filemode='a')


## __main__
# save the 'directory_list' on tape 'device'
# the tape is tested before and if errors occurs the script exit
tape_backup(device, directory_list)
