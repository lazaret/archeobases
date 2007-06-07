# Module for HTML ouput
# -*- coding: UTF-8 -*-

# jahtml
# (C) Jerome ALET <alet@unice.fr> 1999-2001
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# =====================================================================
#
# THIS MODULE IS OBSOLETED BY THE JAXML MODULE.
#
# YOU CAN FIND THE JAXML MODULE AT:
#
#         http://cortex.unice.fr/~jerome/jaxml/
#
# BUT BE CAREFUL BECAUSE THE API HAS CHANGED A LITTLE !!!
#
# =====================================================================
#
#
# $Id: jahtml.py,v 1.5 2001/02/06 10:10:17 jerome Exp $
#

import sys
import string
import time
import os
import cStringIO
import urllib

__version__ = "2.00"

class Html_document:
    """This class defines an HTML document.

       Not all functions should be called from the outside.
    """
    def __init__(self):
        """Initialize local datas."""
        self.__page__ = []
        self.__pushed__ = []
        self.__position__ = 0
        self.__indentstring__ = " "
        sys.stderr.write("WARNING: The jahtml.Html_document() class shouldn't be used anymore.\n")
        sys.stderr.write("Use jaxml.HTML_document() instead, and modify your programs according to the new API.\n")
        sys.stderr.write("Download jaxml now from: http://cortex.unice.fr/~jerome/jaxml/\n")
        sys.stderr.flush()

    def __calculate_args__(self, modifier, value) :
        if value != None :
            value = str(value)
            if string.find(value, "'") != -1 :
                return string.upper(modifier) + '="' + value + '" '
            else :
                return string.upper(modifier) + "='" + value + "' "
        else :
            return ""

    def __insert_symtag__(self, tag, arguments, dotab = 1, donl = 0, domod = 0):
        """Insert a symetrical tag (e.g. <BODY> </BODY>) in the page.

           tag
                tag to be inserted
           arguments
                tag's arguments (e.g. BACKGROUND='image.gif')
           dotab
                if the tag should shift to the right on opening and left on closing
           donl
                if newlines should be added after the tag
           domod
                if content between opening and closing should be output as-is or not
        """
        text = tag
        if arguments != "" :
            text = text + " " + arguments
            if text[-1] == ' ' :
                text = text[:-1]

        if dotab :
                tab_in = 1
                tab_out = -1
        else :
                tab_in = 0
                tab_out = 0

        if donl :
                nl_in = -1
                nl_out = 1
        else :
                nl_in = 0
                nl_out = 0

        if domod :
                mod_in = -1
                mod_out = 1
        else :
                mod_in = 0
                mod_out = 0

        self.__page__.insert(self.__position__, ("<" + text + ">", tab_in, nl_in, mod_in))
        self.__position__ = self.__position__ + 1
        self.__page__.insert(self.__position__, ("</" + tag + ">", tab_out, nl_out, mod_out))
        self.__adjust_stack__(2)

    def __subst_lines__(self, lines, **vars):
        """Substitues var names with their values.

           parts of this function come from the Whiz package
           THANKS TO Neale Pickett ! Here follows the original license terms for Whiz:
                ## Author: Neale Pickett <neale@lanl.gov>
                ## Time-stamp: <99/02/11 10:45:42 neale>

                ## This software and ancillary information (herein called "SOFTWARE")
                ## called html.py made avaiable under the terms described here.  The
                ## SOFTWARE has been approved for release with associated LA-CC Number
                ## 89-47.

                ## Unless otherwise indicated, this SOFTWARE has been authored by an
                ## employee or employees of the University of California, operator of
                ## the Los Alamos National Laboratory under contract No. W-7405-ENG-36
                ## with the U.S. Department of Energy.  The U.S. Government has rights
                ## to use, reproduce, and distribute this SOFTWARE.  The public may
                ## copy, distribute, prepare derivative works and publicly display this
                ## SOFTWARE without charge, provided that this Notice and any statement
                ## of authorship are reproduced on all copies.  Neither the Government
                ## nor the University makes any warranty, express or implied, or assumes
                ## any liability or responsibility for the use of this SOFTWARE.

                ## If SOFTWARE is modified to produce derivative works, such modified
                ## SOFTWARE should be clearly marked, so as not to confuse it with the
                ## version available from LANL.
        """
        import regex

        container = regex.compile('\(<!-- \)?##\([-_A-Za-z0-9]+\)##\( -->\)?')

        for line in lines:
                while container.search(line) != -1:
                        try:
                                replacement = str(vars[container.group(2)])
                        except KeyError:
                                replacement = str('<!-- Unmached variable: ' + container.group(2) + ' -->')

                        pre = line[:container.regs[0][0]]
                        post = line[container.regs[0][1]:]

                        if string.strip(pre) == '':
                                # pre is just whitespace, so pad our replacement's lines with that space
                                lines = string.split(replacement, '\n')
                                new = [lines[0]]

                                for l in lines[1:]:
                                        new.append(pre + l)
                                replacement = string.join(new, '\n')

                        line = "%s%s%s" % (pre, replacement, post)
                self.insert_text(line)

    def __adjust_stack__(self, offset) :
        """Adjust the stack of pushed positions.

           offset
                offset by which adjust the stack
        """

        if len(self.__pushed__) :
            pos, oldoffset = self.__pushed__[-1]
            self.__pushed__[-1] = (pos, oldoffset + offset)

    def __enclosing_tag__(self, tag, args, text, dotab = 1, donl = 0, domod = 0) :
        """Insert a text enclosed between an opening an a closing tag.

           tag
                the tag to use
           text
                the text to enclose
        """
        self.push()
        self.__insert_symtag__(tag, args, dotab, donl, domod)
        self.insert_text(text)
        self.pop()

    def __ienclosing_tag__(self, tag, args, text, dotab = 1, donl = 0, domod = 0) :
        """Same as above, but intelligent."""
        if text != "" :
                 self.__enclosing_tag__(tag, args, text, dotab, donl, domod)
        else :
                 self.__insert_symtag__(tag, args, dotab, donl, domod)

#
#
# Here begins the callable interface

    def set_indentstring(self, newindentstring = " "):
        """Sets the indentation string for the output (default is a single space character).

           newindentstring
                new indentation string, e.g. 2 spaces, default is a single space character
        """
        self.__indentstring__ = newindentstring

    def insert_tag(self, tag, arguments):
        """Insert a non symetrical tag (e.g. <BR>) in the page.

           tag
                tag to be inserted
           arguments
                tag's arguments
        """
        text = tag
        if arguments != "" :
            text = text + " " + arguments
            if text[-1] == ' ' :
                text = text[:-1]

        self.__page__.insert(self.__position__, ("<" + text + ">", 0, 0, 0))
        self.__position__ = self.__position__ + 1
        self.__adjust_stack__(1)

    def insert_text(self, text):
        """Insert plain text in the page.

           text
                text to be inserted
        """
        self.__page__.insert(self.__position__, (str(text), 0, 0, 0))
        self.__position__ = self.__position__ + 1
        self.__adjust_stack__(1)

    def push(self) :
        """Push the current tag's position.

           useful before a block of imbricated tags
        """
        self.__pushed__.append((self.__position__, 0))

    def pop(self) :
        """Restore the latest pushed position.

           useful to get out of a block of imbricated tags
        """
        if len(self.__pushed__) :
            pos,offset = self.__pushed__[-1]
            self.__position__ = pos + offset
            del self.__pushed__[-1]
            self.__adjust_stack__(offset) # we report the offset on previous saved tags

    def __repr__(self) :
        """returns the document as a string of text"""
        outstr = cStringIO.StringIO()
        tabs = 0
        savetabs = -1
        blocage = 0
        nl = 0
        for i in range(len(self.__page__)):
            texte, decalage, newline, canmodify = self.__page__[i]
            texte = str(texte)

            if (blocage == 0) and (savetabs != -1) :
                tabs = savetabs
                savetabs = -1

            blocage = blocage + canmodify
            if (blocage == 0) :
                if decalage == -1 :
                        tabs = tabs - 1
                        outstr.write("%s" % ((self.__indentstring__ * tabs) + texte))
                elif decalage == 1 :
                        outstr.write("%s" % ((self.__indentstring__ * tabs) + texte))
                        tabs = tabs + 1
                else :
                        outstr.write("%s" % ((self.__indentstring__ * tabs) + texte))
            else:
                if savetabs == -1 :
                        savetabs = tabs
                        tabs = 0
                outstr.write("%s" % texte)

            nl = nl + newline
            if (blocage == 0) and (nl == 0) :
                outstr.write("\n")
        outstr.flush()
        retval = outstr.getvalue()
        outstr.close()
        return retval

    __str__ = __repr__

    def output(self, file = "-") :
        """Ouput the page, with indentation.

           file
                the file object or filename to output to
        """
        isopen = 0
        if type(file) == type("") :
            if (file != "-") and (file != "") :
                outf = open(file, "w")
                isopen = 1
            else :
                outf = sys.stdout
        else :
            outf = file
        outf.write("%s" % repr(self))
        outf.flush()
        if isopen :
                outf.close()

    def template(self, file = "-", **vars) :
        """Include an external file in the current doc.

           Replace ##vars## with their values
           parts of this function come from the Whiz package
           THANKS TO Neale Pickett ! Here follows the original license terms for Whiz:
                ## Author: Neale Pickett <neale@lanl.gov>
                ## Time-stamp: <99/02/11 10:45:42 neale>

                ## This software and ancillary information (herein called "SOFTWARE")
                ## called html.py made avaiable under the terms described here.  The
                ## SOFTWARE has been approved for release with associated LA-CC Number
                ## 89-47.

                ## Unless otherwise indicated, this SOFTWARE has been authored by an
                ## employee or employees of the University of California, operator of
                ## the Los Alamos National Laboratory under contract No. W-7405-ENG-36
                ## with the U.S. Department of Energy.  The U.S. Government has rights
                ## to use, reproduce, and distribute this SOFTWARE.  The public may
                ## copy, distribute, prepare derivative works and publicly display this
                ## SOFTWARE without charge, provided that this Notice and any statement
                ## of authorship are reproduced on all copies.  Neither the Government
                ## nor the University makes any warranty, express or implied, or assumes
                ## any liability or responsibility for the use of this SOFTWARE.

                ## If SOFTWARE is modified to produce derivative works, such modified
                ## SOFTWARE should be clearly marked, so as not to confuse it with the
                ## version available from LANL.
        """
        if type(file) == type("") :
            if (file != "-") and (file != "") :
                inf = open(file, "r")
            else :
                inf = sys.stdin
        else :
            inf = file

        lines = map(lambda l: l[:-1], inf.readlines())
        if inf != sys.stdin :
                inf.close()
        apply(self.__subst_lines__, (lines,), vars)

    def head(self) :
        """Insert a <HEAD></HEAD> tag."""
        self.__insert_symtag__("HEAD", "")

    def tbody(self) :
        """Insert a <TBODY></TBODY> tag."""
        self.__insert_symtag__("TBODY", "")

    def tfoot(self) :
        """Insert a <TFOOT></TFOOT> tag."""
        self.__insert_symtag__("TFOOT", "")

    def blink(self, text="") :
        """Insert a <BLINK></BLINK> tag."""
        self.__ienclosing_tag__("BLINK", "", text)

    def blockquote(self, text="") :
        """Insert a <BLOCKQUOTE></BLOCKQUOTE> tag."""
        self.__ienclosing_tag__("BLOCKQUOTE", "", text)

    def center(self, text="") :
        """Insert a <CENTER></CENTER> tag."""
        self.__ienclosing_tag__("CENTER", "", text)

    def address(self, text="") :
        """Insert a <ADDRESS></ADDRESS> tag with the enclosed text."""
        self.__ienclosing_tag__("ADDRESS", "", text)

    def title(self, text) :
        """Insert a <TITLE></TITLE> tag with the enclosed text."""
        self.__ienclosing_tag__("TITLE", "", text)

    def server(self, text) :
        """Insert a <SERVER></SERVER> tag with the enclosed text."""
        self.__ienclosing_tag__("SERVER", "", text)

    def nobr(self, text="") :
        """Insert a <NOBR></NOBR> tag with the enclosed text."""
        self.__ienclosing_tag__("NOBR", "", text)

    def noembed(self, text="") :
        """Insert a <NOEMBED></NOEMBED> tag with the enclosed text."""
        self.__ienclosing_tag__("NOEMBED", "", text)

    def noframes(self, text="") :
        """Insert a <NOFRAMES></NOFRAMES> tag with the enclosed text."""
        self.__ienclosing_tag__("NOFRAMES", "", text)

    def noscript(self, text="") :
        """Insert a <NOSCRIPT</NOSCRIPT> tag with the enclosed text."""
        self.__ienclosing_tag__("NOSCRIPT", "", text)

    def html(self, **modifiers) :
        """Insert a <HTML></HTML> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("HTML", arg)

    def body(self, **modifiers) :
        """Insert a <BODY></BODY> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("BODY", arg)

    def dir(self, **modifiers) :
        """Insert a <DIR></DIR> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("DIR", arg)

    def div(self, **modifiers) :
        """Insert a <DIV></DIV> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("DIV", arg)

    def form(self, **modifiers) :
        """Insert a <FORM></FORM> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("FORM", arg)

    def select(self, **modifiers) :
        """Insert a <SELECT></SELECT> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("SELECT", arg)

    def select_multiple(self, **modifiers) :
        """Insert a <SELECT></SELECT> tag."""
        arg="MULTIPLE "
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("SELECT", arg)

    def frame(self, **modifiers) :
        """Insert a <FRAME></FRAME> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("FRAME", arg)

    def frameset(self, **modifiers) :
        """Insert a <FRAMESET></FRAMESET> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("FRAMESET", arg)

    def iframe(self, **modifiers) :
        """Insert a <IFRAME></IFRAME> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("IFRAME", arg)

    def ilayer(self, **modifiers) :
        """Insert a <ILAYER></ILAYER> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("ILAYER", arg)

    def layer(self, **modifiers) :
        """Insert a <LAYER></LAYER> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("LAYER", arg)

    def map(self, **modifiers) :
        """Insert a <MAP></MAP> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("MAP", arg)

    def menu(self, **modifiers) :
        """Insert a <MENU></MENU> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("MENU", arg)

    def multicol(self, **modifiers) :
        """Insert a <MULTICOL></MULTICOL> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("MULTICOL", arg)

    def ol(self, **modifiers) :
        """Insert a <OL></OL> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("OL", arg)

    def ul(self, **modifiers) :
        """Insert a <UL></UL> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("UL", arg)

    def table(self, **modifiers) :
        """Insert a <TABLE></TABLE> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("TABLE", arg)

    def tr(self, **modifiers) :
        """Insert a <TR></TR> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__insert_symtag__("TR", arg)

    def caption(self, text="", **modifiers) :
        """Insert a <CAPTION></CAPTION> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("CAPTION", arg, text)

    def td(self, text="", **modifiers) :
        """Insert a <TD></TD> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("TD", arg, text)

    def th(self, text="", **modifiers) :
        """Insert a <TH></TH> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("TH", arg, text)

    def thead(self, text="", **modifiers) :
        """Insert a <THEAD></THEAD> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("THEAD", arg, text)

    def comment(self, text="", **modifiers) :
        """Insert a <COMMENT></COMMENT> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("COMMENT", arg, text)

    def dd(self, text="", **modifiers) :
        """Insert a <DD></DD> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("DD", arg, text)

    def dl(self, text="", **modifiers) :
        """Insert a <DL></DL> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("DL", arg, text)

    def dt(self, text="", **modifiers) :
        """Insert a <DT></DT> tag."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("DT", arg, text)

    def style(self, text="", **modifiers) :
        """Insert a <STYLE></STYLE> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("STYLE", arg, text)

    def applet(self, text="", **modifiers) :
        """Insert a <APPLET></APPLET> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("APPLET", arg, text)

    def marquee(self, text="", **modifiers) :
        """Insert a <MARQUEE></MARQUEE> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("MARQUEE", arg, text)

    def area(self, **modifiers) :
        """Insert a <AREA> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("AREA", arg)

    def input(self, **modifiers) :
        """Insert a <INPUT> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def submit(self, **modifiers) :
        """Insert a <INPUT TYPE="submit"> tag with all its arguments."""
        arg='TYPE="submit" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def reset(self, **modifiers) :
        """Insert a <INPUT TYPE="reset"> tag with all its arguments."""
        arg='TYPE="reset" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def radio(self, **modifiers) :
        """Insert a <INPUT TYPE="radio"> tag with all its arguments."""
        arg='TYPE="radio" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def radio_checked(self, **modifiers) :
        """Insert a <INPUT TYPE="radio" CHECKED> tag with all its arguments."""
        arg='TYPE="radio" CHECKED '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def checkbox(self, **modifiers) :
        """Insert a <INPUT TYPE="checkbox"> tag with all its arguments."""
        arg='TYPE="checkbox" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def checkbox_checked(self, **modifiers) :
        """Insert a <INPUT TYPE="checkbox" CHECKED> tag with all its arguments."""
        arg='TYPE="checkbox" CHECKED '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def password(self, **modifiers) :
        """Insert a <INPUT TYPE="password"> tag with all its arguments."""
        arg='TYPE="password" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def hidden(self, **modifiers) :
        """Insert a <INPUT TYPE="hidden"> tag with all its arguments."""
        arg='TYPE="hidden" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def text(self, **modifiers) :
        """Insert a <INPUT TYPE="text"> tag with all its arguments."""
        arg='TYPE="text" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def button(self, **modifiers) :
        """Insert a <INPUT TYPE="button"> tag with all its arguments."""
        arg='TYPE="button" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def file(self, **modifiers) :
        """Insert a <INPUT TYPE="file"> tag with all its arguments."""
        arg='TYPE="file" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def image(self, **modifiers) :
        """Insert a <INPUT TYPE="image"> tag with all its arguments."""
        arg='TYPE="image" '
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("INPUT", arg)

    def spacer(self, **modifiers) :
        """Insert a <SPACER> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("SPACER", arg)

    def meta(self, **modifiers) :
        """Insert a <META> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("META", arg)

    def object(self, **modifiers) :
        """Insert a <OBJECT> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("OBJECT", arg)

    def isindex(self, **modifiers) :
        """Insert a <ISINDEX> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("ISINDEX", arg)

    def keygen(self, **modifiers) :
        """Insert a <KEYGEN> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("KEYGEN", arg)

    def img(self, **modifiers) :
        """Insert a <IMG> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("IMG", arg)

    def link(self, **modifiers) :
        """Insert a <LINK> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("LINK", arg)

    def base(self, **modifiers) :
        """Insert a <BASE> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("BASE", arg)

    def basefont(self, **modifiers) :
        """Insert a <BASEFONT> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("BASEFONT", arg)

    def bgsound(self, **modifiers) :
        """Insert a <BGSOUND> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("BGSOUND", arg)

    def br(self, **modifiers) :
        """Insert a <BR> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("BR", arg)

    def wbr(self, **modifiers) :
        """Insert a <WBR> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("WBR", arg)

    def embed(self, **modifiers) :
        """Insert a <EMBED> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("EMBED", arg)

    def hr(self, **modifiers) :
        """Insert a <HR> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("HR", arg)

    def hr_noshade(self, **modifiers) :
        """Insert a <HR NOSHADE> tag with all its arguments."""
        arg="NOSHADE "
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("HR", arg)

    def col(self, **modifiers) :
        """Insert a <COL> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("COL", arg)

    def colgroup(self, **modifiers) :
        """Insert a <COLGROUP> tag with all its arguments."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.insert_tag("COLGROUP", arg)

    def textarea(self, text="", **modifiers) :
        """Insert a <TEXTAREA></TEXTAREA> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("TEXTAREA", arg, text, 0, 1, 1)

    def a(self, text="", **modifiers) :
        """Insert a <A></A> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("A", arg, text, 0, 1, 1)

    def h1(self, text="", **modifiers) :
        """Insert a <H1></H1> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H1", arg, text)

    def h2(self, text="", **modifiers) :
        """Insert a <H2></H2> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H2", arg, text)

    def h3(self, text="", **modifiers) :
        """Insert a <H3></H3> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H3", arg, text)

    def h4(self, text="", **modifiers) :
        """Insert a <H4></H4> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H4", arg, text)

    def h5(self, text="", **modifiers) :
        """Insert a <H5></H5> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H5", arg, text)

    def h6(self, text="", **modifiers) :
        """Insert a <H6></H6> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("H6", arg, text)

    def kbd(self, text="", **modifiers) :
        """Insert a <KBD></KBD> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("KBD", arg, text)

    def em(self, text="", **modifiers) :
        """Insert a <EM></EM> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("EM", arg, text)

    def i(self, text="", **modifiers) :
        """Insert a <I></I> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("I", arg, text)

    def u(self, text="", **modifiers) :
        """Insert a <U></U> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("U", arg, text)

    def tt(self, text="", **modifiers) :
        """Insert a <TT></TT> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("TT", arg, text)

    def dfn(self, text="", **modifiers) :
        """Insert a <DFN></DFN> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("DFN", arg, text)

    def var(self, varname="", **modifiers) :
        """Insert a <VAR></VAR> tag with the enclosed variable name."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("VAR", arg, varname)

    def b(self, text="", **modifiers) :
        """Insert a <B></B> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("B", arg, text)

    def strong(self, text="", **modifiers) :
        """Insert a <STRONG></STRONG> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("STRONG", arg, text)

    def span(self, text="", **modifiers) :
        """Insert a <SPAN></SPAN> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SPAN", arg, text)

    def sup(self, text="", **modifiers) :
        """Insert a <SUP></SUP> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SUP", arg, text)

    def sub(self, text="", **modifiers) :
        """Insert a <SUB></SUB> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SUB", arg, text)

    def small(self, text="", **modifiers) :
        """Insert a <SMALL></SMALL> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SMALL", arg, text)

    def big(self, text="", **modifiers) :
        """Insert a <BIG></BIG> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("BIG", arg, text)

    def strike(self, text="", **modifiers) :
        """Insert a <STRIKE></STRIKE> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("STRIKE", arg, text)

    def s(self, text="", **modifiers) :
        """Insert a <S></S> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("S", arg, text)

    def samp(self, text="", **modifiers) :
        """Insert a <SAMP></SAMP> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SAMP", arg, text)

    def script(self, text="", **modifiers) :
        """Insert a <SCRIPT></SCRIPT> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("SCRIPT", arg, text)

    def cite(self, text="", **modifiers) :
        """Insert a <CITE></CITE> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("CITE", arg, text)

    def code(self, text="", **modifiers) :
        """Insert a <CODE></CODE> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("CODE", arg, text)

    def font(self, text="", **modifiers) :
        """Insert a <FONT></FONT> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("FONT", arg, text)

    def li(self, text="", **modifiers) :
        """Insert a <LI></LI> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("LI", arg, text)

    def pre(self, text="", **modifiers) :
        """Insert a <PRE></PRE> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("PRE", arg, text, 0, 1, 1)

    def xmp(self, text="", **modifiers) :
        """Insert a <XMP></XMP> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("XMP", arg, text, 0, 1, 1)

    def listing(self, text="", **modifiers) :
        """Insert a <LISTING></LISTING> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("LISTING", arg, text)

    def p(self, text="", **modifiers) :
        """Insert a <P></P> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("P", arg, text)

    def param(self, text="", **modifiers) :
        """Insert a <PARAM></PARAM> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("PARAM", arg, text)

    def option(self, text="", **modifiers) :
        """Insert a <OPTION></OPTION> tag with the enclosed text."""
        arg=""
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("OPTION", arg, text)

    def option_selected(self, text="", **modifiers) :
        """Insert a <OPTION SELECTED></OPTION> tag with the enclosed text."""
        arg="SELECTED "
        for mod in modifiers.keys() :
            arg = arg + self.__calculate_args__(mod, modifiers[mod])
        self.__ienclosing_tag__("OPTION", arg, text)

    def plaintext(self) :
        """Insert a <PLAINTEXT> tag."""
        self.insert_tag("PLAINTEXT")

    def default_header(self, title = "JAHTML Default Document", **modifiers) :
        """Begins a normal document.

           title
                the title of the document
           modifiers
                usual meta name= content= tags (keywords, description, etc...)
                WARNING: doesn't work with other meta tags
        """
        self.html()
        self.push()
        self.head()
        self.insert_text('<meta http-equiv="Content-Type", content="text/html;charset=utf-8" />')
        for mod in modifiers.keys() :
            if modifiers[mod] != None :
                self.meta(name = string.upper(mod), content = modifiers[mod])
        self.title(title)
        self.pop()

class CGI_document(Html_document) :
    """
    This class defines a CGI document.

    it inherits from the Html_document class, but more methods are present
    """

    def __init__(self, content_type = "text/html;charset=utf-8") :
        """
        Initialise local datas.
        """
        self.__content_type__ = content_type
        self.__content_disposition__ = ""
        self.__expires__ = ""
        self.__pragma__ = ""
        self.__redirect__ = ""
        self.__status__ = ""
        self.__statmes__ = ""

        # self.__debug__ can be used to debug jahtml as well as the user's own scripts
        self.__debug__ = None

        Html_document.__init__(self)

    def __output__(self, file) :
        """Send the CGI script output to f ."""
        isopen = 0
        if type(file) == type("") :
            if (file != "-") and (file != "") :
                f = open(file, "w")
                isopen = 1
            else :
                f = sys.stdout
        else :
            f = file

        if self.__redirect__ != "" :
            f.write("Location: %s\n\n" % self.__redirect__)
        else :
            f.write("Content-type: %s\n" % self.__content_type__)
            if self.__status__ != "" :
                f.write("Status: %s %s\n" % (self.__status__, self.__statmes__))
            if self.__pragma__ != "" :
                f.write("Pragma: %s\n" % self.__pragma__)
            if self.__expires__ != "" :
                f.write("Expires: %s\n" % self.__expires__)
            if self.__content_disposition__ != "" :
                f.write("Content-Disposition: %s\n" % self.__content_disposition__)
            f.write("\n")
            Html_document.output(self, f)
        if isopen :
                f.close()

    def set_debug(self, file) :
        """Sets the flag to send the output to a file too."""
        self.__debug__ = file

    def set_pragma(self, prag) :
        """Defines the pragma value.

           prag
                The pragma's value
        """
        self.__pragma__ = prag

    def set_expires(self, exp) :
        """Defines the expiration date of the CGI output.

           exp
                The expiration date
        """
        self.__expires__ = exp

    def set_redirect(self, url) :
        """Defines the redirection url.

           url
                The redirection url to send
        """
        self.__redirect__ = url

    def set_content_type(self, ctype = "text/html") :
        """Defines the content type of the CGI output.

           ctype
                The new content type, default is text/html
        """
        self.__content_type__ = ctype

    def set_content_disposition(self, disp = "") :
        """Defines the content disposition of the CGI output.

           disp
                The new disposition, default is ""
        """
        self.__content_disposition__ = disp

    def set_status(self, code, message="") :
        """Defines the status to return.

           code
                The status value
           message
                The message following the status value
        """
        self.__status__ = code
        self.__statmes__ = message

    def do_nothing(self, message = "No response") :
        """Set status to 204 (do nothing)."""
        self.set_status("204", message)

    def envvar(self, varname) :
        """Returns the variable value or None."""
        if os.environ.has_key(varname) :
                return os.environ[varname]

    def server_software(self) :
        """Returns the SERVER_SOFTWARE environment variable value."""
        return self.envvar('SERVER_SOFTWARE')

    def server_name(self) :
        """Returns the SERVER_NAME environment variable value."""
        return self.envvar('SERVER_NAME')

    def gateway_interface(self) :
        """Returns the GATEWAY_INTERFACE environment variable value."""
        return self.envvar('GATEWAY_INTERFACE')

    def server_protocol(self) :
        """Returns the SERVER_PROTOCOL environment variable value."""
        return self.envvar('SERVER_PROTOCOL')

    def server_port(self) :
        """Returns the SERVER_PORT environment variable value."""
        return self.envvar('SERVER_PORT')

    def request_method(self) :
        """Returns the REQUEST_METHOD environment variable value."""
        return self.envvar('REQUEST_METHOD')

    def path_info(self) :
        """Returns the PATH_INFO environment variable value."""
        return self.envvar('PATH_INFO')

    def path_translated(self) :
        """Returns the PATH_TRANSLATED environment variable value."""
        return self.envvar('PATH_TRANSLATED')

    def document_root(self) :
        """Returns the DOCUMENT_ROOT environment variable value."""
        return self.envvar('DOCUMENT_ROOT')

    def script_name(self) :
        """Returns the SCRIPT_NAME environment variable value."""
        return self.envvar('SCRIPT_NAME')

    def query_string(self) :
        """Returns the QUERY_STRING environment variable value."""
        return self.envvar('QUERY_STRING')

    def remote_host(self) :
        """Returns the REMOTE_HOST environment variable value."""
        return self.envvar('REMOTE_HOST')

    def remote_addr(self) :
        """Returns the REMOTE_ADDR environment variable value."""
        return self.envvar('REMOTE_ADDR')

    def auth_type(self) :
        """Returns the AUTH_TYPE environment variable value."""
        return self.envvar('AUTH_TYPE')

    def remote_user(self) :
        """Returns the REMOTE_USER environment variable value."""
        return self.envvar('REMOTE_USER')

    def remote_ident(self) :
        """Returns the REMOTE_IDENT environment variable value."""
        return self.envvar('REMOTE_IDENT')

    def content_type(self) :
        """Returns the CONTENT_TYPE environment variable value."""
        return self.envvar('CONTENT_TYPE')

    def content_length(self) :
        """Returns the CONTENT_LENGTH environment variable value."""
        return self.envvar('CONTENT_LENGTH')

    def http_accept(self) :
        """Returns the HTTP_ACCEPT environment variable value."""
        return self.envvar('HTTP_ACCEPT')

    def http_user_agent(self) :
        """Returns the HTTP_USER_AGENT environment variable value."""
        return self.envvar('HTTP_USER_AGENT')

    def http_referer(self) :
        """Returns the HTTP_REFERER environment variable value."""
        return self.envvar('HTTP_REFERER')

    def log_message(self, msg = "Error in a CGI Script made with jahtml", level = "error") :
        """Logs a message to the HTTP server's error log file (usually on stderr)."""
        sys.stderr.write("[%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, msg))

    def log_message_and_exit(self, msg = "Fatal Error in a CGI Script made with jahtml", level = "error") :
        """Logs a message to the HTTP server's error log file (usually on stderr) and exits unsuccessfully."""
        self.log_message(msg, level)
        sys.exit(-1)

    def output(self, file = "-") :
        """Prints the CGI script output to stdout or file.

           If self.__debug__ is defined it is used as a file
           to which send the output to too.
        """
        self.__output__(file)
        if self.__debug__ != None :
                self.__output__(self.__debug__)
