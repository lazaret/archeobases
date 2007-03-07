CREATE TABLE "biblio" (
        "identifiant" text NOT NULL,
        "b_type_biblio" text,
        "b_indice" text,
        "b_titre_ouvrage" text,
        "b_auteur" text,
        "b_titre_article text,
        "b_titre_periodique text,
        "b_pages" text,
        "b_maison_edition" text,
        "b_ville_edition" text,
        "b_dir_pub" text,
        "b_annee" text,
        "b_mois" text,
        "b_nombre_volume" text,
        "b_serie" text,
        "b_fascicule" text,
        "b_tome" text,
        "b_numero" text,
        "b_volume" text,
        "b_langue_document" text,
        "b_langue_resume" text,
        "b_etablissement" text,
        "b_description" text,
        "b_isbn" text,
        "b_issn" text,
        "b_resume" text,
        "b_mots_clefs" text,
        "b_nombre_exemplaires" text,
        "b_url" text,
        "b_objets_lies" text,
        "b_modif_biblio" date
);

REVOKE ALL on "biblio" from PUBLIC;
GRANT ALL on "biblio" to "rachel";
GRANT ALL on "biblio" to "collection";
GRANT ALL on "biblio" to "supercollection";
GRANT SELECT on "biblio" to "visiteurcollection";

CREATE TABLE "controle_type_biblio" (
        "type_biblio" text NOT NULL,
        "description" text,
        Constraint "controle_type_biblio_pkey" Primary Key ("type_biblio")
);

REVOKE ALL on "controle_type_biblio" from PUBLIC;
GRANT ALL on "controle_type_biblio" to "rachel";
GRANT SELECT on "controle_type_biblio" to "collection";
GRANT ALL on "controle_type_biblio" to "supercollection";
GRANT SELECT on "controle_type_biblio" to "visiteurcollection";

CREATE TABLE "controle_b_langue_biblio" (
        "b_langue_biblio" text NOT NULL,
        "description" text,
        Constraint "controle_type_biblio_pkey" Primary Key ("b_langue_biblio")
);

REVOKE ALL on "controle_b_langue_document" from PUBLIC;
GRANT ALL on "controle_b_langue_document" to "rachel";
GRANT SELECT on "controle_b_langue_document" to "collection";
GRANT ALL on "controle_b_langue_document" to "supercollection";
GRANT SELECT on "controle_b_langue_document" to "visiteurcollection";

CREATE TABLE "controle_b_langue_resume" (
        "b_langue_resume" text NOT NULL,
        "description" text,
        Constraint "controle_b_langue_resume_pkey" Primary Key ("b_langue_resume")
);

REVOKE ALL on "controle_b_langue_resume" from PUBLIC;
GRANT ALL on "controle_b_langue_resume" to "rachel";
GRANT SELECT on "controle_b_langue_resume" to "collection";
GRANT ALL on "controle_b_langue_resume" to "supercollection";
GRANT SELECT on "controle_b_langue_resume" to "visiteurcollection";

CREATE TABLE "association" (
        "identifiant_1" text NOT NULL,
        "identifiant_2" text NOT NULL,
        Constraint "association_pkey" Primary Key ("identifiant_1", "identifiant_2")
);

REVOKE ALL on "association" from PUBLIC;
GRANT ALL on "association" to "rachel";
GRANT ALL on "association" to "collection";
GRANT ALL on "association" to "supercollection";
GRANT SELECT on "association" to "visiteurcollection";

CREATE TABLE "materiel" (
        "identifiant" text NOT NULL,
        "type_objet" text,
        "m_type_materiel" text,
        "m_numero_inventaire" text,
        "m_nom_site" text,
        "m_localite" text,
        "m_commune" text,
        "m_region" text,
        "m_pays" text,
        "m_nom_commun" text,
        "m_inventeur" text,
        "m_donnateur" text,
        "m_depot_original" text,
        "m_date_decouverte" text,
        "m_periode_culturelle" text,
        "m_periode_geologique" text,
        "m_age_absolu" text,
        "m_date_copie" text,
        "m_numero_individu" text,
        "m_classe" text,
        "m_ordre" text,
        "m_famille" text,
        "m_genre" text,
        "m_espece" text,
        "m_nom_vernaculaire" text,
        "m_synonymes" text,
        "m_age_individu" text,
        "m_sexe_individu" text,
        "m_donnees_individu" text,
        "m_representation_squel" text,
        "m_description_anatomique" text,
        "m_observations_anatomique" text,
        "m_nature" text,
        "m_observations" text,
        "m_bibliographie" text,
        "m_mots_clefs" text,
        "m_type_support" text,
        "m_auteur" text,
        "m_titre" text,
        "m_editeur" text,
        "m_date_edition" text,
        "m_duree" text,
        "m_dimensions" text,
        "m_echelle" text,
        "m_piece" text,
        "m_meuble" text,
        "m_tiroir" text,
        "m_etagere" text,
        "m_nombre_exemplaires" integer,
        "m_date_modif" date,
        "m_batiment" text,
        Constraint "materiel_pkey" Primary Key ("identifiant")
);

--
-- TOC Entry ID 13 (OID 8173710)
--
-- Name: materiel Type: ACL Owner: 
--

REVOKE ALL on "materiel" from PUBLIC;
GRANT ALL on "materiel" to "rachel";
GRANT ALL on "materiel" to "collection";
GRANT ALL on "materiel" to "supercollection";
GRANT SELECT on "materiel" to "visiteurcollection";

CREATE TABLE "controle_m_type_materiel" (
        "m_type_materiel" text NOT NULL,
        "description" text,
        Constraint "controle_m_type_materiel_pkey" Primary Key ("m_type_materiel")
);

REVOKE ALL on "controle_m_type_materiel" from PUBLIC;
GRANT ALL on "controle_m_type_materiel" to "rachel";
GRANT SELECT on "controle_m_type_materiel" to "collection";
GRANT ALL on "controle_m_type_materiel" to "supercollection";
GRANT SELECT on "controle_m_type_materiel" to "visiteurcollection";

CREATE TABLE "controle_m_classe" (
        "m_classe" text NOT NULL,
        "description" text,
        Constraint "controle_m_classe_pkey" Primary Key ("m_classe")
);

REVOKE ALL on "controle_m_classe" from PUBLIC;
GRANT ALL on "controle_m_classe" to "rachel";
GRANT SELECT on "controle_m_classe" to "collection";
GRANT ALL on "controle_m_classe" to "supercollection";
GRANT SELECT on "controle_m_classe" to "visiteurcollection";

CREATE TABLE "controle_m_ordre" (
        "m_ordre" text NOT NULL,
        "description" text,
        Constraint "controle_m_ordre_pkey" Primary Key ("m_ordre")
);

REVOKE ALL on "controle_m_ordre" from PUBLIC;
GRANT ALL on "controle_m_ordre" to "rachel";
GRANT SELECT on "controle_m_ordre" to "collection";
GRANT ALL on "controle_m_ordre" to "supercollection";
GRANT SELECT on "controle_m_ordre" to "visiteurcollection";

CREATE TABLE "controle_m_famille" (
        "m_famille" text NOT NULL,
        "description" text,
        Constraint "controle_m_famille_pkey" Primary Key ("m_famille")
);

REVOKE ALL on "controle_m_famille" from PUBLIC;
GRANT ALL on "controle_m_famille" to "rachel";
GRANT SELECT on "controle_m_famille" to "collection";
GRANT ALL on "controle_m_famille" to "supercollection";
GRANT SELECT on "controle_m_famille" to "visiteurcollection";

CREATE TABLE "controle_m_genre" (
        "m_genre" text NOT NULL,
        "description" text,
        Constraint "controle_m_genre_pkey" Primary Key ("m_genre")
);

REVOKE ALL on "controle_m_genre" from PUBLIC;
GRANT ALL on "controle_m_genre" to "rachel";
GRANT SELECT on "controle_m_genre" to "collection";
GRANT ALL on "controle_m_genre" to "supercollection";
GRANT SELECT on "controle_m_genre" to "visiteurcollection";

CREATE TABLE "controle_m_espece" (
        "m_espece" text NOT NULL,
        "description" text,
        Constraint "controle_m_espece_pkey" Primary Key ("m_espece")
);

REVOKE ALL on "controle_m_espece" from PUBLIC;
GRANT ALL on "controle_m_espece" to "rachel";
GRANT SELECT on "controle_m_espece" to "collection";
GRANT ALL on "controle_m_espece" to "supercollection";
GRANT SELECT on "controle_m_espece" to "visiteurcollection";

CREATE TABLE "controle_m_sexe_individu" (
        "m_sexe_individu" text NOT NULL,
        "description" text,
        Constraint "controle_m_sexe_individu_pkey" Primary Key ("m_sexe_individu")
);

REVOKE ALL on "controle_m_sexe_individu" from PUBLIC;
GRANT ALL on "controle_m_sexe_individu" to "rachel";
GRANT SELECT on "controle_m_sexe_individu" to "collection";
GRANT ALL on "controle_m_sexe_individu" to "supercollection";
GRANT SELECT on "controle_m_sexe_individu" to "visiteurcollection";

CREATE TABLE "controle_m_representation_squel" (
        "m_representation_squel" text NOT NULL,
        "description" text,
        Constraint "controle_m_representation__pkey" Primary Key ("m_representation_squel")
);

REVOKE ALL on "controle_m_representation_squel" from PUBLIC;
GRANT ALL on "controle_m_representation_squel" to "rachel";
GRANT SELECT on "controle_m_representation_squel" to "collection";
GRANT ALL on "controle_m_representation_squel" to "supercollection";
GRANT SELECT on "controle_m_representation_squel" to "visiteurcollection";

CREATE TABLE "controle_m_nature" (
        "m_nature" text NOT NULL,
        "description" text,
        Constraint "controle_m_nature_pkey" Primary Key ("m_nature")
);

REVOKE ALL on "controle_m_nature" from PUBLIC;
GRANT ALL on "controle_m_nature" to "rachel";
GRANT SELECT on "controle_m_nature" to "collection";
GRANT ALL on "controle_m_nature" to "supercollection";
GRANT SELECT on "controle_m_nature" to "visiteurcollection";

CREATE TABLE "controle_m_type_support" (
        "m_type_support" text NOT NULL,
        "description" text,
        Constraint "controle_m_type_support_pkey" Primary Key ("m_type_support")
);

REVOKE ALL on "controle_m_type_support" from PUBLIC;
GRANT ALL on "controle_m_type_support" to "rachel";
GRANT SELECT on "controle_m_type_support" to "collection";
GRANT ALL on "controle_m_type_support" to "supercollection";
GRANT SELECT on "controle_m_type_support" to "visiteurcollection";

CREATE TABLE "controle_m_batiment" (
        "m_batiment" text NOT NULL,
        "description" text,
        Constraint "controle_m_batiment_pkey" Primary Key ("m_batiment")
);

REVOKE ALL on "controle_m_batiment" from PUBLIC;
GRANT ALL on "controle_m_batiment" to "rachel";
GRANT ALL on "controle_m_batiment" to "collection";
GRANT ALL on "controle_m_batiment" to "supercollection";
GRANT ALL on "controle_m_batiment" to "visiteurcollection";

CREATE TABLE "controle_m_piece" (
        "m_piece" text NOT NULL,
        "description" text,
        Constraint "controle_m_piece_pkey" Primary Key ("m_piece")
);

REVOKE ALL on "controle_m_piece" from PUBLIC;
GRANT ALL on "controle_m_piece" to "rachel";
GRANT SELECT on "controle_m_piece" to "collection";
GRANT ALL on "controle_m_piece" to "supercollection";
GRANT SELECT on "controle_m_piece" to "visiteurcollection";

