		INSTALLATION ARCHEO


1- R�cup�ration des donn�es des anciennes bases avec ./sql/recup.sql
==============================================================
Ce fichier contient les requetes SQL qui permettent d'extraire les donn�es depuis les table de l'ancienne base. Ces requ�tes ont �t� con�ues pour le Lazaret qui est la base la plus compl�te dont je dispose. Quand je dis plus compl�te, cela veut dire la base qui a le plus de tables et de champs. Il faut donc �ventuellement adapter ces requ�tes  � chaque base, en enlevement les champs qui n'existent pas pour celle-ci.

Noter de pr�f�rence le num�ro du champs qui n'existe pas pour savoir plus tard comment adapter les programmes de filtre, en partant de 0.

Mettre les donn�es dans un r�pertoire donnees.


2- Cr�er la nouvelle base avec ./cgi/create_structure.py
========================================================
Ce programme cr�e la base, les tables, les utilisateurs.

3- Cr�er les droits les droits sur les tables avec ./cgi/create_droit.py
========================================================================
Ce programme cr�e les droits sur les tables de la base.

4- Ins�rer les mots de passes pour les utilisateurs
===================================================
./utilitaires/archeo_passwd.py


5- Cr�er les fichiers n�cessaires au bon fonctionnement de l'application
========================================================================
Si c'est la premi�ere installation de l'application sur le serveur:
------------------------------------------------------------------

Sinon:
-----
TODO

6- Reinjection des donn�es dans la nouvelle base
================================================
En th�orie, il suffit de lancer le script script.py qui lui m�me lance tous les programmes de r�injection.
En pratique, il sera peut-�tre n�cessaire de lancer les programmes du r�pertoire prog-recup l'un apr�s l'autre. Il faudra modifier ces programmes en mettant eventuellement les champs qui n'existaient pas dans l'ancienne base en commentaire. Il faudra aussi faire attention au d�calage que cela risque de produire puisqu'une des op�rations importantes du programme est de mettre le texte entre quotes avec la fonction db.quote.

7- Recup�ration des listes de controles
=======================================
Il existe deux solutions:

* pour les bases nouvelles ou bien corrig�es en fonction des nouveaux lexiques:
------------------------------------------------------------------------------
 r�cup�ration des valeurs du lexique (industrie seuelement pour l'instant).
./cgi/prog_recup_controles/liste_ind.py < liste-industrie.txt  

* pour les autres bases
-----------------------
 r�cup�ration de la liste des valeurs d�j� existantes dans la base.
./cgi/prog_recup_controles/recup_controle.py

8- Les utilitaires 
==================

Les utilitaires sont peu nombreux pour l'instant.

archeo_passwd.py: permet de changer les mots de passe de l'une des bases.

archeo_update_base.py: permet d'effectuer des requ�tes sur toutes les bases simultan�ment. Ce programme est essentiellement utile lors de modifications de structure.
 


