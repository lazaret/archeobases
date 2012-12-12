#! /usr/bin/env python
#
# maptool.py - (c) 2001-2004 Jerome Alet
#              (c) 2001-2004 C@LL - Conseil Internet & Logiciels Libres
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
#
# $Id: maptool.py,v 1.12 2006/03/23 16:45:12 jalet Exp $
#
# $Log: maptool.py,v $
# Revision 1.12  2006/03/23 16:45:12  jalet
# Fixed a potential division by zero error when bad arguments are passed.
#
# Revision 1.11  2006/03/15 22:59:38  jalet
# Now accepts hex values and names for colors : '#112233' and 'pink' for
# example work.
#
# Revision 1.10  2006/01/11 09:30:42  jalet
# Sort labels
#
# Revision 1.9  2006/01/09 17:55:05  jalet
# The legend can now be positionned in the upper right, upper left, bottom
# right or bottom left corner.
#
# Revision 1.8  2006/01/09 16:57:23  jalet
# Now outputs the date the map was generated
#
# Revision 1.7  2006/01/08 19:37:04  jalet
# Improved scales and grid labels
#
# Revision 1.6  2006/01/08 13:13:02  jalet
# both x and y scales can be drawn
#
# Revision 1.5  2006/01/06 21:41:33  jalet
# Now accepts empty labels when labeling axis.
# Nicer scale drawing.
#
# Revision 1.4  2005/12/15 23:17:29  jalet
# Doesn't rotate objects if map's rotation is None
# Larger fontsize for ticks labels.
# Draw xscale again.
#
# Revision 1.3  2004/07/27 12:49:20  jalet
# Comments
#
# Revision 1.2  2004/07/27 12:47:57  jalet
# Removed charset comment
#
# Revision 1.1  2004/07/26 21:15:29  jalet
# Version 2.00 is out
#
#
#
import sys
import os
import string
import re
import random
import time
import cStringIO
import getopt
import cgi
import urllib
try :
        from reportlab.pdfgen import canvas
        from reportlab.pdfgen import pdfimages
        from reportlab.lib.units import inch,cm
        from reportlab.lib import styles
        from reportlab.lib import pagesizes
        import reportlab.lib.colors
except ImportError :
        sys.stderr.write("You MUST have installed the ReportLab Python module.\nYou can download it from http://www.reportlab.com\n")
        sys.exit(-1)

try :
        import PIL.Image
except ImportError :
        sys.stderr.write("You MUST have installed the Python Imaging Library module.\nYou can download it from http://www.pythonware.org\n")
        sys.exit(-1)

from pdfmap import version

__doc__ = """PDFMap v%s (C) 2001-2006 C@LL - Conseil Internet & Logiciels Libres
A python module to generate maps in PDF format and place clickable
objects on them.

Object types can be represented either by shapes of different forms and
colors (fill and contour), or by user provided images. Each object is
scaled, oriented and positionned on the map.

The more powerful way to use this software is to use its API in your
own programs, this will allow you to produce multipage documents with
different sizes, orientations, scales, background, etc... from page to
page.

However the same result can be obtained launching PDFMap several times
from the command line, producing one or many pages at a time, so here
are the different options available from the command line :

command line usage :

        pdfmap [options] [[inputfile1] [inputfile2] ...]

options :

  -v | --version          prints PDFMap's version number then exits
  -h | --help             prints this message then exits

  --config file.cfg       uses file.cfg as the configuration file
  --outputfile file.pdf   uses file.pdf as the output file, otherwise sends
                          the output to stdout
  --author authorname     uses authorname as the document author's name
  --title doctitle        uses doctitle as the document's title
  --subtitle docsubtitle  uses docsubtitle as the document's subtitle

  --papersize psize       uses psize as the paper size. psize can be any
                          paper size natively recognized by the ReportLab
                          ToolKit, expressed in UPPERCASE (i.e. A4 or LETTER
                          for example), or any size expressed as 'WxH' where
                          W and H respectively are Width and Height of
                          the page in centimeters (e.g. 21x29.7 for A4).
                          For each dimension, you can specify a unit which
                          may be different from one dimension to the other.
                          Allowed units are :
                            cm : centimeters (DEFAULT)
                            in : inches
                            pt : points
                            (e.g. 8.5inx11in for LETTER)

  --orientation o         uses o as the paper orientation, which must be
                          either "portrait" or "landscape"

  --leftmargin lm         left margin
  --bottommargin bm       bottom margin
  --rightmargin rm        right margin
  --topmargin tm          top margin
                          You can choose the unit in which you express
                          the four margins, sticking either 'cm', 'in',
                          or 'pt' at the end of each number.
                            cm : centimeters (DEFAULT)
                            in : inches
                            pt : points
                            (e.g. 100pt for 100 points)

  --legend                generates the map legend, default is no legend

  --bgmap image.jpeg      uses image.jpeg as the map background. Most graphic
                          formats are allowed, and you can also give an URL
                          to download the background from a remote location.
  --bgx x                 X position of the map background in units
  --bgy y                 Y position of the map background in units
  --bgwidth w             width of the map background in units
  --bgheight h            height of the map background in units
  --bgrotation r          rotation of the map background in degres (counter
                          clockwise) wrt the North

  --xlabels labels        Labels for the X ticks
  --ylabels labels        Labels for the Y ticks
  --xalign                Align X labels on X ticks or center them (default)
  --yalign                Align Y labels on Y ticks or center them (default)

  --xorigin x             X origin of the generated map in units (from lower
                          left)
  --yorigin y             Y origin of the generated map in units (from lower
                          left)
  --xscale xs             scale for the X dimension
  --yscale ys             scale for the Y dimension
  --xstep stx             distance between two X ticks in units
  --ystep sty             distance between two Y ticks in units

  --rotation r            angle of the generated map in degres (counter
                          clockwise) wrt the North

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.

Please e-mail bugs to: %s""" % (version.__version__, version.__author__)

# C@LL logo's name
LOGONAME = "calllogo.png"

# and C@LL's website URL
WEBSITE = "http://www.librelogiciel.com"

# Text color in logo
WEBSITECOLOR = (0.421875, 0.609375, 0.6953125)

# Logo's copyright message
COPYRIGHT = "(c) 2001, 2004 C@LL - Conseil Internet & Logiciels Libres"

# HTML form for CGI
HTMLFORM = """
    <form action="pdfmap" method="POST" enctype="multipart/form-data">
      <p>
        <pre>
   Author : <input type="text" size="50" name="author">
    Title : <input type="text" size="50" name="title">
 SubTitle : <input type="text" size="50" name="subtitle">
  Papersize : <select name="papersize">
            <option value="A0">A0</option>
            <option value="A1">A1</option>
            <option value="A2">A2</option>
            <option value="A3">A3</option>
            <option value="A4" selected="SELECTED">A4</option>
            <option value="A5">A5</option>
            <option value="A6">A6</option>
            <option value="LETTER">Letter</option>
          </select>
Orientation : <select name="orientation">
            <option value="portrait" SELECTED>Portrait</option>
            <option value="landscape">Landscape</option>
          </select>
Bottom Margin (cm/in/pt) : <input type="text" size="10" name="bottommargin"> (e.g. <em>1.8in</em>)
  Left Margin (cm/in/pt) : <input type="text" size="10" name="leftmargin">
   Top Margin (cm/in/pt) : <input type="text" size="10" name="topmargin">
 Right Margin (cm/in/pt) : <input type="text" size="10" name="rightmargin">

         Legend : <input type="checkbox" name="legend" checked="CHECKED">

       Map background : <input type="file" size="64" name="bgmap">
Background X position : <input type="text" size="10" name="bgx">
Background Y position : <input type="text" size="10" name="bgy">
     Background width : <input type="text" size="10" name="bgwidth">
    Background height : <input type="text" size="10" name="bgheight">
  Background rotation : <input type="text" size="10" name="bgrotation">

X Labels : <input type="text" size="60" name="xlabels">
Y Labels : <input type="text" size="60" name="ylabels">
Align on X Ticks : <input type="checkbox" checked="CHECKED" name="xalign"> Align on Y Ticks : <input type="checkbox" checked="CHECKED" name="yalign">

X Origin : <input type="text" size="10" name="xorigin"> X Scale : <input type="text" size="10" name="xscale"> X Step : <input type="text" size="10" name="xstep">
Y Origin : <input type="text" size="10" name="yorigin"> Y Scale : <input type="text" size="10" name="yscale"> Y Step : <input type="text" size="10" name="ystep">
Rotation : <input type="text" size="10" name="rotation">

Configuration file : <input type="file" size="64" name="config">
         Data file : <input type="file" size="64" name="datafile">

          <input type="hidden" name="PDFMapFormIsValid" value="1">
          <input type="submit" value="Submit"> <input type="reset" value="Reset">
        </pre>
      </p>
    </form>"""

class PDFMapError :
        """PDFMap's Exception class."""
        def __init__(self, value) :
                self.value = value

        def __str__(self) :
                return str(self.value)

class MapBackground :
        """For rasterized background images."""
        def __init__(self, filename, x, y, width, height, rotation = 0) :
                """Initialize local data.

                     filename : the raster map in a graphic file format (e.g. tiff)
                                or the image itself in PIL.Image.Image format

                     x, y : coordinates of the bottom left of the raster map in map units

                     width, height : real width and height of the map in map units

                     height : real height of the map in map units

                     rotation : angle in degres between the raster map and the real North
                """
                self.filename = filename
                (self.x, self.y) = (x, y)
                (self.width, self.height) = (width, height)
                self.rotation = rotation

        def draw(self, mappdf) :
                """Draws the map image file on the pdf document, taking care of the scales."""
                pdfdoc = mappdf.document
                pdfdoc.saveState()

                path = pdfdoc.beginPath()
                path.rect(0, 0, mappdf.width, mappdf.height)
                pdfdoc.clipPath(path, fill=0)
                if self.filename and (isinstance(self.filename, PIL.Image.Image) or os.path.isfile(self.filename)) :
                        width = mappdf.xratio * self.width
                        height = mappdf.yratio * self.height
                        xoffset = (self.x - mappdf.xorigin) * mappdf.xratio
                        yoffset = (self.y - mappdf.yorigin) * mappdf.yratio
                        width2 = width / 2.0
                        height2 = height / 2.0
                        pdfdoc.translate(xoffset + width2, yoffset + height2)
                        if (mappdf.rotation is not None) and (self.rotation is not None) :
                                pdfdoc.rotate(mappdf.rotation - self.rotation)
                        pdfdoc.drawImage(self.filename, -width2, -height2, width, height, mask="auto")
                pdfdoc.restoreState()

class MapObject :
        """For shapes/images which represent objects on the map."""
        def __init__(self, mappdf, thickness, rgbout, rgbin) :
                """Initializes a shape Map object.

                     mappdf : the PDF Map object

                     thickness : thickness of the drawing

                     rgbout : drawing's external color or filename (images)

                     rgbin : drawing's internal color or ""
                """    
                # save some info
                self.mappdf = mappdf
                self.thickness = thickness
                self.rgbout = rgbout
                self.rgbin = rgbin

        def realDraw(self) :
                """Really draws the object on the PDF map."""
                # here both rgbout and rgbin contain
                # the colors in which we want to draw.
                (r, g, b) = self.rgbout
                self.mappdf.document.setStrokeColorRGB(r, g, b)
                if self.rgbin != "" :
                        (r, g, b) = self.rgbin
                        self.mappdf.document.setFillColorRGB(r, g, b)

                # set drawing thickness
                self.mappdf.document.setLineWidth(self.thickness)

                # begin the drawing path
                self.path = self.mappdf.document.beginPath()

                # calls the real drawing routine
                self.draw()

                # validates the drawing path, with or without filling
                self.mappdf.document.drawPath(self.path, fill = (self.rgbin != ""))

        def drawIt(self, x, y, length, width, orientation, url = None) :
                """Draws an object on the PDF map.

                     x,y : object's coordinates in map units

                     length : object's length in map units

                     width : object's width in map units

                     orientation : object's orientation in degres

                     url : optional url to make an hyperlink on this object
                """
                # scale dimensions which are all in the same unit (e.g. meters)
                self.length = length * self.mappdf.xratio
                self.width = width * self.mappdf.yratio

                # maximum radius of the object on the document
                self.radius = max(self.length, self.width)

                # precomputes some values
                self.length2 = self.length / 2.0
                self.width2 = self.width / 2.0
                self.radius2 = self.radius / 2.0

                # computes actual coordinates in the document
                newx = (x - self.mappdf.xorigin) * self.mappdf.xratio
                newy = (y - self.mappdf.yorigin) * self.mappdf.yratio

                # change coordinates system : the new origin is at the center of
                # the object to be drawn.
                pdfdoc = self.mappdf.document
                pdfdoc.saveState()
                pdfdoc.translate(newx, newy)

                # rotate the object before drawing it, according to
                # the original angle
                if self.mappdf.rotation is not None :
                        pdfdoc.rotate(self.mappdf.rotation + orientation)

                # is there an url to use ?
                if url :
                        pdfdoc.linkURL(url, (-self.length2, -self.width2, self.length2, self.width2), relative=1)

                # really draw the object
                self.realDraw()

                # restore original state
                pdfdoc.restoreState()

        def draw(self) :
                """Only there to be sure the user will override it."""
                raise PDFMapError, 'NotImplemented\nYou must first subclass maptool.MapObject, then override its draw() method'

class Square(MapObject) :
        """For objects represented by squares on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.rect(-self.radius2, -self.radius2, self.radius, self.radius)

class Circle(MapObject) :
        """For objects represented by circles on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.circle(0, 0, self.radius2)

class Triangle(MapObject) :
        """For objects represented by triangles on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.moveTo(0, self.radius2)
                self.path.lineTo(-self.radius2, -self.radius2)
                self.path.lineTo(self.radius2, -self.radius2)
                self.path.close()

class Diamond(MapObject) :
        """For objects represented by diamonds on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.moveTo(0, self.width2)
                self.path.lineTo(-self.length2, 0)
                self.path.lineTo(0, -self.width2)
                self.path.lineTo(self.length2, 0)
                self.path.close()

class Cross(MapObject) :
        """For objects represented by crosses on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.moveTo(0, self.width2)
                self.path.lineTo(0, -self.width2)
                self.path.moveTo(self.length2, 0)
                self.path.lineTo(-self.length2, 0)
                self.path.close()

class Star(MapObject) :
        """For objects represented by stars on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.moveTo(0, self.radius2)
                self.path.lineTo(0, -self.radius2)
                self.path.moveTo(self.radius2, 0)
                self.path.lineTo(-self.radius2, 0)
                self.path.moveTo(self.radius2, self.radius2)
                self.path.lineTo(-self.radius2, -self.radius2)
                self.path.moveTo(-self.radius2, self.radius2)
                self.path.lineTo(self.radius2, -self.radius2)
                self.path.close()

class Ellipse(MapObject) :
        """For objects represented by ellipses on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.ellipse(-self.length2, -self.width2, self.length, self.width)

class Rectangle(MapObject) :
        """For objects represented by rectangles on the map."""
        def draw(self) :
                """Draws this shape on the map."""
                self.path.rect(-self.length2, -self.width2, self.length, self.width)

class Image(MapObject) :
        """For objects represented by images on the map."""
        def __init__(self, mappdf, dummy, imagename, mask = "auto") :
                """Initializes an image Map object.

                     mappdf : the PDF Map object

                     dummy : unused, but provides a constructor consistent
                                 with other MapObjects

                     imagename : image name or directory name

                     mask : either "auto" or a color tuple or empty (which means "auto" too)
                            represents the color to mask in the image (the transparent color)
                """   
                # save some info
                self.mappdf = mappdf
                if not mask :
                        mask = "auto"
                self.mask = mask

                # imagename contains the image filename
                # or images directory name. An image directory
                # contains lots of images which are used at
                # random when rendering. If this is not a
                # directory then we must be sure that the file exists.
                # do something in case there's a ~username
                # imagename = os.path.normpath(os.path.expanduser(os.path.expandvars(imagename)))
                imagename = os.path.expanduser(os.path.expandvars(imagename))
                normimagename = os.path.normpath(imagename)
                if os.path.isdir(imagename) :
                        self.imagenames = os.listdir(normimagename)
                        if not self.imagenames :
                                sys.stderr.write("%s doesn't contain any file\n" % normimagename)
                        else :
                                self.imagenames = filter(os.path.isfile, map(lambda image,prefix=normimagename : os.path.join(prefix, image), self.imagenames))
                elif not os.path.isfile(imagename) :
                        self.imagenames = [ imagename ]
                else :
                        self.imagenames = [ normimagename ]

        def realDraw(self) :
                """Really draws the image object on the PDF map."""
                try :
                        # translate again, because images are drawn
                        # from their lower left, but our shapes are
                        # drawn from their center.
                        # displays the image, then done.
                        # randomized, even if only one...
                        imagename = whrandom.choice(self.imagenames)
                        mask = self.mask
                        if mask != "auto" :
                                (r, g, b) = map(lambda x : x * 255.0, mask)
                                mask = (r, r, g, g, b, b)
                        self.mappdf.document.drawImage(imagename, -self.length2, -self.width2, self.length, self.width, mask)
                except IOError :
                        # Invalid image file
                        self.draw("Unable to open image file %s" % imagename)
                except IndexError :
                        # empty form list : no filename was a real image
                        self.draw("No image file !")

        def draw(self, message) :
                """Represents the object as an error message when something went wrong."""
                sys.stderr.write("%s\n" % message)
                self.mappdf.document.drawCentredString(0, 0, message)

class PDFMap :
        """Our Map class."""
        orientations = { "N": 0, "W": 90, "S": 180, "E" : -90, "EW" : 90, "NS": 180, "NW": 45, "SW" : 135, "SE": -135, "NE": -45, "SN": 0 }
        def __init__(self, author, title, subtitle, papersize) :
                """Initialize a PDF Map.

                     author : the author's name

                     title : the document's title

                     subtitle : the document's subtitle

                     papersize : any paper size natively recognized by the ReportLab toolkit,
                                 or a string of the form "WxH" where W and H are the Page's
                                 dimensions in centimeters (default), inches or points.
                """
                # initialize local datas, global to the PDF document
                self.author = author or "Unknown"
                self.title = title or ""
                self.subtitle = subtitle or ""
                self.papersize = papersize
                self.pagewritten = 0

                # for testing purpose :
                # whrandom.seed(1,1,1)

                # creates a pseudo file to handle the pdf output
                self.file = cStringIO.StringIO()

                # initialize the PDF canvas
                pdfdoc = self.document = canvas.Canvas(self.file)

                # set the special fields
                pdfdoc.setAuthor(self.author)
                pdfdoc.setTitle(self.title)
                pdfdoc.setSubject(self.subtitle)

        def unit_to_points(self, value) :
                """Converts a value expressed in centimeters, inches, points into points.

                     value : The number to convert. If it doesn't contain a unit string
                             like pt for points, cm for centimeters or in for inches, then
                             centimeters is assumed.
                """
                if type(value) != type("") :
                        # already a number so it's in centimeters
                        return float(value) * cm
                else :
                        number = float(value[:-2] or '0')
                        unit = value[-2:]
                        if unit == 'pt' :
                                return number
                        elif unit == 'cm' :
                                return number * cm
                        elif unit == 'in' :
                                return number * inch
                        else :
                                # default when nothing specified
                                return float(value) * cm

        def formatpage(self, orientation = "portrait", leftmargin = "1.5cm", bottommargin="1.5cm", rightmargin="1.5cm", topmargin="1.5cm") :
                """Set the page orientation and margins.

                     The page dimensions are set from the constructor's papersize
                     parameter, because having multiple different page sizes is
                     probably possible but not convenient for printing. However
                     having a different orientation from page to page is
                     interesting.

                     orientation : "portrait" or "landscape", defaults to "portrait"

                     leftmargin : left margin, defaults to 1.5cm

                     bottommargin : bottom margin, defaults to 1.5cm

                     rightmargin : right margin, defaults to 1.5cm

                     topmargin : top margin, defaults to 1.5cm
                """
                # set page size and orientation
                try :
                        papersize = getattr(pagesizes, self.papersize)
                except AttributeError :
                        try :
                                papersize = map(lambda v,s=self : s.unit_to_points(v), string.split(self.papersize, 'x'))
                                if len(papersize) != 2 :
                                        raise PDFMapError, "Invalid papersize %s" % str(self.papersize)
                        except ValueError :
                                raise PDFMapError, "Invalid papersize %s" % str(self.papersize)
                try :
                        pagesize = getattr(pagesizes, orientation)(papersize)
                except AttributeError :
                        raise PDFMapError, "Invalid orientation %s" % str(orientation)
                self.document.setPageSize(pagesize)

                # convert to points :
                try :
                        self.leftmargin = self.unit_to_points(leftmargin)
                except ValueError :
                        raise PDFMapError, "Invalid leftmargin %s" % leftmargin
                try :
                        self.bottommargin = self.unit_to_points(bottommargin)
                except ValueError :
                        raise PDFMapError, "Invalid bottommargin %s" % bottommargin
                try :
                        self.rightmargin = self.unit_to_points(rightmargin)
                except ValueError :
                        raise PDFMapError, "Invalid rightmargin %s" % rightmargin
                try :
                        self.topmargin = self.unit_to_points(topmargin)
                except ValueError :
                        raise PDFMapError, "Invalid topmargin %s" % topmargin

                # computes available width and height
                (w, h) = pagesize
                self.width = w - self.leftmargin - self.rightmargin
                self.height = h - self.topmargin - self.bottommargin

        def initpage(self, background, xorigin, yorigin, xscale, yscale, xstep, ystep, rotation, showxgrid=1, showygrid=1, showxscale=1, showyscale=1) :
                """Creates a new page in the PDF document.

                     background : a MapBackground object.

                     xorigin, yorigin : origin coordinates in map units.

                     xscale, yscale : x and y scales (e.g. 1.0/25000.0)

                     xstep, ystep : grid cell's dimensions in map units.

                     rotation : orientation wrt. the North, in degres.
                     
                     showxgrid : shows the x grid or not.
                     
                     showygrid : shows the y grid or not.
                     
                     showxscale : shows the x scale.
                     
                     showyscale : shows the y scale.
                """       
                # other local datas specific to each page
                self.pagewritten = 0
                self.showyscale = showyscale
                self.showxscale = showxscale
                self.showygrid = showygrid
                self.showxgrid = showxgrid
                self.rotation = rotation
                self.xstep = xstep or 1.0
                self.ystep = ystep or 1.0
                self.xscale = xscale
                self.yscale = yscale
                self.xorigin = xorigin
                self.yorigin = yorigin
                self.background = background

                # computes scaling factors
                # and x and y step for grid
                self.nbx = self.xstep * 100.0 * cm * xscale
                self.nby = self.ystep * 100.0 * cm * yscale
                self.xratio = self.nbx / self.xstep
                self.yratio = self.nby / self.ystep

                # new origin = bottom left of the raster map
                pdfdoc = self.document
                pdfdoc.translate(self.leftmargin, self.bottommargin)

                # then we can draw all
                if background is not None :
                        self.background.draw(self)
                self._draw_titles()
                self._draw_scales()
                self._draw_grid()
                self._draw_north()

                # set clipping region
                pdfdoc.saveState()
                path = pdfdoc.beginPath()
                path.rect(0, 0, self.width, self.height)
                pdfdoc.clipPath(path, fill=0)

        def endpage(self) :
                """Ends the previous page and creates a new one."""
                if not self.pagewritten :
                        self.document.restoreState()
                        self._draw_call_logo() # draw the logo now, otherwise objects could override it
                        self.document.showPage()
                        self.pagewritten = 1

        def setaxis(self, xaxis = [], yaxis = [], xaxisalign = 1, yaxisalign = 1) :
                """Sets the two axis labels.

                     xaxis : list of labels for x

                     yaxis : list of labels for y

                     xaxisalign : 1 if x labels are aligned with grid, 0 if they are centered in cell's width

                     yaxisalign : 1 if y labels are aligned with grid, 0 if they are centered in cell's height
                """        
                # be sure there's no None value passing for labels
                xaxis = xaxis or []
                yaxis = yaxis or []
                if type(xaxis) == type("") :
                        xaxis = string.split(xaxis)
                if type(yaxis) == type("") :
                        yaxis = string.split(yaxis)
                xaxis = map(lambda v : str(v or ""), xaxis)
                yaxis = map(lambda v : str(v or ""), yaxis)
                self.xaxis = xaxis
                self.yaxis = yaxis
                self.xaxisalign = xaxisalign
                self.yaxisalign = yaxisalign

        def __del__(self) :
                """Frees some more memory."""
                if self.file is not None :
                        self.file.close()
                        del self.file

        def __str__(self) :
                """Returns the PDF document as a string of text."""
                if self.file is not None :
                        self.endpage()
                        self.document.save()
                        return self.file.getvalue()
                else :
                        return ""

        def output(self, file = "-") :
                """Outputs the PDF document to the specified file.

                     file : "-" or None both mean sys.stdout, which is the default
                            you can also pass a file object
                """
                isopen = 0
                if (type(file) == type("")) or (file is None) :
                        if file and (file != "-") :
                                outf = open(file, "w+b")
                                isopen = 1
                        else :
                                outf = sys.stdout
                else :
                        outf = file     # we assume it's a file like object
                outf.write(str(self))
                outf.flush()
                if isopen :
                        outf.close()

        def _available_shapes(self) :
                """Returns the list of available shapes as defined in this module."""
                # caches the list
                if hasattr(self, "AvailableShapes") :
                        return self.AvailableShapes
                # no cache currently exist : build it
                # TODO : allow the user to register his own shapes
                # TODO : see if we could do this automatically
                from pdfmap import maptool
                self.AvailableShapes = []
                for c in dir(maptool) :
                        cl = getattr(maptool, c)
                        if type(cl) == type(maptool.MapObject) :
                                # we want all subclasses of MapObject,
                                # but not MapObject itself.
                               if issubclass(cl, maptool.MapObject) :
                                        if cl.__name__ != 'MapObject' :
                                                self.AvailableShapes.append(c)
                return self.AvailableShapes

        def _read_config(self, filename) :
                """Reads a configuration file and returns a Python dictionnary."""
                from pdfmap import maptool
                cfg = {}
                havetoclose = 0
                if hasattr(filename, "readline") :
                        conf = filename
                elif not os.path.isfile(filename) :
                        raise PDFMapError, "%s : file doesn't exist" % filename
                else :
                        conf = open(filename, "r")
                        havetoclose = 1

                # thanks to Lionel Grolleau & Xavier Defrang
                splitter = re.compile(':|([^:]*"[^"]*"[^:]*)')

                while 1 :
                        confline = conf.readline()
                        if not confline :
                                break
                        confline = string.strip(confline)
                        #
                        # skip empty lines and comments
                        if (not confline) or (confline[0:1] == '#') :
                                continue
                        eclate = map(string.strip, filter(lambda s : s is not None, splitter.split(confline)))
                        #
                        # very ugly code because regexp is not 100% correct
                        # TODO : find a better solution
                        j = 0
                        while j < (len(eclate) - 1) :
                                i = j + 1
                                if (not eclate[j]) and \
                                   eclate[i] and (eclate[i][0] == eclate[i][-1] == '"') :
                                        del eclate[j]
                                if eclate[j] and (eclate[j][0] == eclate[j][-1] == '"') :
                                        eclate[j] = string.strip(eclate[j][1:-1])
                                j = j + 1
                        if len(eclate) < 8 :
                                raise PDFMapError, "Error in configuration file %s\n\tincomplete line : '%s'" % (filename, confline)
                        elif len(eclate) == 8 :
                                eclate.append("")
                        eclate = map(string.strip, eclate)
                        ending = string.join(eclate[8:], ':')
                        del eclate[8:]
                        eclate.append(ending)
                        (nature, shape, thickness, rgbout, rgbin, magnify, minimalsize, maximalsize, desc) = eclate

                        if not thickness :
                                thickness = 0.01
                        try :
                                thickness = abs(float(thickness))
                        except :
                                raise PDFMapError, "Error in configuration file %s\n\tinvalid Thickness field : '%s'" % (filename, confline)

                        shape = string.capitalize(string.lower(shape))
                        if shape not in self._available_shapes() :
                                raise PDFMapError, "Error in configuration file %s\n\tunknown shape type : '%s'" % (filename, confline)

                        if shape != "Image" :
                                if (len(rgbout) == 7) and rgbout.startswith("#") :
                                        # hexadecimal color
                                        r = int("0x%s" % rgbout[1:3], 16)
                                        g = int("0x%s" % rgbout[3:5], 16)
                                        b = int("0x%s" % rgbout[5:7], 16)
                                        rgbout = (r, g, b)    
                                else :    
                                        try :
                                                r,g,b = map(lambda x : abs(float(string.strip(x))), string.split(rgbout, ","))
                                                rgbout = (r, g, b)
                                        except :
                                                try :
                                                    rgbout = getattr(reportlab.lib.colors, rgbout).rgb()
                                                except AttributeError :    
                                                    raise PDFMapError, "Error in configuration file %s\n\tinvalid RGBout field : '%s'" % (filename, confline)
                        else :
                                # rgbout contains the image filename or a directory
                                # name, the directory should contain images
                                pass

                        if rgbin :
                                if (len(rgbin) == 7) and rgbin.startswith("#") :
                                        # hexadecimal color
                                        r = int("0x%s" % rgbin[1:3], 16)
                                        g = int("0x%s" % rgbin[3:5], 16)
                                        b = int("0x%s" % rgbin[5:7], 16)
                                        rgbin = (r, g, b)    
                                else :    
                                        try :
                                                r,g,b = map(lambda x : abs(float(string.strip(x))), string.split(rgbin, ","))
                                                rgbin = (r, g, b)
                                        except :
                                                if (shape != "Image") or (rgbin != "auto") :
                                                        try :
                                                                rgbin = getattr(reportlab.lib.colors, rgbin).rgb()
                                                        except AttributeError :    
                                                                raise PDFMapError, "Error in configuration file %s\n\tinvalid RGBin field : '%s'" % (filename, confline)

                        if not magnify :
                                magnify = 1.0
                        try :
                                magnify = abs(float(magnify))
                        except :
                                raise PDFMapError, "Error in configuration file %s\n\tinvalid Magnify field : '%s'" % (filename, confline)

                        if not minimalsize :
                                minimalsize = 0.0
                        try :
                                minimalsize = abs(float(minimalsize))
                        except :
                                raise PDFMapError, "Error in configuration file %s\n\tinvalid MinimalSize field : '%s'" % (filename, confline)

                        if not maximalsize :
                                maximalsize = float(sys.maxint) # TODO : find a better maximum value
                        try :
                                maximalsize = abs(float(maximalsize))
                        except :
                                raise PDFMapError, "Error in configuration file %s\n\tinvalid MaximalSize field : '%s'" % (filename, confline)

                        if cfg.has_key(nature) :
                                raise PDFMapError, "Error in configuration file %s\n\tduplicated line : '%s'" % (filename, confline)
                        cfg[nature] = { 'Shape': getattr(maptool, shape)(self, thickness, rgbout, rgbin), 'Magnify' : magnify, 'MinimalSize' : minimalsize, 'MaximalSize' : maximalsize, 'Description' : desc, 'Valid' : 0, 'TooSmall' : 0, 'TooBig' : 0 }
                if havetoclose :
                        conf.close()
                return cfg

        def draw_datas(self, configfile, inputfile, legend = 1) :
                """Draws all objects of an input file on the map.

                     configfile : the configuration file name

                     inputfile : the datas file name or handle,
                                 or "-" or None which both mean sys.stdin

                     legend : 1 indicates that we want a legend, 0 that we don't
                              by default legend is positionned in the upper right
                              corner of the page. Special values 'ur' (upper right)
                              'ul' (upper left), 'br' (bottom right) and 'bl'
                              (bottom left) are also accepted.
                """
                config = self._read_config(configfile)
                if config is None :
                        raise PDFMapError, "%s : invalid configuration file" % configfile

                havetoclose = 0
                if (inputfile == "-") or (inputfile is None) :
                        infile = sys.stdin
                elif hasattr(inputfile, "readline") :
                        infile = inputfile
                elif not os.path.isfile(inputfile) :
                        raise PDFMapError, "%s : file doesn't exist" % inputfile
                else :
                        infile = open(inputfile, "r")
                        havetoclose = 1

                linenumber = 0
                skipped = 0
                while 1 :
                        line = infile.readline()
                        if not line :
                                break
                        linenumber = linenumber + 1
                        line = string.strip(line)
                        if not line or (line[0] == '#') :
                                skipped = skipped + 1
                        else :
                                linesplit = self._splitline(config, line)
                                if linesplit is None :
                                        sys.stderr.write("%s : Error on line %i (skipped)\n" % (inputfile, linenumber))
                                        skipped = skipped + 1
                                else :
                                        self._draw_object(linesplit)
                if havetoclose :
                        infile.close()

                if legend :
                        self._draw_legend(config, linenumber, skipped, legend)

        def _draw_object(self, linesplit) :
                """Draws an object on the map.

                     linesplit : a tuple containing the corresponding
                                 entry in the configuration file and
                                 the fields from the input file :

                       (confobject, [ nature, x, y, length, width, orientation, url ])
                """
                (confobject, fields) = linesplit
                (nature, x, y, length, width, orientation, url) = fields
                magfactor = confobject["Magnify"]
                length = length * magfactor
                width = width * magfactor
                shapesize = length * width
                if shapesize < confobject["MinimalSize"] :
                        confobject["TooSmall"] = confobject["TooSmall"] + 1
                elif shapesize > confobject["MaximalSize"] :
                        confobject["TooBig"] = confobject["TooBig"] + 1
                else :
                        confobject["Valid"] = confobject["Valid"] + 1
                        confobject["Shape"].drawIt(x, y, length, width, orientation, url)

        def _splitline(self, configuration, line) :
                """Splits a data line, trying to be intelligent about the line format at the same time.

                     The datas read from the input file must be of the form :

                       nature\tx\ty\tlength\twidth\torientation\turl

                       or nature,x,y,length,width,orientation,url

                       or nature;x;y;length;width;orientation;url

                       or all the fields separated by any amount of whitespace

                       The url field is optionnal.
                """   
                ok = 0
                for separator in [',', ';', None] :
                         trythis = string.split(line, separator)
                         if 6 <= len(trythis) <= 7 :
                                ok = 1
                                break
                if not ok :
                        # invalid line after three passes
                        return

                # The url field is optionnal
                if len(trythis) == 6 :
                        trythis.append("")

                trythis = map(string.strip, trythis)
                for i in range(1, 5) :
                        try :
                                value = float(trythis[i])
                        except :
                                # invalid line
                                return
                        trythis[i] = value

                # be sure that length and width are positive
                if (trythis[3] < 0.0) or (trythis[4] < 0.0) :
                        # invalid length or width
                        return

                # computes the angle from the orientation
                # in fact just extract it from our dictionnary
                # if it's a string. If it's a number, just use it
                # directly modulo 360 degres
                orientation = trythis[5]
                try :
                        orientation = float(orientation) % 360
                except ValueError :
                        # it's a string
                        orientation = string.upper(orientation[:2])
                        if self.orientations.has_key(orientation) :
                                orientation = self.orientations[orientation]
                        else :
                                sys.stderr.write("Unknown orientation '%s', reset to North.\n" % orientation)
                                orientation = 0
                trythis[5] = orientation

                for nature in [trythis[0], "DEFAULT"] :
                        if configuration.has_key(nature) :
                                return (configuration[nature], trythis)
                raise PDFMapError, "Nature %s unknown and no DEFAULT entry in configuration file" % nature

        def _draw_grid(self) :
                """Draws the grid on the page."""
                pdfdoc = self.document
                pdfdoc.saveState()
                pdfdoc.setLineWidth(1)
                xmax = int(self.width / self.nbx) + 1
                ymax = int(self.height / self.nby) + 1
                if self.showxgrid :
                    xh = self.height
                else :    
                    xh = 5
                if self.showygrid :
                    yh = self.width
                else :    
                    yh = 5
                for x in range(0, xmax) :
                        xs = x * self.nbx
                        pdfdoc.line(xs, 0, xs, -5)
                        pdfdoc.line(xs, self.height, xs, self.height + 5)
                        pdfdoc.saveState()
                        pdfdoc.setLineWidth(0.01)
                        pdfdoc.line(xs, 0, xs, xh)
                        pdfdoc.line(xs, self.height, xs, self.height - 5)
                        pdfdoc.restoreState()
                for y in range(0, ymax) :
                        ys = y * self.nby
                        pdfdoc.line(-5, ys, 0, ys)
                        pdfdoc.line(self.width, ys, self.width + 5, ys)
                        pdfdoc.saveState()
                        pdfdoc.setLineWidth(0.01)
                        pdfdoc.line(0, ys, yh, ys)
                        pdfdoc.line(self.width - 5, ys, self.width, ys)
                        pdfdoc.restoreState()

                fontsize = 14
                pdfdoc.setFont('Helvetica', fontsize)
                x = 0
                if not self.xaxisalign :
                        x = x + (self.nbx / 2.0)
                xi = 0
                for xlabel in self.xaxis :
                        if xlabel :
                                pdfdoc.drawCentredString(x, self.height + 10, xlabel)
                                pdfdoc.drawCentredString(x, -(fontsize + 10) , xlabel)
                        x = x + self.nbx
                        xi = xi + 1
                        if xi >= xmax :
                                break
                y = 0
                if not self.yaxisalign :
                        y = y + (self.nby / 2.0)
                yi = 0
                for ylabel in self.yaxis :
                        if ylabel :
                                pdfdoc.drawString(self.width + 10, y - (fontsize / 2.5), ylabel)
                                pdfdoc.drawRightString(-10, y - (fontsize / 2.5), ylabel)
                        y = y + self.nby
                        yi = yi + 1
                        if yi >= ymax :
                                break
                pdfdoc.restoreState()

        def _draw_scales(self) :
                """Draws the x and optionally y scales."""
                if self.showxscale :
                        unit = self.xratio
                        pdfdoc = self.document
                        pdfdoc.saveState()
                        pdfdoc.setLineWidth(0.1)
                        pdfdoc.translate(0, -1.5*cm)
                        pdfdoc.line(0, -5, 0, 5)
                        pdfdoc.line(unit, -5, unit, 5)
                        pdfdoc.setLineWidth(0.1)
                        pdfdoc.rect(0, -2, unit, 4, fill=0)
                        size = unit / 10.0
                        xpos = size
                        for i in range(2) :
                                pdfdoc.rect(xpos, -2, size, 4, fill=1)
                                xpos += 2*size
                        pdfdoc.rect(unit / 2.0, 0, unit / 2.0, 2, fill=1)
                        pdfdoc.setFont("Helvetica", 8)
                        pdfdoc.drawCentredString(unit / 2.0, -12, "1.00 m")
                        pdfdoc.setStrokeColorRGB(1,0,0)
                        size = unit / 20.0
                        xpos = size
                        for i in range(1, 20) :
                                pdfdoc.line(xpos, -2, xpos, 2)
                                xpos += size
                        pdfdoc.restoreState()
                                
                if self.showyscale :
                        unit = self.yratio
                        pdfdoc.saveState()
                        pdfdoc.setLineWidth(0.1)
                        pdfdoc.translate(-1.5*cm, 0)
                        pdfdoc.line(-5, 0, 5, 0)
                        pdfdoc.line(-5, unit, 5, unit)
                        pdfdoc.setLineWidth(0.1)
                        pdfdoc.rect(-2, 0, 4, unit, fill=0)
                        size = unit / 10.0
                        ypos = size
                        for i in range(2) :
                                pdfdoc.rect(-2, ypos, 4, size, fill=1)
                                ypos += 2*size
                        pdfdoc.rect(0, unit / 2.0, 2, unit / 2.0, fill=1)
                        pdfdoc.setFont("Helvetica", 8)
                        pdfdoc.drawRightString(-5, unit / 2.0, "1.00 m")
                        pdfdoc.setStrokeColorRGB(1,0,0)
                        size = unit / 20.0
                        ypos = size
                        for i in range(1, 20) :
                                pdfdoc.line(-2, ypos, 2, ypos)
                                ypos += size
                        pdfdoc.restoreState()

        def _draw_north(self) :
                """Draws the North arrow."""
                if self.rotation is not None :
                        radius = 0.5*cm
                        pdfdoc = self.document
                        pdfdoc.saveState()
                        pdfdoc.translate(4 * radius + 30, 4 * radius + 30)  # 30 = 'N' FontSize
                        pdfdoc.rotate(self.rotation)
                        pdfdoc.setLineWidth(2)
                        pdfdoc.circle(0, 0, radius)
                        pdfdoc.line(-1.75*radius,0,1.75*radius,0)
                        pdfdoc.line(0,4*radius,0,-4*radius)
                        p = pdfdoc.beginPath()
                        p.moveTo(0, 4*radius)
                        p.lineTo(-0.5*radius, 3*radius)
                        p.lineTo(0, 3.5*radius)
                        p.lineTo(0.5*radius, 3*radius)
                        p.close()
                        pdfdoc.drawPath(p, fill=1)
                        p = pdfdoc.beginPath()
                        p.moveTo(0, -3*radius)
                        p.lineTo(-0.5*radius, -4*radius)
                        p.lineTo(0, -3.5*radius)
                        p.lineTo(0.5*radius, -4*radius)
                        p.close()
                        pdfdoc.drawPath(p, fill=1)
                        pdfdoc.setFillColorRGB(1,0,0)
                        pdfdoc.setFont('Times-Bold', 30)
                        pdfdoc.drawCentredString(0, 4*radius, "N")
                        pdfdoc.restoreState()
                        
        def _draw_titles(self) :
                """Draws the different titles and copyright messages."""
                fontsize = 28
                pdfdoc = self.document
                pdfdoc.saveState()
                pdfdoc.translate(0, self.height)
                pdfdoc.setFont('Times-Roman', fontsize)
                pdfdoc.drawString(0, fontsize, "%s" % self.title)
                pdfdoc.setFont('Times-Roman', fontsize - 4)
                pdfdoc.drawRightString(self.width, fontsize, "%s" % self.subtitle)
                pdfdoc.restoreState()
                pdfdoc.saveState()
                pdfdoc.setFont("Helvetica", 8)
                pdfdoc.drawRightString(self.width, -1.5*cm, time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time())))
                pdfdoc.restoreState()

        def _draw_call_logo(self) :
                """Draws C@LL's logo.

                     This method expects a file named %s in the current
                     directory. If the file is absent, then nothing is
                     done, otherwise a clickable C@LL logo is drawn.

                     This is not intended to make this software
                     non Free in any way, it's just for me to make
                     demos not reusable by free riders. Does anyone
                     have a better solution ?
                """ % LOGONAME
                if os.path.isfile(LOGONAME) :
                        image = PIL.Image.open(LOGONAME)
                        (width, height) = image.size
                        del image
                        pdfdoc = self.document
                        multi = (height + 0.0) / (2 * cm)
                        width = width / multi
                        height = height / multi
                        self.logowidth = width 
                        self.logoheight = height 
                        website_width = pdfdoc.stringWidth(COPYRIGHT, 'Times-Roman', 12)
                        copyright_width = pdfdoc.stringWidth(COPYRIGHT, 'Helvetica', 8)
                        self.logowidth = max(self.logowidth, website_width, copyright_width)
                        self.logoheight = self.logoheight + 2 * cm

                        pdfdoc.saveState()
                        pdfdoc.translate(cm, self.height - cm - self.logoheight)
                        pdfdoc.setLineWidth(2)
                        pdfdoc.setStrokeColorRGB(0, 0, 0)
                        pdfdoc.setFillColorRGB(1,1,1)
                        p = pdfdoc.beginPath()
                        p.rect(0, 0, self.logowidth, self.logoheight)
                        p.close()
                        pdfdoc.drawPath(p, fill=1)
                        pdfdoc.drawImage(LOGONAME, (self.logowidth - width) / 2, 1.5*cm, width, height, mask="auto")
                        (r, g, b) = WEBSITECOLOR
                        pdfdoc.setFillColorRGB(r, g, b)
                        pdfdoc.setStrokeColorRGB(r, g, b)
                        pdfdoc.drawCentredString(self.logowidth / 2.0, 1*cm, WEBSITE)
                        pdfdoc.setFont('Helvetica', 8)
                        pdfdoc.drawCentredString(self.logowidth / 2.0, 0.5*cm, COPYRIGHT)
                        pdfdoc.linkURL(WEBSITE, (0, 0, self.logowidth, self.logoheight), relative=1)
                        pdfdoc.restoreState()

        def _draw_legend(self, config, total, rejected, legend) :
                """Draws the map legend."""
                pdfdoc = self.document
                font = "Times-Roman"
                fontsize = 10

                # computes the legend's width
                maxwidth = 0
                lines = []
                toosmall = toobig = 0
                for key in config.keys() :
                        cfg = config[key]
                        toosmall = toosmall + cfg["TooSmall"]
                        toobig = toobig + cfg["TooBig"]
                        if cfg["Valid"] :
                                chaine = "%s" % key
                                if cfg["Description"] :
                                        chaine = chaine + " - %s" % cfg["Description"]
                                chaine = chaine + " (%i : %02.2f%%)" % (cfg["Valid"], (cfg["Valid"] * 100.0 / (total - rejected)))
                                linewidth = pdfdoc.stringWidth(chaine, font, fontsize)
                                if linewidth > maxwidth :
                                        maxwidth = linewidth
                                lines.append((cfg["Description"] or key, key, chaine))
                totalline = "%i lines, %i skipped, %i too small, %i too big" % (total, rejected, toosmall, toobig)
                linewidth = pdfdoc.stringWidth(totalline, font, fontsize)
                if linewidth > maxwidth :
                        maxwidth = linewidth

                largeur = maxwidth + (2 * cm) + 15
                hauteur = len(lines) * 20
                pdfdoc.saveState()
                pdfdoc.setFont(font, fontsize)
                
                try :
                    legend = legend.lower()
                except AttributeError :    
                    legend = "ur"
                
                if legend == "ur" :
                    xpos = self.width - largeur - cm
                    ypos = self.height - hauteur - cm
                elif legend == "ul" :    
                    xpos = cm
                    ypos = self.height - hauteur - cm
                elif legend == "br" :    
                    xpos = self.width - largeur - cm
                    ypos = 2*cm
                elif legend == "bl" :    
                    xpos = cm
                    ypos = 2*cm
                else :
                    raise ValueError, "Invalid legend positioning '%s'" % legend
                    
                pdfdoc.translate(xpos, ypos)
                pdfdoc.setLineWidth(2)
                pdfdoc.setStrokeColorRGB(0, 0, 0)
                pdfdoc.setFillColorRGB(1,1,1)
                p = pdfdoc.beginPath()
                p.rect(0, -cm, largeur, hauteur + cm)
                p.close()
                pdfdoc.drawPath(p, fill=1)

                pdfdoc.setStrokeColorRGB(0, 0, 0)
                pdfdoc.setFillColorRGB(0, 0, 0)

                lines.sort()
                for k in range(len(lines)) :
                        (dummy, key, line) = lines[k]
                        cfg = config[key]
                        pdfdoc.saveState()
                        pdfdoc.setLineWidth(0.01)
                        pdfdoc.translate(cm, hauteur - ((k+1) * 20) + (fontsize / 2.0))
                        # we fool the engine with false coordinates and rotation
                        obj = cfg["Shape"].drawIt(self.xorigin, self.yorigin, fontsize / self.xratio, fontsize / (2.0 * self.yratio), -(self.rotation or 0))
                        pdfdoc.restoreState()
                        pdfdoc.drawString(cm + 15, hauteur - ((k+1) * 20), line)
                pdfdoc.setFont(font, fontsize - 2)
                pdfdoc.drawCentredString(largeur / 2.0, -24, totalline)
                pdfdoc.restoreState()

def __display_version_and_quit() :
        """Displays version number, then exists successfully."""
        print version.__version__
        sys.exit(0)

def __display_usage_and_quit() :
        """Displays command line usage, then exists successfully."""
        print __doc__
        sys.exit(0)

def standardize_form(form) :
        """Tries to determine if we were launched as a CGI script
           or from Zope, then returns the form contents as a dictionnary
           identical in both cases."""
        # this field MUST be present in all cases
        if hasattr(form["PDFMapFormIsValid"], "value") :
                # regular CGI script
                # we must get rid of this '.value' thing
                newform = {}
                for key in form.keys() :
                        newform[key] = form[key].value
                newform["bgmap"] = PIL.Image.open(cStringIO.StringIO(newform["bgmap"])).convert("RGB")
                for file in ["config", "datafile"] :
                        if newform.has_key(file) :
                                newform[file] = cStringIO.StringIO(newform[file])
                return newform
        else :
                # probably Zope : it's already a regular dictionnary
                # so we return it unchanged for now.
                # TODO : verify if we have to do something for the input fields of type file.
                return form

def parse_commandline(argv, short, long) :
        """Parses the command line, controlling options."""
        # split options in two lists: those which need an argument, those which don't
        withoutarg = []
        witharg = []
        lgs = len(short)
        i = 0
        while i < lgs :
                ii = i + 1
                if (ii < lgs) and (short[ii] == ':') :
                        # needs an argument
                        witharg.append(short[i])
                        ii = ii + 1 # skip the ':'
                else :
                        # doesn't need an argument
                        withoutarg.append(short[i])
                i = ii
        for option in long :
                if option[-1] == '=' :
                        # needs an argument
                        witharg.append(option[:-1])
                else :
                        # doesn't need an argument
                        withoutarg.append(option)

        # we begin with all possible options unset
        parsed = {}
        for option in withoutarg + witharg :
                parsed[option] = None

        # then we parse the command line
        args = []       # to not break if something unexpected happened
        try:
                options,args = getopt.getopt(argv, short, long)
                if options :
                        for (o, v) in options :
                                # we skip the '-' chars
                                lgo = len(o)
                                i = 0
                                while (i < lgo) and (o[i] == '-') :
                                        i = i + 1
                                o = o[i:]
                                if o in witharg :
                                        # needs an argument : set it
                                        parsed[o] = v
                                elif o in withoutarg :
                                        # doesn't need an argument : boolean
                                        parsed[o] = 1
                                else :
                                        # should never occur
                                        raise PDFMapError, "Unexpected problem when parsing command line"
                elif (not args) and sys.stdin.isatty() : # no option and no argument, we display help if we are a tty
                        __display_usage_and_quit()
        except getopt.error,msg :
                sys.stderr.write("%s\n" % msg)
                __display_usage_and_quit()
        return (parsed, args)

def createpdfmap(cmdline, arguments, mandatory) :
        """Options check and conversions, then does the real work."""
        # convert some arguments to float if possible, else display error
        tofloat = ["xorigin", "yorigin", "xscale", "yscale", "xstep", "ystep", "rotation"]
        # providing a map background is optionnal
        if cmdline["bgmap"] is not None :
                # but if we do it we must ensure other options are present
                tofloat.extend(["bgx", "bgy", "bgwidth", "bgheight", "bgrotation"])
        for option in tofloat :
                try :
                        cmdline[option] = float(cmdline[option])
                except ValueError :
                        sys.stderr.write("Bad option %s : %s\n" % (option, cmdline[option]))
                        __display_usage_and_quit()
                except TypeError :      # None
                        sys.stderr.write("Option %s is mandatory\n" % option)
                        __display_usage_and_quit()

        # do we want a rasterized map for the background ?
        if cmdline["bgmap"] is not None :
                background = MapBackground(cmdline["bgmap"], cmdline["bgx"], cmdline["bgy"], cmdline["bgwidth"], cmdline["bgheight"], cmdline["bgrotation"])
        else :
                background = None

        # verifies mandatory values
        # for floating point number that's already done (see above)
        for option in mandatory :
                if cmdline[option] is None :
                        sys.stderr.write("Option %s is mandatory\n" % option)
                        __display_usage_and_quit()

        # check some values
        cmdline["orientation"] = string.lower(cmdline["orientation"])
        if cmdline["orientation"] not in ["portrait", "landscape"] :
                sys.stderr.write("Unknown %s paper orientation\n" % cmdline["orientation"])
                __display_usage_and_quit()

        # initialize the PDF document
        doc = PDFMap(cmdline["author"], cmdline["title"], cmdline["subtitle"], cmdline["papersize"])

        # set the format of the next pages
        doc.formatpage(cmdline["orientation"], cmdline["leftmargin"], cmdline["bottommargin"], cmdline["rightmargin"], cmdline["topmargin"])

        # sets the labels for the two axis
        doc.setaxis(xaxis = cmdline["xlabels"], yaxis = cmdline["ylabels"], xaxisalign = cmdline["xalign"], yaxisalign = cmdline["yalign"])

        # generates a new page for each input file
        for infile in arguments :
                # initialize the new page
                doc.initpage(background, cmdline["xorigin"], cmdline["yorigin"], cmdline["xscale"], cmdline["yscale"], cmdline["xstep"], cmdline["ystep"], cmdline["rotation"])

                # draws the datas read from he input files
                # according to what's in the configuration file
                doc.draw_datas(cmdline["config"], infile, cmdline["legend"])

                # ends the current page
                doc.endpage()

        # returns the Map in PDF
        return doc

def main() :
        """Main code here."""
        short_options = "hv"
        long_options = ["config=", "help", "version", "outputfile=", "legend", \
                        "bgmap=", "bgx=", "bgy=", "bgwidth=", "bgheight=", "bgrotation=", \
                        "author=", "title=", "subtitle=", "papersize=", "orientation=", \
                        "leftmargin=", "bottommargin=", "rightmargin=", "topmargin=", \
                        "xlabels=", "ylabels=", "xalign", "yalign", \
                        "xorigin=", "yorigin=", "xscale=", "yscale=", "xstep=", "ystep=", "rotation="]

        # what non-number options are mandatory (NB: every number option is mandatory)
        mandatory = ["config", "papersize", "orientation", "leftmargin", "bottommargin", "rightmargin", "topmargin"]

        # are we a CGI script ?
        if (len(sys.argv) < 2) and os.environ.has_key("REQUEST_METHOD") :
                # YES, probably
                try :
                        import jaxml
                except ImportError :
                        sys.stderr.write("You MUST have installed the jaxml Python module.\nYou can download it from http://cortex.unice.fr/~jerome/\n")
                        sys.exit(-1)
                try :
                        doc = jaxml.CGI_document()
                        form = cgi.FieldStorage()
                        if not form.has_key("PDFMapFormIsValid") :
                                doc._default_header("PDFMap v%s" % version.__version__)
                                doc.body(bgcolor="white")
                                doc._text(HTMLFORM)
                        else :
                                # standardizes the form
                                newform = standardize_form(form)

                                # creates the PDF document
                                args = [newform["datafile"]]
                                if not newform.has_key("legend") :
                                        newform["legend"] = None
                                pdfmap = createpdfmap(newform, args, mandatory)

                                # sets the correct HTTP header
                                doc._set_content_type("application/pdf")
                                doc._set_content_disposition("attachment; filename=map.pdf")
                                doc._text(str(pdfmap))
                except PDFMapError, message :
                        # send an error document to the client, in HTML
                        title = "PDFMap v%s Error" % version.__version__
                        doc = jaxml.CGI_document()
                        doc._default_header(title)
                        doc.body()
                        doc.h2(title)
                        doc._text(message)

                        # also send something to stderr => Web server's error log file
                        sys.stderr.write("%s - %s\n" % (title, message))
                        sys.stderr.flush()

                # output our HTML doc
                doc._output()

                # we must exit with 0 otherwise Apache sends an Internal Server Error
                # and our message above is not sent at all.
                sys.exit(0)
        else :
                # NO, certainely
                try :
                        # normal command line launch, then first parse it
                        (cmdline, args) = parse_commandline(sys.argv[1:], short_options, long_options)

                        # see if we have to display usage or version
                        # if this is the case then the program ends here
                        if (cmdline["help"] is not None) or (cmdline["h"] is not None) :
                                __display_usage_and_quit()
                        elif (cmdline["version"] is not None) or (cmdline["v"] is not None) :
                                __display_version_and_quit()
                        else :  # unneeded
                                # no argument and stdin is redirected, then
                                # we will read the datas from stdin
                                if (not args) :
                                        if not sys.stdin.isatty() :
                                                args.append("-")
                                        else :        
                                                raise PDFMapError, "You must pass some datas as input !"

                                # creates the PDF document
                                doc = createpdfmap(cmdline, args, mandatory)

                                # generates the PDF document
                                doc.output(cmdline["outputfile"])
                except PDFMapError, message :
                        sys.stderr.write("%s\n" % message)
                        sys.stderr.flush()
                        sys.exit(-1)
                        
if __name__ == '__main__' :
        main()
