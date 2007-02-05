		INSTALLATION ARCHEO


1- Récupération des données des anciennes bases avec ./sql/recup.sql
==============================================================
Ce fichier contient les requetes SQL qui permettent d'extraire les données depuis les table de l'ancienne base. Ces requêtes ont été conçues pour le Lazaret qui est la base la plus complète dont je dispose. Quand je dis plus complète, cela veut dire la base qui a le plus de tables et de champs. Il faut donc éventuellement adapter ces requêtes  à chaque base, en enlevement les champs qui n'existent pas pour celle-ci.

Noter de préférence le numéro du champs qui n'existe pas pour savoir plus tard comment adapter les programmes de filtre, en partant de 0.

Mettre les données dans un répertoire donnees.


2- Créer la nouvelle base avec ./cgi/create_structure.py
========================================================
Ce programme crée la base, les tables, les utilisateurs.

3- Créer les droits les droits sur les tables avec ./cgi/create_droit.py
========================================================================
Ce programme crée les droits sur les tables de la base.

4- Insérer les mots de passes pour les utilisateurs
===================================================
./utilitaires/archeo_passwd.py


5- Créer les fichiers nécessaires au bon fonctionnement de l'application
========================================================================
Si c'est la premièere installation de l'application sur le serveur:
------------------------------------------------------------------

Sinon:
-----
TODO

6- Reinjection des données dans la nouvelle base
================================================
En théorie, il suffit de lancer le script script.py qui lui même lance tous les programmes de réinjection.
En pratique, il sera peut-être nécessaire de lancer les programmes du répertoire prog-recup l'un après l'autre. Il faudra modifier ces programmes en mettant eventuellement les champs qui n'existaient pas dans l'ancienne base en commentaire. Il faudra aussi faire attention au décalage que cela risque de produire puisqu'une des opérations importantes du programme est de mettre le texte entre quotes avec la fonction db.quote.

7- Recupération des listes de controles
=======================================
Il existe deux solutions:

* pour les bases nouvelles ou bien corrigées en fonction des nouveaux lexiques:
------------------------------------------------------------------------------
 récupération des valeurs du lexique (industrie seuelement pour l'instant).
./cgi/prog_recup_controles/liste_ind.py < liste-industrie.txt  

* pour les autres bases
-----------------------
 récupération de la liste des valeurs déjà existantes dans la base.
./cgi/prog_recup_controles/recup_controle.py

8- Les utilitaires 
==================

Les utilitaires sont peu nombreux pour l'instant.

archeo_passwd.py: permet de changer les mots de passe de l'une des bases.

archeo_update_base.py: permet d'effectuer des requêtes sur toutes les bases simultanément. Ce programme est essentiellement utile lors de modifications de structure.
 


