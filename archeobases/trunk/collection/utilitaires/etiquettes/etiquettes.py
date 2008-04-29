#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# Génération de planches d'étiquettes
# Usage :  ./etiquettes.py  prefix  mincount  maxcount  >fichier.pdf\n")


import sys
from cStringIO import StringIO

from reportlab.graphics.barcode import *
from reportlab.graphics.barcode import code128

from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.fonts import addMapping
from reportlab.platypus.paragraph import Paragraph
from reportlab.platypus.tables import *
from reportlab.platypus.doctemplate import *
from reportlab.platypus import flowables
from reportlab.lib.units import inch,cm
from reportlab.lib import styles, colors

NBLABELS = 65
NBCOLS = 5

class EditionPDF(BaseDocTemplate) : # Avery C2651
    class MyPageTemplate(PageTemplate) :
        def __init__(self, name, parent) :
            self.__parent = parent
            frames = []
            MARGEDROITE = 0.467*cm # 0.5 au lien de 0.3
            MARGEBAS = 1.09*cm
            DECX = 0.254*cm
            DECY = 0*cm
            NBROWS = NBLABELS / NBCOLS
            for x in range(NBCOLS) :
                for y in range(NBROWS) :
                    xpos = (x * (3.81*cm + DECX)) + MARGEDROITE
                    ypos = (y * (2.12*cm + DECY)) + MARGEBAS     # ou par exemple 0.5*inch
                    width = 3.81*cm
                    height = 2.12*cm
                    frames.append(Frame(xpos, ypos, width, height, showBoundary = 0))
            PageTemplate.__init__(self, name, frames)
        
    def __init__(self, prefix, mincount, maxcount, debug=0) :
        self.debug = debug
        self.__built = 0
        self.__objects = []
        self.__report = StringIO()
        self.prefix = prefix
        self.mincount = mincount
        self.maxcount = maxcount
        
        BaseDocTemplate.__init__(self, self.__report)
        self.addPageTemplates([self.MyPageTemplate("First", self)])
        
        # feuille de style
        self._StyleSheet = styles.getSampleStyleSheet()
        
        # construction du document
        self.body()
        
        # generation réelle du document PDF
        self.build(self.__objects)
        self.__built = 1
    
    def __str__(self) :
        if self.__built :
            return self.__report.getvalue()
        else :
            return None
    
    def _append(self, object) :
        self.__objects.append(object)
    
    def body(self) :
        for count in range(self.mincount, self.maxcount+1) :
            message = "%s%06i" % (self.prefix, count)
            self._append(Paragraph("%s" % message, self._StyleSheet["Normal"]))
            self._append(Spacer(-0.8*cm, 0.5*cm))
            self._append(code128.Code128("%s" % message, quiet=0))
            self._append(FrameBreak())
        
def generePlanche(prefix, mincount, maxcount) :
    return str(EditionPDF(prefix, mincount, maxcount))
    
def main() :    
    if len(sys.argv) != 4 :
        sys.stderr.write("Usage :  etiquettes  prefix  mincount  maxcount  >fichier.pdf\n")
        sys.exit(-1)
    prefix = sys.argv[1]
    mincount = int(sys.argv[2])
    maxcount = int(sys.argv[3])
    sys.stdout.write(generePlanche(prefix, mincount, maxcount))
    return 0
    
if __name__ == "__main__" :    
    sys.exit(main())
