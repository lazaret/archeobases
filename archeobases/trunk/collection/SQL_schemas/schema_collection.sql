--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: materiel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materiel (
    identifiant text NOT NULL,
    m_type_materiel text,
    m_numero_inventaire text,
    m_nom_site text,
    m_localite text,
    m_commune text,
    m_region text,
    m_pays text,
    m_nom_commun text,
    m_inventeur text,
    m_donnateur text,
    m_depot_original text,
    m_date_decouverte text,
    m_periode_culturelle text,
    m_periode_geologique text,
    m_age_absolu text,
    m_date_copie text,
    m_individu text,
    m_classe text,
    m_ordre text,
    m_famille text,
    m_genre text,
    m_espece text,
    m_nom_familier text,
    m_synonymes text,
    m_age_individu text,
    m_sexe_individu text,
    m_donnees_individu text,
    m_representation_squel text,
    m_description_anatomique text,
    m_observations_anatomique text,
    m_nature text,
    m_observations text,
    m_bibliographie text,
    m_mots_clefs text,
    m_type_support text,
    m_auteur text,
    m_titre text,
    m_editeur text,
    m_date_edition text,
    m_duree text,
    m_dimensions text,
    m_echelle text,
    m_piece text,
    m_meuble text,
    m_tiroir text,
    m_etagere text,
    m_nombre_exemplaires integer,
    m_date_modif date,
    m_batiment text,
    m_groupe text,
    m_ville text,
    m_nom_fossile text,
    m_holotype_espece text,
    m_origine text,
    m_date text,
    m_date_acquisition text,
    m_numero_individu text,
    m_largeur_coupe text,
    m_support text,
    m_edition text,
    m_diffusion text,
    m_dimension text,
    m_saisie date DEFAULT date('now'::text),
    m_depot_moule text
);


ALTER TABLE public.materiel OWNER TO postgres;

--
-- Name: anthropologie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW anthropologie AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'ANTHROPOLOGIE'::text);


ALTER TABLE public.anthropologie OWNER TO postgres;

--
-- Name: association; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE association (
    identifiant_1 text NOT NULL,
    identifiant_2 text NOT NULL
);


ALTER TABLE public.association OWNER TO postgres;

--
-- Name: audio_video; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW audio_video AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'AUDIO_VIDEO'::text);


ALTER TABLE public.audio_video OWNER TO postgres;

--
-- Name: biblio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE biblio (
    identifiant text NOT NULL,
    b_type_biblio text,
    b_indice text,
    b_titre_ouvrage text,
    b_auteur text,
    b_titre_article text,
    b_titre_periodique text,
    b_pages text,
    b_maison_edition text,
    b_ville_edition text,
    b_dir_pub text,
    b_annee integer,
    b_mois text,
    b_nombre_volume integer,
    b_serie text,
    b_fascicule integer,
    b_tome integer,
    b_numero integer,
    b_volume integer,
    b_langue_document text,
    b_langue_resume text,
    b_etablissement text,
    b_description text,
    b_isbn text,
    b_issn text,
    b_resume text,
    b_mots_clefs text,
    b_nombre_ex_supp integer,
    b_url text,
    b_modif_biblio date DEFAULT date('now'::text),
    b_saisie date
);


ALTER TABLE public.biblio OWNER TO postgres;

--
-- Name: carte; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW carte AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'CARTE'::text);


ALTER TABLE public.carte OWNER TO postgres;

--
-- Name: controle_b_langue_document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_langue_document (
    b_langue_document text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_langue_document OWNER TO postgres;

--
-- Name: controle_b_type_biblio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_type_biblio (
    b_type_biblio text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_type_biblio OWNER TO postgres;

--
-- Name: controle_m_batiment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_batiment (
    m_batiment text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_batiment OWNER TO postgres;

--
-- Name: controle_m_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_classe (
    m_classe text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_classe OWNER TO postgres;

--
-- Name: controle_m_espece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_espece (
    m_espece text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_espece OWNER TO postgres;

--
-- Name: controle_m_famille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_famille (
    m_famille text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_famille OWNER TO postgres;

--
-- Name: controle_m_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_genre (
    m_genre text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_genre OWNER TO postgres;

--
-- Name: controle_m_nature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_nature (
    m_nature text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_nature OWNER TO postgres;

--
-- Name: controle_m_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_ordre (
    m_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_ordre OWNER TO postgres;

--
-- Name: controle_m_piece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_piece (
    m_piece text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_piece OWNER TO postgres;

--
-- Name: controle_m_representation_squel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_representation_squel (
    m_representation_squel text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_representation_squel OWNER TO postgres;

--
-- Name: controle_m_sexe_individu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_sexe_individu (
    m_sexe_individu text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_sexe_individu OWNER TO postgres;

--
-- Name: controle_m_type_materiel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_type_materiel (
    m_type_materiel text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_type_materiel OWNER TO postgres;

--
-- Name: controle_m_type_support; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_m_type_support (
    m_type_support text NOT NULL,
    description text
);


ALTER TABLE public.controle_m_type_support OWNER TO postgres;

--
-- Name: dessin; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW dessin AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'DESSIN'::text);


ALTER TABLE public.dessin OWNER TO postgres;

--
-- Name: faune_comparaison; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW faune_comparaison AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'FAUNE_COMPARAISON'::text);


ALTER TABLE public.faune_comparaison OWNER TO postgres;

--
-- Name: moulage_objet; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW moulage_objet AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'MOULAGE_OBJET'::text);


ALTER TABLE public.moulage_objet OWNER TO postgres;

--
-- Name: moulage_sol; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW moulage_sol AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'MOULAGE_SOL'::text);


ALTER TABLE public.moulage_sol OWNER TO postgres;

--
-- Name: releve; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW releve AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'RELEVE'::text);


ALTER TABLE public.releve OWNER TO postgres;

--
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requete (
    nomrequete text NOT NULL,
    coderequete text
);


ALTER TABLE public.requete OWNER TO postgres;

--
-- Name: scan; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW scan AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'CT-SCAN'::text);


ALTER TABLE public.scan OWNER TO postgres;

--
-- Name: sepulture; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW sepulture AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'SEPULTURE'::text);


ALTER TABLE public.sepulture OWNER TO postgres;

--
-- Name: vue; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vue AS
    SELECT materiel.identifiant, materiel.m_type_materiel, materiel.m_numero_inventaire, materiel.m_nom_site, materiel.m_localite, materiel.m_commune, materiel.m_region, materiel.m_pays, materiel.m_nom_commun, materiel.m_inventeur, materiel.m_donnateur, materiel.m_depot_original, materiel.m_date_decouverte, materiel.m_periode_culturelle, materiel.m_periode_geologique, materiel.m_age_absolu, materiel.m_date_copie, materiel.m_individu, materiel.m_classe, materiel.m_ordre, materiel.m_famille, materiel.m_genre, materiel.m_espece, materiel.m_nom_familier, materiel.m_synonymes, materiel.m_age_individu, materiel.m_sexe_individu, materiel.m_donnees_individu, materiel.m_representation_squel, materiel.m_description_anatomique, materiel.m_observations_anatomique, materiel.m_nature, materiel.m_observations, materiel.m_bibliographie, materiel.m_mots_clefs, materiel.m_type_support, materiel.m_auteur, materiel.m_titre, materiel.m_editeur, materiel.m_date_edition, materiel.m_duree, materiel.m_dimensions, materiel.m_echelle, materiel.m_piece, materiel.m_meuble, materiel.m_tiroir, materiel.m_etagere, materiel.m_nombre_exemplaires, materiel.m_date_modif, materiel.m_batiment, materiel.m_groupe, materiel.m_ville, materiel.m_nom_fossile, materiel.m_holotype_espece, materiel.m_origine, materiel.m_date, materiel.m_date_acquisition, materiel.m_numero_individu, materiel.m_largeur_coupe, materiel.m_support, materiel.m_edition, materiel.m_diffusion, materiel.m_dimension, materiel.m_saisie, materiel.m_depot_moule FROM materiel WHERE (materiel.m_type_materiel = 'VUE'::text);


ALTER TABLE public.vue OWNER TO postgres;

--
-- Name: association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY association
    ADD CONSTRAINT association_pkey PRIMARY KEY (identifiant_1, identifiant_2);


--
-- Name: biblio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY biblio
    ADD CONSTRAINT biblio_pkey PRIMARY KEY (identifiant);


--
-- Name: controle_b_langue_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_langue_document
    ADD CONSTRAINT controle_b_langue_document_pkey PRIMARY KEY (b_langue_document);


--
-- Name: controle_b_type_biblio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_type_biblio
    ADD CONSTRAINT controle_b_type_biblio_pkey PRIMARY KEY (b_type_biblio);


--
-- Name: controle_m_batiment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_batiment
    ADD CONSTRAINT controle_m_batiment_pkey PRIMARY KEY (m_batiment);


--
-- Name: controle_m_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_classe
    ADD CONSTRAINT controle_m_classe_pkey PRIMARY KEY (m_classe);


--
-- Name: controle_m_espece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_espece
    ADD CONSTRAINT controle_m_espece_pkey PRIMARY KEY (m_espece);


--
-- Name: controle_m_famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_famille
    ADD CONSTRAINT controle_m_famille_pkey PRIMARY KEY (m_famille);


--
-- Name: controle_m_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_genre
    ADD CONSTRAINT controle_m_genre_pkey PRIMARY KEY (m_genre);


--
-- Name: controle_m_nature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_nature
    ADD CONSTRAINT controle_m_nature_pkey PRIMARY KEY (m_nature);


--
-- Name: controle_m_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_ordre
    ADD CONSTRAINT controle_m_ordre_pkey PRIMARY KEY (m_ordre);


--
-- Name: controle_m_piece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_piece
    ADD CONSTRAINT controle_m_piece_pkey PRIMARY KEY (m_piece);


--
-- Name: controle_m_representation__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_representation_squel
    ADD CONSTRAINT controle_m_representation__pkey PRIMARY KEY (m_representation_squel);


--
-- Name: controle_m_sexe_individu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_sexe_individu
    ADD CONSTRAINT controle_m_sexe_individu_pkey PRIMARY KEY (m_sexe_individu);


--
-- Name: controle_m_type_materiel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_type_materiel
    ADD CONSTRAINT controle_m_type_materiel_pkey PRIMARY KEY (m_type_materiel);


--
-- Name: controle_m_type_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_m_type_support
    ADD CONSTRAINT controle_m_type_support_pkey PRIMARY KEY (m_type_support);


--
-- Name: materiel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materiel
    ADD CONSTRAINT materiel_pkey PRIMARY KEY (identifiant);


--
-- Name: requete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT requete_pkey PRIMARY KEY (nomrequete);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: materiel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE materiel FROM PUBLIC;
REVOKE ALL ON TABLE materiel FROM postgres;
GRANT ALL ON TABLE materiel TO postgres;
GRANT ALL ON TABLE materiel TO collection;
GRANT ALL ON TABLE materiel TO supercollection;
GRANT SELECT ON TABLE materiel TO visiteurcollection;


--
-- Name: anthropologie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE anthropologie FROM PUBLIC;
REVOKE ALL ON TABLE anthropologie FROM postgres;
GRANT ALL ON TABLE anthropologie TO postgres;
GRANT ALL ON TABLE anthropologie TO collection;
GRANT ALL ON TABLE anthropologie TO supercollection;
GRANT SELECT ON TABLE anthropologie TO visiteurcollection;


--
-- Name: association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE association FROM PUBLIC;
REVOKE ALL ON TABLE association FROM postgres;
GRANT ALL ON TABLE association TO postgres;
GRANT ALL ON TABLE association TO collection;
GRANT ALL ON TABLE association TO supercollection;
GRANT SELECT ON TABLE association TO visiteurcollection;


--
-- Name: audio_video; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE audio_video FROM PUBLIC;
REVOKE ALL ON TABLE audio_video FROM postgres;
GRANT ALL ON TABLE audio_video TO postgres;
GRANT ALL ON TABLE audio_video TO collection;
GRANT ALL ON TABLE audio_video TO supercollection;
GRANT SELECT ON TABLE audio_video TO visiteurcollection;


--
-- Name: biblio; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE biblio FROM PUBLIC;
REVOKE ALL ON TABLE biblio FROM postgres;
GRANT ALL ON TABLE biblio TO postgres;
GRANT ALL ON TABLE biblio TO collection;
GRANT ALL ON TABLE biblio TO supercollection;
GRANT SELECT ON TABLE biblio TO visiteurcollection;


--
-- Name: carte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE carte FROM PUBLIC;
REVOKE ALL ON TABLE carte FROM postgres;
GRANT ALL ON TABLE carte TO postgres;
GRANT ALL ON TABLE carte TO collection;
GRANT ALL ON TABLE carte TO supercollection;
GRANT SELECT ON TABLE carte TO visiteurcollection;


--
-- Name: controle_b_langue_document; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_langue_document FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_langue_document FROM postgres;
GRANT ALL ON TABLE controle_b_langue_document TO postgres;
GRANT SELECT ON TABLE controle_b_langue_document TO collection;
GRANT ALL ON TABLE controle_b_langue_document TO supercollection;
GRANT SELECT ON TABLE controle_b_langue_document TO visiteurcollection;


--
-- Name: controle_b_type_biblio; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_type_biblio FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_type_biblio FROM postgres;
GRANT ALL ON TABLE controle_b_type_biblio TO postgres;
GRANT SELECT ON TABLE controle_b_type_biblio TO collection;
GRANT ALL ON TABLE controle_b_type_biblio TO supercollection;
GRANT SELECT ON TABLE controle_b_type_biblio TO visiteurcollection;


--
-- Name: controle_m_batiment; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_batiment FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_batiment FROM postgres;
GRANT ALL ON TABLE controle_m_batiment TO postgres;
GRANT ALL ON TABLE controle_m_batiment TO collection;
GRANT ALL ON TABLE controle_m_batiment TO supercollection;
GRANT ALL ON TABLE controle_m_batiment TO visiteurcollection;


--
-- Name: controle_m_classe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_classe FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_classe FROM postgres;
GRANT ALL ON TABLE controle_m_classe TO postgres;
GRANT SELECT ON TABLE controle_m_classe TO collection;
GRANT ALL ON TABLE controle_m_classe TO supercollection;
GRANT SELECT ON TABLE controle_m_classe TO visiteurcollection;


--
-- Name: controle_m_espece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_espece FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_espece FROM postgres;
GRANT ALL ON TABLE controle_m_espece TO postgres;
GRANT SELECT ON TABLE controle_m_espece TO collection;
GRANT ALL ON TABLE controle_m_espece TO supercollection;
GRANT SELECT ON TABLE controle_m_espece TO visiteurcollection;


--
-- Name: controle_m_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_famille FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_famille FROM postgres;
GRANT ALL ON TABLE controle_m_famille TO postgres;
GRANT SELECT ON TABLE controle_m_famille TO collection;
GRANT ALL ON TABLE controle_m_famille TO supercollection;
GRANT SELECT ON TABLE controle_m_famille TO visiteurcollection;


--
-- Name: controle_m_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_genre FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_genre FROM postgres;
GRANT ALL ON TABLE controle_m_genre TO postgres;
GRANT SELECT ON TABLE controle_m_genre TO collection;
GRANT ALL ON TABLE controle_m_genre TO supercollection;
GRANT SELECT ON TABLE controle_m_genre TO visiteurcollection;


--
-- Name: controle_m_nature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_nature FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_nature FROM postgres;
GRANT ALL ON TABLE controle_m_nature TO postgres;
GRANT SELECT ON TABLE controle_m_nature TO collection;
GRANT ALL ON TABLE controle_m_nature TO supercollection;
GRANT SELECT ON TABLE controle_m_nature TO visiteurcollection;


--
-- Name: controle_m_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_ordre FROM postgres;
GRANT ALL ON TABLE controle_m_ordre TO postgres;
GRANT SELECT ON TABLE controle_m_ordre TO collection;
GRANT ALL ON TABLE controle_m_ordre TO supercollection;
GRANT SELECT ON TABLE controle_m_ordre TO visiteurcollection;


--
-- Name: controle_m_piece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_piece FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_piece FROM postgres;
GRANT ALL ON TABLE controle_m_piece TO postgres;
GRANT SELECT ON TABLE controle_m_piece TO collection;
GRANT ALL ON TABLE controle_m_piece TO supercollection;
GRANT SELECT ON TABLE controle_m_piece TO visiteurcollection;


--
-- Name: controle_m_representation_squel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_representation_squel FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_representation_squel FROM postgres;
GRANT ALL ON TABLE controle_m_representation_squel TO postgres;
GRANT SELECT ON TABLE controle_m_representation_squel TO collection;
GRANT ALL ON TABLE controle_m_representation_squel TO supercollection;
GRANT SELECT ON TABLE controle_m_representation_squel TO visiteurcollection;


--
-- Name: controle_m_sexe_individu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_sexe_individu FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_sexe_individu FROM postgres;
GRANT ALL ON TABLE controle_m_sexe_individu TO postgres;
GRANT SELECT ON TABLE controle_m_sexe_individu TO collection;
GRANT ALL ON TABLE controle_m_sexe_individu TO supercollection;
GRANT SELECT ON TABLE controle_m_sexe_individu TO visiteurcollection;


--
-- Name: controle_m_type_materiel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_type_materiel FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_type_materiel FROM postgres;
GRANT ALL ON TABLE controle_m_type_materiel TO postgres;
GRANT SELECT ON TABLE controle_m_type_materiel TO collection;
GRANT ALL ON TABLE controle_m_type_materiel TO supercollection;
GRANT SELECT ON TABLE controle_m_type_materiel TO visiteurcollection;


--
-- Name: controle_m_type_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_m_type_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_m_type_support FROM postgres;
GRANT ALL ON TABLE controle_m_type_support TO postgres;
GRANT SELECT ON TABLE controle_m_type_support TO collection;
GRANT ALL ON TABLE controle_m_type_support TO supercollection;
GRANT SELECT ON TABLE controle_m_type_support TO visiteurcollection;


--
-- Name: dessin; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE dessin FROM PUBLIC;
REVOKE ALL ON TABLE dessin FROM postgres;
GRANT ALL ON TABLE dessin TO postgres;
GRANT ALL ON TABLE dessin TO collection;
GRANT ALL ON TABLE dessin TO supercollection;
GRANT SELECT ON TABLE dessin TO visiteurcollection;


--
-- Name: faune_comparaison; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE faune_comparaison FROM PUBLIC;
REVOKE ALL ON TABLE faune_comparaison FROM postgres;
GRANT ALL ON TABLE faune_comparaison TO postgres;
GRANT ALL ON TABLE faune_comparaison TO collection;
GRANT ALL ON TABLE faune_comparaison TO supercollection;
GRANT SELECT ON TABLE faune_comparaison TO visiteurcollection;


--
-- Name: moulage_objet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE moulage_objet FROM PUBLIC;
REVOKE ALL ON TABLE moulage_objet FROM postgres;
GRANT ALL ON TABLE moulage_objet TO postgres;
GRANT ALL ON TABLE moulage_objet TO collection;
GRANT ALL ON TABLE moulage_objet TO supercollection;
GRANT SELECT ON TABLE moulage_objet TO visiteurcollection;


--
-- Name: moulage_sol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE moulage_sol FROM PUBLIC;
REVOKE ALL ON TABLE moulage_sol FROM postgres;
GRANT ALL ON TABLE moulage_sol TO postgres;
GRANT ALL ON TABLE moulage_sol TO collection;
GRANT ALL ON TABLE moulage_sol TO supercollection;
GRANT SELECT ON TABLE moulage_sol TO visiteurcollection;


--
-- Name: releve; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE releve FROM PUBLIC;
REVOKE ALL ON TABLE releve FROM postgres;
GRANT ALL ON TABLE releve TO postgres;
GRANT ALL ON TABLE releve TO collection;
GRANT ALL ON TABLE releve TO supercollection;
GRANT SELECT ON TABLE releve TO visiteurcollection;


--
-- Name: requete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE requete FROM PUBLIC;
REVOKE ALL ON TABLE requete FROM postgres;
GRANT ALL ON TABLE requete TO postgres;
GRANT ALL ON TABLE requete TO collection;
GRANT ALL ON TABLE requete TO supercollection;


--
-- Name: scan; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE scan FROM PUBLIC;
REVOKE ALL ON TABLE scan FROM postgres;
GRANT ALL ON TABLE scan TO postgres;
GRANT ALL ON TABLE scan TO collection;
GRANT ALL ON TABLE scan TO supercollection;
GRANT SELECT ON TABLE scan TO visiteurcollection;


--
-- Name: sepulture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE sepulture FROM PUBLIC;
REVOKE ALL ON TABLE sepulture FROM postgres;
GRANT ALL ON TABLE sepulture TO postgres;
GRANT ALL ON TABLE sepulture TO collection;
GRANT ALL ON TABLE sepulture TO supercollection;
GRANT SELECT ON TABLE sepulture TO visiteurcollection;


--
-- Name: vue; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vue FROM PUBLIC;
REVOKE ALL ON TABLE vue FROM postgres;
GRANT ALL ON TABLE vue TO postgres;
GRANT ALL ON TABLE vue TO collection;
GRANT ALL ON TABLE vue TO supercollection;
GRANT SELECT ON TABLE vue TO visiteurcollection;


--
-- PostgreSQL database dump complete
--

