                INSTALLATION ARCHEO


1- Récupération des données des anciennes bases avec ./recuperation/sql/recup.sql
==============================================================
Ce fichier contient les requetes SQL qui permettent d'extraire les données depuis les tables de l'ancienne base. Ces requêtes ont été conçues pour le Lazaret qui est la base la plus complète dont je dispose. Quand je dis plus complète, cela veut dire la base qui a le plus de tables et de champs. Il faut donc éventuellement adapter ces requêtes  à chaque base, en enlevement les champs qui n'existent pas pour celle-ci.

Noter de préférence le numéro du champs qui n'existe pas pour savoir plus tard comment adapter les programmes de filtre, en partant de 0.

Mettre les données dans un répertoire donnees.

2- Créer la nouvelle base avec ./creation/create_structure.py
========================================================
Ce programme crée la base, les tables, les utilisateurs.

3- Créer les droits sur les tables avec ./creation/create_droit.py
=============================================================
Ce programme crée les droits sur les tables de la base.
Taper ./creation/craete_droit nom_base

4- Créer les fichiers nécessaires au bon fonctionnement de l'application

========================================================================
Si c'est la première installation de l'application sur le serveur:
------------------------------------------------------------------
        Créer les répertoires nécessaires à l'application:
        -------------------------------------------------
        mkdir -p /home/bases/auth

        mkdir -p /home/bases/archeo/decors
        os.system("cp -R /cdrom/decors/* /home/bases/archeo/decors

        mkdir -p /home/bases/archeo/lexique
        cp -R /cdrom/lexique/* /home/bases/archeo/lexique

        mkdir -p /home/bases/archeo/manuel
        cp -R /cdrom/manuel/* /home/bases/archeo/manuel

        mkdir -p /home/bases/archeo/utilitaires
        cp -R /cdrom/utilitaires/* /home/bases/archeo/utilitaires
        chmod +x /home/bases/archeo/utilitaires

        cp -R /cdrom/cgi/prog_recup /home/bases/archeo/recuperation

        Copier les programmes de l'application
        --------------------------------------
        mkdir -p /home/bases/cgi-bin
        cp /cdrom/cgi/prog_ecran/* /home/bases/archeo/cgi-bin
        chmod +x /home/bases/cgi-bin/archeo/*py

        Faire les liens symboliques dans /usr/lib/cgi-bin (Debian)
        -------------------------------------------------
        mkdir -p /usr/lib/cgi-bin
        ln -s /home/bases/cgi-bin/archeo /usr/lib/cgi-bin/archeo
        ln -s /home/bases/cgi-bin/archeo/archeo.py /usr/lib/cgi-bin/


        Faire les liens symboliques dans /srv/www/cgi-bin (Red hat)
        -------------------------------------------------
        ln -s /home/bases/cgi-bin/archeo /srv/www/cgi-bin/archeo
        ln -s /home/bases/cgi-bin/archeo/archeo.py /srv/www/cgi-bin/


        Copier le fichier exemple archeo.conf et le modifier
        ----------------------------------------------------
        cp /cdrom/cgi/archeo.conf /etc/

        Créer le fichier d'authentification et
        les mots de passe des utilisateurs de la base
        ---------------------------------------------
        cd /home/bases
        htpasswd -c authentification superma_base
        htpasswd  authentification ma_base
        htpasswd  authentification visiteurma_base


        Créer le fichier image et lui donner les bons droits
        ----------------------------------------------------
        mkdir -p /home/bases/archeo/ma_base/images
        chown -R www-data.www-data /home/bases/archeo/ma_base/images

Sinon:
-----
        Ajouter la base dans /etc/archeo.conf
        -------------------------------------

        Ajouter les utilisateurs de cette base dans le fichier d'authentification
        -------------------------------------------------------------------------
        cd /home/bases
        ./archeo_passwd.py

        Créer le fichier image et lui donner les bons droits
        ----------------------------------------------------
        mkdir -p /home/bases/archeo/ma_base/images
        chown -R www-data.www-data /home/bases/archeo/ma_base/images

6- Reinjection des données dans la nouvelle base
================================================
En théorie, il suffit de lancer le script script.py qui lui même lance tous les programmes de réinjection, mais il ne fonctionne pas dans tous les cas.
En pratique, pour l'instant, il vaut mieux lancer les programmes du répertoire prog_recup_donnees l'un après l'autre. Il faudra modifier ces programmes en mettant eventuellement les champs qui n'existaient pas dans l'ancienne base en commentaire, en modifiant éventuellement les numéros des champs qui seront mis entre quotes avec l'instruction db.quote, et enfin en modifiant la liste des champs dans le INSERT.
Il faudra bien recuperer les tables dans le bon ordre, c'est a dire lancer le programme tobjet.py avant les programmes tfaune et tindustrie...

# RECUPERATION DU CONTENU DE LA BASE
#===================================
        Placer tous les fichiers textes de récupération de l'ancienne base dans le répertoire /home/vases/donnees avec un ftp vers l'ancien serveur.

           Recuperation du carnet
           ----------------------
           /home/recuperation/prog_recup_donnees/tobjet.py ma_base < /donnees/robjet.txt >./erreurs/robjet.erreur"

           Récupération de la faune
           ------------------------
           /home/recuperation/prog_recup_donnees/tfaune.py ma_base < ./donnees/rfaune.txt > /home/bases.erreurs/rfaune.erreur
           /home/recuperation/prog_recup_donnees/ttrace.py ma_base < ./donnees/rtrace.txt > /home/bases/erreurs/rtrace.erreur
           /home/recuperation/prog_recup_donnees/tmesure.py ma_base < ./donnees/rmesure.txt > /home/bases/erreurs/rmesure.erreur
           /home/recuperation/prog_recup_donnees/tdent.py ma_base < ./donnees/rmdent.txt > /home/bases/erreurs/rmdent.erreur
           /home/recuperation/prog_recup_donnees/tmicro.py ma_base < ./donnees/rmicro.txt > /home/bases/erreurs/rmicro.erreur

           Récupération de l'industrie
           ---------------------------
           /home/recuperation/prog_recup_donnees/toutil.py ma_base < ./donnees/routil.txt > /home/bases/erreurs/routil.erreur
           /home/recuperation/prog_recup_donnees/tsimple.py ma_base < ./donnees/rsimple.txt > /home/bases/erreurs/rsimple.erreur
           /home/recuperation/prog_recup_donnees/tfractur..py ma_base < ./donnees/rfractur..txt > /home/bases/erreurs/rfractur..erreur
           /home/recuperation/prog_recup_donnees/tretouch.py ma_base < ./donnees/rretouch.txt > /home/bases/erreurs/rretouch.erreur


           /home/recuperation/prog_recup_donnees/tstigmat_simple.py ma_base < ./donnees/rstigmat_simple.txt > /home/bases/erreurs/rstigmat_simple.erreur

ou
           /home/recuperation/prog_recup_donnees/tstigmat.py ma_base < ./donnees/rstigmat.txt > /home/bases/erreurs/rstigmat.erreur
+
           /home/recuperation/prog_recup_donnees/tstigmat2.py ma_base < ./donnees/rstigmat2.txt > /home/bases/erreurs/rstigmat2.erreur


           /home/recuperation/prog_recup_donnees/textremi.py ma_base < ./donnees/rextremi.txt > /home/bases/erreurs/rextremi.erreur
           /home/recuperation/prog_recup_donnees/tgalet.py ma_base < ./donnees/rgalet.txt > /home/bases/erreurs/rgalet.erreur
           /home/recuperation/prog_recup_donnees/tnucleus.py ma_base < ./donnees/rnucleus.txt > /home/bases/erreurs/rnucleus.erreur
           /home/recuperation/prog_recup_donnees/tdimens.py ma_base < ./donnees/rdimens.txt > /home/bases/erreurs/rdimens.erreur
           /home/recuperation/prog_recup_donnees/tdimens2.py ma_base < ./donnees/rdimens2.txt > /home/bases/erreurs/rdimens2.erreur

7- Recupération des listes de controles
=======================================
Il existe deux solutions:

* pour les bases nouvelles ou bien corrigées en fonction des nouveaux lexiques:
------------------------------------------------------------------------------
        récupération des valeurs du lexique (industrie seulement pour l'instant).
        /home/bases/prog_recup_controles/liste_ind.py < /home/bases/liste-industrie.txt

* pour les autres bases
-----------------------
        récupération de la liste des valeurs déjà existantes dans la base.
        /cdrom/prog_recup_controles/recup_controle.py

8- Les utilitaires
==================

Les utilitaires sont peu nombreux pour l'instant.

archeo_passwd.py: permet de changer les mots de passe de l'une des bases.

archeo_update_base.py: permet d'effectuer des requêtes sur toutes les bases simultanément. Ce programme est essentiellement utile lors de modifications de structure et est exclusivement réservé à la personne qui centralise l'appliaction..



