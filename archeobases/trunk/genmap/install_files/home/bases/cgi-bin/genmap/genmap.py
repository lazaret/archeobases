#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Genmap - (c) 2004-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

# version 1.0 Jerome Allet
# version 1.1 Bertrand lecervoisier -> Passage à l'UTF-8

import sys
import os
import imp
import string
import urllib
import cgi
import urlparse
import tempfile
import jaxml
from pdfmap import maptool

try:
    import psyco
except ImportError:
    pass
else:
    psyco.profile()


# calcule la position du centre de l'objet
# dans le document final.
# ce qui n'est pas cool c'est qu'au Lazaret, les X et les Y sont
# à l'envers par rapport aux conventions généralement appliquées en
# cours de math: x pour abscisses, y pour ordonnées
# ici c'est le contraire:
#
#                 ^
#                 |
#                 | X
#                 |
#        <--------+
#            Y
#
#

lesy = []
for i in range(27):
    lesy.append(chr(i + ord('A')))
# IL N'Y A PAS DE V !!!
del lesy[lesy.index('V')]

# ce qui est ci-dessous ne sert que pour etre conservé pour d'autres
# extractions similaires, pour ne pas avoir à réinventer la roue...
def get_xy(zone, x, y):
    """Décompose la zone en abscisse et ordonnee"""
    zone = zone.upper()
    letter = ""
    number = ""
    for i in range(len(zone)):
        if zone[i] in string.uppercase:
            letter = letter + zone[i]
        else:
            number = number + zone[i]
    newx = float(number) - ((100.0 - float(y)) / 100.0)
    newy = lesy.index(letter) + (float(x) / 100.0)
    return (newx, newy)

def main(arguments):
    """Fonction principale"""

    # import du fichier de configuration
    if arguments[1] == "--titre":
        titre = arguments[2]
        arguments = arguments[2:]
    else:
        titre = ""
    confname = arguments[1]
    config = imp.load_source("config", confname)
    typetrace = config.TYPETRACE.lower()
    # parcours tous les fichiers d'entrée et stocke les données
    # dans des listes.
    urlerreurs = []
    donnees = {}
    for fichier in arguments[2:]:
        mustclose = 0
        if fichier == "-":
            infile = sys.stdin
            fichier = "(stdin)"
        else:
            infile = open(fichier, "r")
            mustclose = 1
        try:
            try:
                separateur_donnees = ","
                champs = infile.readline().strip().split(separateur_donnees)
                indicechamps = {}
                for i in range(len(champs)):
                    v = champs[i]
                    if (v.startswith('"') and v.endswith('"')) or \
                       (v.startswith("'") and v.endswith("'")):
                        champs[i] = v[1:-1] # remove comas
                    indicechamps[champs[i]] = i
                izone = indicechamps["zone"]
                inumero = indicechamps["numero"]
                ibis = indicechamps["bis"]
                ix = indicechamps["x"]
                iy = indicechamps["y"]
                inature = indicechamps["nature"]
                iorientation = indicechamps["orientation"]
                ilongueur = indicechamps["longueur"]
                ilargeur = indicechamps["largeur"]
                iepaisseur = indicechamps["epaisseur"]
                izabsolu = indicechamps["zabsolu"]
                lines = infile.readlines()
                for indice in range(len(lines)):
                    line = lines[indice]
                    valeurs = line.strip().split(separateur_donnees)
                    if len(valeurs) != len(champs):
                        continue # saute la ligne invalide
                    for i in range(len(valeurs)):
                        v = valeurs[i]
                        if (v.startswith('"') and v.endswith('"')) or \
                           (v.startswith("'") and v.endswith("'")):
                            valeurs[i] = v[1:-1]
                    valeurs[inature] = valeurs[inature].upper()
                    nature = valeurs[inature].strip()
                    valeurs[izone] = valeurs[izone].upper()
                    valeurs[iorientation] = valeurs[iorientation].upper() or 'N'
                    urldic = {"action": "Chercher",
                              "zone": valeurs[izone],
                              "numero": valeurs[inumero],
                              "bis": valeurs[ibis],
                             }
                    url = "%s?%s" % (config.URL, urllib.urlencode(urldic))
                    erreur = False
                    if not nature:
                        urlerreurs.append(url)
                        erreur = True
                    else:
                        try:
                            zabsolu = float(valeurs[izabsolu]) / 100.0
                            (x, y) = get_xy(valeurs[izone], valeurs[ix], valeurs[iy])
                        except (ValueError, TypeError):
                            urlerreurs.append(url)
                            erreur = True
                        else:
                            try:
                                (longueur, largeur, epaisseur) = (float(valeurs[ilongueur]) / 1000.0, \
                                                                  float(valeurs[ilargeur]) / 1000.0, \
                                                                  float(valeurs[iepaisseur]) / 1000.0)
                                surface = longueur * largeur
                                if not surface:
                                    raise ValueError, "Surface nulle."
                            except (ValueError, TypeError):
                                if getattr(config, "INCOMPLETS", True):
                                    longueur = largeur = epaisseur = config.FORCETAILLE or 0.01
                                    surface = longueur * largeur
                                else:
                                    urlerreurs.append(url)
                                    erreur = True
                            if erreur is False:
                                naturedatas = donnees.setdefault(nature, [])
                                naturedatas.append((surface, zabsolu, nature, x, y, longueur, largeur, epaisseur, valeurs[iorientation], url))
            except (ValueError, KeyError), msg:
                sys.stderr.write("Format de fichier invalide: %s\n" % msg)
                sys.exit(-1)
        finally:
            if mustclose:
                infile.close()
    if urlerreurs:
        doc = jaxml.HTML_document()
        doc.html()
        doc._push()
        doc.head()
        doc.title("Liste des erreurs pour %s:" % (config.SOUSTITRE or titre))
        doc._pop()
        doc.body()
        doc.h3("Liste des erreurs pour %s:" % (config.SOUSTITRE or titre))
        doc.ul()
        for url in urlerreurs:
            doc._push()
            doc.li()
            doc.a(url, href=url)
            doc._pop()
        doc._output(config.FICHIERERREURS)
    # Maintenant on crée les fichiers de travail
    alldatas = []
    for nature in donnees.keys():
        # on trie par surface décroissante
        lines = donnees[nature]
        lines.sort()
        lines.reverse()     # permet aux petits objets de s'afficher au dessus des plus gros
        alldatas.extend(lines)
        fout = open("%s.data" % nature, "w")
        for (surface, zabsolu, nature, x, y, longueur, largeur, epaisseur, orientation, url) in lines:
            if typetrace == "plan":
                realx = 2*config.XORIGINE - x
                realy = y
                reallength = longueur
                realwidth = largeur
                realorientation = orientation
            elif typetrace == "transversal":
                realx = y
                realy = -zabsolu
                reallength = longueur
                realwidth = epaisseur
                realorientation = "N"
            elif typetrace == "longitudinal":
                if config.MIROIR:
                    realx = 2*config.XORIGINE - x
                else:
                    realx = x
                realy = -zabsolu
                reallength = epaisseur
                realwidth = largeur
                realorientation = "N"
            else:
                raise ValueError, "Type de tracé '%s' invalide !" % typetrace
            if config.FORCETAILLE:
                reallength = config.FORCETAILLE
                realwidth = config.FORCETAILLE
            fout.write("%s;%f;%f;%f;%f;%s;%s\n" % (nature, realx, realy, reallength, realwidth, realorientation, url))
        fout.close()
    # si plus d'une nature, on fait la même chose avec l'ensemble des données.
    if len(donnees.keys()) > 1:
        # on trie par surface décroissante
        alldatas.sort()
        alldatas.reverse()         # permet aux petits objets de s'afficher au dessus des plus gros
        fout = open("ALL.data", "w")
        for (surface, zabsolu, nature, x, y, longueur, largeur, epaisseur, orientation, url) in alldatas:
            if typetrace == "plan":
                realx = 2*config.XORIGINE - x
                realy = y
                reallength = longueur
                realwidth = largeur
                realorientation = orientation
            elif typetrace == "transversal":
                realx = y
                realy = -zabsolu
                reallength = longueur
                realwidth = epaisseur
                realorientation = "N"
            elif typetrace == "longitudinal":
                if config.MIROIR:
                    realx = 2*config.XORIGINE - x
                else:
                    realx = x + 1
                realy = -zabsolu
                reallength = epaisseur
                realwidth = largeur
                realorientation = "N"
            else:
                raise ValueError, "Type de tracé '%s' invalide !" % typetrace
            if config.FORCETAILLE:
                reallength = config.FORCETAILLE
                realwidth = config.FORCETAILLE
            fout.write("%s;%f;%f;%f;%f;%s;%s\n" % (nature, realx, realy, reallength, realwidth, realorientation, url))
        fout.close()
    # what rasterized map to use as the map background
    if config.IMAGEFOND and os.path.exists(config.IMAGEFOND):
        bg = maptool.MapBackground(config.IMAGEFOND, \
                                   config.XIMAGE, config.YIMAGE, \
                                   config.LARGEURIMAGE, config.HAUTEURIMAGE, \
                                   config.ROTATIONIMAGE)
    else:
        bg = None
    # initialize the PDF document
    doc = maptool.PDFMap(author = config.AUTEUR, \
                         title = config.TITRE, \
                         subtitle = config.SOUSTITRE or titre, \
                         papersize = config.PAPIER)
    # set the format of the next pages
    for marge in ("gauche", "droite", "haut", "bas"):
        mname = "MARGE%s" % marge.upper()
        if not hasattr(config, mname):
            setattr(config, mname, getattr(config, "MARGE", "3cm"))
    for echelle in ("x", "y"):
        ename = "%sECHELLE" % echelle.upper()
        if not hasattr(config, ename):
            setattr(config, ename, getattr(config, "ECHELLE", 0.1))
    doc.formatpage(config.ORIENTATION, \
                   config.MARGEGAUCHE, \
                   config.MARGEBAS, \
                   config.MARGEDROITE, \
                   config.MARGEHAUT)
    # sets the labels for the two axis
    doc.setaxis(xaxis = config.XAXIS, \
        yaxis = config.YAXIS, \
        xaxisalign = config.XALIGNERGRADUATION, \
        yaxisalign = config.YALIGNERGRADUATION)
    allfiles = ["%s.data" % nature for nature in donnees.keys()]
    if len(allfiles) > 1:
        allfiles.append("ALL.data")
        if not config.DETAIL:
            allfiles = allfiles[-1:]
    for infile in allfiles:
        # initialize the new page
        doc.initpage(background = bg, \
            xorigin = config.XORIGINE, \
            yorigin = config.YORIGINE, \
            xscale = config.XECHELLE, \
            yscale = config.YECHELLE, \
            xstep = config.XPAS, \
            ystep = config.YPAS, \
            rotation = config.ROTATION, \
            showxgrid = config.XMONTRERGRILLE, \
            showygrid = config.YMONTRERGRILLE, \
            showxscale = config.XMONTRERECHELLE, \
            showyscale = config.YMONTRERECHELLE)
        # draws the datas read from he input files
        # according to what's in the configuration file
        doc.draw_datas(config.FICHIERCONFIGNATURES, \
                       infile, \
                       legend = config.LEGENDE)
        # ends the current page
        doc.endpage()
        # generates the PDF document
    try:
        doc.output(config.FICHIERPDF)
    except IndexError:
        return True # Impossible de generer le PDF car toutes les lignes sont invalides (par exemple tous les z sont vides)



def mainForCGI():
    """Main function when used as a CGI script."""
    # first retrieve all variables:
    variables = [("auteur", "text", str), ("titre", "text", str), ("soustitre", "text", str),
                 ("typetrace", "text", str, True), ("papier", "text", str, True),
                 ("orientation", "text", str, True), ("marge", "text", str, True  ),
                 ("echelle", "text", float, True), ("xmontrerechelle", "bool", bool), ("ymontrerechelle", "bool", bool),
                 ("legende", "text", str), ("xmontrergrille", "bool", bool), ("xalignergraduation", "bool", bool),
                 ("ymontrergrille", "bool", bool), ("yalignergraduation", "bool", bool),
                 ("xpas", "text", float, True), ("ypas", "text", float, True), ("detail", "bool", bool, True),
                 ("miroir", "bool", bool), ("forcetaille", "text", float),
                 ("xorigine", "text", float, True), ("yorigine", "text", float, True),
                 ("xaxis", "text", lambda s: s.split(",")), ("yaxis", "text", lambda s: s.split(",")), ("rotation", "text", lambda s: s.strip() or None),
                 ("ximage", "text", float), ("yimage", "text", float), ("largeurimage", "text", float), ("hauteurimage", "text", float),
                 ("rotationimage", "text", lambda s: s.strip() or None), ("imagefond", "file", str), ("url", "text", str, True), ("fichierconfignatures", "file", str, True),
                 ("fichierdonnees", "file", str, True), ("incomplets", "bool", bool)]
    form = cgi.FieldStorage()
    varvalues = {}
    errors = []
    for variable in variables:
        try:
            (varname, vartype, varconv, mandatory) = variable
        except ValueError:
            (varname, vartype, varconv, mandatory) = list(variable) + [ False ]
        if form.has_key(varname):
            if vartype == "bool":
                value = form[varname].value
                if value in [0, 0.0, "0", "OFF", "off", "FALSE", False]:
                    varvalues[varname] = False
                else:
                    varvalues[varname] = True
            elif vartype == "text":
                value = form[varname].value.strip()
                if mandatory and not value:
                    errors.append("Champ %s vide, or il est obligatoire." % varname)
                else:
                    try:
                        varvalues[varname] = varconv(value)
                    except ValueError:
                        varvalues[varname] = None
            elif vartype == "file":
                value = form[varname].value
                if mandatory and not value:
                    errors.append("Champ %s vide, or il est obligatoire." % varname)
                else:
                    varvalues[varname] = value
            else:
                errors.append("Type %s non supporté pour le champ %s !" % (vartype, varname))
        else:
            if mandatory:
                errors.append("Le champ %s est obligatoire !" % varname)
            elif vartype == "bool":
                varvalues[varname] = False
            elif vartype == "text":
                if varconv == float:
                    varvalues[varname] = 0.0
                else:
                    varvalues[varname] = None
            elif vartype == "file":
                varvalues[varname] = None
            else:
                errors.append("Type %s non supporté pour le champ %s !\n" % (vartype, varname))
    doc = jaxml.CGI_document()
    doc.html()
    doc._push()
    doc.head().title("Résultat")
    doc._pop()
    doc.body()
    if errors:
        doc.h3("Liste des erreurs:")
        doc.p()
        for e in errors:
            doc._push()
            doc._text(e)
            doc.br()
            doc._pop()
    else:
        docroot = os.environ.get("DOCUMENT_ROOT", "/var/www")
        referer = os.environ.get("HTTP_REFERER", "")
        (scheme, netloc, subdir, query, fragment) = urlparse.urlsplit(referer)
        if subdir.startswith("/"):
            subdir = subdir[1:]
        subdir = "/".join(subdir.split("/")[:-1])
        genmaproot = os.path.join(docroot, subdir, "genmap-work")
        directory = tempfile.mkdtemp(prefix="genmap-", dir=genmaproot)
        os.chmod(directory, 0755)
        os.chdir(directory)
        tempdir = directory.split(os.sep)[-1]
        url = urlparse.urlunsplit((scheme, netloc, "%s/genmap-work/%s" % (subdir, tempdir), query, fragment))
        configpyname = os.path.join(directory, "configuration.txt")
        erreursname = os.path.join(directory, "erreurs.html")
        resultname = os.path.join(directory, "resultat.pdf")
        configpy = open(configpyname, "w")
        configpy.write("# -*- coding: UTF-8 -*-\n# Ne pas modifier la ligne ci-dessus\n\n")
        for variable in variables:
            try:
                (varname, vartype, varconv, mandatory) = variable
            except ValueError:
                (varname, vartype, varconv, mandatory) = list(variable) + [ False ]
            if vartype != "file":
                configpy.write("%s = %s\n" % (varname.upper(), repr(varvalues[varname])))
        for (varname, filename) in [ ("imagefond", "image-fond.jpeg"),
                                     ("fichierconfignatures", "natures.conf"),
                                     ("fichierdonnees", "resultat-requete.datas") ]:
            value = varvalues[varname]
            if value:
                outfilename = os.path.join(directory, filename)
                if varname != "fichierdonnees":
                    configpy.write("%s = %s\n" % (varname.upper(), repr(outfilename)))
                outfile = open(outfilename, "w+b")
                outfile.write(varvalues[varname])
                outfile.close()
            else:
                configpy.write('%s = ""\n' % varname.upper())
        configpy.write('FICHIERERREURS = "%s"\n' % erreursname)
        configpy.write('FICHIERPDF = "%s"\n' % resultname)
        configpy.close()
        donneesoriginales = os.path.join(directory, "resultat-requete.datas")
        erreur = main(("genmap", configpyname, donneesoriginales))
        doc.h3("Résultat:")
        doc.ul()
        doc._push()
        doc.li()
        doc._text("Fichier PDF :")
        if erreur :
            doc._text("<strong>Génération du PDF impossible, vérifiez vos données s.v.p !</strong>")
        else:
            doc.a("%s/resultat.pdf" % url, href="%s/resultat.pdf" % url, target="_new")
        doc._pop()
        doc._push()
        doc.li()
        doc._text("Erreurs :")
        if os.path.exists(erreursname):
            doc.a("%s/erreurs.html" % url, href="%s/erreurs.html" % url, target="_new")
        else:
            doc.strong("Aucune")
        doc._pop()
        doc._push()
        doc.li()
        doc._text("Fichier de configuration de Genmap :")
        doc.a("%s/configuration.txt" % url, href="%s/configuration.txt" % url, target="_new")
        doc._pop()
        doc._push()
        doc.li()
        doc._text("Fichier de configuration des natures :")
        doc.a("%s/natures.conf" % url, href="%s/natures.conf" % url, target="_new")
        doc._pop()
        doc._push()
        doc.li()
        doc._text("Données originales :")
        doc.a("%s/resultat-requete.datas" % url, href="%s/resultat-requete.datas" % url, target="_new")
        doc._pop()
    doc._output("-")


if __name__ == '__main__':
    if len(sys.argv) == 1:
        if os.environ.has_key("REQUEST_METHOD"):
            sys.exit(mainForCGI())
        else:
            sys.stderr.write("usage: genmap [--titre 'blah !'] fichierconfig.py fichierdonnees1 [fichierdonnees2 ...]\n")
            sys.exit(-1)
    elif len(sys.argv) < 3:
        sys.argv.append("-")    # sys.stdin as single input file
    sys.exit(main(sys.argv))
