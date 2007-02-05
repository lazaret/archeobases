--
-- Selected TOC Entries:
--
\connect - postgres

--
-- TOC Entry ID 60 (OID 77256)
--
-- Name: "plpgsql_call_handler" () Type: FUNCTION Owner: postgres
--

CREATE FUNCTION "plpgsql_call_handler" () RETURNS opaque AS '/usr/lib/postgresql/lib/plpgsql.so', 'plpgsql_call_handler' LANGUAGE 'C';

--
-- TOC Entry ID 61 (OID 77257)
--
-- Name: plpgsql Type: PROCEDURAL LANGUAGE Owner: 
--

CREATE TRUSTED PROCEDURAL LANGUAGE 'plpgsql' HANDLER "plpgsql_call_handler" LANCOMPILER 'PL/pgSQL';

\connect - rachel

--
-- TOC Entry ID 2 (OID 8173685)
--
-- Name: association Type: TABLE Owner: rachel
--

CREATE TABLE "association" (
	"identifiant_1" text NOT NULL,
	"identifiant_2" text NOT NULL,
	Constraint "association_pkey" Primary Key ("identifiant_1", "identifiant_2")
);

--
-- TOC Entry ID 3 (OID 8173685)
--
-- Name: association Type: ACL Owner: 
--

REVOKE ALL on "association" from PUBLIC;
GRANT ALL on "association" to "rachel";
GRANT ALL on "association" to "collection";
GRANT ALL on "association" to "supercollection";
GRANT SELECT on "association" to "visiteurcollection";

--
-- TOC Entry ID 4 (OID 8173716)
--
-- Name: controle_m_type_materiel Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_type_materiel" (
	"m_type_materiel" text NOT NULL,
	"description" text,
	Constraint "controle_m_type_materiel_pkey" Primary Key ("m_type_materiel")
);

--
-- TOC Entry ID 5 (OID 8173716)
--
-- Name: controle_m_type_materiel Type: ACL Owner: 
--

REVOKE ALL on "controle_m_type_materiel" from PUBLIC;
GRANT ALL on "controle_m_type_materiel" to "rachel";
GRANT SELECT on "controle_m_type_materiel" to "collection";
GRANT ALL on "controle_m_type_materiel" to "supercollection";
GRANT SELECT on "controle_m_type_materiel" to "visiteurcollection";

--
-- TOC Entry ID 6 (OID 8173722)
--
-- Name: controle_m_classe Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_classe" (
	"m_classe" text NOT NULL,
	"description" text,
	Constraint "controle_m_classe_pkey" Primary Key ("m_classe")
);

--
-- TOC Entry ID 7 (OID 8173722)
--
-- Name: controle_m_classe Type: ACL Owner: 
--

REVOKE ALL on "controle_m_classe" from PUBLIC;
GRANT ALL on "controle_m_classe" to "rachel";
GRANT SELECT on "controle_m_classe" to "collection";
GRANT ALL on "controle_m_classe" to "supercollection";
GRANT SELECT on "controle_m_classe" to "visiteurcollection";

--
-- TOC Entry ID 8 (OID 8173728)
--
-- Name: controle_m_ordre Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_ordre" (
	"m_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_m_ordre_pkey" Primary Key ("m_ordre")
);

--
-- TOC Entry ID 9 (OID 8173728)
--
-- Name: controle_m_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_m_ordre" from PUBLIC;
GRANT ALL on "controle_m_ordre" to "rachel";
GRANT SELECT on "controle_m_ordre" to "collection";
GRANT ALL on "controle_m_ordre" to "supercollection";
GRANT SELECT on "controle_m_ordre" to "visiteurcollection";

--
-- TOC Entry ID 10 (OID 8173734)
--
-- Name: controle_m_famille Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_famille" (
	"m_famille" text NOT NULL,
	"description" text,
	Constraint "controle_m_famille_pkey" Primary Key ("m_famille")
);

--
-- TOC Entry ID 11 (OID 8173734)
--
-- Name: controle_m_famille Type: ACL Owner: 
--

REVOKE ALL on "controle_m_famille" from PUBLIC;
GRANT ALL on "controle_m_famille" to "rachel";
GRANT SELECT on "controle_m_famille" to "collection";
GRANT ALL on "controle_m_famille" to "supercollection";
GRANT SELECT on "controle_m_famille" to "visiteurcollection";

--
-- TOC Entry ID 12 (OID 8173740)
--
-- Name: controle_m_genre Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_genre" (
	"m_genre" text NOT NULL,
	"description" text,
	Constraint "controle_m_genre_pkey" Primary Key ("m_genre")
);

--
-- TOC Entry ID 13 (OID 8173740)
--
-- Name: controle_m_genre Type: ACL Owner: 
--

REVOKE ALL on "controle_m_genre" from PUBLIC;
GRANT ALL on "controle_m_genre" to "rachel";
GRANT SELECT on "controle_m_genre" to "collection";
GRANT ALL on "controle_m_genre" to "supercollection";
GRANT SELECT on "controle_m_genre" to "visiteurcollection";

--
-- TOC Entry ID 14 (OID 8173746)
--
-- Name: controle_m_espece Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_espece" (
	"m_espece" text NOT NULL,
	"description" text,
	Constraint "controle_m_espece_pkey" Primary Key ("m_espece")
);

--
-- TOC Entry ID 15 (OID 8173746)
--
-- Name: controle_m_espece Type: ACL Owner: 
--

REVOKE ALL on "controle_m_espece" from PUBLIC;
GRANT ALL on "controle_m_espece" to "rachel";
GRANT SELECT on "controle_m_espece" to "collection";
GRANT ALL on "controle_m_espece" to "supercollection";
GRANT SELECT on "controle_m_espece" to "visiteurcollection";

--
-- TOC Entry ID 16 (OID 8173752)
--
-- Name: controle_m_sexe_individu Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_sexe_individu" (
	"m_sexe_individu" text NOT NULL,
	"description" text,
	Constraint "controle_m_sexe_individu_pkey" Primary Key ("m_sexe_individu")
);

--
-- TOC Entry ID 17 (OID 8173752)
--
-- Name: controle_m_sexe_individu Type: ACL Owner: 
--

REVOKE ALL on "controle_m_sexe_individu" from PUBLIC;
GRANT ALL on "controle_m_sexe_individu" to "rachel";
GRANT SELECT on "controle_m_sexe_individu" to "collection";
GRANT ALL on "controle_m_sexe_individu" to "supercollection";
GRANT SELECT on "controle_m_sexe_individu" to "visiteurcollection";

--
-- TOC Entry ID 18 (OID 8173758)
--
-- Name: controle_m_representation_squel Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_representation_squel" (
	"m_representation_squel" text NOT NULL,
	"description" text,
	Constraint "controle_m_representation__pkey" Primary Key ("m_representation_squel")
);

--
-- TOC Entry ID 19 (OID 8173758)
--
-- Name: controle_m_representation_squel Type: ACL Owner: 
--

REVOKE ALL on "controle_m_representation_squel" from PUBLIC;
GRANT ALL on "controle_m_representation_squel" to "rachel";
GRANT SELECT on "controle_m_representation_squel" to "collection";
GRANT ALL on "controle_m_representation_squel" to "supercollection";
GRANT SELECT on "controle_m_representation_squel" to "visiteurcollection";

--
-- TOC Entry ID 20 (OID 8173764)
--
-- Name: controle_m_nature Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_nature" (
	"m_nature" text NOT NULL,
	"description" text,
	Constraint "controle_m_nature_pkey" Primary Key ("m_nature")
);

--
-- TOC Entry ID 21 (OID 8173764)
--
-- Name: controle_m_nature Type: ACL Owner: 
--

REVOKE ALL on "controle_m_nature" from PUBLIC;
GRANT ALL on "controle_m_nature" to "rachel";
GRANT SELECT on "controle_m_nature" to "collection";
GRANT ALL on "controle_m_nature" to "supercollection";
GRANT SELECT on "controle_m_nature" to "visiteurcollection";

--
-- TOC Entry ID 22 (OID 8173770)
--
-- Name: controle_m_type_support Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_type_support" (
	"m_type_support" text NOT NULL,
	"description" text,
	Constraint "controle_m_type_support_pkey" Primary Key ("m_type_support")
);

--
-- TOC Entry ID 23 (OID 8173770)
--
-- Name: controle_m_type_support Type: ACL Owner: 
--

REVOKE ALL on "controle_m_type_support" from PUBLIC;
GRANT ALL on "controle_m_type_support" to "rachel";
GRANT SELECT on "controle_m_type_support" to "collection";
GRANT ALL on "controle_m_type_support" to "supercollection";
GRANT SELECT on "controle_m_type_support" to "visiteurcollection";

--
-- TOC Entry ID 24 (OID 8173779)
--
-- Name: controle_m_batiment Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_batiment" (
	"m_batiment" text NOT NULL,
	"description" text,
	Constraint "controle_m_batiment_pkey" Primary Key ("m_batiment")
);

--
-- TOC Entry ID 25 (OID 8173779)
--
-- Name: controle_m_batiment Type: ACL Owner: 
--

REVOKE ALL on "controle_m_batiment" from PUBLIC;
GRANT ALL on "controle_m_batiment" to "rachel";
GRANT ALL on "controle_m_batiment" to "collection";
GRANT ALL on "controle_m_batiment" to "supercollection";
GRANT ALL on "controle_m_batiment" to "visiteurcollection";

--
-- TOC Entry ID 26 (OID 8173785)
--
-- Name: controle_m_piece Type: TABLE Owner: rachel
--

CREATE TABLE "controle_m_piece" (
	"m_piece" text NOT NULL,
	"description" text,
	Constraint "controle_m_piece_pkey" Primary Key ("m_piece")
);

--
-- TOC Entry ID 27 (OID 8173785)
--
-- Name: controle_m_piece Type: ACL Owner: 
--

REVOKE ALL on "controle_m_piece" from PUBLIC;
GRANT ALL on "controle_m_piece" to "rachel";
GRANT SELECT on "controle_m_piece" to "collection";
GRANT ALL on "controle_m_piece" to "supercollection";
GRANT SELECT on "controle_m_piece" to "visiteurcollection";

--
-- TOC Entry ID 28 (OID 8173915)
--
-- Name: controle_b_type_biblio Type: TABLE Owner: rachel
--

CREATE TABLE "controle_b_type_biblio" (
	"b_type_biblio" text NOT NULL,
	"description" text,
	Constraint "controle_b_type_biblio_pkey" Primary Key ("b_type_biblio")
);

--
-- TOC Entry ID 29 (OID 8173915)
--
-- Name: controle_b_type_biblio Type: ACL Owner: 
--

REVOKE ALL on "controle_b_type_biblio" from PUBLIC;
GRANT ALL on "controle_b_type_biblio" to "rachel";
GRANT SELECT on "controle_b_type_biblio" to "collection";
GRANT ALL on "controle_b_type_biblio" to "supercollection";
GRANT SELECT on "controle_b_type_biblio" to "visiteurcollection";

--
-- TOC Entry ID 30 (OID 8173921)
--
-- Name: controle_b_langue_document Type: TABLE Owner: rachel
--

CREATE TABLE "controle_b_langue_document" (
	"b_langue_document" text NOT NULL,
	"description" text,
	Constraint "controle_b_langue_document_pkey" Primary Key ("b_langue_document")
);

--
-- TOC Entry ID 31 (OID 8173921)
--
-- Name: controle_b_langue_document Type: ACL Owner: 
--

REVOKE ALL on "controle_b_langue_document" from PUBLIC;
GRANT ALL on "controle_b_langue_document" to "rachel";
GRANT SELECT on "controle_b_langue_document" to "collection";
GRANT ALL on "controle_b_langue_document" to "supercollection";
GRANT SELECT on "controle_b_langue_document" to "visiteurcollection";

--
-- TOC Entry ID 32 (OID 8173989)
--
-- Name: biblio Type: TABLE Owner: rachel
--

CREATE TABLE "biblio" (
	"identifiant" text NOT NULL,
	"b_type_biblio" text,
	"b_indice" text,
	"b_titre_ouvrage" text,
	"b_auteur" text,
	"b_titre_article" text,
	"b_titre_periodique" text,
	"b_pages" text,
	"b_maison_edition" text,
	"b_ville_edition" text,
	"b_dir_pub" text,
	"b_annee" integer,
	"b_mois" text,
	"b_nombre_volume" integer,
	"b_serie" text,
	"b_fascicule" integer,
	"b_tome" integer,
	"b_numero" integer,
	"b_volume" integer,
	"b_langue_document" text,
	"b_langue_resume" text,
	"b_etablissement" text,
	"b_description" text,
	"b_isbn" text,
	"b_issn" text,
	"b_resume" text,
	"b_mots_clefs" text,
	"b_nombre_ex_supp" integer,
	"b_url" text,
	"b_modif_biblio" date,
	"b_saisie" date DEFAULT 'now'::text,
	Constraint "biblio_pkey" Primary Key ("identifiant")
);

--
-- TOC Entry ID 33 (OID 8173989)
--
-- Name: biblio Type: ACL Owner: 
--

REVOKE ALL on "biblio" from PUBLIC;
GRANT ALL on "biblio" to "rachel";
GRANT ALL on "biblio" to "collection";
GRANT ALL on "biblio" to "supercollection";
GRANT SELECT on "biblio" to "visiteurcollection";

--
-- TOC Entry ID 34 (OID 8195952)
--
-- Name: materiel Type: TABLE Owner: rachel
--

CREATE TABLE "materiel" (
	"identifiant" text NOT NULL,
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
	"m_individu" text,
	"m_classe" text,
	"m_ordre" text,
	"m_famille" text,
	"m_genre" text,
	"m_espece" text,
	"m_nom_familier" text,
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
	"m_groupe" text,
	"m_ville" text,
	"m_nom_scientifique" text,
	"m_holotype_espece" text,
	"m_origine" text,
	"m_date" text,
	"m_date_acquisition" text,
	"m_numero_individu" text,
	"m_largeur_coupe" text,
	"m_support" text,
	"m_edition" text,
	"m_diffusion" text,
	"m_dimension" text,
	"m_saisie" date DEFAULT 'now'::text,
	Constraint "materiel_pkey" Primary Key ("identifiant")
);

--
-- TOC Entry ID 35 (OID 8195952)
--
-- Name: materiel Type: ACL Owner: 
--

REVOKE ALL on "materiel" from PUBLIC;
GRANT ALL on "materiel" to "rachel";
GRANT ALL on "materiel" to "collection";
GRANT ALL on "materiel" to "supercollection";
GRANT SELECT on "materiel" to "visiteurcollection";

--
-- TOC Entry ID 36 (OID 8195980)
--
-- Name: anthropologie Type: VIEW Owner: rachel
--

CREATE VIEW "anthropologie" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'ANTHROPOLOGIE'::text);

--
-- TOC Entry ID 37 (OID 8195980)
--
-- Name: anthropologie Type: ACL Owner: 
--

REVOKE ALL on "anthropologie" from PUBLIC;
GRANT ALL on "anthropologie" to "rachel";
GRANT ALL on "anthropologie" to "collection";
GRANT ALL on "anthropologie" to "supercollection";
GRANT SELECT on "anthropologie" to "visiteurcollection";

--
-- TOC Entry ID 38 (OID 8195984)
--
-- Name: audio_video Type: VIEW Owner: rachel
--

CREATE VIEW "audio_video" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'AUDIO_VIDEO'::text);

--
-- TOC Entry ID 39 (OID 8195984)
--
-- Name: audio_video Type: ACL Owner: 
--

REVOKE ALL on "audio_video" from PUBLIC;
GRANT ALL on "audio_video" to "rachel";
GRANT ALL on "audio_video" to "collection";
GRANT ALL on "audio_video" to "supercollection";
GRANT SELECT on "audio_video" to "visiteurcollection";

--
-- TOC Entry ID 40 (OID 8195988)
--
-- Name: carte Type: VIEW Owner: rachel
--

CREATE VIEW "carte" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'CARTE'::text);

--
-- TOC Entry ID 41 (OID 8195988)
--
-- Name: carte Type: ACL Owner: 
--

REVOKE ALL on "carte" from PUBLIC;
GRANT ALL on "carte" to "rachel";
GRANT ALL on "carte" to "collection";
GRANT ALL on "carte" to "supercollection";
GRANT SELECT on "carte" to "visiteurcollection";

--
-- TOC Entry ID 42 (OID 8195992)
--
-- Name: dessin Type: VIEW Owner: rachel
--

CREATE VIEW "dessin" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'DESSIN'::text);

--
-- TOC Entry ID 43 (OID 8195992)
--
-- Name: dessin Type: ACL Owner: 
--

REVOKE ALL on "dessin" from PUBLIC;
GRANT ALL on "dessin" to "rachel";
GRANT ALL on "dessin" to "collection";
GRANT ALL on "dessin" to "supercollection";
GRANT SELECT on "dessin" to "visiteurcollection";

--
-- TOC Entry ID 44 (OID 8195996)
--
-- Name: faune_comparaison Type: VIEW Owner: rachel
--

CREATE VIEW "faune_comparaison" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'FAUNE_COMPARAISON'::text);

--
-- TOC Entry ID 45 (OID 8195996)
--
-- Name: faune_comparaison Type: ACL Owner: 
--

REVOKE ALL on "faune_comparaison" from PUBLIC;
GRANT ALL on "faune_comparaison" to "rachel";
GRANT ALL on "faune_comparaison" to "collection";
GRANT ALL on "faune_comparaison" to "supercollection";
GRANT SELECT on "faune_comparaison" to "visiteurcollection";

--
-- TOC Entry ID 46 (OID 8196000)
--
-- Name: moulage_sol Type: VIEW Owner: rachel
--

CREATE VIEW "moulage_sol" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'MOULAGE_SOL'::text);

--
-- TOC Entry ID 47 (OID 8196000)
--
-- Name: moulage_sol Type: ACL Owner: 
--

REVOKE ALL on "moulage_sol" from PUBLIC;
GRANT ALL on "moulage_sol" to "rachel";
GRANT ALL on "moulage_sol" to "collection";
GRANT ALL on "moulage_sol" to "supercollection";
GRANT SELECT on "moulage_sol" to "visiteurcollection";

--
-- TOC Entry ID 48 (OID 8196008)
--
-- Name: releve Type: VIEW Owner: rachel
--

CREATE VIEW "releve" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'RELEVE'::text);

--
-- TOC Entry ID 49 (OID 8196008)
--
-- Name: releve Type: ACL Owner: 
--

REVOKE ALL on "releve" from PUBLIC;
GRANT ALL on "releve" to "rachel";
GRANT ALL on "releve" to "collection";
GRANT ALL on "releve" to "supercollection";
GRANT SELECT on "releve" to "visiteurcollection";

--
-- TOC Entry ID 50 (OID 8196012)
--
-- Name: scan Type: VIEW Owner: rachel
--

CREATE VIEW "scan" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'SCAN_3D'::text);

--
-- TOC Entry ID 51 (OID 8196012)
--
-- Name: scan Type: ACL Owner: 
--

REVOKE ALL on "scan" from PUBLIC;
GRANT ALL on "scan" to "rachel";
GRANT ALL on "scan" to "collection";
GRANT ALL on "scan" to "supercollection";
GRANT SELECT on "scan" to "visiteurcollection";

--
-- TOC Entry ID 52 (OID 8196016)
--
-- Name: vue Type: VIEW Owner: rachel
--

CREATE VIEW "vue" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'VUE'::text);

--
-- TOC Entry ID 53 (OID 8196016)
--
-- Name: vue Type: ACL Owner: 
--

REVOKE ALL on "vue" from PUBLIC;
GRANT ALL on "vue" to "rachel";
GRANT ALL on "vue" to "collection";
GRANT ALL on "vue" to "supercollection";
GRANT SELECT on "vue" to "visiteurcollection";

--
-- TOC Entry ID 54 (OID 8196020)
--
-- Name: sepulture Type: VIEW Owner: rachel
--

CREATE VIEW "sepulture" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'SEPULTURE'::text);

--
-- TOC Entry ID 55 (OID 8196020)
--
-- Name: sepulture Type: ACL Owner: 
--

REVOKE ALL on "sepulture" from PUBLIC;
GRANT ALL on "sepulture" to "rachel";
GRANT ALL on "sepulture" to "collection";
GRANT ALL on "sepulture" to "supercollection";
GRANT SELECT on "sepulture" to "visiteurcollection";

--
-- TOC Entry ID 56 (OID 8196024)
--
-- Name: moulage_objet Type: VIEW Owner: rachel
--

CREATE VIEW "moulage_objet" as SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_scientifique, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension FROM materiel WHERE (materiel.m_type_materiel = 'MOULAGE_OBJET'::text);

--
-- TOC Entry ID 57 (OID 8196024)
--
-- Name: moulage_objet Type: ACL Owner: 
--

REVOKE ALL on "moulage_objet" from PUBLIC;
GRANT ALL on "moulage_objet" to "rachel";
GRANT ALL on "moulage_objet" to "collection";
GRANT ALL on "moulage_objet" to "supercollection";
GRANT SELECT on "moulage_objet" to "visiteurcollection";

--
-- TOC Entry ID 58 (OID 8219262)
--
-- Name: requete Type: TABLE Owner: rachel
--

CREATE TABLE "requete" (
	"nomrequete" text NOT NULL,
	"coderequete" text,
	Constraint "requete_pkey" Primary Key ("nomrequete")
);

--
-- TOC Entry ID 59 (OID 8219262)
--
-- Name: requete Type: ACL Owner: 
--

REVOKE ALL on "requete" from PUBLIC;
GRANT ALL on "requete" to "rachel";
GRANT ALL on "requete" to "collection";
GRANT ALL on "requete" to "supercollection";

