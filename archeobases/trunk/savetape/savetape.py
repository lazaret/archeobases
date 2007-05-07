#! /usr/bin/env python
# -*- coding: utf-8 -*-


""" Save the database folders to unix tape
"""

__version__ = "0.5"


import commands
import logging
from optparse import OptionParser



### Command line options
# initiate the option parser
parser = OptionParser(usage="Usage: %prog [options]", version="%prog - "+__version__, description="Description: save selected directories on an unix tape.")
# define the verbose option
parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=False, help="produce a verbose output")
# define the logs option
#parser.add_option("-l", "--log", action="store_true", dest="logs", default=True, help="save a log on /etc/sauve_bande.log")
# populating the option parser
(options, args) = parser.parse_args()



def verbose_message(message):
    """ write to standart output verboses messages if verbose option is ON.
    """
    if options.verbose==True:
        print message


def tape_test(device):
    """ test if there is an available tape in 'device'. 
    If not, write log & error messages and stop the script.
    """
    output_string = commands.getoutput("mt -f "+device+" status")
    if output_string=="mt: "+device+": No medium found" or output_string=="mt: "+device+": Input/output error":
	# write error to standart output even in non verbose mode
        print "ERROR : (mt -f "+device+" status) : The tape is not available !"
	logging.error("(mt -f "+device+" status) : The tape is not available !")
        raise SystemExit
    else:
        return True


def tape_save(device, directory_list):
    """ tar 'directory_list' on tape 'device'.
        If an error occur, write log and error messages and stop the script.
    """
    output_string = commands.getoutput("tar cvf "+device+" "+directory_list)
    if "tar: "+device+": Cannot open:" in output_string:
	# write error to standart output even in non verbose mode	
	print "ERROR : (tar cvf "+device+" "+directory_list+") : The tape is not available !"
	logging.error("(tar cvf "+device+" "+directory_list+") : The tape is not available !")
        raise SystemExit


def tape_rewoffl(device):
    """ rewind and eject tape in 'device'.
    If an error occur, write log and error messages and stop the script.
    """
    output_string = commands.getoutput("mt -f "+device+" rewoffl")
    if output_string=="mt: "+device+": No medium found" or output_string=="mt: "+device+": Input/output error":
	# write error to standart output even in non verbose mode	
	print "ERROR : (mt -f "+device+" rewoffl) : The tape is not available !"
	logging.error("(mt -f "+device+" rewoffl) : The tape is not available !")
        raise SystemExit


def tape_backup(device, directory_list):
    """ test tape 'device' and then save to the folders given as 'folder_list' argument.
    """
    ## test if there is an available tape on 'device' /dev/st0
    verbose_message("* Testing if there is a tape on "+device)
    tape_available = tape_test(device)
    if tape_available==True:
        # save 'directory_list' to 'device'
        verbose_message("* Begin of the save on tape "+device)
        tape_save(device, directory_list)
        # rewing & ejection of the cartdrige
        verbose_message("* Rewind and eject of the tape "+device)
        tape_rewoffl(device)
        # write a message to log (if no SystemExit occur)
        logging.info("Save of "+directory_list+" on tape "+device+" done.")

