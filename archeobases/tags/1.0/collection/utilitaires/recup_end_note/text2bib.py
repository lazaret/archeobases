#! /usr/bin/env python

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
               #"City":"location",
               #"Conference location":"location",
               #"Academic Dept.":"location",
               "Publisher":"publisher",
               "University":"school",
               "Institution":"institution",
               "Volume":"volume",
               #"Number of volumes":"volume_number",
               "Pages":"pages",
               "Number of pages";"number",
               "Series Editor":"series",
               "Series Title":"series",
               "Edition":"edition",
               "Version":"edition",
               #"Date":,"date",
               #"Issue Date":"date",
               #"Type of work":,
               #"Thesis Type":"type",
               #"Type":"type",
               #"Translator":"translator",
               #"Alternate Journal":"journal",
               #"Report Number":,
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
                  #"chapter"             :"text",
                  #"booktitle"          :"text",
                  "institution"         :"text",
                  #"address"             :"text",
                  #"pmid"               :"text",
                  #"preprint_server"    :"text",
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
                                
                        



