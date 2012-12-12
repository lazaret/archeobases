#! /usr/bin/env python
#
# $Id: europe.py,v 1.7 2004/07/26 21:15:30 jalet Exp $
#
# pdfmap python test script - July 26th, 2004
#
# (c) 2001 Jerome Alet <alet@librelogiciel.com>
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import sys
import os
import string
sys.path.append("..")
from pdfmap import maptool

if __name__ == '__main__' :
        if len(sys.argv) < 2 :
                sys.argv.append("-")    # sys.stdin as single input file

        # maybe an exception will occur
        try :
                # what rasterized map to use as the map background
                bg = maptool.MapBackground("europe.png", 0, 0, 2400, 2400, 0)

                # initialize the PDF document
                doc = maptool.PDFMap(author="Jerome Alet", \
                            title = "Europe", subtitle = "Datas from MapIt.de", \
                            papersize = "A3")

                # set the format of the next pages
                doc.formatpage("portrait", "1.5cm", "1.5cm", "1.5cm", "1.5cm")

                # sets the labels for the two axis
                doc.setaxis(xaxis = [0, 500, 1000, 1500, 2000, 2500], \
                    yaxis = "0 500 1000 1500 2000 2500", \
                    xaxisalign = 1, yaxisalign = 1)

                for infile in sys.argv[1:] :
                        # initialize the new page
                        doc.initpage(background = bg, xorigin = 0, yorigin = 0, \
                             xscale = 0.000105, yscale = 0.00015, \
                             xstep = 500.0, ystep = 500.0, \
                             rotation = 0)

                        # draws the datas read from he input files
                        # according to what's in the configuration file
                        doc.draw_datas("europe.conf", infile, legend = 1)

                        # ends the current page
                        doc.endpage()

                # generates the PDF document
                doc.output("europe.pdf")
                sys.exit(0)
        except maptool.PDFMapError, msg :
                sys.stderr.write("%s\n" % msg)
                sys.stderr.flush()
                sys.exit(-1)
