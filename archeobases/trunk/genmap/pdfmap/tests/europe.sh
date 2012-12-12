#! /bin/sh
#
# $Id: europe.sh,v 1.6 2004/07/26 21:15:30 jalet Exp $
#
# pdfmap test script - July 26th, 2004
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
python ../bin/pdfmap --config europe.conf --bgmap europe.png --bgx=0 --bgy=0 --bgwidth=2400 --bgheight=2400 --bgrotation=0 \
--legend --author="Jerome Alet" --title="Europe" --subtitle="Datas from MapIt.de" --papersize="29.7cmx42cm" \
--orientation="portrait" --xorigin=0 --yorigin=0 --xscale=0.000105 --yscale=0.00015 --xstep=500 --ystep=500 --rotation=0 \
--xalign --xlabels="0 500 1000 1500 2000 2500" \
--yalign --ylabels="0 500 1000 1500 2000 2500" \
--leftmargin=1.5cm --bottommargin=1.5cm --rightmargin=1.5cm --topmargin=1.5cm --outputfile=europe.pdf $*
