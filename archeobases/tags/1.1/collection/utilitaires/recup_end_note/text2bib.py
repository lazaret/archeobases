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

import string
import sys

lines = sys.stdin.readlines()
dic_fields = {"Reference Type":"publication_type", 
               "Record Number":"id", 
               "Author": "author", 
               "Editor":"author",
               "Reporter":"author",
               "cartographer":"author",
               "Year": "publication_year", 
               "Year of Conference": "publication_year", 
               "Title":"publication_title",
               "Series Editor":"editor",
               "Publisher":"publisher",
               "University":"school",
               "Institution":"institution",
               "Volume":"volume",
               "Pages":"pages",
               "Number of pages";"number",
               "Series Editor":"series",
               "Series Title":"series",
               "Edition":"edition",
               "Version":"edition",
               "Label":"label",
               "Keywords":"keywords",
               "Abstract":"abstract",
               "Notes":"note"] 

dic_bib = {key : {"publication_type"    :"text", 
                  "publication_title"   :"text", 
                  "publication_year"    :"text",
                  "abstract"            :"text",
                  "journal"             :"text",
                  "volume"              :"text",
                  "number"              :"text",
                  "pages"               :"text",
                  "series"              :"text",
                  "edition"             :"text",
                  "editor"              :"text",
                  "publisher"           :"text",
                  "note"                :"text",
                  "school"              :"text",
                  "institution"         :"text",
}
dic_res = {}

i = 0

for line in lines:
        line = line.strip(line[-1])
        if line !="" and line[:10] == "Reference Type":
                dic_res[i] =  
               
        for k in range (0, len(dic_fields.keys())):
                n = len(dic_fields)
                if line != "" 
                        if line[:n] == k: 
                                value = line[:n+2]   
                                dic_res[i][dic_fields.value] = value}
                        else:

