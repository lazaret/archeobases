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
-- Name: biface; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE biface (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    b_forme text,
    b_type text,
    b_base text,
    b_surface text,
    b_enlevement text,
    b_amenagement_bord text,
    b_amenagement_distal text,
    b_distale text,
    b_biseau text,
    b_bord text,
    b_meplat text,
    b_extension text,
    b_symetrie text,
    b_facture text,
    b_bilaterale text,
    b_bifaciale text,
    b_arete text,
    b_retouche text,
    b_lar1 integer,
    b_lar2 integer,
    b_lar3 integer,
    b_long1 integer,
    b_l1a integer,
    b_long2 integer,
    b_long3 integer,
    b_lar4 integer,
    b_l5 integer,
    b_e1 integer,
    b_e2 integer,
    b_poids integer,
    b_ind1 real,
    b_ind2 real,
    b_ind3 real,
    b_ind4 real,
    b_ind5 real,
    b_ind6 real,
    b_ind7 real,
    b_ind8 real,
    b_ind9 real,
    b_ind10 real,
    b_ind11 real,
    b_ind12 real,
    b_ind13 real,
    b_ind14 real,
    b_ind15 real,
    b_ind16 real,
    b_bc integer,
    b_nt integer,
    b_dat1 text,
    b_dat2 text,
    b_dat text,
    b_bd1 integer,
    b_be1 integer,
    b_bd2 integer,
    b_be2 integer,
    b_1t integer,
    b_2t integer,
    b_bde1 integer,
    b_bde2 integer,
    b_bdet integer,
    b_ent integer,
    b_bf text,
    b_te integer,
    b_bh1 integer,
    b_bh2 integer,
    b_bht integer,
    b_bi1 integer,
    b_bi2 integer,
    b_bit integer,
    b_bj1 integer,
    b_bj2 integer,
    b_bj integer,
    b_bk1 integer,
    b_bk2 integer,
    b_bk integer,
    b_bna integer,
    b_bnb integer,
    b_bla integer,
    b_blb integer,
    b_bla1 integer,
    b_blb1 integer,
    b_bl1 integer,
    b_bla2 integer,
    b_blb2 integer,
    b_bl2 integer,
    b_bo1a integer,
    b_bo1b integer,
    b_bo2a integer,
    b_bo2b integer,
    b_bo integer,
    b_p1 integer,
    b_p2 integer,
    b_bp1 integer,
    b_bp2 integer,
    b_bq1 integer,
    b_bq2 integer,
    b_bq1a integer,
    b_bq2a integer,
    b_br1 integer,
    b_br2 integer,
    b_bv integer,
    b_bx integer,
    b_by integer,
    b_bep integer,
    b_bu1 integer,
    b_bu2 integer,
    b_bu integer,
    b_bu1a integer,
    b_bu2a integer,
    b_ua integer,
    b_bg text,
    b_ntf text,
    b_bo1 integer,
    b_bo2 integer,
    b_support text,
    b_bo3 integer,
    b_bua integer,
    b_bo3b integer,
    b_bo3a integer,
    b_lar5 integer
);


ALTER TABLE public.biface OWNER TO postgres;

--
-- Name: bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bord (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    b_ordre integer NOT NULL,
    b_extremite text,
    b_code text,
    b_amincissement text,
    b_localisation text
);


ALTER TABLE public.bord OWNER TO postgres;

--
-- Name: carnet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carnet (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    locus text,
    localite text,
    carre text,
    souscarre text,
    ensemble text,
    niveau text,
    sol text,
    couche text,
    foyer text,
    nature text,
    nofouille integer,
    nomusee integer,
    nosopi integer,
    x integer,
    y integer,
    zrelatif real,
    zreference real,
    zabsolu real,
    orientation text,
    pendage text,
    vers text,
    longueur integer,
    largeur integer,
    epaisseur integer,
    trouve date,
    saisie date DEFAULT date('now'::text),
    latitude text,
    longitude text,
    responsable_fouille text
);


ALTER TABLE public.carnet OWNER TO postgres;

--
-- Name: controle_b_amenagement_bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_amenagement_bord (
    b_amenagement_bord text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_amenagement_bord OWNER TO postgres;

--
-- Name: controle_b_amenagement_distal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_amenagement_distal (
    b_amenagement_distal text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_amenagement_distal OWNER TO postgres;

--
-- Name: controle_b_amincissement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_amincissement (
    b_amincissement text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_amincissement OWNER TO postgres;

--
-- Name: controle_b_arete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_arete (
    b_arete text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_arete OWNER TO postgres;

--
-- Name: controle_b_base; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_base (
    b_base text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_base OWNER TO postgres;

--
-- Name: controle_b_bifaciale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_bifaciale (
    b_bifaciale text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_bifaciale OWNER TO postgres;

--
-- Name: controle_b_bilaterale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_bilaterale (
    b_bilaterale text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_bilaterale OWNER TO postgres;

--
-- Name: controle_b_biseau; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_biseau (
    b_biseau text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_biseau OWNER TO postgres;

--
-- Name: controle_b_bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_bord (
    b_bord text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_bord OWNER TO postgres;

--
-- Name: controle_b_code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_code (
    b_code text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_code OWNER TO postgres;

--
-- Name: controle_b_dat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_dat (
    b_dat text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_dat OWNER TO postgres;

--
-- Name: controle_b_dat1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_dat1 (
    b_dat1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_dat1 OWNER TO postgres;

--
-- Name: controle_b_dat2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_dat2 (
    b_dat2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_dat2 OWNER TO postgres;

--
-- Name: controle_b_distale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_distale (
    b_distale text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_distale OWNER TO postgres;

--
-- Name: controle_b_enlevement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_enlevement (
    b_enlevement text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_enlevement OWNER TO postgres;

--
-- Name: controle_b_extension; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_extension (
    b_extension text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_extension OWNER TO postgres;

--
-- Name: controle_b_extremite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_extremite (
    b_extremite text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_extremite OWNER TO postgres;

--
-- Name: controle_b_facture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_facture (
    b_facture text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_facture OWNER TO postgres;

--
-- Name: controle_b_meplat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_meplat (
    b_meplat text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_meplat OWNER TO postgres;

--
-- Name: controle_b_retouche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_retouche (
    b_retouche text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_retouche OWNER TO postgres;

--
-- Name: controle_b_support; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_support (
    b_support text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_support OWNER TO postgres;

--
-- Name: controle_b_surface; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_surface (
    b_surface text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_surface OWNER TO postgres;

--
-- Name: controle_b_symetrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_symetrie (
    b_symetrie text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_symetrie OWNER TO postgres;

--
-- Name: controle_b_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_b_type (
    b_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_b_type OWNER TO postgres;

--
-- Name: controle_bis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_bis (
    bis text NOT NULL,
    description text
);


ALTER TABLE public.controle_bis OWNER TO postgres;

--
-- Name: controle_c_alteration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_alteration (
    c_alteration text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_alteration OWNER TO postgres;

--
-- Name: controle_c_altnat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_altnat (
    c_altnat text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_altnat OWNER TO postgres;

--
-- Name: controle_c_autre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_autre (
    c_autre text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_autre OWNER TO postgres;

--
-- Name: controle_c_consistance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_consistance (
    c_consistance text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_consistance OWNER TO postgres;

--
-- Name: controle_c_couleur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_couleur (
    c_couleur text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_couleur OWNER TO postgres;

--
-- Name: controle_c_element; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_element (
    c_element text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_element OWNER TO postgres;

--
-- Name: controle_c_ext1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_ext1 (
    c_ext1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_ext1 OWNER TO postgres;

--
-- Name: controle_c_ext2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_ext2 (
    c_ext2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_ext2 OWNER TO postgres;

--
-- Name: controle_c_extremite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_extremite (
    c_extremite text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_extremite OWNER TO postgres;

--
-- Name: controle_c_famille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_famille (
    c_famille text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_famille OWNER TO postgres;

--
-- Name: controle_c_forme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_forme (
    c_forme text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_forme OWNER TO postgres;

--
-- Name: controle_c_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_genre (
    c_genre text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_genre OWNER TO postgres;

--
-- Name: controle_c_granulometrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_granulometrie (
    c_granulometrie text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_granulometrie OWNER TO postgres;

--
-- Name: controle_c_incl1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_incl1 (
    c_incl1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_incl1 OWNER TO postgres;

--
-- Name: controle_c_incl2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_incl2 (
    c_incl2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_incl2 OWNER TO postgres;

--
-- Name: controle_c_incl3; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_incl3 (
    c_incl3 text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_incl3 OWNER TO postgres;

--
-- Name: controle_c_inclusion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_inclusion (
    c_inclusion text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_inclusion OWNER TO postgres;

--
-- Name: controle_c_lame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_lame (
    c_lame text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_lame OWNER TO postgres;

--
-- Name: controle_c_liant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_liant (
    c_liant text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_liant OWNER TO postgres;

--
-- Name: controle_c_macroreste; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_macroreste (
    c_macroreste text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_macroreste OWNER TO postgres;

--
-- Name: controle_c_mif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_mif (
    c_mif text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_mif OWNER TO postgres;

--
-- Name: controle_c_motcou; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_motcou (
    c_motcou text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_motcou OWNER TO postgres;

--
-- Name: controle_c_motif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_motif (
    c_motif text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_motif OWNER TO postgres;

--
-- Name: controle_c_motnat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_motnat (
    c_motnat text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_motnat OWNER TO postgres;

--
-- Name: controle_c_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_ordre (
    c_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_ordre OWNER TO postgres;

--
-- Name: controle_c_palyno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_palyno (
    c_palyno text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_palyno OWNER TO postgres;

--
-- Name: controle_c_parasito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_parasito (
    c_parasito text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_parasito OWNER TO postgres;

--
-- Name: controle_c_retrecissement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_retrecissement (
    c_retrecissement text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_retrecissement OWNER TO postgres;

--
-- Name: controle_c_sediment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_sediment (
    c_sediment text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_sediment OWNER TO postgres;

--
-- Name: controle_c_vol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_vol (
    c_vol text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_vol OWNER TO postgres;

--
-- Name: controle_c_volext; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_c_volext (
    c_volext text NOT NULL,
    description text
);


ALTER TABLE public.controle_c_volext OWNER TO postgres;

--
-- Name: controle_carre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_carre (
    carre text NOT NULL,
    description text
);


ALTER TABLE public.controle_carre OWNER TO postgres;

--
-- Name: controle_d_serie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_d_serie (
    d_serie text NOT NULL,
    description text
);


ALTER TABLE public.controle_d_serie OWNER TO postgres;

--
-- Name: controle_d_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_d_type (
    d_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_d_type OWNER TO postgres;

--
-- Name: controle_e_bulbe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_bulbe (
    e_bulbe text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_bulbe OWNER TO postgres;

--
-- Name: controle_e_carene; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_carene (
    e_carene text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_carene OWNER TO postgres;

--
-- Name: controle_e_charniere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_charniere (
    e_charniere text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_charniere OWNER TO postgres;

--
-- Name: controle_e_code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_code (
    e_code text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_code OWNER TO postgres;

--
-- Name: controle_e_cone; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_cone (
    e_cone text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_cone OWNER TO postgres;

--
-- Name: controle_e_contour; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_contour (
    e_contour text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_contour OWNER TO postgres;

--
-- Name: controle_e_debitage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_debitage (
    e_debitage text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_debitage OWNER TO postgres;

--
-- Name: controle_e_enlevement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_enlevement (
    e_enlevement text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_enlevement OWNER TO postgres;

--
-- Name: controle_e_epi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_epi (
    e_epi text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_epi OWNER TO postgres;

--
-- Name: controle_e_onde; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_onde (
    e_onde text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_onde OWNER TO postgres;

--
-- Name: controle_e_parasite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_parasite (
    e_parasite text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_parasite OWNER TO postgres;

--
-- Name: controle_e_secondaire; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_secondaire (
    e_secondaire text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_secondaire OWNER TO postgres;

--
-- Name: controle_e_section_long; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_section_long (
    e_section_long text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_section_long OWNER TO postgres;

--
-- Name: controle_e_section_trans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_section_trans (
    e_section_trans text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_section_trans OWNER TO postgres;

--
-- Name: controle_e_strie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_strie (
    e_strie text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_strie OWNER TO postgres;

--
-- Name: controle_e_talon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_talon (
    e_talon text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_talon OWNER TO postgres;

--
-- Name: controle_e_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_e_type (
    e_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_e_type OWNER TO postgres;

--
-- Name: controle_eg_element; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_element (
    eg_element text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_element OWNER TO postgres;

--
-- Name: controle_eg_epaisseur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_epaisseur (
    eg_epaisseur text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_epaisseur OWNER TO postgres;

--
-- Name: controle_eg_extremite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_extremite (
    eg_extremite text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_extremite OWNER TO postgres;

--
-- Name: controle_eg_longueur_generale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_longueur_generale (
    eg_longueur_generale text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_longueur_generale OWNER TO postgres;

--
-- Name: controle_eg_proeminence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_proeminence (
    eg_proeminence text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_proeminence OWNER TO postgres;

--
-- Name: controle_eg_profil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_profil (
    eg_profil text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_profil OWNER TO postgres;

--
-- Name: controle_eg_profondeur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_profondeur (
    eg_profondeur text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_profondeur OWNER TO postgres;

--
-- Name: controle_eg_sens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_sens (
    eg_sens text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_sens OWNER TO postgres;

--
-- Name: controle_eg_situation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_situation (
    eg_situation text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_situation OWNER TO postgres;

--
-- Name: controle_eg_support; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_eg_support (
    eg_support text NOT NULL,
    description text
);


ALTER TABLE public.controle_eg_support OWNER TO postgres;

--
-- Name: controle_en_direction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_direction (
    en_direction text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_direction OWNER TO postgres;

--
-- Name: controle_en_dptimpact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_dptimpact (
    en_dptimpact text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_dptimpact OWNER TO postgres;

--
-- Name: controle_en_frappe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_frappe (
    en_frappe text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_frappe OWNER TO postgres;

--
-- Name: controle_en_inclinaison; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_inclinaison (
    en_inclinaison text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_inclinaison OWNER TO postgres;

--
-- Name: controle_en_obliquite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_obliquite (
    en_obliquite text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_obliquite OWNER TO postgres;

--
-- Name: controle_en_profondeur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_en_profondeur (
    en_profondeur text NOT NULL,
    description text
);


ALTER TABLE public.controle_en_profondeur OWNER TO postgres;

--
-- Name: controle_ensemble; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ensemble (
    ensemble text NOT NULL,
    description text
);


ALTER TABLE public.controle_ensemble OWNER TO postgres;

--
-- Name: controle_f_affespece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_affespece (
    f_affespece text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_affespece OWNER TO postgres;

--
-- Name: controle_f_affgenre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_affgenre (
    f_affgenre text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_affgenre OWNER TO postgres;

--
-- Name: controle_f_agecl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_agecl (
    f_agecl text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_agecl OWNER TO postgres;

--
-- Name: controle_f_agent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_agent (
    f_agent text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_agent OWNER TO postgres;

--
-- Name: controle_f_agest; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_agest (
    f_agest text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_agest OWNER TO postgres;

--
-- Name: controle_f_ancien_oss; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_ancien_oss (
    f_ancien_oss text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_ancien_oss OWNER TO postgres;

--
-- Name: controle_f_association; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_association (
    f_association text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_association OWNER TO postgres;

--
-- Name: controle_f_calcouleur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_calcouleur (
    f_calcouleur text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_calcouleur OWNER TO postgres;

--
-- Name: controle_f_caltype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_caltype (
    f_caltype text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_caltype OWNER TO postgres;

--
-- Name: controle_f_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_classe (
    f_classe text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_classe OWNER TO postgres;

--
-- Name: controle_f_complement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_complement (
    f_complement text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_complement OWNER TO postgres;

--
-- Name: controle_f_composite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_composite (
    f_composite text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_composite OWNER TO postgres;

--
-- Name: controle_f_concretion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_concretion (
    f_concretion text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_concretion OWNER TO postgres;

--
-- Name: controle_f_conservation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_conservation (
    f_conservation text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_conservation OWNER TO postgres;

--
-- Name: controle_f_coprolithe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_coprolithe (
    f_coprolithe text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_coprolithe OWNER TO postgres;

--
-- Name: controle_f_coraspect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_coraspect (
    f_coraspect text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_coraspect OWNER TO postgres;

--
-- Name: controle_f_corfissure; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_corfissure (
    f_corfissure text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_corfissure OWNER TO postgres;

--
-- Name: controle_f_couleur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_couleur (
    f_couleur text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_couleur OWNER TO postgres;

--
-- Name: controle_f_datation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_datation (
    f_datation text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_datation OWNER TO postgres;

--
-- Name: controle_f_description; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_description (
    f_description text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_description OWNER TO postgres;

--
-- Name: controle_f_dessin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_dessin (
    f_dessin text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_dessin OWNER TO postgres;

--
-- Name: controle_f_eclat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_eclat (
    f_eclat text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_eclat OWNER TO postgres;

--
-- Name: controle_f_espece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_espece (
    f_espece text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_espece OWNER TO postgres;

--
-- Name: controle_f_famille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_famille (
    f_famille text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_famille OWNER TO postgres;

--
-- Name: controle_f_fossilisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_fossilisation (
    f_fossilisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_fossilisation OWNER TO postgres;

--
-- Name: controle_f_fragde; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_fragde (
    f_fragde text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_fragde OWNER TO postgres;

--
-- Name: controle_f_fragge; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_fragge (
    f_fragge text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_fragge OWNER TO postgres;

--
-- Name: controle_f_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_genre (
    f_genre text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_genre OWNER TO postgres;

--
-- Name: controle_f_icirconference; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_icirconference (
    f_icirconference text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_icirconference OWNER TO postgres;

--
-- Name: controle_f_ilongueur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_ilongueur (
    f_ilongueur text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_ilongueur OWNER TO postgres;

--
-- Name: controle_f_lateralite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_lateralite (
    f_lateralite text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_lateralite OWNER TO postgres;

--
-- Name: controle_f_mode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_mode (
    f_mode text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_mode OWNER TO postgres;

--
-- Name: controle_f_moulage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_moulage (
    f_moulage text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_moulage OWNER TO postgres;

--
-- Name: controle_f_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_ordre (
    f_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_ordre OWNER TO postgres;

--
-- Name: controle_f_oxyde; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_oxyde (
    f_oxyde text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_oxyde OWNER TO postgres;

--
-- Name: controle_f_pathologie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_pathologie (
    f_pathologie text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_pathologie OWNER TO postgres;

--
-- Name: controle_f_pelote; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_pelote (
    f_pelote text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_pelote OWNER TO postgres;

--
-- Name: controle_f_percussion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_percussion (
    f_percussion text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_percussion OWNER TO postgres;

--
-- Name: controle_f_photo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_photo (
    f_photo text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_photo OWNER TO postgres;

--
-- Name: controle_f_reference; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_reference (
    f_reference text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_reference OWNER TO postgres;

--
-- Name: controle_f_responsable; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_responsable (
    f_responsable text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_responsable OWNER TO postgres;

--
-- Name: controle_f_restauration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_restauration (
    f_restauration text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_restauration OWNER TO postgres;

--
-- Name: controle_f_saisie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_saisie (
    f_saisie text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_saisie OWNER TO postgres;

--
-- Name: controle_f_sauvefrag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_sauvefrag (
    f_sauvefrag text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_sauvefrag OWNER TO postgres;

--
-- Name: controle_f_sexe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_sexe (
    f_sexe text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_sexe OWNER TO postgres;

--
-- Name: controle_f_ssespece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_ssespece (
    f_ssespece text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_ssespece OWNER TO postgres;

--
-- Name: controle_f_ssfamille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_ssfamille (
    f_ssfamille text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_ssfamille OWNER TO postgres;

--
-- Name: controle_f_stdent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_stdent (
    f_stdent text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_stdent OWNER TO postgres;

--
-- Name: controle_f_stserie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_stserie (
    f_stserie text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_stserie OWNER TO postgres;

--
-- Name: controle_f_taille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_taille (
    f_taille text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_taille OWNER TO postgres;

--
-- Name: controle_f_tissu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_tissu (
    f_tissu text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_tissu OWNER TO postgres;

--
-- Name: controle_f_traitement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_traitement (
    f_traitement text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_traitement OWNER TO postgres;

--
-- Name: controle_f_tranchant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_tranchant (
    f_tranchant text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_tranchant OWNER TO postgres;

--
-- Name: controle_f_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_type (
    f_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_type OWNER TO postgres;

--
-- Name: controle_f_typedos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typedos (
    f_typedos text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typedos OWNER TO postgres;

--
-- Name: controle_f_typos1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos1 (
    f_typos1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos1 OWNER TO postgres;

--
-- Name: controle_f_typos2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos2 (
    f_typos2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos2 OWNER TO postgres;

--
-- Name: controle_f_typos3; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos3 (
    f_typos3 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos3 OWNER TO postgres;

--
-- Name: controle_f_typos4; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos4 (
    f_typos4 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos4 OWNER TO postgres;

--
-- Name: controle_f_typos5; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos5 (
    f_typos5 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos5 OWNER TO postgres;

--
-- Name: controle_f_typos6; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_f_typos6 (
    f_typos6 text NOT NULL,
    description text
);


ALTER TABLE public.controle_f_typos6 OWNER TO postgres;

--
-- Name: controle_ff_angle1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_angle1 (
    ff_angle1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_angle1 OWNER TO postgres;

--
-- Name: controle_ff_angle2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_angle2 (
    ff_angle2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_angle2 OWNER TO postgres;

--
-- Name: controle_ff_aspect1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_aspect1 (
    ff_aspect1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_aspect1 OWNER TO postgres;

--
-- Name: controle_ff_aspect2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_aspect2 (
    ff_aspect2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_aspect2 OWNER TO postgres;

--
-- Name: controle_ff_localisation1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_localisation1 (
    ff_localisation1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_localisation1 OWNER TO postgres;

--
-- Name: controle_ff_localisation2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_localisation2 (
    ff_localisation2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_localisation2 OWNER TO postgres;

--
-- Name: controle_ff_morphologie1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_morphologie1 (
    ff_morphologie1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_morphologie1 OWNER TO postgres;

--
-- Name: controle_ff_morphologie2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_morphologie2 (
    ff_morphologie2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_morphologie2 OWNER TO postgres;

--
-- Name: controle_ff_non1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_non1 (
    ff_non1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_non1 OWNER TO postgres;

--
-- Name: controle_ff_non2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_non2 (
    ff_non2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_non2 OWNER TO postgres;

--
-- Name: controle_ff_profil1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_profil1 (
    ff_profil1 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_profil1 OWNER TO postgres;

--
-- Name: controle_ff_profil2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ff_profil2 (
    ff_profil2 text NOT NULL,
    description text
);


ALTER TABLE public.controle_ff_profil2 OWNER TO postgres;

--
-- Name: controle_fi_mode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_fi_mode (
    fi_mode text NOT NULL,
    description text
);


ALTER TABLE public.controle_fi_mode OWNER TO postgres;

--
-- Name: controle_fi_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_fi_ordre (
    fi_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_fi_ordre OWNER TO postgres;

--
-- Name: controle_fi_percussion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_fi_percussion (
    fi_percussion text NOT NULL,
    description text
);


ALTER TABLE public.controle_fi_percussion OWNER TO postgres;

--
-- Name: controle_fi_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_fi_type (
    fi_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_fi_type OWNER TO postgres;

--
-- Name: controle_ga_arete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_arete (
    ga_arete text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_arete OWNER TO postgres;

--
-- Name: controle_ga_chf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_chf (
    ga_chf text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_chf OWNER TO postgres;

--
-- Name: controle_ga_facture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_facture (
    ga_facture text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_facture OWNER TO postgres;

--
-- Name: controle_ga_forme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_forme (
    ga_forme text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_forme OWNER TO postgres;

--
-- Name: controle_ga_obliquite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_obliquite (
    ga_obliquite text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_obliquite OWNER TO postgres;

--
-- Name: controle_ga_orientation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_orientation (
    ga_orientation text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_orientation OWNER TO postgres;

--
-- Name: controle_ga_qualite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_qualite (
    ga_qualite text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_qualite OWNER TO postgres;

--
-- Name: controle_ga_retouche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_retouche (
    ga_retouche text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_retouche OWNER TO postgres;

--
-- Name: controle_ga_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ga_type (
    ga_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_ga_type OWNER TO postgres;

--
-- Name: controle_h_amenagement_bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_amenagement_bord (
    h_amenagement_bord text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_amenagement_bord OWNER TO postgres;

--
-- Name: controle_h_amenagement_distal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_amenagement_distal (
    amenagement_h_distal text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_amenagement_distal OWNER TO postgres;

--
-- Name: controle_h_arete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_arete (
    h_arete text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_arete OWNER TO postgres;

--
-- Name: controle_h_base; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_base (
    h_base text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_base OWNER TO postgres;

--
-- Name: controle_h_bilaterale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_bilaterale (
    h_bilaterale text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_bilaterale OWNER TO postgres;

--
-- Name: controle_h_biseau; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_biseau (
    h_biseau text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_biseau OWNER TO postgres;

--
-- Name: controle_h_bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_bord (
    h_bord text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_bord OWNER TO postgres;

--
-- Name: controle_h_distale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_distale (
    h_distale text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_distale OWNER TO postgres;

--
-- Name: controle_h_extension; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_extension (
    h_extension text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_extension OWNER TO postgres;

--
-- Name: controle_h_facture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_facture (
    h_facture text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_facture OWNER TO postgres;

--
-- Name: controle_h_meplat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_meplat (
    h_meplat text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_meplat OWNER TO postgres;

--
-- Name: controle_h_retouche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_retouche (
    h_retouche text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_retouche OWNER TO postgres;

--
-- Name: controle_h_surface; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_surface (
    h_surface text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_surface OWNER TO postgres;

--
-- Name: controle_h_symetrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_h_symetrie (
    h_symetrie text NOT NULL,
    description text
);


ALTER TABLE public.controle_h_symetrie OWNER TO postgres;

--
-- Name: controle_i_action; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_action (
    i_action text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_action OWNER TO postgres;

--
-- Name: controle_i_alteration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_alteration (
    i_alteration text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_alteration OWNER TO postgres;

--
-- Name: controle_i_desilicification; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_desilicification (
    i_desilicification text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_desilicification OWNER TO postgres;

--
-- Name: controle_i_dpatine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_dpatine (
    i_dpatine text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_dpatine OWNER TO postgres;

--
-- Name: controle_i_encroutement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_encroutement (
    i_encroutement text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_encroutement OWNER TO postgres;

--
-- Name: controle_i_eolisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_eolisation (
    i_eolisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_eolisation OWNER TO postgres;

--
-- Name: controle_i_forme_galet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_forme_galet (
    i_forme_galet text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_forme_galet OWNER TO postgres;

--
-- Name: controle_i_lustrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_lustrage (
    i_lustrage text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_lustrage OWNER TO postgres;

--
-- Name: controle_i_matiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_matiere (
    i_matiere text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_matiere OWNER TO postgres;

--
-- Name: controle_i_objet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_objet (
    i_objet text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_objet OWNER TO postgres;

--
-- Name: controle_i_patine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_patine (
    i_patine text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_patine OWNER TO postgres;

--
-- Name: controle_i_pmycellium; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_pmycellium (
    i_pmycellium text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_pmycellium OWNER TO postgres;

--
-- Name: controle_i_roulage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_roulage (
    i_roulage text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_roulage OWNER TO postgres;

--
-- Name: controle_i_support; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_support (
    i_support text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_support OWNER TO postgres;

--
-- Name: controle_i_support_originel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_support_originel (
    i_support_originel text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_support_originel OWNER TO postgres;

--
-- Name: controle_localite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_localite (
    localite text NOT NULL,
    description text
);


ALTER TABLE public.controle_localite OWNER TO postgres;

--
-- Name: controle_locus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_locus (
    locus text NOT NULL,
    description text
);


ALTER TABLE public.controle_locus OWNER TO postgres;

--
-- Name: controle_mf_serie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_mf_serie (
    mf_serie text NOT NULL,
    description text
);


ALTER TABLE public.controle_mf_serie OWNER TO postgres;

--
-- Name: controle_mf_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_mf_type (
    mf_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_mf_type OWNER TO postgres;

--
-- Name: controle_n_cortotal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_n_cortotal (
    n_cortotal integer NOT NULL,
    description text
);


ALTER TABLE public.controle_n_cortotal OWNER TO postgres;

--
-- Name: controle_n_epuisement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_n_epuisement (
    n_epuisement integer NOT NULL,
    descripion text
);


ALTER TABLE public.controle_n_epuisement OWNER TO postgres;

--
-- Name: controle_n_forme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_n_forme (
    n_forme text NOT NULL,
    description text
);


ALTER TABLE public.controle_n_forme OWNER TO postgres;

--
-- Name: controle_n_orientation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_n_orientation (
    n_orientation text NOT NULL,
    description text
);


ALTER TABLE public.controle_n_orientation OWNER TO postgres;

--
-- Name: controle_n_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_n_type (
    n_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_n_type OWNER TO postgres;

--
-- Name: controle_nature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_nature (
    nature text NOT NULL,
    description text
);


ALTER TABLE public.controle_nature OWNER TO postgres;

--
-- Name: controle_niveau; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_niveau (
    niveau text NOT NULL,
    description text
);


ALTER TABLE public.controle_niveau OWNER TO postgres;

--
-- Name: controle_o_chronologie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_chronologie (
    o_chronologie text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_chronologie OWNER TO postgres;

--
-- Name: controle_o_code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_code (
    o_code text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_code OWNER TO postgres;

--
-- Name: controle_o_destination; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_destination (
    o_destination text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_destination OWNER TO postgres;

--
-- Name: controle_o_etat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_etat (
    o_etat text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_etat OWNER TO postgres;

--
-- Name: controle_o_forme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_forme (
    o_forme text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_forme OWNER TO postgres;

--
-- Name: controle_o_localisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_localisation (
    o_localisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_localisation OWNER TO postgres;

--
-- Name: controle_o_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_ordre (
    o_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_ordre OWNER TO postgres;

--
-- Name: controle_o_orientation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_orientation (
    o_orientation text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_orientation OWNER TO postgres;

--
-- Name: controle_o_origine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_origine (
    o_origine text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_origine OWNER TO postgres;

--
-- Name: controle_o_retouche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_retouche (
    o_retouche text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_retouche OWNER TO postgres;

--
-- Name: controle_o_sens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_sens (
    o_sens text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_sens OWNER TO postgres;

--
-- Name: controle_o_serie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_o_serie (
    o_serie text NOT NULL,
    description text
);


ALTER TABLE public.controle_o_serie OWNER TO postgres;

--
-- Name: controle_orientation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_orientation (
    orientation text NOT NULL,
    description text
);


ALTER TABLE public.controle_orientation OWNER TO postgres;

--
-- Name: controle_pendage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_pendage (
    pendage text NOT NULL,
    description text
);


ALTER TABLE public.controle_pendage OWNER TO postgres;

--
-- Name: controle_r_association; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_association (
    r_association text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_association OWNER TO postgres;

--
-- Name: controle_r_bord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_bord (
    r_bord text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_bord OWNER TO postgres;

--
-- Name: controle_r_cas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_cas (
    r_cas text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_cas OWNER TO postgres;

--
-- Name: controle_r_denticulation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_denticulation (
    r_denticulation text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_denticulation OWNER TO postgres;

--
-- Name: controle_r_destination; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_destination (
    r_destination text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_destination OWNER TO postgres;

--
-- Name: controle_r_dimension; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_dimension (
    r_dimension text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_dimension OWNER TO postgres;

--
-- Name: controle_r_ecrasement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_ecrasement (
    r_ecrasement text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_ecrasement OWNER TO postgres;

--
-- Name: controle_r_extremite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_extremite (
    r_extremite text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_extremite OWNER TO postgres;

--
-- Name: controle_r_frequence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_frequence (
    r_frequence text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_frequence OWNER TO postgres;

--
-- Name: controle_r_lustrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_lustrage (
    r_lustrage text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_lustrage OWNER TO postgres;

--
-- Name: controle_r_obliquite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_obliquite (
    r_obliquite text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_obliquite OWNER TO postgres;

--
-- Name: controle_r_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_ordre (
    r_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_ordre OWNER TO postgres;

--
-- Name: controle_r_origine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_origine (
    r_origine text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_origine OWNER TO postgres;

--
-- Name: controle_r_sens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_sens (
    r_sens text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_sens OWNER TO postgres;

--
-- Name: controle_r_strie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_strie (
    r_strie text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_strie OWNER TO postgres;

--
-- Name: controle_r_superposition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_superposition (
    r_superposition text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_superposition OWNER TO postgres;

--
-- Name: controle_r_tranchant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_tranchant (
    r_tranchant text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_tranchant OWNER TO postgres;

--
-- Name: controle_r_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_type (
    r_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_type OWNER TO postgres;

--
-- Name: controle_r_utilisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_r_utilisation (
    r_utilisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_r_utilisation OWNER TO postgres;

--
-- Name: controle_responsable_fouille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_responsable_fouille (
    responsable_fouille text NOT NULL,
    description text
);


ALTER TABLE public.controle_responsable_fouille OWNER TO postgres;

--
-- Name: controle_s_localisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_localisation (
    s_localisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_localisation OWNER TO postgres;

--
-- Name: controle_s_lustrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_lustrage (
    s_lustrage text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_lustrage OWNER TO postgres;

--
-- Name: controle_s_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_ordre (
    s_ordre text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_ordre OWNER TO postgres;

--
-- Name: controle_s_polissage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_polissage (
    s_polissage text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_polissage OWNER TO postgres;

--
-- Name: controle_s_relation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_relation (
    s_relation text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_relation OWNER TO postgres;

--
-- Name: controle_s_situation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_situation (
    s_situation text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_situation OWNER TO postgres;

--
-- Name: controle_s_sous_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_sous_type (
    s_sous_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_sous_type OWNER TO postgres;

--
-- Name: controle_s_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_s_type (
    s_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_s_type OWNER TO postgres;

--
-- Name: controle_sol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_sol (
    sol text NOT NULL,
    description text
);


ALTER TABLE public.controle_sol OWNER TO postgres;

--
-- Name: controle_souscarre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_souscarre (
    souscarre text NOT NULL,
    description text
);


ALTER TABLE public.controle_souscarre OWNER TO postgres;

--
-- Name: controle_t_agent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_agent (
    t_agent text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_agent OWNER TO postgres;

--
-- Name: controle_t_allure; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_allure (
    t_allure text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_allure OWNER TO postgres;

--
-- Name: controle_t_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_classe (
    t_classe text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_classe OWNER TO postgres;

--
-- Name: controle_t_dessin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_dessin (
    t_dessin text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_dessin OWNER TO postgres;

--
-- Name: controle_t_direction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_direction (
    t_direction text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_direction OWNER TO postgres;

--
-- Name: controle_t_dstrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_dstrie (
    t_dstrie text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_dstrie OWNER TO postgres;

--
-- Name: controle_t_ensemble; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_ensemble (
    t_ensemble text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_ensemble OWNER TO postgres;

--
-- Name: controle_t_largeur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_largeur (
    t_largeur text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_largeur OWNER TO postgres;

--
-- Name: controle_t_locmusc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_locmusc (
    t_locmusc text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_locmusc OWNER TO postgres;

--
-- Name: controle_t_nature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_nature (
    t_nature text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_nature OWNER TO postgres;

--
-- Name: controle_t_phenomene; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_phenomene (
    t_phenomene text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_phenomene OWNER TO postgres;

--
-- Name: controle_t_photo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_photo (
    t_photo text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_photo OWNER TO postgres;

--
-- Name: controle_t_profondeur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_profondeur (
    t_profondeur text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_profondeur OWNER TO postgres;

--
-- Name: controle_t_replique; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_replique (
    t_replique text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_replique OWNER TO postgres;

--
-- Name: controle_t_section; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_section (
    t_section text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_section OWNER TO postgres;

--
-- Name: controle_t_sens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_sens (
    t_sens text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_sens OWNER TO postgres;

--
-- Name: controle_t_trace; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_t_trace (
    t_trace text NOT NULL,
    description text
);


ALTER TABLE public.controle_t_trace OWNER TO postgres;

--
-- Name: controle_ud_fragmentation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ud_fragmentation (
    ud_fragmentation text NOT NULL,
    description text
);


ALTER TABLE public.controle_ud_fragmentation OWNER TO postgres;

--
-- Name: controle_ud_lateralite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ud_lateralite (
    ud_lateralite text NOT NULL,
    description text
);


ALTER TABLE public.controle_ud_lateralite OWNER TO postgres;

--
-- Name: controle_ud_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ud_type (
    ud_type text NOT NULL,
    description text
);


ALTER TABLE public.controle_ud_type OWNER TO postgres;

--
-- Name: controle_ud_usure; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_ud_usure (
    ud_usure text NOT NULL,
    description text
);


ALTER TABLE public.controle_ud_usure OWNER TO postgres;

--
-- Name: controle_vers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_vers (
    vers text NOT NULL,
    description text
);


ALTER TABLE public.controle_vers OWNER TO postgres;

--
-- Name: controle_zone; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_zone (
    "zone" text NOT NULL,
    description text
);


ALTER TABLE public.controle_zone OWNER TO postgres;

--
-- Name: controlec__forme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controlec__forme (
    c_forme text NOT NULL,
    description text
);


ALTER TABLE public.controlec__forme OWNER TO postgres;

--
-- Name: coprolithe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE coprolithe (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    c_association integer,
    c_fragmentation text,
    c_sediment text,
    c_couleur text,
    c_motif text,
    c_motnat text,
    c_motcou text,
    c_forme text,
    c_vol text,
    c_volext text,
    c_retrecissement text,
    c_nombre integer,
    c_extremite text,
    c_ext1 text,
    c_ext2 text,
    c_alteration text,
    c_altnat text,
    c_inclusion text,
    c_incl1 text,
    c_incl2 text,
    c_incl3 text,
    c_element text,
    c_granulometrie text,
    c_liant text,
    c_consistance text,
    c_ordre text,
    c_famille text,
    c_genre text,
    c_parasito text,
    c_palyno text,
    c_lame text,
    c_autre text,
    c_mif text,
    c_macroreste text,
    c_longueur integer,
    c_largeur integer,
    c_epaisseur integer,
    c_poids integer
);


ALTER TABLE public.coprolithe OWNER TO postgres;

--
-- Name: dent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dent (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    d_serie text NOT NULL,
    d_type text NOT NULL,
    d_m1 integer,
    d_m2 integer,
    d_m3 integer,
    d_m4 integer,
    d_m5 integer,
    d_m6 integer,
    d_m7 integer,
    d_m8 integer,
    d_m9 integer,
    d_m10 integer,
    d_m11 integer,
    d_m12 integer,
    d_m13 integer,
    d_m14 integer,
    d_m15 integer,
    d_m16 integer,
    d_m17 integer,
    d_m18 integer,
    d_m19 integer,
    d_m20 integer,
    d_m21 integer,
    d_m22 integer,
    d_m23 integer,
    d_m24 integer,
    d_m25 integer,
    d_m26 integer,
    d_m27 integer,
    d_m28 integer,
    d_m29 integer,
    d_m30 integer
);


ALTER TABLE public.dent OWNER TO postgres;

--
-- Name: eclat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eclat (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    e_code text,
    e_debitage text,
    e_section_long text,
    e_section_trans text,
    e_contour text,
    e_enlevement text,
    e_bulbe text,
    e_talon text,
    e_cone text,
    e_onde text,
    e_epi text,
    e_strie text,
    e_parasite text,
    e_secondaire text,
    e_charniere text,
    e_carene text,
    e_type text,
    e_longm integer,
    e_largm integer,
    e_fa integer,
    e_fb integer,
    e_fc integer,
    e_fd integer,
    e_fe integer,
    e_ff integer,
    e_ta integer,
    e_tb integer,
    e_tc integer,
    e_td integer,
    e_te integer,
    e_tf integer,
    e_tg integer,
    e_thc integer,
    e_ti integer
);


ALTER TABLE public.eclat OWNER TO postgres;

--
-- Name: enlevement_biface; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enlevement_biface (
    bis text NOT NULL,
    "zone" text NOT NULL,
    numero integer NOT NULL,
    eb_rang text NOT NULL,
    eb_longueur integer,
    eb_largeur integer,
    eb_obliquite integer,
    eb_corde integer,
    eb_fleche integer,
    old_eb_tranche integer,
    eb_tranche text
);


ALTER TABLE public.enlevement_biface OWNER TO postgres;

--
-- Name: enlevement_galet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enlevement_galet (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    ga_ordre integer NOT NULL,
    eg_rang text NOT NULL,
    eg_element text,
    eg_longueur_generale text,
    eg_profil text,
    eg_profondeur text,
    eg_obliquite text,
    eg_extremite text,
    eg_proeminence text,
    eg_sens text,
    eg_localisation text,
    eg_situation text,
    eg_epaisseur text,
    eg_longueur integer,
    eg_largeur integer,
    eg_tranchant text,
    eg_obliquite_degre text,
    eg_corde integer,
    eg_fleche integer,
    eg_dptimpact text,
    eg_support text,
    eg_relation text
);


ALTER TABLE public.enlevement_galet OWNER TO postgres;

--
-- Name: enlevement_nucleus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enlevement_nucleus (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    n_ordre integer NOT NULL,
    en_rang text NOT NULL,
    en_longueur integer,
    en_largeur integer,
    en_obliquite text,
    en_obliquite_degre text,
    en_corde integer,
    en_fleche integer,
    en_dptimpact text,
    en_frappe text,
    en_numero integer,
    en_inclinaison text,
    en_direction text
);


ALTER TABLE public.enlevement_nucleus OWNER TO postgres;

--
-- Name: faune; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE faune (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    f_longueur integer,
    f_largeur integer,
    f_epaisseur integer,
    f_poids integer,
    f_ancien_oss text,
    f_classe text,
    f_ordre text,
    f_famille text,
    f_ssfamille text,
    f_genre text,
    f_espece text,
    f_ssespece text,
    f_typos1 text,
    f_typos2 text,
    f_typos3 text,
    f_typos4 text,
    f_typos5 text,
    f_typos6 text,
    f_lateralite text,
    f_sexe text,
    f_agecl text,
    f_agest text,
    f_epins text,
    f_stserie text,
    f_stdent text,
    f_taille text,
    f_association integer,
    f_pathologie text,
    f_description text,
    f_fragge text,
    f_fragde text,
    f_sauvefrag text,
    f_couleur text,
    f_caltype text,
    f_calcouleur text,
    f_concretion text,
    f_oxyde text,
    f_coraspect text,
    f_corfissure text,
    f_trace text,
    f_fossilisation text,
    f_tissu text,
    f_typedos text,
    f_ilongueur text,
    f_icirconference text,
    f_eclat text,
    f_agent text,
    f_photo text,
    f_dessin text,
    f_traitement text,
    f_datation text,
    f_moulage text,
    f_conservation text,
    f_restauration text,
    f_coprolithe text,
    f_pelote text,
    f_saisie date DEFAULT date('now'::text),
    f_reference text,
    f_complement text,
    responsable text,
    controle_f_ancien_oss text,
    f_responsable text,
    f_affgenre text,
    f_affespece text
);


ALTER TABLE public.faune OWNER TO postgres;

--
-- Name: fracture_faune; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fracture_faune (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    ff_localisation1 text,
    ff_non1 text,
    ff_angle1 text,
    ff_aspect1 text,
    ff_profil1 text,
    ff_morphologie1 text,
    ff_localisation2 text,
    ff_non2 text,
    ff_angle2 text,
    ff_aspect2 text,
    ff_profil2 text,
    ff_morphologie2 text
);


ALTER TABLE public.fracture_faune OWNER TO postgres;

--
-- Name: fracture_industrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fracture_industrie (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    fi_ordre integer NOT NULL,
    fi_type text,
    fi_percussion text,
    fi_mode text,
    fi_anciennete text,
    fi_localisation text,
    old_support text,
    fi_relation text
);


ALTER TABLE public.fracture_industrie OWNER TO postgres;

--
-- Name: galet_amenage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE galet_amenage (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    ga_ordre integer NOT NULL,
    ga_type text,
    ga_facture text,
    ga_qualite text,
    ga_nba integer,
    ga_nbb integer,
    ga_nbp integer,
    ga_forme text,
    ga_arete text,
    ga_orientation text,
    ga_retouche text,
    ga_cha integer,
    ga_chb integer,
    ga_chc integer,
    ga_chd integer,
    ga_che integer,
    ga_chde integer,
    ga_chf text,
    old_ga_chg integer,
    ga_chh integer,
    ga_chi integer,
    ga_chj integer,
    ga_chk integer,
    ga_chl integer,
    ga_chm integer,
    ga_chna integer,
    ga_chnb integer,
    ga_cho integer,
    ga_chp integer,
    ga_chq integer,
    ga_chqq integer,
    ga_chr integer,
    ga_chrg integer,
    ga_chrd integer,
    ga_chrr integer,
    ga_chs integer,
    ga_cht integer,
    ga_chu integer,
    ga_chw1 integer,
    ga_chw2 integer,
    ga_chv1 integer,
    ga_chv2 integer,
    ga_chv3 integer,
    ga_chx integer,
    ga_chxx integer,
    ga_chy integer,
    ga_chyy integer,
    ga_chz1 integer,
    ga_chz2 integer,
    ga_chz3 integer,
    ga_chz4 integer,
    ga_chg text,
    ga_obliquite text,
    ga_relation text
);


ALTER TABLE public.galet_amenage OWNER TO postgres;

--
-- Name: hachereau; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hachereau (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    h_type text,
    h_base text,
    h_surface text,
    h_amenagement_bord text,
    h_distale text,
    h_biseau text,
    h_bord text,
    h_meplat text,
    h_extension text,
    h_symetrie text,
    h_bilaterale text,
    h_facture text,
    h_arete text,
    h_retouche text,
    h_long1 integer,
    h_long2 integer,
    h_long3 integer,
    h_l1 integer,
    h_l1a integer,
    h_l2 integer,
    h_l3 integer,
    h_l4 integer,
    h_l5 integer,
    h_e1 integer,
    h_e2 integer,
    h_poids integer,
    h_ind1 real,
    h_ind2 real,
    h_ind3 real,
    h_ind4 real,
    h_ind5 real,
    h_ind6 real,
    h_ind7 real,
    h_ind8 real,
    h_ind9 real,
    h_ind10 real,
    h_ind11 real,
    h_ind12 real,
    h_ind13 real,
    h_ind14 real,
    h_ind15 real,
    h_hc integer,
    h_hd integer,
    h_he integer,
    h_hb1a integer,
    h_hb1b integer,
    h_hb1 integer,
    h_hb2a integer,
    h_hb2b integer,
    h_hb2 integer,
    h_hde1 integer,
    h_hg1 integer,
    h_hg2 integer,
    h_hh integer,
    h_hi integer,
    h_hj integer,
    h_hk integer,
    h_hla1 integer,
    h_hlb1 integer,
    h_hl1 integer,
    h_hla2 integer,
    h_hlb2 integer,
    h_hl2 integer,
    h_hm integer,
    h_hs integer,
    h_hng integer,
    h_hnd integer,
    h_ho integer,
    h_hp integer,
    h_hq integer,
    h_hr integer,
    h_hu integer,
    h_hx integer,
    h_hya1 integer,
    h_hya2 integer,
    h_hya integer,
    h_hyb1 integer,
    h_hyb2 integer,
    h_hyb integer,
    h_hy integer,
    h_hyax integer,
    h_hybx integer,
    h_hyx integer,
    h_hf integer,
    h_ntf integer,
    old_h_de2 integer,
    h_hde2 integer
);


ALTER TABLE public.hachereau OWNER TO postgres;

--
-- Name: industrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE industrie (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    i_oa integer,
    i_ob integer,
    i_oc integer,
    i_poids integer,
    i_forme_galet text,
    i_matiere text,
    i_objet text,
    i_support_originel text,
    i_patine text,
    i_dpatine text,
    i_alteration text,
    i_encroutement text,
    i_pmycellium text,
    i_eolisation text,
    i_lustrage text,
    i_roulage text,
    i_action text,
    i_desilicification text,
    old_support text,
    i_observation text,
    i_support text
);


ALTER TABLE public.industrie OWNER TO postgres;

--
-- Name: microfaune; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE microfaune (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    mf_serie text NOT NULL,
    mf_type text NOT NULL,
    mf_m1 real,
    mf_m2 real,
    mf_m3 real,
    mf_m4 real,
    mf_m5 real,
    mf_m6 real,
    mf_m7 real,
    mf_m8 real,
    mf_m9 real,
    mf_m10 real,
    mf_m11 real,
    mf_m12 real,
    mf_m13 real,
    mf_m14 real,
    mf_m15 real,
    mf_m16 real,
    mf_m17 real,
    mf_m18 real,
    mf_m19 real,
    mf_m20 real,
    mf_m21 real,
    mf_m22 real,
    mf_m23 real,
    mf_m24 real,
    mf_m25 real,
    mf_m26 real,
    mf_m27 real,
    mf_m28 real,
    mf_m29 real,
    mf_m30 real
);


ALTER TABLE public.microfaune OWNER TO postgres;

--
-- Name: nucleus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nucleus (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    n_ordre integer NOT NULL,
    n_type text,
    n_nbplan integer,
    n_nba integer,
    n_nbb integer,
    n_nbp integer,
    n_orientation text,
    n_dirtotal integer,
    n_dirfacea integer,
    n_dirfaceb integer,
    n_dirprofil integer,
    n_formule text,
    n_rotation text,
    n_cortotal integer,
    n_corfacea integer,
    n_corfaceb integer,
    n_corprofil integer,
    n_epuisement integer
);


ALTER TABLE public.nucleus OWNER TO postgres;

--
-- Name: os; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE os (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    o_serie text NOT NULL,
    o_type text,
    o_m1 integer,
    o_m2 integer,
    o_m3 integer,
    o_m4 integer,
    o_m5 integer,
    o_m6 integer,
    o_m7 integer,
    o_m8 integer,
    o_m9 integer,
    o_m10 integer,
    o_m11 integer,
    o_m12 integer,
    o_m13 integer,
    o_m14 integer,
    o_m15 integer,
    o_m16 integer,
    o_m17 integer,
    o_m18 integer,
    o_m19 integer,
    o_m20 integer,
    o_m21 integer,
    o_m22 integer,
    o_m23 integer,
    o_m24 integer,
    o_m25 integer,
    o_m26 integer,
    o_m27 integer,
    o_m28 integer,
    o_m29 integer,
    o_m30 integer,
    o_m31 integer,
    o_m32 integer,
    o_m33 integer,
    o_m34 integer,
    o_m35 integer,
    o_m36 integer,
    o_m37 integer,
    o_m38 integer,
    o_m39 integer,
    o_m40 integer,
    o_m41 integer,
    o_m42 integer,
    o_m43 integer,
    o_m44 integer,
    o_m45 integer,
    o_m46 integer,
    o_m47 integer,
    o_m48 integer,
    o_m49 integer,
    o_m50 integer
);


ALTER TABLE public.os OWNER TO postgres;

--
-- Name: outil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE outil (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    o_ordre integer NOT NULL,
    o_code text,
    o_code_comp text,
    o_retouche text,
    o_orientation text,
    o_origine text,
    o_destination text,
    o_etat text,
    o_localisation text,
    o_sens text,
    o_serie text,
    o_forme text,
    o_chronologie text,
    o_a integer,
    o_b integer,
    o_c integer,
    o_d integer,
    o_e integer,
    o_f integer,
    o_g integer,
    o_h integer,
    o_tranchant text,
    o_relation text
);


ALTER TABLE public.outil OWNER TO postgres;

--
-- Name: photocoprolithe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photocoprolithe (
    idphoto integer DEFAULT nextval(('seq_photocoprolithe'::text)::regclass) NOT NULL,
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    t_ensemble text NOT NULL,
    legende text
);


ALTER TABLE public.photocoprolithe OWNER TO postgres;

--
-- Name: photofaune; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photofaune (
    idphoto integer DEFAULT nextval(('seq_photofaune'::text)::regclass) NOT NULL,
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    legende text
);


ALTER TABLE public.photofaune OWNER TO postgres;

--
-- Name: photoindustrie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photoindustrie (
    idphoto integer DEFAULT nextval(('seq_photoindustrie'::text)::regclass) NOT NULL,
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    legende text
);


ALTER TABLE public.photoindustrie OWNER TO postgres;

--
-- Name: phototrace; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE phototrace (
    idphoto integer DEFAULT nextval(('seq_phototrace'::text)::regclass) NOT NULL,
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    t_ensemble text NOT NULL,
    legende text
);


ALTER TABLE public.phototrace OWNER TO postgres;

--
-- Name: remonte_famille; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE remonte_famille (
    famille text NOT NULL,
    ordre text,
    classe text
);


ALTER TABLE public.remonte_famille OWNER TO postgres;

--
-- Name: remonte_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE remonte_genre (
    genre text NOT NULL,
    famille text,
    ordre text,
    classe text
);


ALTER TABLE public.remonte_genre OWNER TO postgres;

--
-- Name: remonte_ordre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE remonte_ordre (
    ordre text NOT NULL,
    classe text
);


ALTER TABLE public.remonte_ordre OWNER TO postgres;

--
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requete (
    nomrequete text NOT NULL,
    coderequete text
);


ALTER TABLE public.requete OWNER TO postgres;

--
-- Name: retouche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retouche (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    r_ordre integer NOT NULL,
    r_type text,
    r_obliquite text,
    r_denticulation text,
    r_cas text,
    r_utilisation text,
    r_dimension text,
    r_association text,
    r_superposition text,
    r_extremite text,
    r_bord text,
    r_frequence text,
    r_ecrasement text,
    r_lustrage text,
    r_strie text,
    r_origine text,
    r_destination text,
    r_sens text,
    r_tranchant text,
    r_relation text,
    r_extension integer
);


ALTER TABLE public.retouche OWNER TO postgres;

--
-- Name: seq_bord; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bord
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bord OWNER TO postgres;

--
-- Name: seq_bord; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bord', 2, true);


--
-- Name: seq_photocoprolithe; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_photocoprolithe
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photocoprolithe OWNER TO postgres;

--
-- Name: seq_photocoprolithe; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_photocoprolithe', 1, false);


--
-- Name: seq_photofaune; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_photofaune
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photofaune OWNER TO postgres;

--
-- Name: seq_photofaune; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_photofaune', 9, true);


--
-- Name: seq_photoindustrie; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_photoindustrie
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photoindustrie OWNER TO postgres;

--
-- Name: seq_photoindustrie; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_photoindustrie', 6, true);


--
-- Name: seq_phototrace; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_phototrace
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_phototrace OWNER TO postgres;

--
-- Name: seq_phototrace; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_phototrace', 1, false);


--
-- Name: stigmate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stigmate (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    s_ordre integer NOT NULL,
    s_type text,
    s_sous_type text,
    s_lustrage text,
    s_polissage text,
    s_sub text,
    s_localisation text,
    s_situation text,
    s_relation text,
    s_composite text,
    s_simple text,
    s_support text,
    s_roche text,
    s_geometrie text,
    s_alteration text,
    s_concretion text,
    s_plan text,
    s_dessin text,
    s_coupe text,
    s_photo text,
    s_analyse text,
    s_longueur integer,
    s_largeur integer,
    s_epaisseur integer,
    s_poids integer,
    s_outil integer,
    s_cimx integer,
    s_cimn integer,
    s_cr1s integer,
    s_cr2s integer,
    s_timx2 integer,
    s_timn2 integer,
    s_tr1s integer,
    s_tr2s integer,
    s_tang integer,
    s_numero integer
);


ALTER TABLE public.stigmate OWNER TO postgres;

--
-- Name: trace; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trace (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    t_ensemble text NOT NULL,
    t_nature text,
    t_nombre integer,
    t_agent text,
    t_phenomene text,
    t_localisation text,
    t_position text,
    t_locmusc text,
    t_longueur integer,
    t_classe text,
    t_largeur text,
    t_profondeur text,
    t_section text,
    t_diametre integer,
    t_dstrie text,
    t_trace text,
    t_direction text,
    t_sens text,
    t_allure text,
    t_description text,
    t_dessin text,
    t_replique text,
    t_photo text
);


ALTER TABLE public.trace OWNER TO postgres;

--
-- Name: usure_dent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usure_dent (
    "zone" text NOT NULL,
    numero integer NOT NULL,
    bis text NOT NULL,
    ud_serie text NOT NULL,
    ud_type text,
    ud_lateralite text,
    ud_usure text,
    ud_fragmentation text
);


ALTER TABLE public.usure_dent OWNER TO postgres;

--
-- Data for Name: biface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY biface ("zone", numero, bis, b_forme, b_type, b_base, b_surface, b_enlevement, b_amenagement_bord, b_amenagement_distal, b_distale, b_biseau, b_bord, b_meplat, b_extension, b_symetrie, b_facture, b_bilaterale, b_bifaciale, b_arete, b_retouche, b_lar1, b_lar2, b_lar3, b_long1, b_l1a, b_long2, b_long3, b_lar4, b_l5, b_e1, b_e2, b_poids, b_ind1, b_ind2, b_ind3, b_ind4, b_ind5, b_ind6, b_ind7, b_ind8, b_ind9, b_ind10, b_ind11, b_ind12, b_ind13, b_ind14, b_ind15, b_ind16, b_bc, b_nt, b_dat1, b_dat2, b_dat, b_bd1, b_be1, b_bd2, b_be2, b_1t, b_2t, b_bde1, b_bde2, b_bdet, b_ent, b_bf, b_te, b_bh1, b_bh2, b_bht, b_bi1, b_bi2, b_bit, b_bj1, b_bj2, b_bj, b_bk1, b_bk2, b_bk, b_bna, b_bnb, b_bla, b_blb, b_bla1, b_blb1, b_bl1, b_bla2, b_blb2, b_bl2, b_bo1a, b_bo1b, b_bo2a, b_bo2b, b_bo, b_p1, b_p2, b_bp1, b_bp2, b_bq1, b_bq2, b_bq1a, b_bq2a, b_br1, b_br2, b_bv, b_bx, b_by, b_bep, b_bu1, b_bu2, b_bu, b_bu1a, b_bu2a, b_ua, b_bg, b_ntf, b_bo1, b_bo2, b_support, b_bo3, b_bua, b_bo3b, b_bo3a, b_lar5) FROM stdin;
\.


--
-- Data for Name: bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bord ("zone", numero, bis, b_ordre, b_extremite, b_code, b_amincissement, b_localisation) FROM stdin;
\.


--
-- Data for Name: carnet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carnet ("zone", numero, bis, locus, localite, carre, souscarre, ensemble, niveau, sol, couche, foyer, nature, nofouille, nomusee, nosopi, x, y, zrelatif, zreference, zabsolu, orientation, pendage, vers, longueur, largeur, epaisseur, trouve, saisie, latitude, longitude, responsable_fouille) FROM stdin;
\.


--
-- Data for Name: controle_b_amenagement_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_amenagement_bord (b_amenagement_bord, description) FROM stdin;
AB0	\N
AB1	\N
AB2	\N
AB3	\N
AB4	\N
\.


--
-- Data for Name: controle_b_amenagement_distal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_amenagement_distal (b_amenagement_distal, description) FROM stdin;
1	\N
2	\N
\.


--
-- Data for Name: controle_b_amincissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_amincissement (b_amincissement, description) FROM stdin;
ALCD	\N
ALCI	\N
ALCM	\N
ALED	\N
ALEI	\N
ALEM	\N
ADCD	\N
ADCI	\N
ADCM	\N
ADCP	\N
ADED	\N
ADEI	\N
ADEM	\N
ADEP	\N
APCD	\N
APCI	\N
APCM	\N
APCP	\N
APED	\N
APEI	\N
APEM	\N
APEP	\N
\.


--
-- Data for Name: controle_b_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_arete (b_arete, description) FROM stdin;
ALR	\N
ALI	\N
ALS	\N
ALSI	\N
ALSR	\N
ALRI	\N
ALRS	\N
ALIS	\N
AL0	\N
\.


--
-- Data for Name: controle_b_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_base (b_base, description) FROM stdin;
B1	\N
B2	\N
\.


--
-- Data for Name: controle_b_bifaciale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_bifaciale (b_bifaciale, description) FROM stdin;
EQ1	\N
EQ2	\N
\.


--
-- Data for Name: controle_b_bilaterale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_bilaterale (b_bilaterale, description) FROM stdin;
SB0	\N
SB1	\N
\.


--
-- Data for Name: controle_b_biseau; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_biseau (b_biseau, description) FROM stdin;
BT0	\N
BT1	\N
BT1A	\N
BT1B	\N
BT1C	\N
\.


--
-- Data for Name: controle_b_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_bord (b_bord, description) FROM stdin;
FB1	\N
FB2	\N
FB3	\N
FB4	\N
FB23	\N
FB12	\N
FB13	\N
\.


--
-- Data for Name: controle_b_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_code (b_code, description) FROM stdin;
MC	\N
MNC	\N
MBN	\N
MRD	\N
MRI	\N
MRM	\N
TL	\N
TLC	\N
TNC	\N
TLD	\N
TLI	\N
TLM	\N
BIT	\N
I	\N
PP	\N
TT	\N
CH	\N
MBC	\N
MBNC	\N
MBPF	\N
MBCA	\N
MBFV	\N
EC	\N
ENC	\N
PUA	\N
PUG	\N
PUD	\N
PBA	\N
PBG	\N
PBD	\N
TTD	\N
TTI	\N
TTM	\N
TRD	\N
TRI	\N
TRM	\N
MTRD	\N
MTRI	\N
MTRM	\N
O	\N
POL	\N
\.


--
-- Data for Name: controle_b_dat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_dat (b_dat, description) FROM stdin;
\.


--
-- Data for Name: controle_b_dat1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_dat1 (b_dat1, description) FROM stdin;
\.


--
-- Data for Name: controle_b_dat2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_dat2 (b_dat2, description) FROM stdin;
\.


--
-- Data for Name: controle_b_distale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_distale (b_distale, description) FROM stdin;
ED1	\N
ED2	\N
ED3	\N
ED4	\N
ED5	\N
ED6	\N
\.


--
-- Data for Name: controle_b_enlevement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_enlevement (b_enlevement, description) FROM stdin;
EB1	\N
EB2	\N
EB3	\N
\.


--
-- Data for Name: controle_b_extension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_extension (b_extension, description) FROM stdin;
ERU	\N
EAU	\N
EMU	\N
ER	\N
ERA	\N
EA	\N
EMA	\N
EMM	\N
EMR	\N
\.


--
-- Data for Name: controle_b_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_extremite (b_extremite, description) FROM stdin;
LATG	\N
TRDIS	\N
LATD	\N
TRPROX	\N
ANGGPROX	\N
ANGGDIS	\N
ANGDPROX	\N
ANGDDIS	\N
\.


--
-- Data for Name: controle_b_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_facture (b_facture, description) FROM stdin;
FHB	\N
FHM	\N
HT	\N
\.


--
-- Data for Name: controle_b_meplat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_meplat (b_meplat, description) FROM stdin;
ML0	\N
ML1	\N
ML1U	\N
ML1B	\N
\.


--
-- Data for Name: controle_b_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_retouche (b_retouche, description) FROM stdin;
RS0	\N
RS1	\N
RS2	\N
RS5	\N
\.


--
-- Data for Name: controle_b_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_support (b_support, description) FROM stdin;
NLE	\N
G0	\N
G1	\N
G2	\N
G3	\N
IND	\N
D	\N
\.


--
-- Data for Name: controle_b_surface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_surface (b_surface, description) FROM stdin;
SO0	\N
SO1	\N
SO2	\N
SO3	\N
\.


--
-- Data for Name: controle_b_symetrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_symetrie (b_symetrie, description) FROM stdin;
SMD0	\N
SMD1	\N
\.


--
-- Data for Name: controle_b_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_b_type (b_type, description) FROM stdin;
\.


--
-- Data for Name: controle_bis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_bis (bis, description) FROM stdin;
R	\N
--	\N
A	\N
B	\N
C	\N
D	\N
E	\N
\.


--
-- Data for Name: controle_c_alteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_alteration (c_alteration, description) FROM stdin;
\.


--
-- Data for Name: controle_c_altnat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_altnat (c_altnat, description) FROM stdin;
\.


--
-- Data for Name: controle_c_autre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_autre (c_autre, description) FROM stdin;
\.


--
-- Data for Name: controle_c_consistance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_consistance (c_consistance, description) FROM stdin;
\.


--
-- Data for Name: controle_c_couleur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_couleur (c_couleur, description) FROM stdin;
\.


--
-- Data for Name: controle_c_element; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_element (c_element, description) FROM stdin;
\.


--
-- Data for Name: controle_c_ext1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_ext1 (c_ext1, description) FROM stdin;
\.


--
-- Data for Name: controle_c_ext2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_ext2 (c_ext2, description) FROM stdin;
\.


--
-- Data for Name: controle_c_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_extremite (c_extremite, description) FROM stdin;
\.


--
-- Data for Name: controle_c_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_famille (c_famille, description) FROM stdin;
\.


--
-- Data for Name: controle_c_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_forme (c_forme, description) FROM stdin;
\.


--
-- Data for Name: controle_c_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_genre (c_genre, description) FROM stdin;
\.


--
-- Data for Name: controle_c_granulometrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_granulometrie (c_granulometrie, description) FROM stdin;
\.


--
-- Data for Name: controle_c_incl1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_incl1 (c_incl1, description) FROM stdin;
\.


--
-- Data for Name: controle_c_incl2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_incl2 (c_incl2, description) FROM stdin;
\.


--
-- Data for Name: controle_c_incl3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_incl3 (c_incl3, description) FROM stdin;
\.


--
-- Data for Name: controle_c_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_inclusion (c_inclusion, description) FROM stdin;
\.


--
-- Data for Name: controle_c_lame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_lame (c_lame, description) FROM stdin;
\.


--
-- Data for Name: controle_c_liant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_liant (c_liant, description) FROM stdin;
\.


--
-- Data for Name: controle_c_macroreste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_macroreste (c_macroreste, description) FROM stdin;
\.


--
-- Data for Name: controle_c_mif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_mif (c_mif, description) FROM stdin;
\.


--
-- Data for Name: controle_c_motcou; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_motcou (c_motcou, description) FROM stdin;
\.


--
-- Data for Name: controle_c_motif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_motif (c_motif, description) FROM stdin;
\.


--
-- Data for Name: controle_c_motnat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_motnat (c_motnat, description) FROM stdin;
\.


--
-- Data for Name: controle_c_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_ordre (c_ordre, description) FROM stdin;
\.


--
-- Data for Name: controle_c_palyno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_palyno (c_palyno, description) FROM stdin;
\.


--
-- Data for Name: controle_c_parasito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_parasito (c_parasito, description) FROM stdin;
\.


--
-- Data for Name: controle_c_retrecissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_retrecissement (c_retrecissement, description) FROM stdin;
\.


--
-- Data for Name: controle_c_sediment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_sediment (c_sediment, description) FROM stdin;
\.


--
-- Data for Name: controle_c_vol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_vol (c_vol, description) FROM stdin;
\.


--
-- Data for Name: controle_c_volext; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_c_volext (c_volext, description) FROM stdin;
\.


--
-- Data for Name: controle_carre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_carre (carre, description) FROM stdin;
\.


--
-- Data for Name: controle_d_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_d_serie (d_serie, description) FROM stdin;
1	\N
2	\N
3	\N
4	\N
\.


--
-- Data for Name: controle_d_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_d_type (d_type, description) FROM stdin;
M1	\N
M2	\N
P2	\N
M3	\N
I3	\N
P4	\N
CA	\N
P3	\N
I2	\N
D3	\N
D4	\N
D2	\N
I1	\N
C	\N
M4	\N
IG	\N
P2I	\N
P3I	\N
P4I	\N
M1I	\N
I1I	\N
CI	\N
P4S	\N
I3S	\N
CS	\N
P1S	\N
P2S	\N
P3S	\N
M1S	\N
M2S	\N
I1S	\N
I2S	\N
I3I	\N
I2I	\N
M3I	\N
M2I	\N
P1I	\N
\.


--
-- Data for Name: controle_e_bulbe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_bulbe (e_bulbe, description) FROM stdin;
A	\N
E1	\N
E2	\N
E3	\N
I	\N
UTC	\N
UC	\N
UPD	\N
UD	\N
UP	\N
M1A	\N
M1B	\N
M1C	\N
M2A	\N
M1D	\N
M1E	\N
M2B	\N
M2C	\N
M2D	\N
UN	\N
UE1	\N
UE2	\N
UE3	\N
M1AC	\N
M1AP	\N
M1APD	\N
M1AD	\N
M1ATC	\N
\.


--
-- Data for Name: controle_e_carene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_carene (e_carene, description) FROM stdin;
N	\N
A	\N
P	\N
\.


--
-- Data for Name: controle_e_charniere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_charniere (e_charniere, description) FROM stdin;
N	\N
O	\N
AN	\N
S	\N
P	\N
A	\N
\.


--
-- Data for Name: controle_e_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_code (e_code, description) FROM stdin;
ECL	\N
ECLF	\N
ECLU	\N
PTE	\N
PTEU	\N
PTEF	\N
LAM	\N
LAMU	\N
LAMF	\N
OUT	\N
PEC	\N
PECU	\N
PECF	\N
LAML	\N
ERT	\N
CHBU	\N
PEL	\N
ECLTH	\N
\.


--
-- Data for Name: controle_e_cone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_cone (e_cone, description) FROM stdin;
N	\N
FD	\N
D	\N
TD	\N
A	\N
\.


--
-- Data for Name: controle_e_contour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_contour (e_contour, description) FROM stdin;
A1	\N
A2	\N
A3	\N
Q1	\N
Q2	\N
Q3	\N
Q4	\N
Q5	\N
Q6	\N
P	\N
TC	\N
TD	\N
R	\N
I	\N
\.


--
-- Data for Name: controle_e_debitage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_debitage (e_debitage, description) FROM stdin;
IA	\N
IAC	\N
IAC1	\N
IAC2	\N
IAC3	\N
IAC4	\N
IAC5	\N
IAC6	\N
IAL	\N
IAL1	\N
IAL2	\N
IAL3	\N
IAL4	\N
IAL5	\N
IAL6	\N
IB	\N
IBC	\N
IBC1	\N
IBC2	\N
IBC3	\N
IBC4	\N
IBC5	\N
IBC6	\N
IBL	\N
IBL1	\N
IBL2	\N
IBL3	\N
IBL4	\N
IBL5	\N
IBL6	\N
IC	\N
ICC	\N
ICC1	\N
ICC2	\N
ICC3	\N
ICC4	\N
ICC5	\N
ICC6	\N
ICL	\N
ICL1	\N
ICL2	\N
ICL3	\N
ICL4	\N
ICL5	\N
ICL6	\N
ID	\N
ID1	\N
ID2	\N
II	\N
IIA	\N
IIAC	\N
IIAC1	\N
IIAC2	\N
IIAC3	\N
IIAC4	\N
IIAC5	\N
IIAC6	\N
IIAL	\N
IIAL1	\N
IIAL2	\N
IIAL3	\N
IIAL4	\N
IIAL5	\N
IIAL6	\N
IIB	\N
IIBC	\N
IIBC1	\N
IIBC2	\N
IIBC3	\N
IIBC4	\N
IIBC5	\N
IIBC6	\N
II BL	\N
IIBL1	\N
IIBL2	\N
IIBL3	\N
IIBL4	\N
IIBL5	\N
IIBL6	\N
IIC	\N
IICC	\N
IICC1	\N
IICC2	\N
IICC3	\N
IICC4	\N
IICC5	\N
IICC6	\N
IICL	\N
IICL1	\N
IICL2	\N
IICL3	\N
IICL4	\N
IICL5	\N
IICL6	\N
IID	\N
IID1	\N
IID2	\N
III	\N
IIIA	\N
IIIA1	\N
IIIA1A	\N
IIIA1B	\N
IIIA2	\N
IIIA2A	\N
IIIA2B	\N
IIIA2C	\N
IIIA2D	\N
IIIA3	\N
IIIA3A	\N
IIIA3B	\N
IIIA3C	\N
IIIA3D	\N
IIIA4	\N
IIIA4A	\N
IIIA4B	\N
IIIA4C	\N
IIIA4D	\N
IIIA5	\N
IIIA5A	\N
IIIA5B	\N
IIIA5C	\N
IIIA5D	\N
IIIB	\N
IIIB1	\N
IIIB1A	\N
IIIB1B	\N
IIIB2	\N
IIIB2A	\N
IIIB2B	\N
IIIB2C	\N
IIIB2D	\N
IIIB3	\N
IIIB3A	\N
IIIB3B	\N
IIIB3C	\N
IIIB3D	\N
IIIB4	\N
IIIB4A	\N
IIIB4B	\N
IIIB4C	\N
IIIB4D	\N
IIIB5	\N
IIIB5A	\N
IIIB5B	\N
IIIC	\N
IIIC1	\N
IIIC1A	\N
IIIC1B	\N
IIIC2	\N
IIIC2A	\N
IIIC2B	\N
IIIC2C	\N
IIIC2D	\N
IIIC3	\N
IIIC3A	\N
IIIC3B	\N
IIIC3C	\N
IIIC3D	\N
IIIC4	\N
IIIC4A	\N
IIIC4B	\N
IIIC4C	\N
IIIC4D	\N
IIIC5	\N
IIIC5A	\N
IIIC5B	\N
IIIC5C	\N
IIIC5D	\N
IIID	\N
IIID1A	\N
IIID2	\N
IIID2A	\N
IIID2C	\N
IIID3	\N
IIID3A	\N
IIID3C	\N
IIID4	\N
IIID4A	\N
IIID4C	\N
IIID5	\N
IIID5A	\N
IIID5C	\N
IV	\N
IVA	\N
IVA1	\N
IVA2	\N
IVB	\N
IVB1	\N
IVB2	\N
IVC	\N
IVD	\N
I	\N
IIID3B	\N
IIID2B	\N
\.


--
-- Data for Name: controle_e_enlevement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_enlevement (e_enlevement, description) FROM stdin;
O	\N
LC	\N
LU	\N
LB	\N
TU	\N
TB	\N
OR	\N
E	\N
C	\N
I	\N
D	\N
\.


--
-- Data for Name: controle_e_epi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_epi (e_epi, description) FROM stdin;
N	\N
FD	\N
D	\N
TD	\N
A	\N
\.


--
-- Data for Name: controle_e_onde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_onde (e_onde, description) FROM stdin;
N	\N
FD	\N
D	\N
TD	\N
A	\N
BIP	\N
\.


--
-- Data for Name: controle_e_parasite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_parasite (e_parasite, description) FROM stdin;
N	\N
PP	\N
PM	\N
PG	\N
PTG	\N
A	\N
\.


--
-- Data for Name: controle_e_secondaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_secondaire (e_secondaire, description) FROM stdin;
N	\N
PU	\N
PQ	\N
PN	\N
A	\N
\.


--
-- Data for Name: controle_e_section_long; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_section_long (e_section_long, description) FROM stdin;
LA	\N
LB	\N
LC	\N
LD	\N
LE	\N
LF	\N
LG	\N
LJ	\N
\.


--
-- Data for Name: controle_e_section_trans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_section_trans (e_section_trans, description) FROM stdin;
A	\N
B	\N
C	\N
D	\N
E	\N
F	\N
G	\N
H	\N
I	\N
J	\N
P	\N
R	\N
\.


--
-- Data for Name: controle_e_strie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_strie (e_strie, description) FROM stdin;
N	\N
A	\N
P	\N
\.


--
-- Data for Name: controle_e_talon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_talon (e_talon, description) FROM stdin;
TL	\N
TL1	\N
TL2	\N
TL3	\N
TLP	\N
TD	\N
TD1A	\N
TD1B	\N
TDA	\N
TD4B	\N
TD5A	\N
TD5B	\N
TD3A	\N
TD3B	\N
TF	\N
TF1A	\N
TF1B	\N
TF2A	\N
TF2B	\N
TF3A	\N
TF3B	\N
TF4A	\N
TF4B	\N
TF5A	\N
TF5B	\N
TR	\N
TR6C	\N
TR6D	\N
TR7	\N
TC	\N
TO	\N
TO8	\N
TO9	\N
TI	\N
TA	\N
TP2	\N
TP3	\N
TP4	\N
TD4A	\N
\.


--
-- Data for Name: controle_e_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_e_type (e_type, description) FROM stdin;
G0	\N
G	\N
G1	\N
G2	\N
G3	\N
D	\N
D1	\N
D2	\N
D3	\N
D4	\N
N	\N
L	\N
L0	\N
LE1	\N
LE2	\N
LE3	\N
LE4	\N
LBN	\N
LP1	\N
LP2	\N
LP3	\N
LP4	\N
LP5	\N
LP6	\N
LP7	\N
LP8	\N
LL1	\N
LL2	\N
LL3	\N
NL	\N
NL0	\N
NLE1	\N
NLE2	\N
NLE3	\N
NLE4	\N
NLE5M	\N
NLE6M	\N
NLE7M	\N
NLE5	\N
NLE6	\N
NLE7	\N
NLBN	\N
EP	\N
EFB	\N
NLP	\N
NLPP1	\N
NLPP2	\N
NLPP3	\N
NLL1	\N
NLL2	\N
NLL3	\N
NLM	\N
PE	\N
PEE1	\N
PEE2	\N
PEL	\N
ER	\N
NLK	\N
LK	\N
ETH	\N
NLBN7	\N
NLBN6	\N
NLE	\N
NLPB	\N
\.


--
-- Data for Name: controle_eg_element; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_element (eg_element, description) FROM stdin;
IA	\N
IA1	\N
E	\N
IA1E1	\N
IA1E2	\N
IA1ET	\N
A	\N
IA1A5	\N
IA1A2	\N
IA1AT	\N
IA1A3	\N
IA1A4	\N
IA1A1	\N
IA1A6	\N
IA1B1	\N
IA1B2	\N
IA1BT	\N
IA1B3	\N
IA1B4	\N
IA1B5	\N
IA1B6	\N
IA1C1	\N
IA1C2	\N
IA1CT	\N
IA1C3	\N
IA1C4	\N
IA1C5	\N
IA1C6	\N
IA1D1	\N
IA1D2	\N
IA1DT	\N
IA2	\N
IA2SE1	\N
IA2SE2	\N
IA2SET	\N
IA2SA1	\N
IA2SA2	\N
IA2SAT	\N
IA2SA3	\N
IA2SA4	\N
IA2SA5	\N
IA2SA6	\N
IA2SB1	\N
IA2SB2	\N
IA2SBT	\N
IA2SB3	\N
IA2SB4	\N
IA2SB5	\N
IA2SB6	\N
IA2SC1	\N
IA2SC2	\N
IA2SCT	\N
IA2SC3	\N
IA2SC4	\N
IA2SC5	\N
IA2SC6	\N
IA2SD1	\N
IA2SD2	\N
IA2SDT	\N
A2ME1	\N
IA2ME2	\N
IA2MET	\N
IA2MA1	\N
IA2MA2	\N
IA2MAT	\N
IA2MA3	\N
IA2MA4	\N
IA2MA5	\N
IA2MA6	\N
IA2MB1	\N
IA2MB2	\N
IA2MBT	\N
IA2MB3	\N
IA2MB4	\N
IA2MB5	\N
IA2MB6	\N
IA2MC1	\N
IA2MC2	\N
IA2MCT	\N
IA2MC3	\N
IA2MC	\N
IA2MC5	\N
IA2MC6	\N
IA2MD1	\N
IA2MD2	\N
IA2MDT	\N
IA2MFA1	\N
IA2MFAT	\N
IA2MFA3	\N
IA2MFA5	\N
IA2MFB1	\N
IA2MFBT	\N
IA2MFB3	\N
IA2MFB5	\N
IA2MGA1	\N
IA2MGAT	\N
IA2MGA3	\N
IA2MGA5	\N
IA2MGB1	\N
IA2MGBT	\N
IA2MGB3	\N
IA2MGB5	\N
IA2MHA1	\N
IA2MHAT	\N
IA2MHA3	\N
IA2MHA5	\N
IA2MHB1	\N
IA2MHBT	\N
IA2MHB3	\N
IA2MHB5	\N
IA2MHC1	\N
IA2MHCT	\N
IA2MHC3	\N
IA2MHC5	\N
\.


--
-- Data for Name: controle_eg_epaisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_epaisseur (eg_epaisseur, description) FROM stdin;
I	\N
E	\N
N	\N
M	\N
\.


--
-- Data for Name: controle_eg_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_extremite (eg_extremite, description) FROM stdin;
I	\N
ATN	\N
PC	\N
CR	\N
COP	\N
FP	\N
\.


--
-- Data for Name: controle_eg_longueur_generale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_longueur_generale (eg_longueur_generale, description) FROM stdin;
C	\N
SL	\N
L	\N
E	\N
\.


--
-- Data for Name: controle_eg_proeminence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_proeminence (eg_proeminence, description) FROM stdin;
N	\N
P	\N
\.


--
-- Data for Name: controle_eg_profil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_profil (eg_profil, description) FROM stdin;
P	\N
CV	\N
SC	\N
CC	\N
S	\N
\.


--
-- Data for Name: controle_eg_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_profondeur (eg_profondeur, description) FROM stdin;
C	\N
M	\N
E	\N
P	\N
\.


--
-- Data for Name: controle_eg_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_sens (eg_sens, description) FROM stdin;
DIR	\N
INV	\N
MIX	\N
MIXAL	\N
PROFL	\N
PROFT	\N
PROFM	\N
MP	\N
\.


--
-- Data for Name: controle_eg_situation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_situation (eg_situation, description) FROM stdin;
I	\N
P	\N
B	\N
\.


--
-- Data for Name: controle_eg_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_eg_support (eg_support, description) FROM stdin;
IND	\N
ANGGPROX	\N
LATGT	\N
LATGPROX	\N
LATGMES	\N
LATGDIS	\N
ANGGDIS	\N
TRDIST	\N
TRDISG	\N
TRDISMES	\N
TRDID	\N
PTDIS	\N
ANGDDIS	\N
LATDT	\N
LATDPROX	\N
LATDMES	\N
LATDDIS	\N
ANGDPROX	\N
TRPROXT	\N
TRPROXG	\N
TRPROXMES	\N
TRPROXD	\N
PTPROX	\N
\.


--
-- Data for Name: controle_en_direction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_direction (en_direction, description) FROM stdin;
C	\N
L	\N
L1	\N
L2	\N
T	\N
T1	\N
T2	\N
H	\N
H1	\N
H2	\N
P	\N
\.


--
-- Data for Name: controle_en_dptimpact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_dptimpact (en_dptimpact, description) FROM stdin;
\.


--
-- Data for Name: controle_en_frappe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_frappe (en_frappe, description) FROM stdin;
PFC	\N
PFF	\N
PFAR	\N
PFAE	\N
\.


--
-- Data for Name: controle_en_inclinaison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_inclinaison (en_inclinaison, description) FROM stdin;
PAR	\N
OBL	\N
PER	\N
PRO	\N
\.


--
-- Data for Name: controle_en_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_obliquite (en_obliquite, description) FROM stdin;
\.


--
-- Data for Name: controle_en_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_en_profondeur (en_profondeur, description) FROM stdin;
C	\N
M	\N
E	\N
P	\N
\.


--
-- Data for Name: controle_ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ensemble (ensemble, description) FROM stdin;
CII	\N
CIII	\N
\.


--
-- Data for Name: controle_f_affespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_affespece (f_affespece, description) FROM stdin;
AFF	\N
CONF	\N
\.


--
-- Data for Name: controle_f_affgenre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_affgenre (f_affgenre, description) FROM stdin;
CONF	\N
AFF	affinité
\.


--
-- Data for Name: controle_f_agecl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_agecl (f_agecl, description) FROM stdin;
F	FOETUS
JA	\N
A	\N
AA	\N
ATA	\N
J	\N
\.


--
-- Data for Name: controle_f_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_agent (f_agent, description) FROM stdin;
S	STRIE
L	RACLAGE
C	CARNIVORE
P	point impact
\.


--
-- Data for Name: controle_f_agest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_agest (f_agest, description) FROM stdin;
\.


--
-- Data for Name: controle_f_ancien_oss; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_ancien_oss (f_ancien_oss, description) FROM stdin;
\.


--
-- Data for Name: controle_f_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_association (f_association, description) FROM stdin;
\.


--
-- Data for Name: controle_f_calcouleur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_calcouleur (f_calcouleur, description) FROM stdin;
NOI	\N
GRI	\N
MAR	\N
BLA	\N
N+M	\N
BLE	\N
B+B	\N
GC	\N
GF	\N
G+M	\N
N+BRR	\N
BRR	\N
G+BLA	\N
G+BLE	\N
G+N	\N
G+G	\N
BRG	\N
N+BLE	\N
N+BLA	\N
N+BRG	\N
\.


--
-- Data for Name: controle_f_caltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_caltype (f_caltype, description) FROM stdin;
TOT	\N
PAR	\N
\.


--
-- Data for Name: controle_f_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_classe (f_classe, description) FROM stdin;
MAMMALIA	\N
AVES	\N
REPTILIA	\N
MOLLUSCA	\N
AMPHIBIA	\N
\.


--
-- Data for Name: controle_f_complement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_complement (f_complement, description) FROM stdin;
\.


--
-- Data for Name: controle_f_composite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_composite (f_composite, description) FROM stdin;
\.


--
-- Data for Name: controle_f_concretion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_concretion (f_concretion, description) FROM stdin;
P	\N
.	\N
Q	\N
4	\N
*	\N
R	\N
\.


--
-- Data for Name: controle_f_conservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_conservation (f_conservation, description) FROM stdin;
898	\N
PK	\N
F01	\N
P1	\N
BRU	\N
DIG	\N
P2	\N
R11	\N
0	\N
913	\N
FC1	\N
P6	\N
470	\N
464	\N
151	\N
P	\N
P7	\N
*	\N
\.


--
-- Data for Name: controle_f_coprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_coprolithe (f_coprolithe, description) FROM stdin;
\.


--
-- Data for Name: controle_f_coraspect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_coraspect (f_coraspect, description) FROM stdin;
FIB	\N
LES	\N
COM	\N
CAL	\N
IND	\N
\.


--
-- Data for Name: controle_f_corfissure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_corfissure (f_corfissure, description) FROM stdin;
FNOM	\N
FPEU	\N
FDIF	\N
COM	\N
M	\N
PNOM	\N
FPEN	\N
\.


--
-- Data for Name: controle_f_couleur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_couleur (f_couleur, description) FROM stdin;
D	\N
FIB	\N
G	\N
SPO	\N
M2	\N
M1	\N
0	\N
O	\N
.	\N
ORY	\N
\.


--
-- Data for Name: controle_f_datation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_datation (f_datation, description) FROM stdin;
M	\N
D	\N
\.


--
-- Data for Name: controle_f_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_description (f_description, description) FROM stdin;
\.


--
-- Data for Name: controle_f_dessin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_dessin (f_dessin, description) FROM stdin;
0	\N
18	\N
1	\N
39	\N
9	\N
10	\N
12	\N
11	\N
17	\N
2	\N
51	\N
61	\N
43	\N
19	\N
4	\N
\.


--
-- Data for Name: controle_f_eclat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_eclat (f_eclat, description) FROM stdin;
P	pr�sent
\.


--
-- Data for Name: controle_f_espece; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_espece (f_espece, description) FROM stdin;
LIVIA	\N
ASPIS	\N
BERUS	\N
URSINI	\N
GIRONDICA	\N
AUSTRIACA	\N
VIRIDIFLAVUS	\N
SCALARIS	\N
LONGISSIMA	\N
FRAGILIS	\N
LEPIDA	\N
VIRIDIS	\N
ERYTHROPUS	\N
AGRESTIS	\N
SP	\N
GLAREOLUS	\N
GLIS	\N
QUERCINUS	\N
CRICETUS	\N
AVELLANARIUS	\N
MALEI-OECONOMUS	\N
LAGURUS	\N
NIVALIS	\N
GRACULUS	\N
GREGALIS	\N
GLANDARIUS	\N
PUNCTATUS	\N
CHRYSAETOS	\N
ALUCO	\N
SCOPS	\N
OTUS	\N
FUNEREUS	\N
NOCTUA	\N
FLAMMEUS	\N
BUBO	\N
FASCIATUS	\N
CYANEUS	\N
SUBBUTEO	\N
BUTEO	\N
TINNUNCULUS	\N
VESPERTINUS	\N
MONACHUS	\N
BARBATUS	\N
ELEONARAE	\N
MACROURUS	\N
COTURNIX	\N
CALAMITA	\N
BUFO	\N
MONEDULA	\N
PYRRHOCORAX	\N
GRAECA	\N
TEMPORARIA	\N
PALAEOPERDIX	\N
CORAX	\N
VISCIVORUS	\N
PICA	\N
MERULA	\N
CANORUS	\N
ARVENSIS	\N
PALUMBUS	\N
OENAS	\N
CREX	\N
SCANDIACA	\N
CHLORIS	\N
CF.FLAVA	\N
AQUATICUS	\N
ALBICOLLIS	\N
CARYOCATACTES	\N
CF.VISCIVORUS	\N
CALANDRA	\N
RUSTICA	\N
CF.OENAS	\N
CF.PALUMBUS	\N
HYBRIDA	\N
COLUMBARIUS	\N
ALBICILLA	\N
STAGNATILIS	\N
RUSTICOLA	\N
CF.HIRUNDO	\N
ARCTICA	\N
AALGE/LOMVIA	\N
SQUATAROLA	\N
DUBIUS	\N
CF. CANUS	\N
PETRONIA	\N
HISPANICA	\N
PHOENICURUS	\N
RUBECULA	\N
URBICA	\N
CINCLUS	\N
PYTYOPSITTACUS	\N
COCCOTHRAUSTES	\N
ENUCLEATOR	\N
PYRRHULA	\N
ERYTHRINUS	\N
COELEBS	\N
HORTULANA	\N
ALBA	\N
PRATENSIS	\N
VULGARIS	\N
CORONE	\N
ILIACUS	\N
ARBOREA	\N
CUITATA	\N
CRISTATA	\N
PILARIS	\N
APUS	\N
DAURICO	\N
GALLUS	\N
PALLIDUS	\N
MELBA	\N
MAJOR	\N
MINOR	\N
MEDIUS	\N
MARILA	\N
CLYPEATA	\N
CF. ACUTA	\N
CLANGULA	\N
PARETI	\N
NICIENSIS	\N
CUNICULUS	\N
SIMILIS	\N
ELEGANS	\N
UNIFASCIATA	\N
OBVOLUTA	\N
DECOLATTA	\N
BIDENTATA	\N
CESPITUM	\N
GIGAXI	\N
CANDIDISSIMA	\N
ELAPHUS	\N
AVENACEA	\N
TRIPLICATA	\N
PURA	\N
RUGOSIUSCULA	\N
ACICULA	\N
EUROPEA	\N
DEPRESSUS	\N
ACICULOIDES	\N
QUADRIDENS	\N
SECALE	\N
GEYERI	\N
CANTIANA	\N
CABALLUS	\N
IBEX	\N
CAPREOLUS	\N
ANTIQUUS	\N
LATREILLI	\N
RETICULATUM	\N
LUPUS	\N
PRISCUS	\N
SPELAEA	\N
VULPES	\N
SYLVATICUS	\N
TARANDUS	\N
PRIMIGENIUS	\N
RUPICAPRA	\N
ANTIQUITATIS	\N
TERRESTRIS	\N
LENKI	\N
BRECCIENSIS	\N
ARVALIS	\N
NORVEGICUS	\N
MUSCULUS	\N
BORONENSIS	\N
EUROPAEA	\N
MINUTUS	\N
FODIENS	\N
HIPPOSIDEROS	\N
SCHREIBERSI	\N
BARBASTELLUS	\N
DAMA	\N
MYOTIS	\N
PARDUS	\N
ARCTOS	\N
SPELAEUS	\N
MELES	\N
SILVESTRIS	\N
OEDICNEMUS	\N
NERITOIDES	\N
SAXATILIS	\N
FABALIS	\N
CRUCIATUS	\N
CORALLINUS	\N
STRIATUS	\N
EXASPERATUS	\N
SANGUINEUM	\N
FERRUGINEA	\N
VULGATUM	\N
CALYCULATA	\N
COMMUNIS	\N
NATRIX	\N
DONOVANIA	\N
SCABRIDA	\N
VARIABILIS	\N
TORQUATUS	\N
PERDIX	\N
MUSICUS	\N
TETRIX	\N
ARVALIS-AGRESTIS	\N
DUODECIMCOSTATUS	\N
ESCULENTA	\N
MONTAGUI	\N
ZIZYPHINUM	\N
DISCORS	\N
ALUCASTER	\N
CRISTATUS	\N
EDULIS	\N
APERTUS	\N
TRUNCATULA	\N
VERMICULATA	\N
VARIA	\N
CAERULEA	\N
ULYSSIPONENSIS	\N
NOAE	\N
TUBERCULATA	\N
\.


--
-- Data for Name: controle_f_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_famille (f_famille, description) FROM stdin;
COLUMBIDAE	\N
VIPERIDAE	\N
COLUBRIDAE	\N
ANGUIDAE	\N
LACERTIDAE	\N
SCOLOPACIDAE	\N
ARVICOLIDAE	\N
MURIDAE	\N
GLIRIDAE	\N
CRICETIDAE	\N
CORVIDAE	\N
PELODYTIDAE	\N
HYLIDAE	\N
BUFONIDAE	\N
ACCIPITRIDAE	\N
STRIGIDAE	\N
FALCONIDAE	\N
PHASIANIDAE	\N
RANIDAE	\N
TURDIDAE	\N
CUCULIDAE	\N
ALAUDIDAE	\N
RALLIDAE	\N
FRINGILLIDAE	\N
MOTACILLIDAE	\N
MUSCICAPIDAE	\N
EMBERIZIDAE	\N
HIRUNDINIDAE	\N
STERNIDAE	\N
ALCIDAE	\N
CHARADRIIDAE	\N
LARIDAE	\N
PASSERIDAE	\N
CINCLIDAE	\N
STURNIDAE	\N
APODIDAE	\N
GALLINACAE	\N
PICIDAE	\N
ANATIDAE	\N
HELICIDAE	\N
LEPORIDAE	\N
CHONDRINIDAE	\N
POMATIIDAE	\N
ZONITIDAE	\N
CERVIDAE	\N
PUPILLIDAE	\N
FERUSSACIIDAE	\N
TESTACELLIDAE	\N
BOVIDAE	\N
EQUIDAE	\N
ELEPHANTIDAE	\N
SYLVIDAE	\N
MONTICILLIDAE	\N
LANIIDAE	\N
LUCINIDAE	\N
LIMIDAE	\N
CHAMIDAE	\N
VENERIDAE	\N
PRUNELLIDAE	\N
CAPRIMULGIDAE	\N
CORACIIDAE	\N
TETRAONIDAE	\N
TROGLODYTIDAE	\N
PASSERIFORMA	\N
SALAMANDRIDAE	\N
CANIDAE	\N
LITTORINIDAE	\N
TURBINIDAE	\N
PATELLIDAE	\N
COLUMBELLIDAE	\N
COLLONIDAE	\N
CHIAMYS	\N
ARCIDAE	\N
TONNIDAE	\N
MURICIDAE	\N
TRIVIIDAE	\N
CERITTHIM	\N
FISSURELLIDAE	\N
MITRIDAE	\N
CYPRAEIDAE	\N
SPONDYLIDAE	\N
FELIDAE	\N
OSTREIDAE	\N
NEOTAENOGLOSSA	\N
SUIDAE	\N
RHINOCEROTIDAE	\N
URSIDAE	\N
OSD	\N
PEPORIDAE	\N
SCIURIDAE	\N
TALPIDAE	\N
MAMMIFERES	\N
DE	\N
GEKKONIDAE	\N
PROCELLARIIDAE	\N
HOMINIDAE	\N
PELOBATIDAE	\N
DIPODIDAE	\N
SORICIDAE	\N
RHINOLOPHIDAE	\N
MUSTELIDAE	\N
BURHINIDAE	\N
CERCOPITHECIDAE	\N
PONGIDAE	\N
ERINACEIDAE	\N
MOLOSSIDAE	\N
VESPERTILIONIDAE	\N
SPALACIDAE	\N
CASTORIDAE	\N
CAPROMYIDAE	\N
HYSTRICIDAE	\N
HYDROCHOERIDAE	\N
LAGOMYIDAE	\N
AILURIDAE	\N
VIVERRIDAE	\N
HYAENIDAE	\N
ODOBAENIDAE	\N
PHOCIDAE	\N
HIPPOPOTAMIDAE	\N
CAMELIDAE	\N
GIRAFFIDAE	\N
ANTILOCAPRIDAE	\N
TAPIRIDAE	\N
GOMPHOTERIIDAE	\N
DELPHINIDAE	\N
PHOCAENIDAE	\N
MONODONLIDAE	\N
PHYSETERIDAE	\N
ZIPHIIDAE	\N
BALAONOPTERIDAE	\N
BALAENIDAE	\N
GAVIIDAE	\N
PODICIPEDIDAE	\N
DIOMEDEIDAE	\N
HYDROBATIDAE	\N
SULIDAE	\N
PELECANIDAE	\N
PHALACROCORACIDAE	\N
ARDEIDAE	\N
THRESKIORNITHIDAE	\N
CICONIIDAE	\N
PHOENICOPTERIDAE	\N
PANDIODIDAE	\N
TURNICIDAE	\N
GRUIDAE	\N
OTITIDAE	\N
PTEROCLIDIDAE	\N
TYTONIDAE	\N
ALCEDINIDAE	\N
MEROPIDAE	\N
UPUPIDAE	\N
HAEMATOPODIDAE	\N
PHALAROPIDAE	\N
STERCORIIDAE	\N
RECURVIROSTRIDAE	\N
GLAREOLIDAE	\N
ORIOLIDAE	\N
BOMBYCILLIDAE	\N
PARIDAE	\N
AEGITHALIDAE	\N
TIMALIIDAE	\N
REMIZIDAE	\N
SITTIDAE	\N
TICHODROMADIDAE	\N
TESTUDINIDAE	\N
EMYDIDAE	\N
DERMOCHELYDAE	\N
CHELONIDAE	\N
AMPHISBAENIDAE	\N
GECKONIDAE	\N
AGAMIDAE	\N
CHAMELEONTIDAE	\N
CARDITIDAE	\N
ACANTHOCHITONIDAE	\N
BARLEEIDAE	\N
BUCCINIDAE	\N
CERITHIOPSIDAE	\N
MARGINELLIDAE	\N
TRIPHORIDAE	\N
CERITHIIDAE	\N
SCINCIDAE	\N
TURRITELLIDAE	\N
RISSOIDAE	\N
TYPHLOPIDAE	\N
BOIDAE	\N
TRIVIDAE	\N
NASSARIIDAE	\N
COSTELLARIIDAE	\N
TURRIDAE	\N
CLAUSILIIDAE	\N
SUBULINIDAE	\N
SUCCINEIDAE	\N
DISCIDAE	\N
HYGROMIIDAE	\N
LIMACIDAE	\N
PLETHODONTIDAE	\N
PROTEIDAE	\N
DISCOGLOSSIDAE	\N
SERPENTES	\N
BULIMINIDAE	\N
RISSOINIDAE	\N
FASCIOLARIIDAE	\N
MYTILIDAE	\N
ARGNIDAE	\N
LYMNAEIDAE	\N
SPHINCTEROCHILIDAE	\N
HELICODONTIAE	\N
ACICULIDAE	\N
PECTINIDAE	\N
VERMETIDAE	\N
PHASIANELLIDAE	\N
TROCHIDAE	\N
NOETIIDAE	\N
\.


--
-- Data for Name: controle_f_fossilisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_fossilisation (f_fossilisation, description) FROM stdin;
\.


--
-- Data for Name: controle_f_fragde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_fragde (f_fragde, description) FROM stdin;
DEF6	\N
FEE	\N
CODIE	\N
CMCD	\N
TITD	\N
SCP	\N
MDDDM2M3	\N
HUD	\N
MDS36	\N
CADS27	\N
MTP	\N
MCE	\N
MCP	\N
PHE	\N
MDS11	\N
HUP	\N
FEM	\N
CRF	\N
HUE	\N
TIFE	\N
CSSCF	\N
MDDDP2P3P4M1M2	\N
DEE3	\N
HDS1	\N
TIDS4	\N
MX-P3-P4-M1-M2	\N
TAE	\N
FED	\N
CSSCART	\N
RAE	\N
V3EU	\N
ULP	\N
ULPM	\N
MD-P3-P4-M1-M2-M3	\N
TIFD	\N
TIFPM	\N
CADS6	\N
CMCSE	\N
ULDM	\N
MX-I1-I2D+I1G	\N
TIFM	\N
CE	\N
CMCPM	\N
MDDF	\N
MX-I1-I2D+G	\N
FEP	\N
HUPM	\N
MDLGD2D3	\N
COQ F	\N
CADS2	\N
MDDDM2	\N
HUDM	\N
MDS346	\N
MTE	\N
FEDS4B	\N
TMTPM	\N
HUMP	\N
M	\N
HUM	\N
DEF	\N
DEE1	\N
DEF5	\N
RAPM	\N
RAP	\N
TIP0	\N
CODM	\N
MDS1	\N
TIFMD	\N
TMTP	\N
CMCP	\N
HP2	\N
CADS234	\N
FED6	\N
TIFP	\N
DEF3	\N
COQ-F	\N
PH6	\N
MDDGP2	\N
COPM	\N
F-P	\N
CAP2	\N
TIDS24	\N
FEPM	\N
MDS4	\N
FEDM	\N
TMTSE	\N
TITMD	\N
HUMD	\N
FEDSE	\N
CNE	\N
MD-I1-P3-P4-M1-M2-M3	\N
CADS24	\N
COE	\N
RAM	\N
VEF	\N
SEE	\N
MD-P3-P4-M1	\N
PH3	\N
PH3A	\N
CHI	\N
SM6	\N
TITM	\N
SCPM	\N
MDS9	\N
FB2	\N
FEMD	\N
FEDS	\N
MDS8911	\N
FB10	\N
COP	\N
CTF	\N
ULMP	\N
MDDDP2P3P4	\N
TIDS2A	\N
FED5	\N
ULM	\N
CTE	\N
IF	\N
PAE	\N
PAF	\N
RAMD	\N
RAD	\N
MDF	\N
MX-P2-P3-P4-M1	\N
MX-I1	\N
MADF	\N
MX-P2-P3-P4-M1-M2	\N
MX-F	\N
MX-I2	\N
MX-P3-P4-M1	\N
MX-M1	\N
MX-I2D+G	\N
MX-P4-M1	\N
MD-P3-P4	\N
MX-M1-M2-M3	\N
MD-M3	\N
CRAF	\N
MPD	\N
ULE	\N
ULMD	\N
MD-P4-M1-M2-M3	\N
MD-M2-M3	\N
MD-I1	\N
MD-M2	\N
MD-P3	\N
MD-P4-M1-M2	\N
MD-P4-M1	\N
MD-P3-P4-M1-M2-	\N
MXP2-M1	\N
MD-M1-M2-M3	\N
MD-P3-P4-M1-M2	\N
MD-F	\N
MD-I1-P3-P4-M1-M2	\N
MD-I1-P3-P4-M1	\N
MD-I1-P3	\N
VEE	\N
MD-M1-M2	\N
MD-I1-P3-P4	\N
MTD	\N
MTM	\N
PHF	\N
ULD	\N
MX-I1-I2	\N
MX-I1D+G	\N
MX-P2-P3-P4-M1-M2-M3	\N
CRANE-SUB-COMPLET	\N
MDD	\N
MTMD	\N
MCD	\N
MDSF	\N
MAS-F	\N
CRAE	\N
MDLGD4M1M2	\N
MDDDP2	\N
MDDDP3P4	\N
MDDDP3	\N
MDDGP2P3	\N
MDDGP2P3P4	\N
MDDGP3	\N
MDDLD3D4M1	\N
MDDDP3P4M1M2	\N
MDDDP3P4M1M2M3	\N
MDDGP2P3P4M1M2M3	\N
MDDGM1M2	\N
MDDGP3P4M1M2	\N
MDDGP2P3P4M1	\N
MDDGM1M2M3	\N
MDDGP2M1M2M3	\N
MDDGP2P3P4M1M2	\N
MDDGM2M3	\N
MDDDP2P3P4M1M2M3	\N
MDDDM1M2M3	\N
MDDDP4M1	\N
MDDDP2P3P4M1	\N
MDDDP3P4M1	\N
MDDDM1	\N
MDDDM1M2	\N
MDDGP4M1M2	\N
MDDGM1	\N
MDGDM2	\N
MDDGM3	\N
MDGDM2M3	\N
MDDDM3	\N
MDGLD4M1	\N
MDDLD3D4	\N
MDLDD3D4	\N
FEDS8	\N
MXMDD3D4M1M2	\N
MXMGD2D3D4M1	\N
CSCSART	\N
V81C2C456	\N
VC24	\N
V81C346	\N
V3DC7ED	\N
V83456	\N
V81C2C3456	\N
V3EE	\N
VD	\N
V81C2C46	\N
VC14D	\N
V2D	\N
V2G	\N
V3GU	\N
VC26I	\N
SACRF	\N
V2I	\N
SA1AB	\N
V1D	\N
VC14G	\N
V82B	\N
V5EE	\N
V1G	\N
V3A	\N
V2E7ED	\N
V81A2A3456	\N
V81A	\N
V3GC	\N
V9	\N
V81C2C4	\N
VC11B	\N
V3DD	\N
V3DC	\N
V7EI	\N
V81B	\N
V1G2G	\N
V82A	\N
V1B	\N
V3EC	\N
V3DU	\N
V2E	\N
V1E	\N
SA2E	\N
V81A2A4	\N
V81C2C	\N
SAAUG	\N
VA12	\N
VA13	\N
SA1C	\N
V81A2C3456	\N
V81C2A	\N
COCC	\N
COCVT1	\N
COCVC	\N
CODITC	\N
COCVE	\N
COCVT2	\N
COCVE1	\N
CODICV1	\N
CODICC	\N
CODICA	\N
CODICV	\N
CODICR	\N
COCVCV	\N
STME	\N
CODIC	\N
FEEP1	\N
V81A2A34	\N
VSEU	\N
SA1A	\N
COACC	\N
COCVA	\N
STI	\N
STMC	\N
ST1	\N
STXE	\N
SD4M256	\N
SM4	\N
SM23	\N
SM7	\N
SM236	\N
SM67	\N
SM2	\N
SD124	\N
SM34	\N
SM26	\N
SD145M246	\N
SD14	\N
SD4M2	\N
SD1	\N
SM2356	\N
SD145	\N
SM4P4	\N
SM235	\N
SM16	\N
SDE	\N
HP23	\N
HDS2B	\N
HDS12C3	\N
HDS12B3	\N
HDS0C	\N
HD4	\N
HDS2B3	\N
HDS2C	\N
HDS0	\N
HDN	\N
HDS0C3C	\N
HDS12A3	\N
HDS0C3B	\N
HDS0AC3	\N
HD0	\N
HDS1A	\N
HDS12C	\N
HDS12B	\N
HDS0C3	\N
HDS2A	\N
HDS0D1	\N
HDS0A3	\N
HDS123	\N
HDS2B3A	\N
HDS1A2	\N
HDS0B1A2A	\N
HDS2	\N
HDS1A23	\N
HEP2	\N
HDS23	\N
HDS01	\N
RDS1A	\N
HDS0A13	\N
HDS4	\N
RP3	\N
RDS123	\N
RDS3A	\N
RDS4A	\N
RP0	\N
RD1A	\N
RD34UD0	\N
RUD	\N
RD0UD0	\N
RP0UD0	\N
UO346	\N
UDS7	\N
UTN56	\N
UO3456	\N
UO6	\N
UO67	\N
UTN0	\N
UDS356	\N
UDN	\N
UO3467	\N
UO23467	\N
UD0	\N
UO36	\N
UO7	\N
UO234	\N
RDN	\N
UED	\N
UEP	\N
UO15	\N
UTN12356	\N
HA2	\N
RDS2	\N
RD1	\N
HAE	\N
RP2	\N
HA4	\N
CT2	\N
RDS134	\N
RD34	\N
RDS3A4	\N
PIE	\N
RDS23	\N
REP3	\N
PYE	\N
RD0	\N
RP23	\N
RDS23A	\N
SLE	\N
SLD0	\N
SCE	\N
SC1	\N
CAD1	\N
CADS236	\N
CAP12	\N
CAD0	\N
CAED1	\N
CAP0	\N
RED0	\N
RDN0	\N
RD23	\N
RDS3A5	\N
RDS12	\N
CAP1	\N
CADS123	\N
CADS36	\N
RDS34	\N
RDS1	\N
RD2	\N
RED23	\N
CADS56	\N
CADS67	\N
CAD3	\N
CAP27	\N
CAED0	\N
CAD11	\N
CADS267	\N
CADS7	\N
CADS0	\N
CADS346	\N
CADS46	\N
CAE1	\N
CADS456	\N
CADN	\N
CAED3	\N
CAD2	\N
MECE	\N
MECSD	\N
CAE	\N
SEF	\N
PH1	\N
PHE1	\N
PH2	\N
PHEI	\N
PH8	\N
PH3H	\N
IS3	\N
IA3	\N
IL1	\N
FEP13	\N
IL178	\N
IL18	\N
TID0	\N
FEP2	\N
TID13	\N
IA6	\N
FEEP1P3	\N
IL6789	\N
FEDS2A	\N
TIDS1A23	\N
IA4	\N
TIP3	\N
FED1	\N
IP2	\N
FEP1	\N
IA3IS1	\N
TIDS234A	\N
IL2	\N
FED2	\N
TIDS1A2	\N
IA2	\N
FEDS3B4A	\N
TIP2	\N
IP13	\N
IA24	\N
TIEP1	\N
IA2IL238	\N
TIP1	\N
IP1	\N
IA4IPE	\N
IS5	\N
IS10	\N
IL10	\N
FEDS2A34C	\N
TID5	\N
TIDS234B	\N
FEDS34C	\N
TIDS2AP3	\N
IS1	\N
TIDS124	\N
FEED6	\N
TIDS24A	\N
FEDS24B	\N
FEDS1	\N
TIDS34B	\N
FEDS3B4AC	\N
FEDS4C	\N
TIED0	\N
FEDS4D	\N
TIDS1A23A	\N
FEDS123	\N
FEE3	\N
TIP3DS2A	\N
FEDS2B4	\N
TIDS4A	\N
TID3	\N
FEDS4A	\N
FEDS2B34A4C	\N
TIDN	\N
FEDS34A4C	\N
FEDS34B	\N
SM25	\N
FEDS34A	\N
TIDS4B	\N
TIDS124A	\N
TIDS234	\N
FEDS234C	\N
TIDS134B	\N
TIDS34	\N
TIED3	\N
TIP3DS1A	\N
TIP3DS1A23A	\N
TIDS1A	\N
FEEP2	\N
FED123	\N
TIDS13	\N
FED56	\N
TIPNDS34	\N
FED0	\N
TIDS3	\N
FEDS234B	\N
IL1789	\N
IS35	\N
TIDS1	\N
MAE	\N
CL4	\N
CEE	\N
CL2	\N
CE1	\N
CL1	\N
CLE	\N
CL245	\N
CL6	\N
CL7	\N
CEF	\N
CNE-CEE	\N
TA125	\N
CADS35	\N
TA3	\N
CAED2	\N
CAD46	\N
CADS23	\N
CAP24	\N
CAP234	\N
CAP13	\N
CAP23	\N
CAP346	\N
FED12	\N
CAP4	\N
DEE2	\N
DB2	\N
DEF1	\N
DEF2	\N
DEF7	\N
DEF4	\N
DEB2	\N
MDDDP2P3	\N
V7ED	\N
FEDS24C	\N
SDEM256	\N
SM347	\N
SD14SM2	\N
SM56	\N
SM4SP4	\N
SD1A4SM246	\N
SDESM234567	\N
HD12	\N
HDS0D2D	\N
HDSE	\N
HDS0A	\N
HP0	\N
RDS234	\N
RD3	\N
RDS13A4	\N
RED1	\N
RD12	\N
RDS0	\N
RP3DS3UO0DS7	\N
RD0UO7	\N
RD0U067	\N
UO2346	\N
UTN1235	\N
PI2	\N
CADS246	\N
HA3	\N
PH7	\N
IL789	\N
IAE	\N
IP4	\N
IPE	\N
IA23ILE	\N
IL12789	\N
IAEIPE	\N
I912	\N
IA1IS1	\N
FEP0	\N
FED3456	\N
FEEP1PN	\N
FEDS4B4C	\N
FEDS4	\N
FEP3DS12A4	\N
FEPN	\N
FEDS3	\N
TIDSE	\N
TID45	\N
TIEP2	\N
TIDS1A3A	\N
TIP4	\N
PH3G	\N
PH3F	\N
PH5	\N
PHE12	\N
PH3D	\N
CN1	\N
FEDS10	\N
TIPN	\N
TIEP14	\N
TIE	\N
TIDS3A3B4	\N
MDS5	\N
TIDS123	\N
MDS2	\N
TA6	\N
TA4	\N
CAP3	\N
CAP124	\N
2DS23A	\N
CADS257	\N
MXMDD2D3D4M1	\N
MXDDP4M1	\N
MXLDD3D4	\N
MXLGD2D3D4	\N
MXDGP4M1	\N
MXDDM1M2M3	\N
MXDDP2P3P4	\N
MXDGP2	\N
CL14	\N
MXDDP2P3	\N
MXDGM1M2	\N
CL124	\N
MDDGM2	\N
MDS8	\N
MDLDD4	\N
MDS15	\N
MDS811	\N
MDS3	\N
MDS	\N
MDS891011	\N
MDMDI1I2I3D2D3D4M1	\N
MDS10	\N
MDMDD2D3D4M1	\N
MDLDI2I3	\N
MDDGP4M1M2M3	\N
MDLDD2D3D4M1	\N
MDDGP3P4M1M2M3	\N
MDLGD3D4	\N
MDDDP3P4M2	\N
MDDGD3D4	\N
MDDDI1	\N
TIED34	\N
TIDS243	\N
COVT2	\N
FEDS2A4	\N
FEDS124C	\N
ST7	\N
V3E	\N
MXSDC	\N
MXSII	\N
TIDS34A	\N
HD2	\N
FED3A	\N
DEFE	\N
DB3	\N
HDS3A	\N
DB1	\N
ED0	\N
TIP14	\N
SM234567	\N
SDEM24567	\N
FB7	\N
FB11	\N
PHE2	\N
CAP0DS0	\N
CADS1	\N
ND0	\N
SDEM23456	\N
CADS5	\N
TIDS0	\N
SA1B	\N
SACRD	\N
SACRG	\N
V81C2C34	\N
VC12A	\N
SA10	\N
VC11A	\N
V2A	\N
VE1	\N
SA2F	\N
V846	\N
V82A346	\N
MDDGP4M1	\N
MDDDP4M1M2	\N
IAEIL178	\N
MXDGP4M1M2M3	\N
TIDS3B4B	\N
HDS0D13	\N
SDEM2	\N
HENT	\N
HED0	\N
IAF	\N
MDDDP4M1M2M3	\N
MXDGM3	\N
MDS322	\N
MDS89	\N
SD4SM23457	\N
CL5	\N
FEDS2	\N
FEDS1234	\N
ZDSO	\N
UO27	\N
2D23	\N
ZDO	\N
IAE34IPE	\N
IL145789	\N
IA4IP3	\N
HDO	\N
SM3	\N
MDMGD2D3M1	\N
SD14SM246	\N
FEDS0	\N
TIDS1A2A4A	\N
FED23	\N
MDFM1-M2	\N
MDM1-M2	\N
MDM1-M3	\N
MDM1-M2-M3	\N
CH3	\N
CH2	\N
CHE	\N
FB9	\N
FB1	\N
BO1258	\N
HDS10	\N
HDS03	\N
HD1	\N
UO56	\N
SME	\N
IL4	\N
HUSE	\N
TID4	\N
TIDS1A34B	\N
ULSE	\N
TIDS2	\N
PH4	\N
PH3B	\N
SAAUD	\N
VC14I	\N
TIFSE	\N
CL2345	\N
CE4	\N
PY345	\N
SC3	\N
MDM3	\N
MDP4	\N
MDP2-P3-P4-M1-M2	\N
MDM1	\N
MDP1-M1-M2	\N
MDP1-M1	\N
MDM2-M3	\N
MDP3	\N
MDM2	\N
MDP3-P4-M1-M2-M3	\N
MDC	\N
MDP1-P3-P4	\N
MDE	\N
MDP2-P3-P4	\N
MDP3-P4	\N
MDP4-M1-M2-M3	\N
MDP1	\N
MXS3	\N
HYI	\N
TIDS3A4	\N
IL7	\N
CH1	\N
CRIN	\N
CROI	\N
MDP4-M1-M2	\N
MDI-P3-P4-M1-M2-M3	\N
MDP4-M1	\N
MDI-P3-P4-M1	\N
MDI-P3-P4	\N
MDI-P3-P4-M1-M1-M3	\N
MXM1-M2	\N
MDI-P3-P4-M1-M2	\N
FEDS3A	\N
MDDGM12	\N
UO5UDS2456	\N
SD1ASM234567	\N
MD-M1	\N
MX-P3	\N
MD-P3-P4-M3	\N
MD-P4	\N
MX-P4-M1-M2-M3	\N
MD-I1-P4-M1-M2	\N
MD-I1-P4	\N
MDDIP3	\N
MD-I1D+G	\N
CMCE	\N
MD-I1-P4-M1-M2-M3	\N
CAD67	\N
CADS2346	\N
CAPN	\N
CAD06	\N
CAE3	\N
PH3E	\N
PH3DEF	\N
MA1	\N
FEDS46	\N
MXLDD3	\N
MXDGM1	\N
MXDGM2	\N
MXDDP4M1M2M3	\N
MXMDD3D4M1	\N
MXMGD4M1M2	\N
MDDIMI	\N
MXDGE	\N
MXLGD2D3	\N
MXDGP4M1M2	\N
MXDDP4M1M2	\N
MXDDM3	\N
MXMDD4M1M2	\N
MXDDM2M3	\N
MXDDP3P4	\N
MXDDP2	\N
MXDGM2M3	\N
MXDGM1M2M3	\N
MXDDP3	\N
MXDGP3P4	\N
MXDDM1M2	\N
MXDDP3P4M1	\N
MXDDP2P3P4M1	\N
MXDGP2P3P4	\N
MDS6	\N
MDS7	\N
MDS46	\N
MDS34	\N
MDS234	\N
MDS14	\N
MDS58911	\N
MDS1011	\N
SDEM246	\N
MDS124	\N
MDS0	\N
MDS23	\N
MDS22	\N
MDS911	\N
MDS24	\N
MDS236	\N
MDS210	\N
MDIDMI	\N
MDDM2M3	\N
MDDGP4	\N
MDMDD4M1	\N
MDDGI2I3CA	\N
MDDGP3P4	\N
MDMGD2D3D4M1M2	\N
MDDJI	\N
MDDDP4	\N
MDDDI3CA	\N
MDDGP3P4M1	\N
MDMGD4M1M2	\N
MDLDD2D3	\N
MDLGD3	\N
MDDGI2I3C	\N
MDMDD4M1M2	\N
MDMDD3D4M1	\N
MDLGD2	\N
MDLGD2D3D4	\N
MDDDMI	\N
FEP134	\N
RUS	\N
PH34	\N
MXDM1-M2-M3	\N
MDDM1-M2-M3	\N
MXDP4-M1-M2-M3	\N
DEE	\N
SE	\N
MDMGD2D3D4M1	\N
MDGDP4M1M2	\N
MXDGP3P4M1M2M3	\N
MX	\N
MDMGD3D4M1M2M3	\N
TNAE	\N
MT3P	\N
CRE	\N
INDGI1I2	\N
MXDDP4	\N
INS	\N
MXDGP3P4M1M2	\N
MXS	\N
MXDGP4	\N
MXDDP3P4M1M2	\N
MDS111	\N
MDS810	\N
MDDDP1P2P3P4M1M2	\N
MDDGI2CP2P3P4M1M2	\N
MDDDP3M1M2	\N
MDDDCP1P2P3M1M2	\N
MDDGI3CP1P2P3P4M1M2M	\N
MDDDI2	\N
MDDGP1P2P3P4M1M2	\N
MDDMI1I2I3C	\N
MXCP1P2P3P4M1M2	\N
MXDGI1I2I3CP1	\N
MXDDCP1	\N
MDDGCP2P3P4M1M2M3	\N
MDDDCP2P3P4M1M2	\N
MDDGP3M1	\N
MDS13	\N
MXMDD3P4	\N
MDDGCP3P4M1	\N
MDDDCP3P4M1	\N
MXDDCP3P4	\N
MXDGCP3P4	\N
MXDGCP3P4M1	\N
MXDDI2I3CP3P4	\N
MXDMI2I3CP3P4	\N
VF	\N
VE	\N
MID	\N
UO0	\N
FEED	\N
FEED3	\N
PHFD	\N
RDS	\N
RPN	\N
ISE	\N
MIE	\N
MXLGD4	\N
MXDDPI	\N
MIDX	\N
MIED	\N
MIM6	\N
MIM5	\N
MIDF	\N
MIMDX	\N
MIM	\N
TA1	\N
CUE	\N
NAE	\N
FID	\N
FIM	\N
TIDS	\N
ILE	\N
SUE	\N
HAF	\N
UENT	\N
UDS	\N
RENT	\N
HDS0123	\N
HED234	\N
STE	\N
VC15G	\N
VC14	\N
VC15D	\N
MIP	\N
CIE	\N
TAF	\N
PHFP	\N
IE	\N
SAF	\N
VC1A4D5D	\N
HD14	\N
TOE	\N
CSF	\N
CLF	\N
HDS013	\N
MDDDI1I2I3	\N
MDS29	\N
HDS0D	\N
FRBE	\N
TMTDM	\N
CRTI	\N
CRPI	\N
IQ2	\N
SM2467	\N
CRFI	\N
MXLDPI	\N
MTF	\N
MCF	\N
ULF	\N
RAF	\N
TCAE	\N
TCAF	\N
TTAE	\N
TTAF	\N
CSSCE	\N
PHD	\N
PHP	\N
HUF	\N
MX-P2	\N
MX-P3-M1	\N
MX-M2	\N
MDDP4	\N
MX-P4-M1-M2	\N
MX-P3-P4-M1-M2-M3	\N
MD-COMPLETED+G	\N
MD-I1+I2D+G	\N
MD-I1-	\N
FEF	\N
VRF	\N
TIFF	\N
MD-P3-P4M1-M2-M3	\N
MD-I1-P4-M1	\N
MX-P2-P3	\N
MX-P3-P4	\N
MD-I1-P3-M1-M2	\N
MD-I1G+I1D	\N
MD-M1_M2-M3	\N
MD-COMPLETE	\N
MD-	\N
CF	\N
CR-F	\N
MD-MIND	\N
TTCAF	\N
MXF	\N
MX-SUBCOMPLET	\N
MTPM	\N
MCPM	\N
FEMP	\N
TIFMP	\N
MD-M1-M3	\N
MX-P3-M1-M2	\N
UNE	\N
PVXF	\N
CMCMP	\N
CMCDM	\N
CMCM	\N
CMCMD	\N
RDE	\N
CS-SC-PM	\N
SCSE	\N
VE-F	\N
FE	\N
FIB	\N
TMTD	\N
TMTM	\N
TMTE	\N
TITDM	\N
TTS-MD	\N
TITP	\N
TITPM	\N
STF	\N
CSST	\N
COSE	\N
COD	\N
COMD	\N
COM	\N
TIP0DS1A2A34	\N
\.


--
-- Data for Name: controle_f_fragge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_fragge (f_fragge, description) FROM stdin;
\.


--
-- Data for Name: controle_f_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_genre (f_genre, description) FROM stdin;
COLUMBA	\N
VIPERA	\N
NATRIX	\N
CORONELLA	\N
COLUBER	\N
MALPOLON	\N
ELAPHE	\N
ANGUIS	\N
LACERTA	\N
TRINGA	\N
MICROTUS	\N
APODEMUS	\N
ARVICOLA	\N
PLIOMYS	\N
TERRICOLA	\N
CLETHRIONOMYS	\N
GLIS	\N
ELIOMYS	\N
CRICETUS	\N
MUSCARDINUS	\N
LAGURUS	\N
PYRRHOCORAX	\N
GARRULUS	\N
PELODYTES	\N
HYLA	\N
BUFO	\N
AQUILA	\N
STRIX	\N
OTUS	\N
ASIO	\N
AEGOLIUS	\N
ATHENE	\N
BUBO	\N
HIERAAETUS	\N
CIRCUS	\N
FALCO	\N
CF.BUTEO	\N
AEGYPIUS	\N
GYPAETUS	\N
COTURNIX	\N
CORVUS	\N
ALECTORIS	\N
RANA	\N
PERDIX	\N
TURDUS	\N
PICA	\N
CUCULUS	\N
ALAUDA	\N
CREX	\N
NYCTEA	\N
CF.CARDUELIS	\N
CARDUELIS	\N
MOTACILLA	\N
CF.RALLUS	\N
CF.FICEDULA	\N
CF.NUCIFRAGA	\N
PHYLLOSCOPUS	\N
EMBERIZA	\N
HIRUNDO	\N
CHLIDONIAS	\N
HALIAETUS	\N
SCOLOPAX	\N
STERNA	\N
FRATERCULA	\N
URIA	\N
PLUVIALIS	\N
CHARADRIUS	\N
LARUS	\N
MONTIFRINGILLA	\N
PETRONIA	\N
OENANTHE	\N
PHOENICURUS	\N
ERITHACUS	\N
DELICHON	\N
CINCLUS	\N
LOXIA	\N
COCCOTHRAUSTES	\N
PINICOLA	\N
PYRRHULA	\N
CARPODACUS	\N
FRINGILLA	\N
PLECTROPHENAX	\N
ANTHUS	\N
STURNUS	\N
LULLULA	\N
GALERIDA	\N
APUS	\N
GALLUS	\N
RALLUS	\N
DENDROCOPOS	\N
AYTHYA	\N
CF.ANAS	\N
ANAS	\N
BUCEPHALA	\N
MACULARIA	\N
ORYCTOLAGUS	\N
CHONDRINA	\N
CANDIDULA	\N
HELICODONTA	\N
RUMINA	\N
CEPAEA	\N
CLAUSILIA	\N
HELICELLA	\N
JAMINIA	\N
OXYCHILUS	\N
RETINELLA	\N
EOBANIA	\N
CERVUS	\N
PUPILLA	\N
CECILIOIDES	\N
TESTACELLA	\N
LIMAX	\N
ACICULA	\N
ABIDA	\N
TROCHOIDEA	\N
MONACHA	\N
BOS/BISON	\N
EQUUS	\N
CAPRA	\N
CAPREOLUS	\N
ELEPHAS	\N
BITTIUM	\N
BOS	\N
PASSER	\N
PRUNELLA	\N
SYLVIA	\N
LANIUS	\N
SERINUS	\N
MYTILUS	\N
LUCINOMA	\N
LIMA	\N
CHAMA	\N
CARDITA	\N
VENUS	\N
STRIARCA	\N
CHLAMYS	\N
GIBBULA	\N
ARCA	\N
ACCIPITER	\N
SAXICOLA	\N
PTYONOPROGNE	\N
CAPRIMULGUS	\N
PICOIDES	\N
JYNX	\N
CORACIAS	\N
EUDROMIAS	\N
TETRAO	\N
GALLINAGO	\N
BUTEO	\N
NUMENIUS	\N
PORZANA	\N
TROGLODYTES	\N
CORACIA	\N
TRITURUS	\N
PODARCIS	\N
DAMA	\N
CANIS	\N
LITTORINA	\N
HOMALOPOMA	\N
JUJUBINUS	\N
PATELLA	\N
VEXILLUM	\N
IND	\N
CALLIOSTOMA	\N
VRAIA	\N
CALLISTA	\N
CLANCULUS	\N
PECTENIDAE	\N
MONODONTA	\N
NASSARIUS	\N
TRIVIA	\N
RISSOA	\N
DIODORA	\N
COLUMBELLA	\N
FUSINUS	\N
TRICOLIA	\N
PECTINIDAE	\N
MITRA	\N
EROSARIA	\N
MELARAPHE	\N
TUBERCULATA	\N
SPONDYLUS	\N
OSTREA	\N
PANTHERA	\N
ALVANIA	\N
RUPICAPRA	\N
SUS	\N
BISON	\N
DICERORHINUS	\N
LYNX	\N
URSUS	\N
CF.RUPICAPRA	\N
VULPES	\N
MARMOTA	\N
TALPA	\N
CF.EQUUS	\N
TARENTOLA	\N
PUFFINUS	\N
CF. AYTHYA	\N
CF.CHARADRIUS	\N
CF.EUDROMIAS	\N
CF. CALIDRIS	\N
HOMO	\N
COELODONTA	\N
PELOBATES	\N
MUSCICAPA	\N
CF.TURDUS	\N
CF.AEGYPIUS	\N
RANGIFER	\N
MEGALOCEROS	\N
RATTUS	\N
MUS	\N
SOREX	\N
CROCIDURA	\N
NEOMYS	\N
RHINOLOPHUS	\N
MINIOPTERUS	\N
BARBASTELLA	\N
MYOTIS	\N
CF.CANIS	\N
PANTHERA LEO	\N
MELES	\N
FELIS	\N
CF.DAMA	\N
BURHINUS	\N
MACACA	\N
PONGO	\N
GORILLA	\N
PAN	\N
AUSTRALOPITHECUS	\N
EUROPAEUS	\N
ALGIRUS	\N
DAVIDI	\N
HEMIECHINUS	\N
GALEMYS	\N
DESMANA	\N
SUNCUS	\N
MYOSOREX	\N
DEPRANOSOREX	\N
PETENYIA	\N
DEINSDORFIA	\N
BLARINELLA	\N
BERENENDIA	\N
EPISORICULUS	\N
SORICULUS	\N
BLARINOIDES	\N
TADARIDA	\N
SAUROMYS	\N
VESPERTILIO	\N
EPTESICUS	\N
NYCTALUS	\N
PIPISTRELLUS	\N
PLECOTUS	\N
LASIURUS	\N
ALLOPHAIOMYS	\N
DYNAROMYS	\N
ONDRATA	\N
LEMMUS	\N
MYOPUS	\N
DICROSTONYX	\N
ELLOBIUS	\N
MIMOMYS	\N
UNGAROMYS	\N
SPALAX	\N
PROSIPHNEUS	\N
MYOSPALAX	\N
SICISTA	\N
ALLACTAGA	\N
VILLANYIA	\N
MESOCRICETUS	\N
ALLOCRICETUS	\N
PEROMYSCUS	\N
CRICETULUS	\N
MERIONES	\N
CRICETINUS	\N
CASTOR	\N
TROGONTHERIUM	\N
MYOCASTOR	\N
HYSTRIX	\N
GLIRULUS	\N
MYOMIMUS	\N
DRYOMYS	\N
SCIURUS	\N
PTEROMYS	\N
TAMIAS	\N
CITELLUS	\N
CYNONYS	\N
RHAGAMYS	\N
ACOMYS	\N
MICROMYS	\N
LEMNISCONYS	\N
HYDROCHOERUS	\N
LEPUS	\N
HYPOLAGUS	\N
OCHOTONOIDES	\N
PROLAGOMYS	\N
OCHOTONA	\N
PROLAGUS	\N
MUSTELA	\N
MARTES	\N
GULO	\N
LUTRA	\N
GALICTIS	\N
MEPHITIS	\N
BARANOGALE	\N
VORMELA	\N
PANONICTIS	\N
MELLIVORA	\N
ENHYDRA	\N
CUON	\N
FENNECUS	\N
ALOPEX	\N
NYCTEREUTES	\N
LYCAON	\N
AILURUS	\N
HELARCTOS	\N
TREMARCTOS	\N
MELUSUS	\N
PLIONARCTOS	\N
ACINONYX	\N
CARACAL	\N
PUMA	\N
HOMOTHERIUM	\N
MACHAIRODUS	\N
MEGANTERON	\N
GENETTA	\N
HERPESTES	\N
VIVERRA	\N
MUNGO	\N
FOSSA	\N
SURICATA	\N
CROCUTA	\N
HYAENA	\N
PROTELES	\N
EURYBOAS	\N
ODOBAENUS	\N
PHOCA	\N
PUSA	\N
PAGOPHILUS	\N
HALICHOERUS	\N
ERIGNATHUS	\N
CYSTOPHORA	\N
MONACHUS	\N
PHACOCHOERUS	\N
HIPPOPOTAMUS	\N
CAMELUS	\N
LAMA	\N
GIRAFFA	\N
OKAPIA	\N
SIVATHERIUM	\N
CROIZETOCEROS	\N
EUCLADOCEROS	\N
ALCES	\N
PRAEMEGACEROS	\N
ARVERNOCEROS	\N
MUNTIACUS	\N
ELAPHURUS	\N
AXIS	\N
HYELOPHUS	\N
SIKA	\N
RUCERVUS	\N
PRJEVALSKIUM	\N
PUDU	\N
OZOTOCEROS	\N
MAZAMA	\N
ODOCOILEUS	\N
HYDROPOTES	\N
ANTILOCAPRA	\N
LEPTOBOS	\N
BUBALUS	\N
SYNCERUS	\N
SOERGILIA	\N
OVIBOS	\N
PRAEOVIBOS	\N
GAZELLOSPIRA	\N
ALCELAPHUS	\N
ANTIDORCAS	\N
ADDAX	\N
BOSELAPHUS	\N
GAZELLA	\N
CONNOCHAETES	\N
DAMALISCUS	\N
HIPPOTRAGUS	\N
KOBUS	\N
ORYX	\N
SYLVICAPRA	\N
TAUROTRAGUS	\N
TRAGELAPHUS	\N
SAIGA	\N
MYOTRAGUS	\N
GALLOGORAL	\N
PROCAMPTOCERAS	\N
OVIS	\N
MEGALOVIS	\N
AMNOTRAGUS	\N
HEMITRAGUS	\N
PLIOTRAGUS	\N
HIPPARION	\N
TAPIRUS	\N
COELONDONTA	\N
ELASMOTHERIUM	\N
DICEROS	\N
RHINOCEROS	\N
CERAROTHERIUM	\N
STEPHANORHINUS	\N
ANANCUS	\N
LOXODONTA	\N
MAMMUTHUS	\N
DELPHINUS	\N
TURSIOPS	\N
GLOBICEPHALA	\N
GRAMPUS	\N
ORCINUS	\N
PHOCAENA	\N
DELPHINAPTERUS	\N
MONODON	\N
PHYSETER	\N
HYPEROODON	\N
ZYPHIUS	\N
BALAENOPTERA	\N
MEGAPTERA	\N
BALAENA	\N
GAVIA	\N
PODICEPS	\N
TACHYBAPTUS	\N
PODILYMBUS	\N
DIOMEDEA	\N
OCEANODROMA	\N
OCEANITES	\N
HYDROBATES	\N
PELAGODROMA	\N
BULWERIA	\N
PTERODROMA	\N
FULMARUS	\N
CALONECTRIS	\N
SULA 	\N
PELECANUS	\N
PHALACROCORAX	\N
BOTAURUS	\N
IXOBRYCHUS	\N
ARDEOLA	\N
NYCTICORAX	\N
BULBUCUS	\N
EGRETTA	\N
ARDEA	\N
PLATALEA	\N
PLEGADIS	\N
THRESKIORNIS	\N
GERONTICUS	\N
CICONIA	\N
PHOENICOPTRUS	\N
CYGNUS	\N
BRANTA	\N
ANSER	\N
MARMARONETTA	\N
ALOPOCHEN	\N
AIX	\N
TADORNA	\N
NETTA	\N
HISTRIONICUS	\N
CLANGULA	\N
MELANITTA	\N
SOMATERIA	\N
POLYCTICTA	\N
MERGUS	\N
OXYURA	\N
NEOPHRON	\N
GYPS	\N
HALIAEETUS	\N
CIRCAETUS	\N
PERNIS	\N
MILVUS	\N
ELANUS	\N
PANDION	\N
LAGOPUS	\N
TETRAOGALLUS	\N
BONASA	\N
FRANCOLINUS	\N
PHASIANUS	\N
CHRYSOLOPUS	\N
TURNIX	\N
GRUS	\N
ANTHROPOIDES	\N
OTIS	\N
TETRAX	\N
CHLAMYDOTIS	\N
PORPHYRIO	\N
PORPHYRULLA	\N
GALLINULA	\N
FULICA	\N
SYRRHAPTES	\N
PTEROCLES	\N
STREPTOPELIA	\N
CLAMATOR	\N
COCCYZUS	\N
TYTO	\N
GLAUCIDIUM	\N
CHORDEILES	\N
ALCEDO	\N
CERYLE	\N
MEROPS	\N
UPUPA	\N
PICUS	\N
DENDROCOPS	\N
DRYOCOPUS	\N
HAEMATOPUS	\N
VANELLUS	\N
HOPLOPTERUS	\N
CHETTUSIA	\N
ARENARIA	\N
CALIDRIS	\N
LIMICOLA	\N
LIMNODROMUS	\N
MICROPALAMA	\N
LYMNOCRYPTES	\N
PHALAROPUS	\N
STERCORARIUS	\N
PAGOPHILA	\N
RHODOSTHETIA	\N
RISSA	\N
LIMOSA	\N
ACTITIS	\N
XENUS	\N
PHILOMACHUS	\N
TRYNGITES	\N
BARTRAMIA	\N
RECURVIROSTRA	\N
HIMANTOPUS	\N
CURSORIUS	\N
GLAEROLA	\N
GELOCHELIDON	\N
ALCA	\N
ALLE	\N
CEPHUS	\N
CHERSOPHILUS	\N
CALANDRELLA	\N
MELANOCRYPHA	\N
EREMOPHILA	\N
RIPARIA	\N
ORIOLUS	\N
BOMBYCILLA	\N
PERISOREUS	\N
CYANOPICA	\N
NUCIFRAGA	\N
CETTIA	\N
LOCUSTELLA	\N
ACROCEPHALUS	\N
CISTICOLA	\N
HIPPOLAIS	\N
CERCOTRICHAS	\N
REGULUS	\N
CATHARUS	\N
ZOOTHERA	\N
PARUS	\N
AEGITHALOS	\N
REMIZ	\N
SITTA	\N
TICHODROMA	\N
CERTHIA	\N
BUCANETES	\N
MILARIA	\N
CALCARIUS	\N
MUSICAPA	\N
FICEDULA	\N
ACANTHOCHITONA	\N
BARLEEIA	\N
CYCLOPE	\N
POLLIA	\N
PISANIA	\N
CERITHIOPSIS	\N
MARSHALLORA	\N
FISSURELLA	\N
TARSIGER	\N
LUSCINIA	\N
CERITHIUM	\N
IRANIA	\N
TESTUDO	\N
TURRITELLA	\N
EMYS	\N
MAUREMYS	\N
DERMOCHELYS	\N
CARETTA	\N
LEPIDOCHELYS	\N
CHELONIA	\N
ERETHMOCHELYS	\N
BLANUS	\N
HEMIDACTYLUS	\N
PHYLLODACTYLUS	\N
CYRTODACTYLUS	\N
AGAMA	\N
ALGYROIDES	\N
OPHISOPS	\N
PSAMMODROMUS	\N
MUREX	\N
ACANTHODACTYLUS	\N
EREMIAS	\N
MURICOPSIS	\N
OCENEBRA	\N
OCINEBRINA	\N
MITRELLA	\N
MANGELIA	\N
POMATIAS	\N
GRANARIA	\N
SOLATOPUPA	\N
SUCCINEA	\N
DISCUS	\N
VITREA	\N
AEGOPINELLA	\N
XEROTRICHA	\N
CERNUELLA	\N
OPHISAURUS	\N
ABLEPHARUS	\N
OPHIOMORUS	\N
CHALCYDES	\N
TYPHLOPS	\N
ERYX	\N
ARGNA	\N
MACROPROTODON	\N
TELESCOPUS	\N
SALAMANDRA	\N
SALAMANDRINA	\N
CHIOGLOSSA	\N
PLEURODELES	\N
EUPROCTUS	\N
PROTEUS	\N
BOMBINA	\N
DISCOGLOSSUS	\N
ALYTES	\N
PLIOLAGUS	\N
SPELEOMANTES	\N
CORNU	\N
CHAMAELEO	\N
VERMETUS	\N
RISSOINA	\N
CANTAREUS	\N
GALBA	\N
SPHINCTEROCHILA	\N
XEROSECTA	\N
TONNA	\N
HALIOTIS	\N
\.


--
-- Data for Name: controle_f_icirconference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_icirconference (f_icirconference, description) FROM stdin;
1	\N
2	\N
3	\N
\.


--
-- Data for Name: controle_f_ilongueur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_ilongueur (f_ilongueur, description) FROM stdin;
1	\N
2	\N
3	\N
4	\N
\.


--
-- Data for Name: controle_f_lateralite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_lateralite (f_lateralite, description) FROM stdin;
D	\N
G	\N
DG	\N
I	\N
...	\N
\.


--
-- Data for Name: controle_f_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_mode (f_mode, description) FROM stdin;
\.


--
-- Data for Name: controle_f_moulage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_moulage (f_moulage, description) FROM stdin;
0	\N
412	\N
493	\N
165	\N
502	\N
1	\N
508	\N
2	\N
475	\N
153	\N
12	\N
16	\N
807	\N
\.


--
-- Data for Name: controle_f_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_ordre (f_ordre, description) FROM stdin;
COLUMBIFORMA	\N
CHARADRIIFORMA	\N
PASSERIFORMA	\N
ACCIPITRIFORMA	\N
STRIGIFORMA	\N
FALCONIFORMA	\N
GALLIFORMA	\N
CUCULIFORMA	\N
GRUIFORMA	\N
APODIFORMA	\N
PICIFORMA	\N
ANSERIFORMA	\N
HERB	\N
IND	\N
MYTILOIDA	\N
PTERIOIDA	\N
CAPRIMULGIFORMA	\N
CORACIIFORMA	\N
URODELES	\N
NEOGASTROPODA	\N
ARCOIDA	\N
CERITHIDAE	\N
RISSOIDAT	\N
LAGOMORPHA	\N
SUP	\N
PROCELLARIIFORM	\N
PH	petit herbivore
GH	grand herbivore
PRIMATA	\N
INSECTIVORA	\N
CHIROPTERA	\N
RODENTIA	\N
CARNIVORA	\N
ARTIODACTYLA	\N
PERISSODACTYLA	\N
PROBOSCIDEA	\N
CETACEA	\N
GAVIIFORMA	\N
PODICIPEDIFORMA	\N
PROCELLARIIFORMA	\N
PELECANIFORMA	\N
CICONIIFORMA	\N
PHOENICOPTERIFORMA	\N
PTEROCLIDIFORMA	\N
CHELONIA	\N
URODELA	\N
ARCHAEOGASTROPODA	\N
SQUAMATA	\N
POLYPLACOPHORA	\N
BIVALVIA	\N
ANURA	\N
APOGASTROPODA	\N
PULMONATA	\N
MESOGASTROPODA	\N
VENEROIDA	\N
\.


--
-- Data for Name: controle_f_oxyde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_oxyde (f_oxyde, description) FROM stdin;
MN	\N
\.


--
-- Data for Name: controle_f_pathologie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_pathologie (f_pathologie, description) FROM stdin;
P	\N
\.


--
-- Data for Name: controle_f_pelote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_pelote (f_pelote, description) FROM stdin;
\.


--
-- Data for Name: controle_f_percussion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_percussion (f_percussion, description) FROM stdin;
\.


--
-- Data for Name: controle_f_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_photo (f_photo, description) FROM stdin;
P1	\N
O1	\N
--	\N
T1	\N
U1	\N
S1	\N
R	\N
G1	\N
IN	\N
\.


--
-- Data for Name: controle_f_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_reference (f_reference, description) FROM stdin;
\.


--
-- Data for Name: controle_f_responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_responsable (f_responsable, description) FROM stdin;
\.


--
-- Data for Name: controle_f_restauration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_restauration (f_restauration, description) FROM stdin;
P15	\N
R13	\N
G	\N
I9	\N
T13	\N
Q13	\N
\.


--
-- Data for Name: controle_f_saisie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_saisie (f_saisie, description) FROM stdin;
\.


--
-- Data for Name: controle_f_sauvefrag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_sauvefrag (f_sauvefrag, description) FROM stdin;
\.


--
-- Data for Name: controle_f_sexe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_sexe (f_sexe, description) FROM stdin;
M	\N
F	\N
\.


--
-- Data for Name: controle_f_ssespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_ssespece (f_ssespece, description) FROM stdin;
VETUS	\N
LAZARETENSIS	\N
MEDITERRANEUS	\N
PRIMIGENIUS	\N
\.


--
-- Data for Name: controle_f_ssfamille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_ssfamille (f_ssfamille, description) FROM stdin;
\.


--
-- Data for Name: controle_f_stdent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_stdent (f_stdent, description) FROM stdin;
\.


--
-- Data for Name: controle_f_stserie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_stserie (f_stserie, description) FROM stdin;
\.


--
-- Data for Name: controle_f_taille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_taille (f_taille, description) FROM stdin;
G	\N
0	micro
R	\N
.	\N
P	\N
1	petite
2	moy
12	pet/moy
3	gde
4	tr�s gde
34	gd/t.gd
\.


--
-- Data for Name: controle_f_tissu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_tissu (f_tissu, description) FROM stdin;
DEN	\N
MIX	\N
LAZ	\N
COM	\N
SPO	\N
DE	\N
IND	\N
\.


--
-- Data for Name: controle_f_traitement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_traitement (f_traitement, description) FROM stdin;
U	\N
O10	\N
\.


--
-- Data for Name: controle_f_tranchant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_tranchant (f_tranchant, description) FROM stdin;
\.


--
-- Data for Name: controle_f_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_type (f_type, description) FROM stdin;
\.


--
-- Data for Name: controle_f_typedos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typedos (f_typedos, description) FROM stdin;
L	long
P	plat
C	court
\.


--
-- Data for Name: controle_f_typos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos1 (f_typos1, description) FROM stdin;
1	\N
2	\N
3	\N
I	\N
5	\N
6	\N
\.


--
-- Data for Name: controle_f_typos2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos2 (f_typos2, description) FROM stdin;
DE	\N
FE	\N
MP	\N
TH	\N
MD	\N
HU	\N
AN	\N
MC	\N
TA	\N
CR	\N
MT	\N
PO	\N
ZA	\N
CS	\N
AX	\N
T	\N
C	\N
UL	\N
PH	\N
HY	\N
RA	\N
VE	\N
IN	\N
SC	\N
--	\N
CT	\N
PA	\N
CP	\N
MA	\N
SE	\N
IL	\N
EQ	\N
MI	\N
\.


--
-- Data for Name: controle_f_typos3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos3 (f_typos3, description) FROM stdin;
INF	\N
IND	\N
O7	\N
CMC	\N
TIT	\N
O1	\N
SC	\N
MET	\N
4	\N
PHI	\N
I	\N
HU	\N
2	\N
TIF	\N
STY	\N
ZEU	\N
RU	\N
MXD	\N
BAS	\N
FE	\N
RA	\N
T3	\N
UL	\N
CA	\N
MDD	\N
CRA	\N
MAD	\N
COQ	\N
SUP	\N
O11	\N
TMT	\N
CO	\N
MAX	\N
5	\N
ACR	\N
3	\N
OI	\N
SES	\N
CH	\N
BI	\N
TA	\N
MD	\N
BA	\N
ZY	\N
PHQ	\N
ST	\N
---	\N
PHP	\N
TC3	\N
CU	\N
NA	\N
SA	\N
C1	\N
C2	\N
DV	\N
MDS	\N
MAS	\N
O6	\N
SCA	\N
T5	\N
CI	\N
TI	\N
LI	\N
T12	\N
T6	\N
T8	\N
L3	\N
C4	\N
C6	\N
C5	\N
L1	\N
L5	\N
VI	\N
C7	\N
T9	\N
C3	\N
T7	\N
T1	\N
L6	\N
T2	\N
T4	\N
L4	\N
T13	\N
L2	\N
CDI	\N
O3	\N
O8	\N
O10	\N
O13	\N
O2	\N
O4	\N
O5	\N
O9	\N
O12	\N
T11	\N
TL	\N
P5	\N
T10	\N
INC	\N
FRO	\N
ZYG	\N
PE	\N
NAS	\N
TEM	\N
PAR	\N
OCC	\N
PAL	\N
VOM	\N
BM	\N
BO	\N
PRE	\N
P	\N
IN	\N
CDD	\N
CD9	\N
CD5	\N
CD2	\N
CD7	\N
CD4	\N
CD8	\N
L7	\N
CD6	\N
CD3	\N
FR	\N
3D	\N
MXS	\N
CN	\N
CER	\N
CR	\N
1	\N
MCV	\N
MX	\N
FEM	\N
UN	\N
PVX	\N
RD	\N
FIB	\N
CL	\N
VE	\N
PHD	\N
MT	\N
MC	\N
MP	\N
PV	\N
T	\N
C	\N
PA	\N
DE	\N
TE	\N
PL	\N
OC	\N
SPH	\N
QI	\N
TIFI	\N
RAU	\N
UR	\N
SQ	\N
AGL	\N
ANG	\N
SPE	\N
DEN	\N
Q	\N
ETH	\N
LAC	\N
SIND	\N
PH	\N
PT	\N
SP	\N
GS	\N
PHT	\N
PHC	\N
\.


--
-- Data for Name: controle_f_typos4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos4 (f_typos4, description) FROM stdin;
DE	\N
CA	\N
IN	\N
HU	\N
TI	\N
TA	\N
--	\N
34	\N
FE	\N
P1	\N
LA	\N
CN	\N
D	\N
L	\N
GR	\N
P3	\N
T	\N
3	\N
C	\N
25	\N
2	\N
Q	\N
RA	\N
MA	\N
C4	\N
CL	\N
UL	\N
SL	\N
PY	\N
HA	\N
CT	\N
PI	\N
SC	\N
PA	\N
RU	\N
6	\N
5	\N
P2	\N
C1	\N
PE	\N
CE	\N
.	\N
P	\N
C3	\N
AF	\N
I	\N
4	\N
CU	\N
NA	\N
FI	\N
1	\N
SU	\N
CI	\N
TO	\N
CS	\N
MI	\N
MD	\N
GO	\N
OI	\N
BTY	\N
PT	\N
IL	\N
E	\N
TIF	\N
MC	\N
S	\N
\.


--
-- Data for Name: controle_f_typos5; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos5 (f_typos5, description) FROM stdin;
J	\N
L	\N
34	doigt III ou IV
I	\N
4	\N
6	\N
3	\N
D	\N
F	\N
M	\N
E	\N
A	\N
2	\N
5	\N
1	\N
P	\N
7	\N
25	doigt II ou V
EX	\N
IN	\N
GR	\N
\.


--
-- Data for Name: controle_f_typos6; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_f_typos6 (f_typos6, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_angle1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_angle1 (ff_angle1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_angle2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_angle2 (ff_angle2, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_aspect1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_aspect1 (ff_aspect1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_aspect2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_aspect2 (ff_aspect2, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_localisation1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_localisation1 (ff_localisation1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_localisation2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_localisation2 (ff_localisation2, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_morphologie1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_morphologie1 (ff_morphologie1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_morphologie2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_morphologie2 (ff_morphologie2, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_non1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_non1 (ff_non1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_non2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_non2 (ff_non2, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_profil1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_profil1 (ff_profil1, description) FROM stdin;
\.


--
-- Data for Name: controle_ff_profil2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ff_profil2 (ff_profil2, description) FROM stdin;
\.


--
-- Data for Name: controle_fi_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_fi_mode (fi_mode, description) FROM stdin;
FD	\N
PL	\N
IR	\N
TH	\N
ST	\N
CR	\N
ON	\N
OND	\N
ONA	\N
ONF	\N
FF	\N
\.


--
-- Data for Name: controle_fi_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_fi_ordre (fi_ordre, description) FROM stdin;
\.


--
-- Data for Name: controle_fi_percussion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_fi_percussion (fi_percussion, description) FROM stdin;
A	\N
P	\N
\.


--
-- Data for Name: controle_fi_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_fi_type (fi_type, description) FROM stdin;
FI	\N
FIA	\N
FIB	\N
FII	\N
FII1	\N
FII2	\N
FII3	\N
FII4	\N
FII5	\N
FII6	\N
FII7	\N
FII2BIS	\N
FII3BIS	\N
FII4BIS	\N
FII5BIS	\N
FII6BIS	\N
FII7BIS	\N
FII8	\N
FII8BIS	\N
FII9	\N
FII10	\N
FII11	\N
FII12	\N
FIII	\N
FIII1	\N
FIII2	\N
FIII3	\N
FIII4	\N
FIII5	\N
FIII5BIS	\N
FIII6	\N
FIII7	\N
FIII8	\N
FIII9	\N
FIV	\N
FIV1	\N
FIV2	\N
FIV3	\N
FIV4	\N
FIV5	\N
IV5BIS	\N
FIV6	\N
FIV7	\N
FIV8	\N
FIV9	\N
FV	\N
FV0	\N
FV1	\N
FV2	\N
FV2BIS	\N
FV3	\N
FV4	\N
FV5	\N
FV6	\N
FVI	\N
FVI0	\N
FVI1	\N
FVI2	\N
FVI3	\N
FVI4	\N
FVI5	\N
FVI6	\N
FVI7	\N
\.


--
-- Data for Name: controle_ga_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_arete (ga_arete, description) FROM stdin;
CRD	\N
CRI	\N
CS	\N
DR	\N
DS	\N
\.


--
-- Data for Name: controle_ga_chf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_chf (ga_chf, description) FROM stdin;
\.


--
-- Data for Name: controle_ga_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_facture (ga_facture, description) FROM stdin;
M	\N
R	\N
T	\N
\.


--
-- Data for Name: controle_ga_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_forme (ga_forme, description) FROM stdin;
R	\N
RD	\N
CONV	\N
CONVD	\N
TR	\N
TRD	\N
CONC	\N
CONCD	\N
COCL	\N
COCLD	\N
SCONV	\N
SCONVD	\N
SCONC	\N
SCONCD	\N
CIRC	\N
BCP	\N
BCPD	\N
BCM	\N
BCMD	\N
BCT	\N
BCTD	\N
BCMS	\N
BCMSD	\N
IND	\N
\.


--
-- Data for Name: controle_ga_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_obliquite (ga_obliquite, description) FROM stdin;
H	\N
O	\N
SA	\N
A	\N
\.


--
-- Data for Name: controle_ga_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_orientation (ga_orientation, description) FROM stdin;
P	\N
NP	\N
I	\N
\.


--
-- Data for Name: controle_ga_qualite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_qualite (ga_qualite, description) FROM stdin;
B	\N
M	\N
I	\N
\.


--
-- Data for Name: controle_ga_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_retouche (ga_retouche, description) FROM stdin;
A	\N
M	\N
MD	\N
1/2E	\N
1/2ED	\N
E	\N
ED	\N
1/2Q	\N
1/2QD	\N
Q	\N
QD	\N
SE	\N
SED	\N
SA	\N
SAD	\N
AM	\N
AMD	\N
AE	\N
AED	\N
DM	\N
D1/2E	\N
DE	\N
DSE	\N
DSA	\N
DAM	\N
DAE	\N
DEV	\N
DEVS	\N
P	\N
PD	\N
EV	\N
EVD	\N
EVS	\N
EVSD	\N
LSP	\N
LP	\N
LE	\N
\.


--
-- Data for Name: controle_ga_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ga_type (ga_type, description) FROM stdin;
IA	\N
IA1	\N
E	\N
IA1E1	\N
IA1E2	\N
IA1ET	\N
A	\N
IA1A5	\N
IA1A2	\N
IA1AT	\N
IA1A3	\N
IA1A4	\N
IA1A1	\N
IA1A6	\N
IA1B1	\N
IA1B2	\N
IA1BT	\N
IA1B3	\N
IA1B4	\N
IA1B5	\N
IA1B6	\N
IA1C1	\N
IA1C2	\N
IA1CT	\N
IA1C3	\N
IA1C4	\N
IA1C5	\N
IA1C6	\N
IA1D1	\N
IA1D2	\N
IA1DT	\N
IA2	\N
IA2SE1	\N
IA2SE2	\N
IA2SET	\N
IA2SA1	\N
IA2SA2	\N
IA2SAT	\N
IA2SA3	\N
IA2SA4	\N
IA2SA5	\N
IA2SA6	\N
IA2SB1	\N
IA2SB2	\N
IA2SBT	\N
IA2SB3	\N
IA2SB4	\N
IA2SB5	\N
IA2SB6	\N
IA2SC1	\N
IA2SC2	\N
IA2SCT	\N
IA2SC3	\N
IA2SC4	\N
IA2SC5	\N
IA2SC6	\N
IA2SD1	\N
IA2SD2	\N
IA2SDT	\N
A2ME1	\N
IA2ME2	\N
IA2MET	\N
IA2MA1	\N
IA2MA2	\N
IA2MAT	\N
IA2MA3	\N
IA2MA4	\N
IA2MA5	\N
IA2MA6	\N
IA2MB1	\N
IA2MB2	\N
IA2MBT	\N
IA2MB3	\N
IA2MB4	\N
IA2MB5	\N
IA2MB6	\N
IA2MC1	\N
IA2MC2	\N
IA2MCT	\N
IA2MC3	\N
IA2MC	\N
IA2MC5	\N
IA2MC6	\N
IA2MD1	\N
IA2MD2	\N
IA2MDT	\N
IA2MFA1	\N
IA2MFAT	\N
IA2MFA3	\N
IA2MFA5	\N
IA2MFB1	\N
IA2MFBT	\N
IA2MFB3	\N
IA2MFB5	\N
IA2MGA1	\N
IA2MGAT	\N
IA2MGA3	\N
IA2MGA5	\N
IA2MGB1	\N
IA2MGBT	\N
IA2MGB3	\N
IA2MGB5	\N
IA2MHA1	\N
IA2MHAT	\N
IA2MHA3	\N
IA2MHA5	\N
IA2MHB1	\N
IA2MHBT	\N
IA2MHB3	\N
IA2MHB5	\N
IA2MHC1	\N
IA2MHCT	\N
IA2MHC3	\N
IA2MHC5	\N
IA3	\N
IA31	\N
IA32	\N
IA33	\N
IA34	\N
ID	\N
ID1	\N
ID1A1	\N
ID1A2	\N
ID1A3	\N
ID1A4	\N
ID1A5	\N
ID1A6	\N
ID1A7	\N
ID1A8	\N
ID1A9	\N
ID1B1	\N
ID1B2	\N
ID1B3	\N
ID1B4	\N
ID1B5	\N
ID1B6	\N
ID1B7	\N
ID1B8	\N
ID1B9	\N
ID2	\N
ID2A1	\N
ID2A2	\N
ID2A3	\N
ID2A4	\N
ID2B1	\N
ID2B2	\N
ID2B3	\N
ID2B4	\N
ID2C1	\N
ID2C2	\N
ID2C3	\N
ID2C4	\N
ID2D1	\N
ID2D2	\N
ID2D3	\N
ID2D4	\N
ID2E1	\N
ID2E2	\N
ID2E3	\N
ID2E4	\N
ID3	\N
ID3A	\N
ID3B	\N
IM	\N
IMS	\N
MS1A1	\N
IMS1A2	\N
IMS2A	\N
IMS2B1	\N
IMS2B2	\N
IMS3	\N
IMS4	\N
IMC	\N
IMC1A1	\N
IMC1A2	\N
IMC1A3	\N
IMC1B1	\N
IMC1B2	\N
IMC1B3	\N
IMC2A1	\N
IMC2A2	\N
IMC2A3	\N
IMC2A4	\N
IMC2A5	\N
IMC2A6	\N
IMC2B1	\N
IMC2B2	\N
IMC2B3	\N
IMC2B4	\N
IMC2B5	\N
IMC2B6	\N
IMC2C1	\N
MC2C2	\N
IMC2C3	\N
IMC2C4	\N
IMC2C5	\N
IMC2C6	\N
IMC3A1	\N
IMC3A2	\N
IMC3A3	\N
IMC3A4	\N
IMC3A5	\N
IMC3A6	\N
IMC3	\N
IMC3C	\N
IMC4A1	\N
IMC4A2	\N
IMC4B	\N
IIR	\N
IIR1	\N
IIR2	\N
IIR3	\N
IIS1	\N
IIS1C1	\N
IIS1C2	\N
IS1C3	\N
IIS1R1	\N
IIS1R2	\N
IIS1R3	\N
IIS2	\N
IIS2C1	\N
IIS2C2	\N
IIS2C3	\N
IIS2R1	\N
IIS2R2	\N
IIS2R3	\N
IISP	\N
IISP1	\N
IISP2	\N
IISP3	\N
IIS3	\N
IIS3A	\N
IIS3B	\N
IIS3C	\N
IIS3D	\N
IIS3E	\N
IIA	\N
IIA1A	\N
IIA1B	\N
IIA1C	\N
IIA1D	\N
IIA2A	\N
IIA2B	\N
IIA2C	\N
IIA2D	\N
IIA3A	\N
IIA3B	\N
IIA3C	\N
IIA3D	\N
IIN	\N
IIB	\N
IIB1	\N
IIB1A	\N
IIB1B	\N
IIB1C	\N
IIB1D	\N
IIB2	\N
IIB2A	\N
IIB2B	\N
IIB2C	\N
IIB2D	\N
IIB3	\N
IIB3A	\N
IIB3B	\N
IIB3C	\N
IIB3D	\N
IIB4	\N
IIB4B	\N
IIC	\N
IIC1	\N
IIC1AA	\N
IIC1AB	\N
IIC1BA	\N
IIC1BB	\N
IIC1CA	\N
IIC1CB	\N
IIC1DA	\N
IIC1DB	\N
IIC1EA	\N
IIC1EB	\N
IIC1FA	\N
IIC1FB	\N
IIC2	\N
IIC2AA	\N
IIC2AB	\N
IIC2AC	\N
IIC2AD	\N
IIC2BA	\N
IIC2BB	\N
IIC2BC	\N
IIC2BD	\N
IIC2CA	\N
IIC2CB	\N
IIC2CC	\N
IIC2CD	\N
IIC3	\N
IIC3A	\N
IIC3B	\N
IIC3C	\N
IIC3D	\N
IIC3E	\N
IIC3F	\N
IIC3G	\N
IIC3H	\N
IIT	\N
IIT1	\N
IIT2	\N
IID	\N
IID1	\N
IID2	\N
IIE	\N
IIE1	\N
IIE1AA	\N
IIE2AB	\N
IIE1BA	\N
IIE1BB	\N
IIE1CA	\N
IIE1CB	\N
IIE2	\N
IIE2A1A	\N
IIE2A1B	\N
IIE2A2A	\N
IIE2A2B	\N
IIE2B1A	\N
IIE2B1B	\N
IIE2B2A	\N
IIE2B2B	\N
IIF	\N
IIFE	\N
IIFE1	\N
IIFE2	\N
IIFE3	\N
IIFL	\N
IIFL1	\N
IIFL2	\N
IIFL3	\N
IIG	\N
III	\N
IIIA	\N
IIIA1	\N
IIIA2	\N
IIIA3	\N
IIIA4	\N
IIIA5	\N
IIIA6	\N
IIIA7	\N
IIIA8	\N
IIIA9	\N
IIIB	\N
IIIBA1	\N
IIIBA2	\N
IIIBA3	\N
IIIBA4	\N
IIIBA5	\N
IIIBA6	\N
IIIBA7	\N
IIIBA8	\N
IIIBA9	\N
IIIBB1	\N
IIIBB3	\N
IIIBB5	\N
IIIBB7	\N
IIIBB8	\N
IIIBB9	\N
IIIC	\N
IIIC1	\N
IIIC2	\N
IIID	\N
IIID1	\N
IIID2	\N
VR	\N
IVR1	\N
IVR2	\N
IVR3	\N
IVS1	\N
IVS1C2	\N
IVS1C3	\N
IVS1R2	\N
IVS1R3	\N
IVS2	\N
IVS2C2	\N
IVS2C3	\N
IVS2R2	\N
IVS2R3	\N
IVSP	\N
IVSP2	\N
IVSP3	\N
IVS3	\N
IVS3A	\N
IVS3B	\N
IVS3C	\N
IVS3D	\N
IVS3E	\N
IVA	\N
IVAA	\N
IVAB	\N
IVAC	\N
IVAD	\N
IVN	\N
IVB	\N
IVB1	\N
IVB1A	\N
IVB1B	\N
IVB2	\N
IVB2A	\N
IVB2B	\N
IVB3	\N
IVB3A	\N
IVB3B	\N
IVB4	\N
IVC	\N
IVC1	\N
IVC1AA	\N
IVC1BA	\N
IVC1AB	\N
IVC1BB	\N
IVC1CA	\N
IVC1CB	\N
IVC1DA	\N
IVC1DB	\N
IVC1EA	\N
IVC1EB	\N
IVC2	\N
IVC2AA	\N
IVC2BA	\N
IVC2AB	\N
IVC2BB	\N
IVC2CA	\N
IVC2CB	\N
IVC3	\N
IVC3A	\N
IVC3B	\N
IVD	\N
IVD1	\N
IVD2	\N
IVE	\N
V	\N
V1	\N
V2	\N
V2BIS	\N
V3	\N
V4	\N
V5	\N
V6	\N
V7	\N
V8	\N
V9	\N
V10	\N
V11	\N
VI	\N
VI1	\N
VI2	\N
VI2BIS	\N
VI3	\N
VI4	\N
VI5	\N
VI6	\N
VI7	\N
VI8	\N
VI9	\N
VI10	\N
VI11	\N
VI12	\N
VII	\N
VIIA	\N
VIIA1	\N
VIIA1A	\N
VIIA1B	\N
VIIA2	\N
VIIA2A	\N
VIIA2B	\N
VIIB	\N
VIIB1	\N
VIIB1A	\N
VIIB1B	\N
VIIB2	\N
VIIB2A	\N
VIIB2B	\N
VIIC	\N
VIII	\N
IX	\N
IXA	\N
IXB	\N
\.


--
-- Data for Name: controle_h_amenagement_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_amenagement_bord (h_amenagement_bord, description) FROM stdin;
AB0	\N
AB1	\N
AB2	\N
AB3	\N
\.


--
-- Data for Name: controle_h_amenagement_distal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_amenagement_distal (amenagement_h_distal, description) FROM stdin;
\.


--
-- Data for Name: controle_h_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_arete (h_arete, description) FROM stdin;
ALR	\N
ALI	\N
ALS	\N
ALSI	\N
ALSR	\N
ALRI	\N
ALRS	\N
ALIS	\N
AL0	\N
\.


--
-- Data for Name: controle_h_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_base (h_base, description) FROM stdin;
B1	\N
B2	\N
\.


--
-- Data for Name: controle_h_bilaterale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_bilaterale (h_bilaterale, description) FROM stdin;
SB0	\N
SB1	\N
SMDI	\N
\.


--
-- Data for Name: controle_h_biseau; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_biseau (h_biseau, description) FROM stdin;
BT0	\N
BT1	\N
BT1A	\N
BT1B	\N
BT1C	\N
\.


--
-- Data for Name: controle_h_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_bord (h_bord, description) FROM stdin;
FB1	\N
FB2	\N
FB3	\N
FB4	\N
FB23	\N
FB12	\N
FB13	\N
\.


--
-- Data for Name: controle_h_distale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_distale (h_distale, description) FROM stdin;
1	\N
2	\N
\.


--
-- Data for Name: controle_h_extension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_extension (h_extension, description) FROM stdin;
ERU	\N
EAU	\N
EMU	\N
ER	\N
ERA	\N
EA	\N
EMA	\N
EMM	\N
EMR	\N
\.


--
-- Data for Name: controle_h_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_facture (h_facture, description) FROM stdin;
FHB	\N
FHM	\N
HT	\N
\.


--
-- Data for Name: controle_h_meplat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_meplat (h_meplat, description) FROM stdin;
MI0	\N
MI1	\N
MI1U	\N
MI1B	\N
\.


--
-- Data for Name: controle_h_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_retouche (h_retouche, description) FROM stdin;
RS0	\N
RS1	\N
RS2	\N
RS5	\N
2	\N
Q	\N
\.


--
-- Data for Name: controle_h_surface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_surface (h_surface, description) FROM stdin;
SO0	\N
SO1	\N
SO2	\N
SO3	\N
\.


--
-- Data for Name: controle_h_symetrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_h_symetrie (h_symetrie, description) FROM stdin;
SMD0	\N
SMD1	\N
\.


--
-- Data for Name: controle_i_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_action (i_action, description) FROM stdin;
BL	\N
GR	\N
RB	\N
RS	\N
CQI	\N
CQF	\N
CQG	\N
DPI	\N
DPF	\N
DPG	\N
DCI	\N
DCF	\N
DCG	\N
ECI	\N
ECF	\N
ECG	\N
\.


--
-- Data for Name: controle_i_alteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_alteration (i_alteration, description) FROM stdin;
NA	\N
AF	\N
AT	\N
AM	\N
\.


--
-- Data for Name: controle_i_desilicification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_desilicification (i_desilicification, description) FROM stdin;
ND	\N
DF	\N
DM	\N
DT	\N
\.


--
-- Data for Name: controle_i_dpatine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_dpatine (i_dpatine, description) FROM stdin;
H	\N
RD	\N
RDF	\N
RDS	\N
RN	\N
RNP	\N
RNO	\N
RNR	\N
RNI	\N
RND	\N
RNE	\N
\.


--
-- Data for Name: controle_i_encroutement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_encroutement (i_encroutement, description) FROM stdin;
ECC	\N
ECE	\N
ECP	\N
ECF	\N
ECT	\N
\.


--
-- Data for Name: controle_i_eolisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_eolisation (i_eolisation, description) FROM stdin;
NE	\N
FE	\N
TE	\N
\.


--
-- Data for Name: controle_i_forme_galet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_forme_galet (i_forme_galet, description) FROM stdin;
O	\N
PI	\N
PC1	\N
PC2	\N
PC3	\N
PC5	\N
PC6	\N
PC7	\N
PC8	\N
PL1	\N
PL4	\N
PL7	\N
PL8	\N
EA	\N
EB	\N
EBI	\N
EBC1	\N
EBC2	\N
EBC3	\N
EBC7	\N
EBC8	\N
EBL1	\N
EBL4	\N
EBL7	\N
EBL8	\N
EC	\N
ECI	\N
ECC1	\N
ECC2	\N
ECC3	\N
ECC7	\N
ECC8	\N
ECL1	\N
ECL4	\N
ECL7	\N
ECL8	\N
D	\N
EDI	\N
EDC1	\N
EDC2	\N
EDC3	\N
EDC7	\N
EDC8	\N
EDL1	\N
EDL4	\N
EDL7	\N
EDL8	\N
\.


--
-- Data for Name: controle_i_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_lustrage (i_lustrage, description) FROM stdin;
NL	\N
FL	\N
TL	\N
\.


--
-- Data for Name: controle_i_matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_matiere (i_matiere, description) FROM stdin;
IND	\N
S	\N
CAD	\N
CAL	\N
J	\N
JS	\N
CS	\N
CH	\N
Q	\N
QI	\N
QBO	\N
QBT	\N
QBB	\N
QR	\N
QZT	\N
QZT0	\N
QZT1	\N
QZT2	\N
QZT3	\N
GQZT	\N
GQZT1	\N
GQZT2	\N
G	\N
SCH	\N
V	\N
VI	\N
VA	\N
VD	\N
VR	\N
VB	\N
M	\N
MI	\N
MM	\N
MGS	\N
MG	\N
GAB	\N
CA	\N
CAI	\N
CAG	\N
CAM	\N
CAR	\N
CSUB	\N
CPS	\N
CAGS	\N
BS	\N
CHT	\N
ES	\N
D	\N
LYD	\N
DNT	\N
OS	\N
CHC	\N
\.


--
-- Data for Name: controle_i_objet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_objet (i_objet, description) FROM stdin;
ECL	\N
LAM	\N
PEC	\N
LAML	\N
ERT	\N
DEB	\N
PDE	\N
MDE	\N
GAL	\N
GALF	\N
PERC	\N
BIF	\N
HACH	\N
NUC	\N
OUT	\N
GAM	\N
CHBUR	\N
PEL	\N
RET	\N
GALENLV	\N
\.


--
-- Data for Name: controle_i_patine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_patine (i_patine, description) FROM stdin;
N	\N
G	\N
GBG	\N
GM	\N
GBT	\N
GBL	\N
GR	\N
GV	\N
GVR	\N
BG	\N
BR	\N
BL	\N
J	\N
M	\N
RL	\N
RG	\N
GN	\N
VIO	\N
RS	\N
V	\N
\.


--
-- Data for Name: controle_i_pmycellium; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_pmycellium (i_pmycellium, description) FROM stdin;
PMC	\N
PME	\N
PMP	\N
PMF	\N
PMT	\N
\.


--
-- Data for Name: controle_i_roulage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_roulage (i_roulage, description) FROM stdin;
NR	\N
FR	\N
TR	\N
\.


--
-- Data for Name: controle_i_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_support (i_support, description) FROM stdin;
I	\N
PE	\N
NLE	\N
D	\N
N	\N
B	\N
DTH	\N
G0	\N
G1	\N
G2	\N
G3	\N
PEE	\N
ER	\N
EFB	\N
NL	\N
L	\N
OS	\N
DNT	\N
PLQ	\N
D1	\N
D2	\N
D3	\N
D4	\N
\.


--
-- Data for Name: controle_i_support_originel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_i_support_originel (i_support_originel, description) FROM stdin;
GAL	
PIE	
ROG	
BLOC	
NOD	
OS	
PLQ	
\.


--
-- Data for Name: controle_localite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_localite (localite, description) FROM stdin;
N	\N
E	sol UA25
ET	sol UA25
A	sol UA25
B	sol UA25
C	sol UA25
CT	sol UA25
D	sol UA25
F	sol UA25
FF	sol UA25
G	sol UA25
H	sol UA25
I1	sol UA25
I2	sol UA25
\.


--
-- Data for Name: controle_locus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_locus (locus, description) FROM stdin;
LO8	\N
LO5	\N
-B	\N
-N	\N
CEN	\N
PUI	\N
-III	\N
--	\N
ENT	\N
LO6	\N
LO7	\N
\.


--
-- Data for Name: controle_mf_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_mf_serie (mf_serie, description) FROM stdin;
\.


--
-- Data for Name: controle_mf_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_mf_type (mf_type, description) FROM stdin;
\.


--
-- Data for Name: controle_n_cortotal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_n_cortotal (n_cortotal, description) FROM stdin;
3	\N
2	\N
1	\N
0	\N
\.


--
-- Data for Name: controle_n_epuisement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_n_epuisement (n_epuisement, descripion) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
6	\N
\.


--
-- Data for Name: controle_n_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_n_forme (n_forme, description) FROM stdin;
\.


--
-- Data for Name: controle_n_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_n_orientation (n_orientation, description) FROM stdin;
\.


--
-- Data for Name: controle_n_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_n_type (n_type, description) FROM stdin;
N1	\N
N1A	\N
N1ARC	\N
N1AEP	\N
N1ARU	\N
N1ARB	\N
N1B	\N
N1C	\N
N1CRU	\N
N1CRB	\N
N2	\N
N2DA	\N
N2DB	\N
N2DC	\N
N2DD	\N
N2DE	\N
N2DF	\N
N2RA	\N
N2RB	\N
N2RC	\N
N2RD	\N
N2RE	\N
N2RF	\N
N2IA	\N
N2IB	\N
N2IC	\N
N2ID	\N
N2IE	\N
N2IF	\N
N3	\N
N3DA	\N
N3DB	\N
N3RA	\N
N3RB	\N
N3IA	\N
N3IB	\N
N4	\N
N4A	\N
N4B	\N
N4B1	\N
N4C	\N
N4D	\N
N4D1	\N
N4E	\N
N4F	\N
N4F1	\N
N5	\N
N5U	\N
N5UA	\N
N5UB	\N
N5UC	\N
N5UD	\N
N5BOA	\N
N5BOB	\N
N5BOC	\N
N5BOD	\N
N5BOE	\N
N5BAA	\N
N5BAB	\N
N5BAC	\N
N5BAD	\N
N6	\N
N6A	\N
N6B	\N
N6C	\N
N6D	\N
NO	\N
NO2	\N
NO3	\N
NO4	\N
NO5	\N
N7	\N
N7U	\N
N7UA	\N
N7UB	\N
N7UC	\N
N7UD	\N
N7UE	\N
N7UF	\N
N7D	\N
N7DA	\N
N7DB	\N
N7DC	\N
N7DD	\N
N7DE	\N
N7DF	\N
N7B	\N
N7B1A	\N
N7B1B	\N
N7B1C	\N
N7B1D	\N
N7B1E	\N
N7B1F	\N
N7B1G	\N
N7B2A	\N
N7B2B	\N
N7B2C	\N
N7B2D	\N
N7B2E	\N
N7B2F	\N
N7B2G	\N
N7B3A	\N
N7B3B	\N
N7B3C	\N
N7B3D	\N
N7B3E	\N
N7B3F	\N
N7B3G	\N
N7B4A	\N
N7B4B	\N
N7B4C	\N
N7B4D	\N
N7B4E	\N
N7B4F	\N
N7B4G	\N
N7M	\N
N7MA	\N
N7MB	\N
N7MC	\N
NA	\N
NA1	\N
NA2	\N
NA3	\N
NA4	\N
\.


--
-- Data for Name: controle_nature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_nature (nature, description) FROM stdin;
OSD	\N
ESQ	\N
COQ	\N
IND	\N
GAL	\N
OB	\N
CHA	\N
PIE	\N
DNT	\N
MDB	\N
GCA	\N
COP	\N
NID	\N
CAL	\N
\.


--
-- Data for Name: controle_niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_niveau (niveau, description) FROM stdin;
\.


--
-- Data for Name: controle_o_chronologie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_chronologie (o_chronologie, description) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
6	\N
7	\N
8	\N
9	\N
10	\N
\.


--
-- Data for Name: controle_o_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_code (o_code, description) FROM stdin;
RACLAT	\N
RACANG	\N
RACTRA	\N
RACDLAT	\N
RACDLATTRA	\N
PTECT	\N
PTLG	\N
LIMPL	\N
LIMEP	\N
PROLIM	\N
RACCONV	\N
PTDEJD	\N
PTDEJG	\N
RACINCD	\N
RACINCG	\N
RACDEJD	\N
RACDEJG	\N
RACDEJLD	\N
RACDEJLG	\N
RACDB	\N
RACTP	\N
RACQU	\N
RACDENLAT	\N
RACDENANG	\N
RACDENTRA	\N
RACCAR	\N
RACDDENLAT	\N
RACDDENTRA	\N
RACDDENLATTRA	\N
PTQ	\N
PTTYC	\N
PTTYL	\N
LIDPL	\N
LIDEP	\N
PRLID	\N
RACCONVD	\N
PTEDDEJD	\N
PTEDDEJG	\N
RACDINCD	\N
RACDINCG	\N
RACDDEJD	\N
RACDDEJG	\N
RACDDEJLD	\N
RACDDEJLG	\N
RACDDB	\N
RACDTP	\N
RACDQU	\N
ENCRES	\N
ENCRED	\N
ENCREM	\N
BEC1ENCRTT	\N
BEC1ENCRTN	\N
BEC1ENCRTR	\N
BEC1ENCRTA	\N
DENTRLAT	\N
DENTRANG	\N
DENTRTRA	\N
DENTRDLAT	\N
DENTRDANG	\N
DENTRDTRA	\N
PTYRC	\N
PTYRL	\N
DENTRCONV	\N
DENTRDEJD	\N
DENTRDEJG	\N
DENTRDEJLD	\N
DENTRDEJLG	\N
DENTRDB	\N
DENTRTP	\N
DENTRQU	\N
ENCCS	\N
BEC1ENCCTT	\N
BEC1ENCCTN	\N
BEC1ENCCTR	\N
BEC1ENCCTA	\N
DENTCLAT	\N
DENTCANG	\N
DENTCTRA	\N
ENCMD	\N
ENCMM	\N
BECENCM	\N
DENTMLAT	\N
DENTMANG	\N
DENTMTRA	\N
DENTMDLAT	\N
DENTMDTRA	\N
DENTMDLATTRA	\N
PTYMC	\N
PTYML	\N
DENTMCONV	\N
DENTMDEJD	\N
DENTMDEJG	\N
DENTMDEJLD	\N
DENTMDEJLG	\N
DENTMDB	\N
DENTMTP	\N
DENTMQU	\N
GRFPLLN	\N
GRFPLLR	\N
GRFPLLA	\N
GRFPLEMN	\N
GRFPLEMR	\N
GRFPLEEN	\N
GRFPLEER	\N
GRFPCL	\N
GRFPCEM	\N
GRFPCEE	\N
GRFPCEU	\N
GRFPCEC	\N
GRFMLLN	\N
GRFMLLR	\N
GRFMLLA	\N
GRFMLEMN	\N
GRFMLEMR	\N
GRFMLEEN	\N
GRFMLEER	\N
GRFMCL	\N
GRFMCEM	\N
GRFMCEL	\N
GRFMCC	\N
GRMPSE	\N
GRMP1ER	\N
GRMP1EC	\N
GRMP2ER	\N
GRMP2EC	\N
GRMP2EM	\N
GRMESE	\N
GRME1ER	\N
GRME1EC	\N
GRME2ER	\N
GRME2EC	\N
GRME2EM	\N
GRMMPSE	\N
GRMMP1ER	\N
GRMMP1EC	\N
GRMMP2ER	\N
GRMMP2EC	\N
GRMMP2EM	\N
GRMMESE	\N
GRMME1ER	\N
GRMME1EC	\N
GRMME2ER	\N
GRMME2EC	\N
GRMME2EM	\N
GRCMSE	\N
GRCM1ER	\N
GRCM1EC	\N
GRCM2ER	\N
GRCM2EC	\N
GRCM2EM	\N
GRCCA	\N
GRCCN	\N
GRCEV	\N
GRN	\N
RBC	\N
RBN	\N
BUUSLN1	\N
BUUSLN2	\N
BUUSLN3	\N
BUUSLN4	\N
BUUSLT1	\N
BUUSLT2	\N
BUUSLT3	\N
BUUSLT4	\N
BUUSLT5	\N
BUUSLT6	\N
BUUSLT7	\N
BUUSLO1	\N
BUUSLO2	\N
BUUSLO3	\N
BUUSLO4	\N
BUUSLO5	\N
BUUSLO6	\N
BUUSLE1	\N
BUUSLE2	\N
BUUSTN1	\N
BUUSTN2	\N
BUUSTE1	\N
BUUSTE2	\N
BUUSTE3	\N
BUUSTN	\N
BUUSC	\N
BUUMLN1	\N
BUUMLN2	\N
BUUMLN3	\N
BUUMLN4	\N
BUUMLT1	\N
BUUMLT2	\N
BUUMLT3	\N
BUUMLT4	\N
BUUMLT5	\N
BUUMLT6	\N
BUUMLE1	\N
BUUMLE2	\N
BUUMTN1	\N
BUUMTN2	\N
BUUMTE1	\N
BUUMTE2	\N
BUUMTE3	\N
BUUMTN	\N
BUBSA	\N
BUBSDG	\N
BUBSDD	\N
BUBSADG	\N
BUBSADD	\N
BUBSAAG	\N
BUBSAAD	\N
BUBMA	\N
BUBMDG	\N
BUBMDD	\N
BUBMADG	\N
BUBMADD	\N
BUBMAAG	\N
BUBMAAD	\N
PEU1	\N
PEU2	\N
PEU3	\N
PEU4	\N
PEU5	\N
PEU6	\N
PEB1	\N
PEB2	\N
PEB3	\N
PEB4	\N
PE1E1	\N
PE1E2	\N
PE1E3	\N
PE1E4	\N
PE1E5	\N
PE1E6	\N
PE1E7	\N
PE1E8	\N
PE2E1	\N
PE2E2	\N
PE2E3	\N
PE2E4	\N
PE2E5	\N
PE2E6	\N
PE2E7	\N
PE2E8	\N
PEZ1	\N
PEZ2	\N
PEZ3	\N
MPEU	\N
MPEB	\N
MPE1E	\N
MPE2E	\N
PEDB	\N
PETP	\N
PEQU	\N
PETR	\N
TRP1	\N
TRP2	\N
TRP3	\N
TRP4	\N
TRP5	\N
TRO1	\N
TRO2	\N
TRO3	\N
TRO4	\N
TRO5	\N
TRO6	\N
TRO7	\N
TRO8	\N
TRO9	\N
TRO10	\N
TRDB	\N
RETTRP1	\N
RETTRP2	\N
RETTRP3	\N
RETTRO1	\N
RETTRO2	\N
RETTRO3	\N
RETTRO4	\N
RETTRO5	\N
RETTRO6	\N
RETTRDB	\N
EVSD	\N
EVSI	\N
EVSM	\N
EVPD	\N
EVPI	\N
EVPM	\N
ECD	\N
ECI	\N
ECM	\N
AMCUG	\N
AMCUD	\N
AMCB	\N
AMEUG	\N
AMEUD	\N
AMB	\N
ENCABR1	\N
ENCABR2	\N
ENCABR3	\N
ENCABC1	\N
ENCABC2	\N
ENCABC3	\N
ENCAGR1	\N
ENCAGR2	\N
ENCAGR3	\N
ENCAGC1	\N
ENCAGC2	\N
ENCAGC3	\N
EPM	\N
EPE	\N
EPSAM	\N
EPAM	\N
EPAE	\N
ENCEVBA	\N
ENCEVBP	\N
ENCEVGA	\N
ENCEVGP	\N
ENCEVPA	\N
ENCEVPP	\N
PTBIF	\N
\.


--
-- Data for Name: controle_o_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_destination (o_destination, description) FROM stdin;
A	\N
B	\N
P	\N
AF	\N
BF	\N
PF	\N
FL	\N
BT	\N
BC	\N
BR	\N
BD	\N
BTA	\N
BTC	\N
BTP	\N
BTE	\N
BTDC	\N
BTDN	\N
BTT	\N
BTPI	\N
BTPC	\N
BTPM	\N
BTPT	\N
BTPR	\N
M	\N
BTCBTP	\N
BTPBTA	\N
BA	\N
BTABTP	\N
BTABTC	\N
\.


--
-- Data for Name: controle_o_etat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_etat (o_etat, description) FROM stdin;
1	\N
2A	\N
2B	\N
2C	\N
2D	\N
2E	\N
2F	\N
3	\N
\.


--
-- Data for Name: controle_o_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_forme (o_forme, description) FROM stdin;
REC	\N
CONV	\N
CONC	\N
SCONV	\N
SCONC	\N
GCD	\N
GA1	\N
GA1D	\N
GA2	\N
GA2D	\N
GO	\N
GOD	\N
GV	\N
GVD	\N
BR	\N
BCV	\N
BGR	\N
BT	\N
BAR	\N
BDC	\N
BI	\N
GC	\N
\.


--
-- Data for Name: controle_o_localisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_localisation (o_localisation, description) FROM stdin;
IND	\N
ANGGPROX	\N
LATGT	\N
LATGPROX	\N
LATGMES	\N
LATGDIS	\N
ANGGDIS	\N
TRDIST	\N
TRDISG	\N
TRDISMES	\N
TRDISD	\N
PTDIS	\N
ANGDDIS	\N
LATDT	\N
LATDDIS	\N
LATDMES	\N
LATDPROX	\N
ANGDPROX	\N
TRPROXT	\N
TRPROXD	\N
TRPROXMES	\N
TRPROXG	\N
PTPROX	\N
ARMEDT	\N
ARMEDPROX	\N
ARMEDMES	\N
ARMEDDIS	\N
PERP	\N
\.


--
-- Data for Name: controle_o_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_ordre (o_ordre, description) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
6	\N
7	\N
8	\N
9	\N
10	\N
0	\N
\.


--
-- Data for Name: controle_o_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_orientation (o_orientation, description) FROM stdin;
P	\N
NP	\N
I	\N
\.


--
-- Data for Name: controle_o_origine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_origine (o_origine, description) FROM stdin;
A	\N
B	\N
P	\N
AF	\N
BF	\N
PF	\N
FL	\N
BT	\N
BC	\N
BR	\N
BD	\N
BTA	\N
BTC	\N
BTP	\N
BTE	\N
BTDC	\N
BTDN	\N
BTT	\N
BTPI	\N
BTPC	\N
BTPM	\N
BTPT	\N
BTPR	\N
M	\N
BTPBTC	\N
BTABTP	\N
AB	\N
BTPBTA	\N
BTABTC	\N
\.


--
-- Data for Name: controle_o_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_retouche (o_retouche, description) FROM stdin;
M	\N
MD	\N
E/2	\N
E	\N
ED	\N
Q/2	\N
Q/2D	\N
Q	\N
QD	\N
SE	\N
SED	\N
SA	\N
SAD	\N
AM	\N
AMD	\N
AE	\N
AED	\N
DM	\N
DE	\N
DES	\N
DSA	\N
DAM	\N
DAE	\N
DEV	\N
DEVS	\N
DQ2	\N
P	\N
PD	\N
EV	\N
EVD	\N
EVS	\N
EVSD	\N
LSP	\N
LP	\N
LE	\N
PM	\N
DE/2	\N
ED/2	\N
\.


--
-- Data for Name: controle_o_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_sens (o_sens, description) FROM stdin;
DIR	\N
INV	\N
MIX	\N
MIXAL	\N
PROFL	\N
PROFT	\N
PROFM	\N
MSG	\N
MSD	\N
MSX	\N
MIG	\N
MID	\N
\.


--
-- Data for Name: controle_o_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_o_serie (o_serie, description) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
\.


--
-- Data for Name: controle_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_orientation (orientation, description) FROM stdin;
NS	\N
NESW	\N
NWSE	\N
EW	\N
\.


--
-- Data for Name: controle_pendage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_pendage (pendage, description) FROM stdin;
P	\N
O	\N
C	\N
V	\N
SC	\N
SV	\N
S	\N
\.


--
-- Data for Name: controle_r_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_association (r_association, description) FROM stdin;
1	\N
1'	\N
2	\N
3	\N
3'	\N
4	\N
4'	\N
5	\N
6	\N
\.


--
-- Data for Name: controle_r_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_bord (r_bord, description) FROM stdin;
D	\N
C	\N
P	\N
\.


--
-- Data for Name: controle_r_cas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_cas (r_cas, description) FROM stdin;
UBT	\N
I	\N
DEB	\N
BN	\N
UO	\N
U	\N
IBT	\N
\.


--
-- Data for Name: controle_r_denticulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_denticulation (r_denticulation, description) FROM stdin;
ND	\N
DENT	\N
ENC	\N
\.


--
-- Data for Name: controle_r_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_destination (r_destination, description) FROM stdin;
A	\N
P	\N
AF	\N
B	\N
PF	\N
FL	\N
BT	\N
BC	\N
BR	\N
BD	\N
BTA	\N
BTC	\N
BTP	\N
BTE	\N
BTDC	\N
BTDN	\N
BTT	\N
BTPI	\N
BTPC	\N
BTPM	\N
BTPT	\N
BTPR	\N
M	\N
BTABTDF	\N
BTABTDC	\N
BBT	\N
BTPBTDC	\N
BTABTP	\N
BTPBTA	\N
BTABTC	\N
BTCBTA	\N
BTCBTP	\N
BTDFBTDC	\N
BTPBTC	\N
BTDCBTDF	\N
BTDF	\N
BTABTDN	\N
BF	\N
\.


--
-- Data for Name: controle_r_dimension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_dimension (r_dimension, description) FROM stdin;
MR	\N
RC	\N
RM	\N
RL	\N
RLL	\N
\.


--
-- Data for Name: controle_r_ecrasement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_ecrasement (r_ecrasement, description) FROM stdin;
EBT	\N
ERI	\N
ERC	\N
ED	\N
EBN	\N
\.


--
-- Data for Name: controle_r_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_extremite (r_extremite, description) FROM stdin;
A	\N
C	\N
CA	\N
R	\N
\.


--
-- Data for Name: controle_r_frequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_frequence (r_frequence, description) FROM stdin;
U	\N
QQI	\N
1	\N
QQ	\N
NB	\N
2	\N
3	\N
4	\N
5	\N
\.


--
-- Data for Name: controle_r_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_lustrage (r_lustrage, description) FROM stdin;
L	\N
NL	\N
\.


--
-- Data for Name: controle_r_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_obliquite (r_obliquite, description) FROM stdin;
NA	\N
ABR	\N
O	\N
SA	\N
\.


--
-- Data for Name: controle_r_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_ordre (r_ordre, description) FROM stdin;
\.


--
-- Data for Name: controle_r_origine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_origine (r_origine, description) FROM stdin;
A	\N
B	\N
P	\N
AF	\N
BF	\N
PF	\N
FL	\N
BT	\N
BC	\N
BR	\N
BD	\N
BTA	\N
BTC	\N
BTP	\N
BTE	\N
BTDF	\N
BTDC	\N
BTDN	\N
BTT	\N
BTPC	\N
BTPM	\N
BTPT	\N
BTPR	\N
M	\N
I	\N
BTDFBTA	\N
BTDCBTA	\N
 BTB	\N
BTDCBTP	\N
BTB	\N
BTPBTA	\N
BTABTP	\N
BTABTC	\N
BTCTBA	\N
BTPBTC	\N
BTDCBTDF	\N
BTCBTP	\N
BTDNBTA	\N
\.


--
-- Data for Name: controle_r_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_sens (r_sens, description) FROM stdin;
DIR	\N
INV	\N
MIX	\N
MIXAL	\N
PROFL	\N
PROFT	\N
PROFM	\N
MSG	\N
MSD	\N
MSX	\N
MIG	\N
MID	\N
\.


--
-- Data for Name: controle_r_strie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_strie (r_strie, description) FROM stdin;
\.


--
-- Data for Name: controle_r_superposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_superposition (r_superposition, description) FROM stdin;
I	\N
C	\N
CHIRR	\N
CHREG	\N
SIRR	\N
SREG	\N
CH	\N
\.


--
-- Data for Name: controle_r_tranchant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_tranchant (r_tranchant, description) FROM stdin;
IND	\N
ARMEDT	\N
ARMEDPROX	\N
ARMEDMES	\N
ARMEDDIS	\N
PERIP	\N
FAA	\N
FAB	\N
\.


--
-- Data for Name: controle_r_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_type (r_type, description) FROM stdin;
M	\N
E	\N
E/2	\N
SUR	\N
MI	\N
PL	\N
ENV	\N
BUR S1	\N
BUR S2	\N
BUR S3	\N
BUR M1	\N
BUR M2	\N
BUR M3	\N
PM	\N
Q	\N
\.


--
-- Data for Name: controle_r_utilisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_r_utilisation (r_utilisation, description) FROM stdin;
BP	\N
BA	\N
BB	\N
BCE(r_strie)	\N
SPL	\N
SPR	\N
SOB	\N
SEN	\N
SFPL	\N
SFEN	\N
\.


--
-- Data for Name: controle_responsable_fouille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_responsable_fouille (responsable_fouille, description) FROM stdin;
DE LUMLEY	\N
\.


--
-- Data for Name: controle_s_localisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_localisation (s_localisation, description) FROM stdin;
I	\N
IND	\N
ANGGPROX	\N
LATGT	\N
LATGPROX	\N
LATGMES	\N
LATGDIS	\N
ANGGDIS	\N
TRDIST	\N
TRDISG	\N
TRDISMES	\N
TRDISD	\N
PTDIS	\N
ANGDDIS	\N
LATDT	\N
LATDDIS	\N
LATDMES	\N
LATDPROX	\N
ANGDPROX	\N
TRPROXT	\N
TRPROXD	\N
TRPROXMES	\N
TRPROXG	\N
PTMAX	\N
ARMEDT	\N
ARMEDPROX	\N
ARMEDMES	\N
ARMEDDIS	\N
PERIP	\N
FIND	\N
FA	\N
FAA	\N
FAPT	\N
FAPG	\N
FAPM	\N
FAPD	\N
FAMT	\N
FAMG	\N
FAMM	\N
FAMD	\N
FADT	\N
FADG	\N
FADM	\N
ADD	\N
FB	\N
FBB	\N
FBPT	\N
FBPG	\N
FBPM	\N
FBMT	\N
FBMG	\N
FBMM	\N
FBMD	\N
FBDT	\N
FBDG	\N
FBDM	\N
FBDD	\N
FADD	\N
\.


--
-- Data for Name: controle_s_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_lustrage (s_lustrage, description) FROM stdin;
LL	\N
LE	\N
\.


--
-- Data for Name: controle_s_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_ordre (s_ordre, description) FROM stdin;
\.


--
-- Data for Name: controle_s_polissage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_polissage (s_polissage, description) FROM stdin;
PA	\N
PP	\N
PI	\N
\.


--
-- Data for Name: controle_s_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_relation (s_relation, description) FROM stdin;
G	\N
F	\N
CF	\N
AF	\N
PL	\N
O	\N
CO	\N
AO	\N
AT	\N
\.


--
-- Data for Name: controle_s_situation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_situation (s_situation, description) FROM stdin;
I	\N
P	\N
B	\N
F	\N
\.


--
-- Data for Name: controle_s_sous_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_sous_type (s_sous_type, description) FROM stdin;
FPC	\N
FPFC	\N
FE	\N
FPE	\N
FS	\N
FEF	\N
FEA	\N
FC	\N
FAS	\N
FB	\N
FF	\N
FACC	\N
FRF	\N
FRA	\N
UE	\N
UL	\N
UP	\N
\.


--
-- Data for Name: controle_s_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_s_type (s_type, description) FROM stdin;
SI	\N
SIST	\N
SL	\N
SLST	\N
SP	\N
SPST	\N
ST	\N
SIN	\N
SD	\N
SINST	\N
\.


--
-- Data for Name: controle_sol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_sol (sol, description) FROM stdin;
08	\N
14	\N
15	\N
17	\N
03	\N
05	\N
06	\N
07	\N
09	\N
10	\N
11	\N
12	\N
13	\N
16	\N
04	\N
22	\N
24	\N
20	\N
21	\N
19	\N
18	\N
25	\N
7	\N
8	\N
9	\N
23	\N
UA25	\N
01	\N
1	\N
26	\N
02	\N
M2	\N
27	\N
28	\N
A	\N
B	\N
C	\N
D	\N
E	\N
F	\N
G	\N
H	\N
I	\N
J	\N
K	\N
29	\N
30	\N
20-21	\N
21-22	\N
22-23	\N
23-24	\N
24-25	\N
25-26	\N
19-20	\N
\.


--
-- Data for Name: controle_souscarre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_souscarre (souscarre, description) FROM stdin;
\.


--
-- Data for Name: controle_t_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_agent (t_agent, description) FROM stdin;
DM	\N
ENT	\N
EX	\N
ES	\N
DI	\N
DP	\N
EP	\N
DD	\N
ED	\N
DT	\N
EQ	\N
FEDS4	\N
\.


--
-- Data for Name: controle_t_allure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_allure (t_allure, description) FROM stdin;
\.


--
-- Data for Name: controle_t_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_classe (t_classe, description) FROM stdin;
\.


--
-- Data for Name: controle_t_dessin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_dessin (t_dessin, description) FROM stdin;
\.


--
-- Data for Name: controle_t_direction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_direction (t_direction, description) FROM stdin;
\.


--
-- Data for Name: controle_t_dstrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_dstrie (t_dstrie, description) FROM stdin;
\.


--
-- Data for Name: controle_t_ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_ensemble (t_ensemble, description) FROM stdin;
ST	\N
RA	\N
CU	\N
RE	\N
VE	\N
EN	\N
PO	\N
PE	\N
RO	\N
TI	\N
RL	\N
\.


--
-- Data for Name: controle_t_largeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_largeur (t_largeur, description) FROM stdin;
\.


--
-- Data for Name: controle_t_locmusc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_locmusc (t_locmusc, description) FROM stdin;
\.


--
-- Data for Name: controle_t_nature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_nature (t_nature, description) FROM stdin;
ATBC	\N
A-RO	\N
ATBE	\N
ATBD	\N
ATBA	\N
ARBA	\N
ANDC	\N
IN	\N
ANDR	\N
ATBI	\N
NAV	\N
NAI	\N
ANI	\N
ATB	\N
ANGC	\N
ATBP	\N
ATBR	\N
ST	\N
ATUT	\N
\.


--
-- Data for Name: controle_t_phenomene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_phenomene (t_phenomene, description) FROM stdin;
\.


--
-- Data for Name: controle_t_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_photo (t_photo, description) FROM stdin;
\.


--
-- Data for Name: controle_t_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_profondeur (t_profondeur, description) FROM stdin;
\.


--
-- Data for Name: controle_t_replique; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_replique (t_replique, description) FROM stdin;
\.


--
-- Data for Name: controle_t_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_section (t_section, description) FROM stdin;
\.


--
-- Data for Name: controle_t_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_sens (t_sens, description) FROM stdin;
\.


--
-- Data for Name: controle_t_trace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_t_trace (t_trace, description) FROM stdin;
\.


--
-- Data for Name: controle_ud_fragmentation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ud_fragmentation (ud_fragmentation, description) FROM stdin;
\.


--
-- Data for Name: controle_ud_lateralite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ud_lateralite (ud_lateralite, description) FROM stdin;
\.


--
-- Data for Name: controle_ud_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ud_type (ud_type, description) FROM stdin;
\.


--
-- Data for Name: controle_ud_usure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_ud_usure (ud_usure, description) FROM stdin;
\.


--
-- Data for Name: controle_vers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_vers (vers, description) FROM stdin;
N	\N
S	\N
SW	\N
E	\N
SE	\N
NE	\N
NW	\N
W	\N
EW	\N
\.


--
-- Data for Name: controle_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controle_zone ("zone", description) FROM stdin;
\.


--
-- Data for Name: controlec__forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controlec__forme (c_forme, description) FROM stdin;
\.


--
-- Data for Name: coprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coprolithe ("zone", numero, bis, c_association, c_fragmentation, c_sediment, c_couleur, c_motif, c_motnat, c_motcou, c_forme, c_vol, c_volext, c_retrecissement, c_nombre, c_extremite, c_ext1, c_ext2, c_alteration, c_altnat, c_inclusion, c_incl1, c_incl2, c_incl3, c_element, c_granulometrie, c_liant, c_consistance, c_ordre, c_famille, c_genre, c_parasito, c_palyno, c_lame, c_autre, c_mif, c_macroreste, c_longueur, c_largeur, c_epaisseur, c_poids) FROM stdin;
\.


--
-- Data for Name: dent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dent ("zone", numero, bis, d_serie, d_type, d_m1, d_m2, d_m3, d_m4, d_m5, d_m6, d_m7, d_m8, d_m9, d_m10, d_m11, d_m12, d_m13, d_m14, d_m15, d_m16, d_m17, d_m18, d_m19, d_m20, d_m21, d_m22, d_m23, d_m24, d_m25, d_m26, d_m27, d_m28, d_m29, d_m30) FROM stdin;
\.


--
-- Data for Name: eclat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eclat ("zone", numero, bis, e_code, e_debitage, e_section_long, e_section_trans, e_contour, e_enlevement, e_bulbe, e_talon, e_cone, e_onde, e_epi, e_strie, e_parasite, e_secondaire, e_charniere, e_carene, e_type, e_longm, e_largm, e_fa, e_fb, e_fc, e_fd, e_fe, e_ff, e_ta, e_tb, e_tc, e_td, e_te, e_tf, e_tg, e_thc, e_ti) FROM stdin;
\.


--
-- Data for Name: enlevement_biface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enlevement_biface (bis, "zone", numero, eb_rang, eb_longueur, eb_largeur, eb_obliquite, eb_corde, eb_fleche, old_eb_tranche, eb_tranche) FROM stdin;
\.


--
-- Data for Name: enlevement_galet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enlevement_galet ("zone", numero, bis, ga_ordre, eg_rang, eg_element, eg_longueur_generale, eg_profil, eg_profondeur, eg_obliquite, eg_extremite, eg_proeminence, eg_sens, eg_localisation, eg_situation, eg_epaisseur, eg_longueur, eg_largeur, eg_tranchant, eg_obliquite_degre, eg_corde, eg_fleche, eg_dptimpact, eg_support, eg_relation) FROM stdin;
\.


--
-- Data for Name: enlevement_nucleus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enlevement_nucleus ("zone", numero, bis, n_ordre, en_rang, en_longueur, en_largeur, en_obliquite, en_obliquite_degre, en_corde, en_fleche, en_dptimpact, en_frappe, en_numero, en_inclinaison, en_direction) FROM stdin;
\.


--
-- Data for Name: faune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY faune ("zone", numero, bis, f_longueur, f_largeur, f_epaisseur, f_poids, f_ancien_oss, f_classe, f_ordre, f_famille, f_ssfamille, f_genre, f_espece, f_ssespece, f_typos1, f_typos2, f_typos3, f_typos4, f_typos5, f_typos6, f_lateralite, f_sexe, f_agecl, f_agest, f_epins, f_stserie, f_stdent, f_taille, f_association, f_pathologie, f_description, f_fragge, f_fragde, f_sauvefrag, f_couleur, f_caltype, f_calcouleur, f_concretion, f_oxyde, f_coraspect, f_corfissure, f_trace, f_fossilisation, f_tissu, f_typedos, f_ilongueur, f_icirconference, f_eclat, f_agent, f_photo, f_dessin, f_traitement, f_datation, f_moulage, f_conservation, f_restauration, f_coprolithe, f_pelote, f_saisie, f_reference, f_complement, responsable, controle_f_ancien_oss, f_responsable, f_affgenre, f_affespece) FROM stdin;
\.


--
-- Data for Name: fracture_faune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fracture_faune ("zone", numero, bis, ff_localisation1, ff_non1, ff_angle1, ff_aspect1, ff_profil1, ff_morphologie1, ff_localisation2, ff_non2, ff_angle2, ff_aspect2, ff_profil2, ff_morphologie2) FROM stdin;
\.


--
-- Data for Name: fracture_industrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fracture_industrie ("zone", numero, bis, fi_ordre, fi_type, fi_percussion, fi_mode, fi_anciennete, fi_localisation, old_support, fi_relation) FROM stdin;
\.


--
-- Data for Name: galet_amenage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY galet_amenage ("zone", numero, bis, ga_ordre, ga_type, ga_facture, ga_qualite, ga_nba, ga_nbb, ga_nbp, ga_forme, ga_arete, ga_orientation, ga_retouche, ga_cha, ga_chb, ga_chc, ga_chd, ga_che, ga_chde, ga_chf, old_ga_chg, ga_chh, ga_chi, ga_chj, ga_chk, ga_chl, ga_chm, ga_chna, ga_chnb, ga_cho, ga_chp, ga_chq, ga_chqq, ga_chr, ga_chrg, ga_chrd, ga_chrr, ga_chs, ga_cht, ga_chu, ga_chw1, ga_chw2, ga_chv1, ga_chv2, ga_chv3, ga_chx, ga_chxx, ga_chy, ga_chyy, ga_chz1, ga_chz2, ga_chz3, ga_chz4, ga_chg, ga_obliquite, ga_relation) FROM stdin;
\.


--
-- Data for Name: hachereau; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hachereau ("zone", numero, bis, h_type, h_base, h_surface, h_amenagement_bord, h_distale, h_biseau, h_bord, h_meplat, h_extension, h_symetrie, h_bilaterale, h_facture, h_arete, h_retouche, h_long1, h_long2, h_long3, h_l1, h_l1a, h_l2, h_l3, h_l4, h_l5, h_e1, h_e2, h_poids, h_ind1, h_ind2, h_ind3, h_ind4, h_ind5, h_ind6, h_ind7, h_ind8, h_ind9, h_ind10, h_ind11, h_ind12, h_ind13, h_ind14, h_ind15, h_hc, h_hd, h_he, h_hb1a, h_hb1b, h_hb1, h_hb2a, h_hb2b, h_hb2, h_hde1, h_hg1, h_hg2, h_hh, h_hi, h_hj, h_hk, h_hla1, h_hlb1, h_hl1, h_hla2, h_hlb2, h_hl2, h_hm, h_hs, h_hng, h_hnd, h_ho, h_hp, h_hq, h_hr, h_hu, h_hx, h_hya1, h_hya2, h_hya, h_hyb1, h_hyb2, h_hyb, h_hy, h_hyax, h_hybx, h_hyx, h_hf, h_ntf, old_h_de2, h_hde2) FROM stdin;
\.


--
-- Data for Name: industrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY industrie ("zone", numero, bis, i_oa, i_ob, i_oc, i_poids, i_forme_galet, i_matiere, i_objet, i_support_originel, i_patine, i_dpatine, i_alteration, i_encroutement, i_pmycellium, i_eolisation, i_lustrage, i_roulage, i_action, i_desilicification, old_support, i_observation, i_support) FROM stdin;
\.


--
-- Data for Name: microfaune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY microfaune ("zone", numero, bis, mf_serie, mf_type, mf_m1, mf_m2, mf_m3, mf_m4, mf_m5, mf_m6, mf_m7, mf_m8, mf_m9, mf_m10, mf_m11, mf_m12, mf_m13, mf_m14, mf_m15, mf_m16, mf_m17, mf_m18, mf_m19, mf_m20, mf_m21, mf_m22, mf_m23, mf_m24, mf_m25, mf_m26, mf_m27, mf_m28, mf_m29, mf_m30) FROM stdin;
\.


--
-- Data for Name: nucleus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nucleus ("zone", numero, bis, n_ordre, n_type, n_nbplan, n_nba, n_nbb, n_nbp, n_orientation, n_dirtotal, n_dirfacea, n_dirfaceb, n_dirprofil, n_formule, n_rotation, n_cortotal, n_corfacea, n_corfaceb, n_corprofil, n_epuisement) FROM stdin;
\.


--
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY os ("zone", numero, bis, o_serie, o_type, o_m1, o_m2, o_m3, o_m4, o_m5, o_m6, o_m7, o_m8, o_m9, o_m10, o_m11, o_m12, o_m13, o_m14, o_m15, o_m16, o_m17, o_m18, o_m19, o_m20, o_m21, o_m22, o_m23, o_m24, o_m25, o_m26, o_m27, o_m28, o_m29, o_m30, o_m31, o_m32, o_m33, o_m34, o_m35, o_m36, o_m37, o_m38, o_m39, o_m40, o_m41, o_m42, o_m43, o_m44, o_m45, o_m46, o_m47, o_m48, o_m49, o_m50) FROM stdin;
\.


--
-- Data for Name: outil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY outil ("zone", numero, bis, o_ordre, o_code, o_code_comp, o_retouche, o_orientation, o_origine, o_destination, o_etat, o_localisation, o_sens, o_serie, o_forme, o_chronologie, o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h, o_tranchant, o_relation) FROM stdin;
\.


--
-- Data for Name: photocoprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photocoprolithe (idphoto, "zone", numero, bis, t_ensemble, legende) FROM stdin;
\.


--
-- Data for Name: photofaune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photofaune (idphoto, "zone", numero, bis, legende) FROM stdin;
\.


--
-- Data for Name: photoindustrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photoindustrie (idphoto, "zone", numero, bis, legende) FROM stdin;
\.


--
-- Data for Name: phototrace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY phototrace (idphoto, "zone", numero, bis, t_ensemble, legende) FROM stdin;
\.


--
-- Data for Name: remonte_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY remonte_famille (famille, ordre, classe) FROM stdin;
CERCOPITHECIDAE	PRIMATA	MAMMALIA
PONGIDAE	PRIMATA	MAMMALIA
HOMINIDAE	PRIMATA	MAMMALIA
ERINACEIDAE	INSECTIVORA	MAMMALIA
TALPIDAE	INSECTIVORA	MAMMALIA
SORICIDAE	INSECTIVORA	MAMMALIA
MOLOSSIDAE	CHIROPTERA	MAMMALIA
RHINOLOPHIDAE	CHIROPTERA	MAMMALIA
VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
ARVICOLIDAE	RODENTIA	MAMMALIA
SPALACIDAE	RODENTIA	MAMMALIA
DIPODIDAE	RODENTIA	MAMMALIA
CRICETIDAE	RODENTIA	MAMMALIA
CASTORIDAE	RODENTIA	MAMMALIA
CAPROMYIDAE	RODENTIA	MAMMALIA
HYSTRICIDAE	RODENTIA	MAMMALIA
GLIRIDAE	RODENTIA	MAMMALIA
SCIURIDAE	RODENTIA	MAMMALIA
MURIDAE	RODENTIA	MAMMALIA
HYDROCHOERIDAE	RODENTIA	MAMMALIA
LEPORIDAE	LAGOMORPHA	MAMMALIA
LAGOMYIDAE	LAGOMORPHA	MAMMALIA
MUSTELIDAE	CARNIVORA	MAMMALIA
CANIDAE	CARNIVORA	MAMMALIA
AILURIDAE	CARNIVORA	MAMMALIA
URSIDAE	CARNIVORA	MAMMALIA
FELIDAE	CARNIVORA	MAMMALIA
VIVERRIDAE	CARNIVORA	MAMMALIA
HYAENIDAE	CARNIVORA	MAMMALIA
ODOBAENIDAE	CARNIVORA	MAMMALIA
PHOCIDAE	CARNIVORA	MAMMALIA
SUIDAE	ARTIODACTYLA	MAMMALIA
HIPPOPOTAMIDAE	ARTIODACTYLA	MAMMALIA
CAMELIDAE	ARTIODACTYLA	MAMMALIA
GIRAFFIDAE	ARTIODACTYLA	MAMMALIA
CERVIDAE	ARTIODACTYLA	MAMMALIA
ANTILOCAPRIDAE	ARTIODACTYLA	MAMMALIA
BOVIDAE	ARTIODACTYLA	MAMMALIA
EQUIDAE	PERISSODACTYLA	MAMMALIA
TAPIRIDAE	PERISSODACTYLA	MAMMALIA
RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
GOMPHOTERIIDAE	PROBOSCIDEA	MAMMALIA
ELEPHANTIDAE	PROBOSCIDEA	MAMMALIA
DELPHINIDAE	CETACEA	MAMMALIA
PHOCAENIDAE	CETACEA	MAMMALIA
MONODONLIDAE	CETACEA	MAMMALIA
PHYSETERIDAE	CETACEA	MAMMALIA
ZIPHIIDAE	CETACEA	MAMMALIA
BALAONOPTERIDAE	CETACEA	MAMMALIA
BALAENIDAE	CETACEA	MAMMALIA
PODICIPEDIDAE	PODICIPEDIFORMA	AVES
DIOMEDEIDAE	PROCELLARIIFORMA	AVES
HYDROBATIDAE	PROCELLARIIFORMA	AVES
PROCELLARIIDAE	PROCELLARIIFORMA	AVES
SULIDAE	PELECANIFORMA	AVES
PELECANIDAE	PELECANIFORMA	AVES
PHALACROCORACIDAE	PELECANIFORMA	AVES
ARDEIDAE	CICONIIFORMA	AVES
THRESKIORNITHIDAE	CICONIIFORMA	AVES
CICONIIDAE	CICONIIFORMA	AVES
PHOENICOPTERIDAE	PHOENICOPTERIFORMA	AVES
ANATIDAE	ANSERIFORMA	AVES
ACCIPITRIDAE	ACCIPITRIFORMA	AVES
PANDIODIDAE	ACCIPITRIFORMA	AVES
TETRAONIDAE	GALLIFORMA	AVES
PHASIANIDAE	GALLIFORMA	AVES
TURNICIDAE	GRUIFORMA	AVES
GRUIDAE	GRUIFORMA	AVES
OTITIDAE	GRUIFORMA	AVES
RALLIDAE	GRUIFORMA	AVES
PTEROCLIDIDAE	PTEROCLIDIFORMA	AVES
COLUMBIDAE	COLUMBIFORMA	AVES
CUCULIDAE	CUCULIFORMA	AVES
TYTONIDAE	STRIGIFORMA	AVES
STRIGIDAE	STRIGIFORMA	AVES
CAPRIMULGIDAE	CAPRIMULGIFORMA	AVES
APODIDAE	APODIFORMA	AVES
ALCEDINIDAE	CORACIIFORMA	AVES
CORACIIDAE	CORACIIFORMA	AVES
MEROPIDAE	CORACIIFORMA	AVES
UPUPIDAE	CORACIIFORMA	AVES
PICIDAE	PICIFORMA	AVES
HAEMATOPODIDAE	CHARADRIIFORMA	AVES
CHARADRIIDAE	CHARADRIIFORMA	AVES
SCOLOPACIDAE	CHARADRIIFORMA	AVES
PHALAROPIDAE	CHARADRIIFORMA	AVES
STERCORIIDAE	CHARADRIIFORMA	AVES
LARIDAE	CHARADRIIFORMA	AVES
RECURVIROSTRIDAE	CHARADRIIFORMA	AVES
BURHINIDAE	CHARADRIIFORMA	AVES
GLAREOLIDAE	CHARADRIIFORMA	AVES
STERNIDAE	CHARADRIIFORMA	AVES
ALCIDAE	CHARADRIIFORMA	AVES
ALAUDIDAE	PASSERIFORMA	AVES
HIRUNDINIDAE	PASSERIFORMA	AVES
MOTACILLIDAE	PASSERIFORMA	AVES
ORIOLIDAE	PASSERIFORMA	AVES
LANIIDAE	PASSERIFORMA	AVES
STURNIDAE	PASSERIFORMA	AVES
BOMBYCILLIDAE	PASSERIFORMA	AVES
CORVIDAE	PASSERIFORMA	AVES
CINCLIDAE	PASSERIFORMA	AVES
TROGLODYTIDAE	PASSERIFORMA	AVES
PRUNELLIDAE	PASSERIFORMA	AVES
SYLVIDAE	PASSERIFORMA	AVES
TURDIDAE	PASSERIFORMA	AVES
PARIDAE	PASSERIFORMA	AVES
AEGITHALIDAE	PASSERIFORMA	AVES
TIMALIIDAE	PASSERIFORMA	AVES
REMIZIDAE	PASSERIFORMA	AVES
SITTIDAE	PASSERIFORMA	AVES
TICHODROMADIDAE	PASSERIFORMA	AVES
CERTHIIDAE	PASSERIFORMA	AVES
PASSERIDAE	PASSERIFORMA	AVES
FRINGILLIDAE	PASSERIFORMA	AVES
EMBERIZIDAE	PASSERIFORMA	AVES
MUSCICAPIDAE	PASSERIFORMA	AVES
TESTUDINIDAE	CHELONIA	REPTILIA
EMYDIDAE	CHELONIA	REPTILIA
DERMOCHELYDAE	CHELONIA	REPTILIA
CHELONIDAE	CHELONIA	REPTILIA
DISCOGLOSSIDAE	ANURA	AMPHIBIA
LACERTIDAE	SQUAMATA	REPTILIA
AMPHISBAENIDAE	SQUAMATA	REPTILIA
GECKONIDAE	SQUAMATA	REPTILIA
AGAMIDAE	SQUAMATA	REPTILIA
ANGUIDAE	SQUAMATA	REPTILIA
SCINCIDAE	SQUAMATA	REPTILIA
CHAMELEONTIDAE	SQUAMATA	REPTILIA
TYPHLOPIDAE	SERPENTES	REPTILIA
BOIDAE	SERPENTES	REPTILIA
SALAMANDRIDAE	URODELA	AMPHIBIA
PLETHODONTIDAE	URODELA	AMPHIBIA
PROTEIDAE	URODELA	AMPHIBIA
CERITHIIDAE	APOGASTROPODA	MOLLUSCA
TURRITELLIDAE	APOGASTROPODA	MOLLUSCA
RISSOIDAE	APOGASTROPODA	MOLLUSCA
TRIVIDAE	APOGASTROPODA	MOLLUSCA
MURCIIDAE	APOGASTROPODA	MOLLUSCA
NASSARIIDAE	APOGASTROPODA	MOLLUSCA
COSTELLARIIDAE	APOGASTROPODA	MOLLUSCA
TURRIDAE	APOGASTROPODA	MOLLUSCA
POMATIASIDAE+C61	NEOTAENIOGLOSSA	MOLLUSCA
BUFONIDAE	ANURA	AMPHIBIA
PELODYTIDAE	ANURA	AMPHIBIA
PELOBATIDAE	ANURA	AMPHIBIA
HYLIDAE	ANURA	AMPHIBIA
RANIDAE	ANURA	AMPHIBIA
PATELLIDAE	ARCHAEOGASTROPODA	MOLLUSCA
TURBINIDAE	ARCHAEOGASTROPODA	MOLLUSCA
CLAUSILIIDAE	STYLOMMATOPHORA	MOLLUSCA
TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
SUBULINIDAE	STYLOMMATOPHORA	MOLLUSCA
SUCCINEIDAE	STYLOMMATOPHORA	MOLLUSCA
DISCIDAE	STYLOMMATOPHORA	MOLLUSCA
HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
FISSURELLIDAE	ARCHAEOGASTROPODA	MOLLUSCA
LIMACIDAE	STYLOMMATOPHORA	MOLLUSCA
CHONDRINIDAE	STYLOMMATOPHORA	MOLLUSCA
ENIDAE	STYLOMMATOPHORA	MOLLUSCA
LITTORINIDAE	APOGASTROPODA	MOLLUSCA
TESTACELLIDAE	STYLOMMATOPHORA	MOLLUSCA
ZONITIDAE	STYLOMMATOPHORA	MOLLUSCA
HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
PUPILLIDAE	STYLOMMATOPHORA	MOLLUSCA
COLUMBELLIDAE	APOGASTROPODA	MOLLUSCA
MITRIDAE	APOGASTROPODA	MOLLUSCA
FALCONIDAE	FALCONIFORMA	AVES
GAVIIDAE	GAVIIFORMA	AVES
COLUBRIDAE	SQUAMATA	REPTILIA
VIPERIDAE	SQUAMATA	REPTILIA
\.


--
-- Data for Name: remonte_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY remonte_genre (genre, famille, ordre, classe) FROM stdin;
MACACA	CERCOPITHECIDAE	PRIMATA	MAMMALIA
PONGO	PONGIDAE	PRIMATA	MAMMALIA
GORILLA	PONGIDAE	PRIMATA	MAMMALIA
PAN	PONGIDAE	PRIMATA	MAMMALIA
HOMO	HOMINIDAE	PRIMATA	MAMMALIA
AUSTRALOPITHECUS	HOMINIDAE	PRIMATA	MAMMALIA
EUROPAEUS	ERINACEIDAE	INSECTIVORA	MAMMALIA
ALGIRUS	ERINACEIDAE	INSECTIVORA	MAMMALIA
DAVIDI	ERINACEIDAE	INSECTIVORA	MAMMALIA
HEMIECHINUS	ERINACEIDAE	INSECTIVORA	MAMMALIA
GALEMYS	TALPIDAE	INSECTIVORA	MAMMALIA
TALPA	TALPIDAE	INSECTIVORA	MAMMALIA
DESMANA	TALPIDAE	INSECTIVORA	MAMMALIA
SOREX	SORICIDAE	INSECTIVORA	MAMMALIA
NEOMYS	SORICIDAE	INSECTIVORA	MAMMALIA
SUNCUS	SORICIDAE	INSECTIVORA	MAMMALIA
CROCIDURA	SORICIDAE	INSECTIVORA	MAMMALIA
MYOSOREX	SORICIDAE	INSECTIVORA	MAMMALIA
DEPRANOSOREX	SORICIDAE	INSECTIVORA	MAMMALIA
PETENYIA	SORICIDAE	INSECTIVORA	MAMMALIA
DEINSDORFIA	SORICIDAE	INSECTIVORA	MAMMALIA
BLARINELLA	SORICIDAE	INSECTIVORA	MAMMALIA
BERENENDIA	SORICIDAE	INSECTIVORA	MAMMALIA
EPISORICULUS	SORICIDAE	INSECTIVORA	MAMMALIA
SORICULUS	SORICIDAE	INSECTIVORA	MAMMALIA
BLARINOIDES	SORICIDAE	INSECTIVORA	MAMMALIA
TADARIDA	MOLOSSIDAE	CHIROPTERA	MAMMALIA
SAUROMYS	MOLOSSIDAE	CHIROPTERA	MAMMALIA
RHINOLOPHUS	RHINOLOPHIDAE	CHIROPTERA	MAMMALIA
MYOTIS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
VESPERTILIO	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
EPTESICUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
NYCTALUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
PIPISTRELLUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
BARBASTELLA	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
PLECOTUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
MINIOPTERUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
LASIURUS	VESPERTILIONIDAE	CHIROPTERA	MAMMALIA
MICROTUS	ARVICOLIDAE	RODENTIA	MAMMALIA
TERRICOLA	ARVICOLIDAE	RODENTIA	MAMMALIA
ALLOPHAIOMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
DYNAROMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
ARVICOLA	ARVICOLIDAE	RODENTIA	MAMMALIA
ONDRATA	ARVICOLIDAE	RODENTIA	MAMMALIA
CLETHRIONOMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
LEMMUS	ARVICOLIDAE	RODENTIA	MAMMALIA
MYOPUS	ARVICOLIDAE	RODENTIA	MAMMALIA
DICROSTONYX	ARVICOLIDAE	RODENTIA	MAMMALIA
ELLOBIUS	ARVICOLIDAE	RODENTIA	MAMMALIA
LAGURUS	ARVICOLIDAE	RODENTIA	MAMMALIA
MIMOMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
PLIOMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
UNGAROMYS	ARVICOLIDAE	RODENTIA	MAMMALIA
SPALAX	SPALACIDAE	RODENTIA	MAMMALIA
PROSIPHNEUS	SPALACIDAE	RODENTIA	MAMMALIA
MYOSPALAX	SPALACIDAE	RODENTIA	MAMMALIA
SICISTA	DIPODIDAE	RODENTIA	MAMMALIA
ALLACTAGA	DIPODIDAE	RODENTIA	MAMMALIA
CRICETUS	CRICETIDAE	RODENTIA	MAMMALIA
VILLANYIA	CRICETIDAE	RODENTIA	MAMMALIA
MESOCRICETUS	CRICETIDAE	RODENTIA	MAMMALIA
ALLOCRICETUS	CRICETIDAE	RODENTIA	MAMMALIA
PEROMYSCUS	CRICETIDAE	RODENTIA	MAMMALIA
CRICETULUS	CRICETIDAE	RODENTIA	MAMMALIA
MERIONES	CRICETIDAE	RODENTIA	MAMMALIA
CRICETINUS	CRICETIDAE	RODENTIA	MAMMALIA
CASTOR	CASTORIDAE	RODENTIA	MAMMALIA
TROGONTHERIUM	CASTORIDAE	RODENTIA	MAMMALIA
MYOCASTOR	CAPROMYIDAE	RODENTIA	MAMMALIA
HYSTRIX	HYSTRICIDAE	RODENTIA	MAMMALIA
GLIRULUS	GLIRIDAE	RODENTIA	MAMMALIA
ELIOMYS	GLIRIDAE	RODENTIA	MAMMALIA
MYOMIMUS	GLIRIDAE	RODENTIA	MAMMALIA
DRYOMYS	GLIRIDAE	RODENTIA	MAMMALIA
MUSCARDINUS	GLIRIDAE	RODENTIA	MAMMALIA
GLIS	GLIRIDAE	RODENTIA	MAMMALIA
SCIURUS	SCIURIDAE	RODENTIA	MAMMALIA
PLIOLAGUS 	LEPORIDAE	LAGOMORPHA	MAMMALIA
PTEROMYS	SCIURIDAE	RODENTIA	MAMMALIA
TAMIAS	SCIURIDAE	RODENTIA	MAMMALIA
CITELLUS	SCIURIDAE	RODENTIA	MAMMALIA
MARMOTA	SCIURIDAE	RODENTIA	MAMMALIA
CYNONYS	SCIURIDAE	RODENTIA	MAMMALIA
RHAGAMYS	MURIDAE	RODENTIA	MAMMALIA
ACOMYS	MURIDAE	RODENTIA	MAMMALIA
MICROMYS	MURIDAE	RODENTIA	MAMMALIA
APODEMUS	MURIDAE	RODENTIA	MAMMALIA
RATTUS	MURIDAE	RODENTIA	MAMMALIA
LEMNISCONYS	MURIDAE	RODENTIA	MAMMALIA
HYDROCHOERUS	HYDROCHOERIDAE	RODENTIA	MAMMALIA
ORYCTOLAGUS	LEPORIDAE	LAGOMORPHA	MAMMALIA
LEPUS	LEPORIDAE	LAGOMORPHA	MAMMALIA
HYPOLAGUS	LEPORIDAE	LAGOMORPHA	MAMMALIA
OCHOTONOIDES	LAGOMYIDAE	LAGOMORPHA	MAMMALIA
PROLAGOMYS	LAGOMYIDAE	LAGOMORPHA	MAMMALIA
OCHOTONA	LAGOMYIDAE	LAGOMORPHA	MAMMALIA
PROLAGUS	LAGOMYIDAE	LAGOMORPHA	MAMMALIA
MUSTELA	MUSTELIDAE	CARNIVORA	MAMMALIA
MARTES	MUSTELIDAE	CARNIVORA	MAMMALIA
GULO	MUSTELIDAE	CARNIVORA	MAMMALIA
MELES	MUSTELIDAE	CARNIVORA	MAMMALIA
LUTRA	MUSTELIDAE	CARNIVORA	MAMMALIA
GALICTIS	MUSTELIDAE	CARNIVORA	MAMMALIA
MEPHITIS	MUSTELIDAE	CARNIVORA	MAMMALIA
BARANOGALE	MUSTELIDAE	CARNIVORA	MAMMALIA
VORMELA	MUSTELIDAE	CARNIVORA	MAMMALIA
MEGANTEREON	FELIDAE	CARNIVORA	MAMMALIA
PANONICTIS	MUSTELIDAE	CARNIVORA	MAMMALIA
MELLIVORA	MUSTELIDAE	CARNIVORA	MAMMALIA
ENHYDRA	MUSTELIDAE	CARNIVORA	MAMMALIA
CANIS	CANIDAE	CARNIVORA	MAMMALIA
CUON	CANIDAE	CARNIVORA	MAMMALIA
FENNECUS	CANIDAE	CARNIVORA	MAMMALIA
ALOPEX	CANIDAE	CARNIVORA	MAMMALIA
VULPES	CANIDAE	CARNIVORA	MAMMALIA
NYCTEREUTES	CANIDAE	CARNIVORA	MAMMALIA
LYCAON	CANIDAE	CARNIVORA	MAMMALIA
AILURUS	AILURIDAE	CARNIVORA	MAMMALIA
URSUS	URSIDAE	CARNIVORA	MAMMALIA
HELARCTOS	URSIDAE	CARNIVORA	MAMMALIA
TREMARCTOS	URSIDAE	CARNIVORA	MAMMALIA
MELUSUS	URSIDAE	CARNIVORA	MAMMALIA
PLIONARCTOS	URSIDAE	CARNIVORA	MAMMALIA
ACINONYX	FELIDAE	CARNIVORA	MAMMALIA
FELIS	FELIDAE	CARNIVORA	MAMMALIA
CARACAL	FELIDAE	CARNIVORA	MAMMALIA
PUMA	FELIDAE	CARNIVORA	MAMMALIA
LYNX	FELIDAE	CARNIVORA	MAMMALIA
PANTHERA	FELIDAE	CARNIVORA	MAMMALIA
HOMOTHERIUM	FELIDAE	CARNIVORA	MAMMALIA
MACHAIRODUS	FELIDAE	CARNIVORA	MAMMALIA
GENETTA	VIVERRIDAE	CARNIVORA	MAMMALIA
HERPESTES	VIVERRIDAE	CARNIVORA	MAMMALIA
VIVERRA	VIVERRIDAE	CARNIVORA	MAMMALIA
MUNGO	VIVERRIDAE	CARNIVORA	MAMMALIA
FOSSA	VIVERRIDAE	CARNIVORA	MAMMALIA
SURICATA	VIVERRIDAE	CARNIVORA	MAMMALIA
CROCUTA	HYAENIDAE	CARNIVORA	MAMMALIA
HYAENA	HYAENIDAE	CARNIVORA	MAMMALIA
PROTELES	HYAENIDAE	CARNIVORA	MAMMALIA
EURYBOAS	HYAENIDAE	CARNIVORA	MAMMALIA
ODOBAENUS	ODOBAENIDAE	CARNIVORA	MAMMALIA
PHOCA	PHOCIDAE	CARNIVORA	MAMMALIA
PUSA	PHOCIDAE	CARNIVORA	MAMMALIA
PAGOPHILUS	PHOCIDAE	CARNIVORA	MAMMALIA
HALICHOERUS	PHOCIDAE	CARNIVORA	MAMMALIA
ERIGNATHUS	PHOCIDAE	CARNIVORA	MAMMALIA
CYSTOPHORA	PHOCIDAE	CARNIVORA	MAMMALIA
MONACHUS	PHOCIDAE	CARNIVORA	MAMMALIA
PHACOCHOERUS	SUIDAE	ARTIODACTYLA	MAMMALIA
SUS	SUIDAE	ARTIODACTYLA	MAMMALIA
HIPPOPOTAMUS	HIPPOPOTAMIDAE	ARTIODACTYLA	MAMMALIA
CAMELUS	CAMELIDAE	ARTIODACTYLA	MAMMALIA
LAMA	CAMELIDAE	ARTIODACTYLA	MAMMALIA
GIRAFFA	GIRAFFIDAE	ARTIODACTYLA	MAMMALIA
OKAPIA	GIRAFFIDAE	ARTIODACTYLA	MAMMALIA
SIVATHERIUM	GIRAFFIDAE	ARTIODACTYLA	MAMMALIA
CERVUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
CROIZETOCEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
EUCLADOCEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
DAMA	CERVIDAE	ARTIODACTYLA	MAMMALIA
ALCES	CERVIDAE	ARTIODACTYLA	MAMMALIA
RANGIFER	CERVIDAE	ARTIODACTYLA	MAMMALIA
MEGALOCEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
PRAEMEGACEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
ARVERNOCEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
CAPREOLUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
MUNTIACUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
ELAPHURUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
AXIS	CERVIDAE	ARTIODACTYLA	MAMMALIA
HYELOPHUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
SIKA	CERVIDAE	ARTIODACTYLA	MAMMALIA
RUCERVUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
PRJEVALSKIUM	CERVIDAE	ARTIODACTYLA	MAMMALIA
PUDU	CERVIDAE	ARTIODACTYLA	MAMMALIA
OZOTOCEROS	CERVIDAE	ARTIODACTYLA	MAMMALIA
MAZAMA	CERVIDAE	ARTIODACTYLA	MAMMALIA
ODOCOILEUS	CERVIDAE	ARTIODACTYLA	MAMMALIA
HYDROPOTES	CERVIDAE	ARTIODACTYLA	MAMMALIA
ANTILOCAPRA	ANTILOCAPRIDAE	ARTIODACTYLA	MAMMALIA
LEPTOBOS	BOVIDAE	ARTIODACTYLA	MAMMALIA
BOS	BOVIDAE	ARTIODACTYLA	MAMMALIA
BISON	BOVIDAE	ARTIODACTYLA	MAMMALIA
BUBALUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
SYNCERUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
SOERGILIA	BOVIDAE	ARTIODACTYLA	MAMMALIA
OVIBOS	BOVIDAE	ARTIODACTYLA	MAMMALIA
PRAEOVIBOS	BOVIDAE	ARTIODACTYLA	MAMMALIA
GAZELLOSPIRA	BOVIDAE	ARTIODACTYLA	MAMMALIA
ALCELAPHUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
ANTIDORCAS	BOVIDAE	ARTIODACTYLA	MAMMALIA
ADDAX	BOVIDAE	ARTIODACTYLA	MAMMALIA
BOSELAPHUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
GAZELLA	BOVIDAE	ARTIODACTYLA	MAMMALIA
CONNOCHAETES	BOVIDAE	ARTIODACTYLA	MAMMALIA
DAMALISCUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
HIPPOTRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
KOBUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
ORYX	BOVIDAE	ARTIODACTYLA	MAMMALIA
SYLVICAPRA	BOVIDAE	ARTIODACTYLA	MAMMALIA
TAUROTRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
TRAGELAPHUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
SAIGA	BOVIDAE	ARTIODACTYLA	MAMMALIA
MYOTRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
RUPICAPRA	BOVIDAE	ARTIODACTYLA	MAMMALIA
GALLOGORAL	BOVIDAE	ARTIODACTYLA	MAMMALIA
PROCAMPTOCERAS	BOVIDAE	ARTIODACTYLA	MAMMALIA
OVIS	BOVIDAE	ARTIODACTYLA	MAMMALIA
CAPRA	BOVIDAE	ARTIODACTYLA	MAMMALIA
MEGALOVIS	BOVIDAE	ARTIODACTYLA	MAMMALIA
AMNOTRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
HEMITRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
PLIOTRAGUS	BOVIDAE	ARTIODACTYLA	MAMMALIA
HIPPARION	EQUIDAE	PERISSODACTYLA	MAMMALIA
EQUUS	EQUIDAE	PERISSODACTYLA	MAMMALIA
TAPIRUS	TAPIRIDAE	PERISSODACTYLA	MAMMALIA
DICERORHINUS	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
ELASMOTHERIUM	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
DICEROS	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
RHINOCEROS	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
CERAROTHERIUM	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
STEPHANORHINUS	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
ANANCUS	GOMPHOTERIIDAE	PROBOSCIDEA	MAMMALIA
ELEPHAS	ELEPHANTIDAE	PROBOSCIDEA	MAMMALIA
LOXODONTA	ELEPHANTIDAE	PROBOSCIDEA	MAMMALIA
MAMMUTHUS	ELEPHANTIDAE	PROBOSCIDEA	MAMMALIA
DELPHINUS	DELPHINIDAE	CETACEA	MAMMALIA
TURSIOPS	DELPHINIDAE	CETACEA	MAMMALIA
GLOBICEPHALA	DELPHINIDAE	CETACEA	MAMMALIA
GRAMPUS	DELPHINIDAE	CETACEA	MAMMALIA
ORCINUS	DELPHINIDAE	CETACEA	MAMMALIA
PHOCAENA	PHOCAENIDAE	CETACEA	MAMMALIA
DELPHINAPTERUS	MONODONLIDAE	CETACEA	MAMMALIA
MONODON	MONODONLIDAE	CETACEA	MAMMALIA
PHYSETER	PHYSETERIDAE	CETACEA	MAMMALIA
HYPEROODON	ZIPHIIDAE	CETACEA	MAMMALIA
ZYPHIUS	ZIPHIIDAE	CETACEA	MAMMALIA
BALAENOPTERA	BALAONOPTERIDAE	CETACEA	MAMMALIA
MEGAPTERA	BALAONOPTERIDAE	CETACEA	MAMMALIA
BALAENA	BALAENIDAE	CETACEA	MAMMALIA
GAVIA	GAVIIDAE	GAVIIFORMA	AVES
PODICEPS	PODICIPEDIDAE	PODICIPEDIFORMA	AVES
TACHYBAPTUS	PODICIPEDIDAE	PODICIPEDIFORMA	AVES
PODILYMBUS	PODICIPEDIDAE	PODICIPEDIFORMA	AVES
DIOMEDEA	DIOMEDEIDAE	PROCELLARIIFORMA	AVES
OCEANODROMA	HYDROBATIDAE	PROCELLARIIFORMA	AVES
OCEANITES	HYDROBATIDAE	PROCELLARIIFORMA	AVES
HYDROBATES	HYDROBATIDAE	PROCELLARIIFORMA	AVES
PELAGODROMA	HYDROBATIDAE	PROCELLARIIFORMA	AVES
BULWERIA	PROCELLARIIDAE	PROCELLARIIFORMA	AVES
PTERODROMA	PROCELLARIIDAE	PROCELLARIIFORMA	AVES
FULMARUS	PROCELLARIIDAE	PROCELLARIIFORMA	AVES
CALONECTRIS	PROCELLARIIDAE	PROCELLARIIFORMA	AVES
PUFFINUS	PROCELLARIIDAE	PROCELLARIIFORMA	AVES
SULA 	SULIDAE	PELECANIFORMA	AVES
PELECANUS	PELECANIDAE	PELECANIFORMA	AVES
PHALACROCORAX	PHALACROCORACIDAE	PELECANIFORMA	AVES
BOTAURUS	ARDEIDAE	CICONIIFORMA	AVES
IXOBRYCHUS	ARDEIDAE	CICONIIFORMA	AVES
ARDEOLA	ARDEIDAE	CICONIIFORMA	AVES
NYCTICORAX	ARDEIDAE	CICONIIFORMA	AVES
BULBUCUS	ARDEIDAE	CICONIIFORMA	AVES
EGRETTA	ARDEIDAE	CICONIIFORMA	AVES
ARDEA	ARDEIDAE	CICONIIFORMA	AVES
PLATALEA	THRESKIORNITHIDAE	CICONIIFORMA	AVES
PLEGADIS	THRESKIORNITHIDAE	CICONIIFORMA	AVES
THRESKIORNIS	THRESKIORNITHIDAE	CICONIIFORMA	AVES
GERONTICUS	THRESKIORNITHIDAE	CICONIIFORMA	AVES
CICONIA	CICONIIDAE	CICONIIFORMA	AVES
PHOENICOPTRUS	PHOENICOPTERIDAE	PHOENICOPTERIFORMA	AVES
CYGNUS	ANATIDAE	ANSERIFORMA	AVES
BRANTA	ANATIDAE	ANSERIFORMA	AVES
ANSER	ANATIDAE	ANSERIFORMA	AVES
ANAS	ANATIDAE	ANSERIFORMA	AVES
MARMARONETTA	ANATIDAE	ANSERIFORMA	AVES
ALOPOCHEN	ANATIDAE	ANSERIFORMA	AVES
AIX	ANATIDAE	ANSERIFORMA	AVES
TADORNA	ANATIDAE	ANSERIFORMA	AVES
NETTA	ANATIDAE	ANSERIFORMA	AVES
AYTHYA	ANATIDAE	ANSERIFORMA	AVES
BUCEPHALA	ANATIDAE	ANSERIFORMA	AVES
HISTRIONICUS	ANATIDAE	ANSERIFORMA	AVES
CLANGULA	ANATIDAE	ANSERIFORMA	AVES
MELANITTA	ANATIDAE	ANSERIFORMA	AVES
SOMATERIA	ANATIDAE	ANSERIFORMA	AVES
POLYCTICTA	ANATIDAE	ANSERIFORMA	AVES
MERGUS	ANATIDAE	ANSERIFORMA	AVES
OXYURA	ANATIDAE	ANSERIFORMA	AVES
NEOPHRON	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
GYPS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
AEGYPIUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
GYPAETUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
HALIAEETUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
AQUILA	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
HIERAAETUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
CIRCAETUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
BUTEO	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
PERNIS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
ACCIPITER	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
MILVUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
ELANUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
CIRCUS	ACCIPITRIDAE	ACCIPITRIFORMA	AVES
PANDION	PANDIODIDAE	ACCIPITRIFORMA	AVES
LAGOPUS	TETRAONIDAE	GALLIFORMA	AVES
TETRAOGALLUS	TETRAONIDAE	GALLIFORMA	AVES
TETRAO	TETRAONIDAE	GALLIFORMA	AVES
BONASA	TETRAONIDAE	GALLIFORMA	AVES
ALECTORIS	PHASIANIDAE	GALLIFORMA	AVES
PERDIX	PHASIANIDAE	GALLIFORMA	AVES
FRANCOLINUS	PHASIANIDAE	GALLIFORMA	AVES
PHASIANUS	PHASIANIDAE	GALLIFORMA	AVES
CHRYSOLOPUS	PHASIANIDAE	GALLIFORMA	AVES
COTURNIX	PHASIANIDAE	GALLIFORMA	AVES
TURNIX	TURNICIDAE	GRUIFORMA	AVES
GRUS	GRUIDAE	GRUIFORMA	AVES
ANTHROPOIDES	GRUIDAE	GRUIFORMA	AVES
OTIS	OTITIDAE	GRUIFORMA	AVES
TETRAX	OTITIDAE	GRUIFORMA	AVES
CHLAMYDOTIS	OTITIDAE	GRUIFORMA	AVES
RALLUS	RALLIDAE	GRUIFORMA	AVES
CREX	RALLIDAE	GRUIFORMA	AVES
PORZANA	RALLIDAE	GRUIFORMA	AVES
PORPHYRIO	RALLIDAE	GRUIFORMA	AVES
PORPHYRULLA	RALLIDAE	GRUIFORMA	AVES
GALLINULA	RALLIDAE	GRUIFORMA	AVES
FULICA	RALLIDAE	GRUIFORMA	AVES
SYRRHAPTES	PTEROCLIDIDAE	PTEROCLIDIFORMA	AVES
PTEROCLES	PTEROCLIDIDAE	PTEROCLIDIFORMA	AVES
COLUMBA	COLUMBIDAE	COLUMBIFORMA	AVES
STREPTOPELIA	COLUMBIDAE	COLUMBIFORMA	AVES
CUCULUS	CUCULIDAE	CUCULIFORMA	AVES
CLAMATOR	CUCULIDAE	CUCULIFORMA	AVES
COCCYZUS	CUCULIDAE	CUCULIFORMA	AVES
TYTO	TYTONIDAE	STRIGIFORMA	AVES
OTUS	STRIGIDAE	STRIGIFORMA	AVES
GLAUCIDIUM	STRIGIDAE	STRIGIFORMA	AVES
ATHENE	STRIGIDAE	STRIGIFORMA	AVES
AEGOLIUS	STRIGIDAE	STRIGIFORMA	AVES
BUBO	STRIGIDAE	STRIGIFORMA	AVES
NYCTEA	STRIGIDAE	STRIGIFORMA	AVES
STRIX	STRIGIDAE	STRIGIFORMA	AVES
CAPRIMULGUS	CAPRIMULGIDAE	CAPRIMULGIFORMA	AVES
CHORDEILES	CAPRIMULGIDAE	CAPRIMULGIFORMA	AVES
APUS	APODIDAE	APODIFORMA	AVES
ALCEDO	ALCEDINIDAE	CORACIIFORMA	AVES
CERYLE	ALCEDINIDAE	CORACIIFORMA	AVES
CORACIA	CORACIIDAE	CORACIIFORMA	AVES
MEROPS	MEROPIDAE	CORACIIFORMA	AVES
UPUPA	UPUPIDAE	CORACIIFORMA	AVES
PICUS	PICIDAE	PICIFORMA	AVES
PICOIDES	PICIDAE	PICIFORMA	AVES
DRYOCOPUS	PICIDAE	PICIFORMA	AVES
JYNX	PICIDAE	PICIFORMA	AVES
HAEMATOPUS	HAEMATOPODIDAE	CHARADRIIFORMA	AVES
PLUVIALIS	CHARADRIIDAE	CHARADRIIFORMA	AVES
EUDROMIAS	CHARADRIIDAE	CHARADRIIFORMA	AVES
VANELLUS	CHARADRIIDAE	CHARADRIIFORMA	AVES
HOPLOPTERUS	CHARADRIIDAE	CHARADRIIFORMA	AVES
CHETTUSIA	CHARADRIIDAE	CHARADRIIFORMA	AVES
ARENARIA	CHARADRIIDAE	CHARADRIIFORMA	AVES
CHARADRIUS	CHARADRIIDAE	CHARADRIIFORMA	AVES
CALIDRIS	SCOLOPACIDAE	CHARADRIIFORMA	AVES
LIMICOLA	SCOLOPACIDAE	CHARADRIIFORMA	AVES
LIMNODROMUS	SCOLOPACIDAE	CHARADRIIFORMA	AVES
MICROPALAMA	SCOLOPACIDAE	CHARADRIIFORMA	AVES
SCOLOPAX	SCOLOPACIDAE	CHARADRIIFORMA	AVES
GALLINAGO	SCOLOPACIDAE	CHARADRIIFORMA	AVES
LYMNOCRYPTES	SCOLOPACIDAE	CHARADRIIFORMA	AVES
PHALAROPUS	PHALAROPIDAE	CHARADRIIFORMA	AVES
STERCORARIUS	STERCORIIDAE	CHARADRIIFORMA	AVES
PAGOPHILA	LARIDAE	CHARADRIIFORMA	AVES
RHODOSTHETIA	LARIDAE	CHARADRIIFORMA	AVES
LARUS	LARIDAE	CHARADRIIFORMA	AVES
RISSA	LARIDAE	CHARADRIIFORMA	AVES
NUMENIUS	LARIDAE	CHARADRIIFORMA	AVES
LIMOSA	LARIDAE	CHARADRIIFORMA	AVES
ACTITIS	LARIDAE	CHARADRIIFORMA	AVES
TRINGA	LARIDAE	CHARADRIIFORMA	AVES
XENUS	LARIDAE	CHARADRIIFORMA	AVES
PHILOMACHUS	LARIDAE	CHARADRIIFORMA	AVES
TRYNGITES	LARIDAE	CHARADRIIFORMA	AVES
BARTRAMIA	LARIDAE	CHARADRIIFORMA	AVES
RECURVIROSTRA	RECURVIROSTRIDAE	CHARADRIIFORMA	AVES
HIMANTOPUS	RECURVIROSTRIDAE	CHARADRIIFORMA	AVES
BURHINUS	BURHINIDAE	CHARADRIIFORMA	AVES
CURSORIUS	GLAREOLIDAE	CHARADRIIFORMA	AVES
GLAEROLA	GLAREOLIDAE	CHARADRIIFORMA	AVES
GELOCHELIDON	STERNIDAE	CHARADRIIFORMA	AVES
CHLIDONIAS	STERNIDAE	CHARADRIIFORMA	AVES
STERNA	STERNIDAE	CHARADRIIFORMA	AVES
ALCA	ALCIDAE	CHARADRIIFORMA	AVES
URIA	ALCIDAE	CHARADRIIFORMA	AVES
ALLE	ALCIDAE	CHARADRIIFORMA	AVES
CEPHUS	ALCIDAE	CHARADRIIFORMA	AVES
FRATERCULA	ALCIDAE	CHARADRIIFORMA	AVES
CHERSOPHILUS	ALAUDIDAE	PASSERIFORMA	AVES
CALANDRELLA	ALAUDIDAE	PASSERIFORMA	AVES
MELANOCRYPHA	ALAUDIDAE	PASSERIFORMA	AVES
GALERIDA	ALAUDIDAE	PASSERIFORMA	AVES
ALAUDA	ALAUDIDAE	PASSERIFORMA	AVES
LULLULA	ALAUDIDAE	PASSERIFORMA	AVES
EREMOPHILA	ALAUDIDAE	PASSERIFORMA	AVES
RIPARIA	HIRUNDINIDAE	PASSERIFORMA	AVES
PTYONOPROGNE	HIRUNDINIDAE	PASSERIFORMA	AVES
DELICHON	HIRUNDINIDAE	PASSERIFORMA	AVES
HIRUNDO	HIRUNDINIDAE	PASSERIFORMA	AVES
ANTHUS	MOTACILLIDAE	PASSERIFORMA	AVES
MOTACILLA	MOTACILLIDAE	PASSERIFORMA	AVES
ORIOLUS	ORIOLIDAE	PASSERIFORMA	AVES
LANIUS	LANIIDAE	PASSERIFORMA	AVES
STURNUS	STURNIDAE	PASSERIFORMA	AVES
BOMBYCILLA	BOMBYCILLIDAE	PASSERIFORMA	AVES
PERISOREUS	CORVIDAE	PASSERIFORMA	AVES
CYANOPICA	CORVIDAE	PASSERIFORMA	AVES
PICA	CORVIDAE	PASSERIFORMA	AVES
NUCIFRAGA	CORVIDAE	PASSERIFORMA	AVES
PYRRHOCORAX	CORVIDAE	PASSERIFORMA	AVES
CORVUS	CORVIDAE	PASSERIFORMA	AVES
CINCLUS	CINCLIDAE	PASSERIFORMA	AVES
TROGLODYTES	TROGLODYTIDAE	PASSERIFORMA	AVES
PRUNELLA	PRUNELLIDAE	PASSERIFORMA	AVES
CETTIA	SYLVIDAE	PASSERIFORMA	AVES
LOCUSTELLA	SYLVIDAE	PASSERIFORMA	AVES
ACROCEPHALUS	SYLVIDAE	PASSERIFORMA	AVES
CISTICOLA	SYLVIDAE	PASSERIFORMA	AVES
HIPPOLAIS	SYLVIDAE	PASSERIFORMA	AVES
SYLVIA	SYLVIDAE	PASSERIFORMA	AVES
CERCOTRICHAS	TURDIDAE	PASSERIFORMA	AVES
PHYLLOSCOPUS	TURDIDAE	PASSERIFORMA	AVES
REGULUS	TURDIDAE	PASSERIFORMA	AVES
CATHARUS	TURDIDAE	PASSERIFORMA	AVES
TURDUS	TURDIDAE	PASSERIFORMA	AVES
ZOOTHERA	TURDIDAE	PASSERIFORMA	AVES
PARUS	PARIDAE	PASSERIFORMA	AVES
AEGITHALOS	AEGITHALIDAE	PASSERIFORMA	AVES
REMIZ	REMIZIDAE	PASSERIFORMA	AVES
SITTA	SITTIDAE	PASSERIFORMA	AVES
TICHODROMA	TICHODROMADIDAE	PASSERIFORMA	AVES
CERTHIA	CERTHIIDAE	PASSERIFORMA	AVES
PASSER	PASSERIDAE	PASSERIFORMA	AVES
PETRONIA	PASSERIDAE	PASSERIFORMA	AVES
FRINGILLA	FRINGILLIDAE	PASSERIFORMA	AVES
PYRRHULA	FRINGILLIDAE	PASSERIFORMA	AVES
COCCOTHRAUSTES	FRINGILLIDAE	PASSERIFORMA	AVES
SERINUS	FRINGILLIDAE	PASSERIFORMA	AVES
CARDUELIS	FRINGILLIDAE	PASSERIFORMA	AVES
BUCANETES	FRINGILLIDAE	PASSERIFORMA	AVES
PINICOLA	FRINGILLIDAE	PASSERIFORMA	AVES
CARPODACUS	FRINGILLIDAE	PASSERIFORMA	AVES
LOXIA	FRINGILLIDAE	PASSERIFORMA	AVES
MILARIA	EMBERIZIDAE	PASSERIFORMA	AVES
CALCARIUS	EMBERIZIDAE	PASSERIFORMA	AVES
PLECTROPHENAX	EMBERIZIDAE	PASSERIFORMA	AVES
EMBERIZA	EMBERIZIDAE	PASSERIFORMA	AVES
MUSICAPA	MUSCICAPIDAE	PASSERIFORMA	AVES
FICEDULA	MUSCICAPIDAE	PASSERIFORMA	AVES
OENANTHE	MUSCICAPIDAE	PASSERIFORMA	AVES
SAXICOLA	MUSCICAPIDAE	PASSERIFORMA	AVES
MONTICOLA	MUSCICAPIDAE	PASSERIFORMA	AVES
TARSIGER	MUSCICAPIDAE	PASSERIFORMA	AVES
LUSCINIA	MUSCICAPIDAE	PASSERIFORMA	AVES
IRANIA	MUSCICAPIDAE	PASSERIFORMA	AVES
TESTUDO	TESTUDINIDAE	CHELONIA	REPTILIA
ANGUIS	ANGUIDAE	SQUAMATA	REPTILIA
OPHISAURUS	ANGUIDAE	SQUAMATA	REPTILIA
EMYS	EMYDIDAE	CHELONIA	REPTILIA
MAUREMYS	EMYDIDAE	CHELONIA	REPTILIA
DERMOCHELYS	DERMOCHELYDAE	CHELONIA	REPTILIA
CARETTA	CHELONIDAE	CHELONIA	REPTILIA
LEPIDOCHELYS	CHELONIDAE	CHELONIA	REPTILIA
CHELONIA	CHELONIDAE	CHELONIA	REPTILIA
ERETHMOCHELYS	CHELONIDAE	CHELONIA	REPTILIA
ALGYROIDES	LACERTIDAE	SQUAMATA	REPTILIA
OPHISOPS	LACERTIDAE	SQUAMATA	REPTILIA
PSAMMODROMUS	LACERTIDAE	SQUAMATA	REPTILIA
EREMIAS	LACERTIDAE	SQUAMATA	REPTILIA
ACANTHODACTYLUS	LACERTIDAE	SQUAMATA	REPTILIA
LACERTA	LACERTIDAE	SQUAMATA	REPTILIA
PODARCIS	LACERTIDAE	SQUAMATA	REPTILIA
BLANUS	AMPHISBAENIDAE	SQUAMATA	REPTILIA
TARENTOLA	GECKONIDAE	SQUAMATA	REPTILIA
HEMIDACTYLUS	GECKONIDAE	SQUAMATA	REPTILIA
CYRTODACTYLUS	GECKONIDAE	SQUAMATA	REPTILIA
PHYLLODACTYLUS	GECKONIDAE	SQUAMATA	REPTILIA
AGAMA	AGAMIDAE	SQUAMATA	REPTILIA
ABLEPHARUS	SCINCIDAE	SQUAMATA	REPTILIA
OPHIOMORUS	SCINCIDAE	SQUAMATA	REPTILIA
CHALCYDES	SCINCIDAE	SQUAMATA	REPTILIA
CHAMELEO	CHAMELEONTIDAE	SQUAMATA	REPTILIA
TYPHLOPS	TYPHLOPIDAE	SERPENTES	REPTILIA
ERYX	BOIDAE	SERPENTES	REPTILIA
VIPERA	VIPERIDAE	SERPENTES	REPTILIA
MALPOLON	COLUBRIDAE	SERPENTES	REPTILIA
ELAPHE	COLUBRIDAE	SERPENTES	REPTILIA
CORONELLA	COLUBRIDAE	SERPENTES	REPTILIA
TELESCOPUS	COLUBRIDAE	SERPENTES	REPTILIA
MACROPROTODON	COLUBRIDAE	SERPENTES	REPTILIA
NATRIX	COLUBRIDAE	SERPENTES	REPTILIA
SALAMANDRA	SALAMANDRIDAE	URODELA	AMPHIBIA
BOS/BISON	BOVIDAE	ARTIODACTYLA	MAMMALIA
FISSURELLA	FISSURELLIDAE	ARCHAEOGASTROPODA	MOLLUSCA
SALAMANDRINA	SALAMANDRIDAE	URODELA	AMPHIBIA
CHIOGLOSSA	SALAMANDRIDAE	URODELA	AMPHIBIA
PLEURODELES	SALAMANDRIDAE	URODELA	AMPHIBIA
EUPROCTUS	SALAMANDRIDAE	URODELA	AMPHIBIA
CERITHIUM	CERITHIIDAE	APOGASTROPODA	MOLLUSCA
TURRITELLA	TURRITELLIDAE	APOGASTROPODA	MOLLUSCA
TRITURUS	SALAMANDRIDAE	URODELA	AMPHIBIA
MUREX	MURCIIDAE	APOGASTROPODA	MOLLUSCA
MURICOPSIS	MURCIIDAE	APOGASTROPODA	MOLLUSCA
OCENEBRA	MURCIIDAE	APOGASTROPODA	MOLLUSCA
OCINEBRINA	MURCIIDAE	APOGASTROPODA	MOLLUSCA
MITRELLA	COLUMBELLIDAE	APOGASTROPODA	MOLLUSCA
MANGELIA	TURRIDAE	APOGASTROPODA	MOLLUSCA
HYDROMANTES	PLETHODONTIDAE	URODELA	AMPHIBIA
PROTEUS	PROTEIDAE	URODELA	AMPHIBIA
PATELLA	PATELLIDAE	ARCHAEOGASTROPODA	MOLLUSCA
BOLMA	TURBINIDAE	ARCHAEOGASTROPODA	MOLLUSCA
HOMALOPOMA	TURBINIDAE	ARCHAEOGASTROPODA	MOLLUSCA
CLANCULUS	TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
CALLIOSTOMA	TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
GIBBULA	TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
MONODONTA	TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
JUJUBINUS	TROCHIDAE	ARCHAEOGASTROPODA	MOLLUSCA
GRANARIA	CHONDRINIDAE	STYLOMMATOPHORA	MOLLUSCA
SOLATOPUPA	CHONDRINIDAE	STYLOMMATOPHORA	MOLLUSCA
BITTIUM	CERITHIIDAE	APOGASTROPODA	MOLLUSCA
SUCCINEA	SUCCINEIDAE	STYLOMMATOPHORA	MOLLUSCA
LITTORINA	LITTORINIDAE	APOGASTROPODA	MOLLUSCA
MELARAPHE	LITTORINIDAE	APOGASTROPODA	MOLLUSCA
RISSOA	RISSOIDAE	APOGASTROPODA	MOLLUSCA
ALVANIA	RISSOIDAE	APOGASTROPODA	MOLLUSCA
TRIVIA	TRIVIDAE	APOGASTROPODA	MOLLUSCA
DISCUS	DISCIDAE	STYLOMMATOPHORA	MOLLUSCA
VITREA	ZONITIDAE	STYLOMMATOPHORA	MOLLUSCA
AEGOPINELLA	ZONITIDAE	STYLOMMATOPHORA	MOLLUSCA
XEROTRICHA	HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
NASSARIUS	NASSARIIDAE	APOGASTROPODA	MOLLUSCA
COLUMBELLA	COLUMBELLIDAE	APOGASTROPODA	MOLLUSCA
CERNUELLA	HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
VEXILLUM	COSTELLARIIDAE	APOGASTROPODA	MOLLUSCA
MITRA	MITRIDAE	APOGASTROPODA	MOLLUSCA
CANTAREUS	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
ARGNA	PUPILLIDAE	STYLOMMATOPHORA	MOLLUSCA
CHONDRINA	CHONDRINIDAE	STYLOMMATOPHORA	MOLLUSCA
JAMINIA	ENIDAE	STYLOMMATOPHORA	MOLLUSCA
CLAUSILIA	CLAUSILIIDAE	STYLOMMATOPHORA	MOLLUSCA
RUMINA	SUBULINIDAE	STYLOMMATOPHORA	MOLLUSCA
TESTACELLA	TESTACELLIDAE	STYLOMMATOPHORA	MOLLUSCA
OXYCHILUS	ZONITIDAE	STYLOMMATOPHORA	MOLLUSCA
RETINELLA	ZONITIDAE	STYLOMMATOPHORA	MOLLUSCA
MONACHA	HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
CARDITA	CARDITIDAE	BIVALVIA	MOLLUSCA
COELODONTA	RHINOCEROTIDAE	PERISSODACTYLA	MAMMALIA
GARRULUS	CORVIDAE	PASSERIFORMA	AVES
MONTIFRINGILLA	PASSERIDAE	PASSERIFORMA	AVES
ASIO	STRIGIDAE	STRIGIFORMA	AVES
CANDIDULA	HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
DENDROCOPOS	PICIDAE	PICIFORMA	AVES
HELICODONTA	HYGROMIIDAE	STYLOMMATOPHORA	MOLLUSCA
CEPAEA	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
HELIX	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
MACULARIA	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
THEBA	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
EOBANIA	HELICIDAE	STYLOMMATOPHORA	MOLLUSCA
LIMAX	LIMACIDAE	STYLOMMATOPHORA	MOLLUSCA
PUPILLA	PUPILLIDAE	STYLOMMATOPHORA	MOLLUSCA
ABIDA	CHONDRINIDAE	PULMONATA	MOLLUSCA
BUFO	BUFONIDAE	ANURA	AMPHIBIA
COLUBER	COLUBRIDAE	SQUAMATA	REPTILIA
ERITHACUS	MUSCICAPIDAE	PASSERIFORMA	AVES
FALCO	FALCONIDAE	FALCONIFORMA	AVES
GALLUS	PHASIANIDAE	GALLIFORMA	AVES
MUS	MURIDAE	RODENTIA	MAMMALIA
PALAEOLOXODON	ELEPHANTIDAE	PROBOSCIDEA	MAMMALIA
PHOENICURUS	MUSCICAPIDAE	PASSERIFORMA	AVES
BOMBINA	DISCOGLOSSIDAE	ANURA	AMPHIBIA
ALYTES	DISCOGLOSSIDAE	ANURA	AMPHIBIA
DISCOGLOSSUS	DISCOGLOSSIDAE	ANURA	AMPHIBIA
PELOBATES	PELOBATIDAE	ANURA	AMPHIBIA
PELODYTES	PELOBATIDAE	ANURA	AMPHIBIA
HYLA	HYLIDAE	ANURA	AMPHIBIA
RANA	RANIDAE	ANURA	AMPHIBIA
POMATIAS	POMATIASIDAE	NEOTAENIOGLOSSA	MOLLUSCA
\.


--
-- Data for Name: remonte_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY remonte_ordre (ordre, classe) FROM stdin;
PRIMATA	MAMMALIA
INSECTIVORA	MAMMALIA
CHIROPTERA	MAMMALIA
RODENTIA	MAMMALIA
LAGOMORPHA	MAMMALIA
CARNIVORA	MAMMALIA
ARTIODACTYLA	MAMMALIA
PERISSODACTYLA	MAMMALIA
PROBOSCIDEA	MAMMALIA
CETACEA	MAMMALIA
PODICIPEDIFORMA	AVES
PROCELLARIIFORMA	AVES
PELECANIFORMA	AVES
CICONIIFORMA	AVES
PHOENICOPTERIFORMA	AVES
ANSERIFORMA	AVES
ACCIPITRIFORMA	AVES
FALCONIFORMA	AVES
GALLIFORMA	AVES
GRUIFORMA	AVES
PTEROCLIDIFORMA	AVES
COLUMBIFORMA	AVES
CUCULIFORMA	AVES
STRIGIFORMA	AVES
CAPRIMULGIFORMA	AVES
APODIFORMA	AVES
CORACIIFORMA	AVES
PICIFORMA	AVES
CHARADRIIFORMA	AVES
PASSERIFORMA	AVES
IND	MAMMALIA
HERB	MAMMALIA
PH	MAMMALIA
GH	MAMMALIA
ARCHAEOGASTROPODA	MOLLUSCA
APOGASTROPODA	MOLLUSCA
ANURA	AMPHIBIA
SQUAMATA	REPTILIA
URODELA	AMPHIBIA
TESTUDINES	REPTILIA
PULMONATA	MOLLUSCA
MYTILOIDA	MOLLUSCA
MESOGASTROPODA	MOLLUSCA
ARCOIDA	MOLLUSCA
BIVALVIA	MOLLUSCA
NEOGASTROPODA	MOLLUSCA
POLYPLACOPHORA	MOLLUSCA
PTEROIDA	MOLLUSCA
GAVIIFORMA	AVES
\.


--
-- Data for Name: requete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requete (nomrequete, coderequete) FROM stdin;
\.


--
-- Data for Name: retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY retouche ("zone", numero, bis, r_ordre, r_type, r_obliquite, r_denticulation, r_cas, r_utilisation, r_dimension, r_association, r_superposition, r_extremite, r_bord, r_frequence, r_ecrasement, r_lustrage, r_strie, r_origine, r_destination, r_sens, r_tranchant, r_relation, r_extension) FROM stdin;
\.


--
-- Data for Name: stigmate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stigmate ("zone", numero, bis, s_ordre, s_type, s_sous_type, s_lustrage, s_polissage, s_sub, s_localisation, s_situation, s_relation, s_composite, s_simple, s_support, s_roche, s_geometrie, s_alteration, s_concretion, s_plan, s_dessin, s_coupe, s_photo, s_analyse, s_longueur, s_largeur, s_epaisseur, s_poids, s_outil, s_cimx, s_cimn, s_cr1s, s_cr2s, s_timx2, s_timn2, s_tr1s, s_tr2s, s_tang, s_numero) FROM stdin;
\.


--
-- Data for Name: trace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trace ("zone", numero, bis, t_ensemble, t_nature, t_nombre, t_agent, t_phenomene, t_localisation, t_position, t_locmusc, t_longueur, t_classe, t_largeur, t_profondeur, t_section, t_diametre, t_dstrie, t_trace, t_direction, t_sens, t_allure, t_description, t_dessin, t_replique, t_photo) FROM stdin;
\.


--
-- Data for Name: usure_dent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usure_dent ("zone", numero, bis, ud_serie, ud_type, ud_lateralite, ud_usure, ud_fragmentation) FROM stdin;
\.


--
-- Name: biface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY biface
    ADD CONSTRAINT biface_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: bord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bord
    ADD CONSTRAINT bord_pkey PRIMARY KEY ("zone", numero, bis, b_ordre);


--
-- Name: carnet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carnet
    ADD CONSTRAINT carnet_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: controle_b_amenagement_bor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_amenagement_bord
    ADD CONSTRAINT controle_b_amenagement_bor_pkey PRIMARY KEY (b_amenagement_bord);


--
-- Name: controle_b_amenagement_dis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_amenagement_distal
    ADD CONSTRAINT controle_b_amenagement_dis_pkey PRIMARY KEY (b_amenagement_distal);


--
-- Name: controle_b_amincissement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_amincissement
    ADD CONSTRAINT controle_b_amincissement_pkey PRIMARY KEY (b_amincissement);


--
-- Name: controle_b_arete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_arete
    ADD CONSTRAINT controle_b_arete_pkey PRIMARY KEY (b_arete);


--
-- Name: controle_b_base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_base
    ADD CONSTRAINT controle_b_base_pkey PRIMARY KEY (b_base);


--
-- Name: controle_b_bifaciale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_bifaciale
    ADD CONSTRAINT controle_b_bifaciale_pkey PRIMARY KEY (b_bifaciale);


--
-- Name: controle_b_bilaterale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_bilaterale
    ADD CONSTRAINT controle_b_bilaterale_pkey PRIMARY KEY (b_bilaterale);


--
-- Name: controle_b_biseau_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_biseau
    ADD CONSTRAINT controle_b_biseau_pkey PRIMARY KEY (b_biseau);


--
-- Name: controle_b_bord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_bord
    ADD CONSTRAINT controle_b_bord_pkey PRIMARY KEY (b_bord);


--
-- Name: controle_b_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_code
    ADD CONSTRAINT controle_b_code_pkey PRIMARY KEY (b_code);


--
-- Name: controle_b_dat1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_dat1
    ADD CONSTRAINT controle_b_dat1_pkey PRIMARY KEY (b_dat1);


--
-- Name: controle_b_dat2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_dat2
    ADD CONSTRAINT controle_b_dat2_pkey PRIMARY KEY (b_dat2);


--
-- Name: controle_b_dat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_dat
    ADD CONSTRAINT controle_b_dat_pkey PRIMARY KEY (b_dat);


--
-- Name: controle_b_distale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_distale
    ADD CONSTRAINT controle_b_distale_pkey PRIMARY KEY (b_distale);


--
-- Name: controle_b_enlevement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_enlevement
    ADD CONSTRAINT controle_b_enlevement_pkey PRIMARY KEY (b_enlevement);


--
-- Name: controle_b_extension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_extension
    ADD CONSTRAINT controle_b_extension_pkey PRIMARY KEY (b_extension);


--
-- Name: controle_b_extremite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_extremite
    ADD CONSTRAINT controle_b_extremite_pkey PRIMARY KEY (b_extremite);


--
-- Name: controle_b_facture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_facture
    ADD CONSTRAINT controle_b_facture_pkey PRIMARY KEY (b_facture);


--
-- Name: controle_b_meplat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_meplat
    ADD CONSTRAINT controle_b_meplat_pkey PRIMARY KEY (b_meplat);


--
-- Name: controle_b_retouche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_retouche
    ADD CONSTRAINT controle_b_retouche_pkey PRIMARY KEY (b_retouche);


--
-- Name: controle_b_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_support
    ADD CONSTRAINT controle_b_support_pkey PRIMARY KEY (b_support);


--
-- Name: controle_b_surface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_surface
    ADD CONSTRAINT controle_b_surface_pkey PRIMARY KEY (b_surface);


--
-- Name: controle_b_symetrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_symetrie
    ADD CONSTRAINT controle_b_symetrie_pkey PRIMARY KEY (b_symetrie);


--
-- Name: controle_b_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_b_type
    ADD CONSTRAINT controle_b_type_pkey PRIMARY KEY (b_type);


--
-- Name: controle_bis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_bis
    ADD CONSTRAINT controle_bis_pkey PRIMARY KEY (bis);


--
-- Name: controle_c_alteration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_alteration
    ADD CONSTRAINT controle_c_alteration_pkey PRIMARY KEY (c_alteration);


--
-- Name: controle_c_altnat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_altnat
    ADD CONSTRAINT controle_c_altnat_pkey PRIMARY KEY (c_altnat);


--
-- Name: controle_c_autre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_autre
    ADD CONSTRAINT controle_c_autre_pkey PRIMARY KEY (c_autre);


--
-- Name: controle_c_consistance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_consistance
    ADD CONSTRAINT controle_c_consistance_pkey PRIMARY KEY (c_consistance);


--
-- Name: controle_c_couleur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_couleur
    ADD CONSTRAINT controle_c_couleur_pkey PRIMARY KEY (c_couleur);


--
-- Name: controle_c_element_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_element
    ADD CONSTRAINT controle_c_element_pkey PRIMARY KEY (c_element);


--
-- Name: controle_c_ext1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_ext1
    ADD CONSTRAINT controle_c_ext1_pkey PRIMARY KEY (c_ext1);


--
-- Name: controle_c_ext2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_ext2
    ADD CONSTRAINT controle_c_ext2_pkey PRIMARY KEY (c_ext2);


--
-- Name: controle_c_extremite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_extremite
    ADD CONSTRAINT controle_c_extremite_pkey PRIMARY KEY (c_extremite);


--
-- Name: controle_c_famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_famille
    ADD CONSTRAINT controle_c_famille_pkey PRIMARY KEY (c_famille);


--
-- Name: controle_c_forme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_forme
    ADD CONSTRAINT controle_c_forme_pkey PRIMARY KEY (c_forme);


--
-- Name: controle_c_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_genre
    ADD CONSTRAINT controle_c_genre_pkey PRIMARY KEY (c_genre);


--
-- Name: controle_c_granulometrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_granulometrie
    ADD CONSTRAINT controle_c_granulometrie_pkey PRIMARY KEY (c_granulometrie);


--
-- Name: controle_c_incl1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_incl1
    ADD CONSTRAINT controle_c_incl1_pkey PRIMARY KEY (c_incl1);


--
-- Name: controle_c_incl2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_incl2
    ADD CONSTRAINT controle_c_incl2_pkey PRIMARY KEY (c_incl2);


--
-- Name: controle_c_incl3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_incl3
    ADD CONSTRAINT controle_c_incl3_pkey PRIMARY KEY (c_incl3);


--
-- Name: controle_c_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_inclusion
    ADD CONSTRAINT controle_c_inclusion_pkey PRIMARY KEY (c_inclusion);


--
-- Name: controle_c_lame_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_lame
    ADD CONSTRAINT controle_c_lame_pkey PRIMARY KEY (c_lame);


--
-- Name: controle_c_liant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_liant
    ADD CONSTRAINT controle_c_liant_pkey PRIMARY KEY (c_liant);


--
-- Name: controle_c_macroreste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_macroreste
    ADD CONSTRAINT controle_c_macroreste_pkey PRIMARY KEY (c_macroreste);


--
-- Name: controle_c_mif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_mif
    ADD CONSTRAINT controle_c_mif_pkey PRIMARY KEY (c_mif);


--
-- Name: controle_c_motcou_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_motcou
    ADD CONSTRAINT controle_c_motcou_pkey PRIMARY KEY (c_motcou);


--
-- Name: controle_c_motif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_motif
    ADD CONSTRAINT controle_c_motif_pkey PRIMARY KEY (c_motif);


--
-- Name: controle_c_motnat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_motnat
    ADD CONSTRAINT controle_c_motnat_pkey PRIMARY KEY (c_motnat);


--
-- Name: controle_c_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_ordre
    ADD CONSTRAINT controle_c_ordre_pkey PRIMARY KEY (c_ordre);


--
-- Name: controle_c_palyno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_palyno
    ADD CONSTRAINT controle_c_palyno_pkey PRIMARY KEY (c_palyno);


--
-- Name: controle_c_parasito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_parasito
    ADD CONSTRAINT controle_c_parasito_pkey PRIMARY KEY (c_parasito);


--
-- Name: controle_c_retrecissement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_retrecissement
    ADD CONSTRAINT controle_c_retrecissement_pkey PRIMARY KEY (c_retrecissement);


--
-- Name: controle_c_sediment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_sediment
    ADD CONSTRAINT controle_c_sediment_pkey PRIMARY KEY (c_sediment);


--
-- Name: controle_c_vol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_vol
    ADD CONSTRAINT controle_c_vol_pkey PRIMARY KEY (c_vol);


--
-- Name: controle_c_volext_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_c_volext
    ADD CONSTRAINT controle_c_volext_pkey PRIMARY KEY (c_volext);


--
-- Name: controle_carre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_carre
    ADD CONSTRAINT controle_carre_pkey PRIMARY KEY (carre);


--
-- Name: controle_d_serie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_d_serie
    ADD CONSTRAINT controle_d_serie_pkey PRIMARY KEY (d_serie);


--
-- Name: controle_d_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_d_type
    ADD CONSTRAINT controle_d_type_pkey PRIMARY KEY (d_type);


--
-- Name: controle_e_bulbe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_bulbe
    ADD CONSTRAINT controle_e_bulbe_pkey PRIMARY KEY (e_bulbe);


--
-- Name: controle_e_carene_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_carene
    ADD CONSTRAINT controle_e_carene_pkey PRIMARY KEY (e_carene);


--
-- Name: controle_e_charniere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_charniere
    ADD CONSTRAINT controle_e_charniere_pkey PRIMARY KEY (e_charniere);


--
-- Name: controle_e_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_code
    ADD CONSTRAINT controle_e_code_pkey PRIMARY KEY (e_code);


--
-- Name: controle_e_cone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_cone
    ADD CONSTRAINT controle_e_cone_pkey PRIMARY KEY (e_cone);


--
-- Name: controle_e_contour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_contour
    ADD CONSTRAINT controle_e_contour_pkey PRIMARY KEY (e_contour);


--
-- Name: controle_e_debitage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_debitage
    ADD CONSTRAINT controle_e_debitage_pkey PRIMARY KEY (e_debitage);


--
-- Name: controle_e_enlevement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_enlevement
    ADD CONSTRAINT controle_e_enlevement_pkey PRIMARY KEY (e_enlevement);


--
-- Name: controle_e_epi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_epi
    ADD CONSTRAINT controle_e_epi_pkey PRIMARY KEY (e_epi);


--
-- Name: controle_e_onde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_onde
    ADD CONSTRAINT controle_e_onde_pkey PRIMARY KEY (e_onde);


--
-- Name: controle_e_parasite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_parasite
    ADD CONSTRAINT controle_e_parasite_pkey PRIMARY KEY (e_parasite);


--
-- Name: controle_e_secondaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_secondaire
    ADD CONSTRAINT controle_e_secondaire_pkey PRIMARY KEY (e_secondaire);


--
-- Name: controle_e_section_long_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_section_long
    ADD CONSTRAINT controle_e_section_long_pkey PRIMARY KEY (e_section_long);


--
-- Name: controle_e_section_trans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_section_trans
    ADD CONSTRAINT controle_e_section_trans_pkey PRIMARY KEY (e_section_trans);


--
-- Name: controle_e_strie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_strie
    ADD CONSTRAINT controle_e_strie_pkey PRIMARY KEY (e_strie);


--
-- Name: controle_e_talon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_talon
    ADD CONSTRAINT controle_e_talon_pkey PRIMARY KEY (e_talon);


--
-- Name: controle_e_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_e_type
    ADD CONSTRAINT controle_e_type_pkey PRIMARY KEY (e_type);


--
-- Name: controle_eg_element_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_element
    ADD CONSTRAINT controle_eg_element_pkey PRIMARY KEY (eg_element);


--
-- Name: controle_eg_epaisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_epaisseur
    ADD CONSTRAINT controle_eg_epaisseur_pkey PRIMARY KEY (eg_epaisseur);


--
-- Name: controle_eg_extremite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_extremite
    ADD CONSTRAINT controle_eg_extremite_pkey PRIMARY KEY (eg_extremite);


--
-- Name: controle_eg_longueur_gener_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_longueur_generale
    ADD CONSTRAINT controle_eg_longueur_gener_pkey PRIMARY KEY (eg_longueur_generale);


--
-- Name: controle_eg_obliquite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_obliquite
    ADD CONSTRAINT controle_eg_obliquite_pkey PRIMARY KEY (ga_obliquite);


--
-- Name: controle_eg_proeminence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_proeminence
    ADD CONSTRAINT controle_eg_proeminence_pkey PRIMARY KEY (eg_proeminence);


--
-- Name: controle_eg_profil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_profil
    ADD CONSTRAINT controle_eg_profil_pkey PRIMARY KEY (eg_profil);


--
-- Name: controle_eg_profondeur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_profondeur
    ADD CONSTRAINT controle_eg_profondeur_pkey PRIMARY KEY (eg_profondeur);


--
-- Name: controle_eg_sens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_sens
    ADD CONSTRAINT controle_eg_sens_pkey PRIMARY KEY (eg_sens);


--
-- Name: controle_eg_situation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_situation
    ADD CONSTRAINT controle_eg_situation_pkey PRIMARY KEY (eg_situation);


--
-- Name: controle_eg_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_eg_support
    ADD CONSTRAINT controle_eg_support_pkey PRIMARY KEY (eg_support);


--
-- Name: controle_en_direction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_direction
    ADD CONSTRAINT controle_en_direction_pkey PRIMARY KEY (en_direction);


--
-- Name: controle_en_dptimpact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_dptimpact
    ADD CONSTRAINT controle_en_dptimpact_pkey PRIMARY KEY (en_dptimpact);


--
-- Name: controle_en_frappe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_frappe
    ADD CONSTRAINT controle_en_frappe_pkey PRIMARY KEY (en_frappe);


--
-- Name: controle_en_inclinaison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_inclinaison
    ADD CONSTRAINT controle_en_inclinaison_pkey PRIMARY KEY (en_inclinaison);


--
-- Name: controle_en_obliquite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_obliquite
    ADD CONSTRAINT controle_en_obliquite_pkey PRIMARY KEY (en_obliquite);


--
-- Name: controle_en_profondeur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_en_profondeur
    ADD CONSTRAINT controle_en_profondeur_pkey PRIMARY KEY (en_profondeur);


--
-- Name: controle_ensemble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ensemble
    ADD CONSTRAINT controle_ensemble_pkey PRIMARY KEY (ensemble);


--
-- Name: controle_f_affespece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_affespece
    ADD CONSTRAINT controle_f_affespece_pkey PRIMARY KEY (f_affespece);


--
-- Name: controle_f_affgenre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_affgenre
    ADD CONSTRAINT controle_f_affgenre_pkey PRIMARY KEY (f_affgenre);


--
-- Name: controle_f_agecl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_agecl
    ADD CONSTRAINT controle_f_agecl_pkey PRIMARY KEY (f_agecl);


--
-- Name: controle_f_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_agent
    ADD CONSTRAINT controle_f_agent_pkey PRIMARY KEY (f_agent);


--
-- Name: controle_f_agest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_agest
    ADD CONSTRAINT controle_f_agest_pkey PRIMARY KEY (f_agest);


--
-- Name: controle_f_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_association
    ADD CONSTRAINT controle_f_association_pkey PRIMARY KEY (f_association);


--
-- Name: controle_f_calcouleur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_calcouleur
    ADD CONSTRAINT controle_f_calcouleur_pkey PRIMARY KEY (f_calcouleur);


--
-- Name: controle_f_caltype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_caltype
    ADD CONSTRAINT controle_f_caltype_pkey PRIMARY KEY (f_caltype);


--
-- Name: controle_f_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_classe
    ADD CONSTRAINT controle_f_classe_pkey PRIMARY KEY (f_classe);


--
-- Name: controle_f_complement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_complement
    ADD CONSTRAINT controle_f_complement_pkey PRIMARY KEY (f_complement);


--
-- Name: controle_f_composite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_composite
    ADD CONSTRAINT controle_f_composite_pkey PRIMARY KEY (f_composite);


--
-- Name: controle_f_concretion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_concretion
    ADD CONSTRAINT controle_f_concretion_pkey PRIMARY KEY (f_concretion);


--
-- Name: controle_f_conservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_conservation
    ADD CONSTRAINT controle_f_conservation_pkey PRIMARY KEY (f_conservation);


--
-- Name: controle_f_coprolithe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_coprolithe
    ADD CONSTRAINT controle_f_coprolithe_pkey PRIMARY KEY (f_coprolithe);


--
-- Name: controle_f_coraspect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_coraspect
    ADD CONSTRAINT controle_f_coraspect_pkey PRIMARY KEY (f_coraspect);


--
-- Name: controle_f_corfissure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_corfissure
    ADD CONSTRAINT controle_f_corfissure_pkey PRIMARY KEY (f_corfissure);


--
-- Name: controle_f_couleur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_couleur
    ADD CONSTRAINT controle_f_couleur_pkey PRIMARY KEY (f_couleur);


--
-- Name: controle_f_datation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_datation
    ADD CONSTRAINT controle_f_datation_pkey PRIMARY KEY (f_datation);


--
-- Name: controle_f_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_description
    ADD CONSTRAINT controle_f_description_pkey PRIMARY KEY (f_description);


--
-- Name: controle_f_dessin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_dessin
    ADD CONSTRAINT controle_f_dessin_pkey PRIMARY KEY (f_dessin);


--
-- Name: controle_f_eclat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_eclat
    ADD CONSTRAINT controle_f_eclat_pkey PRIMARY KEY (f_eclat);


--
-- Name: controle_f_espece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_espece
    ADD CONSTRAINT controle_f_espece_pkey PRIMARY KEY (f_espece);


--
-- Name: controle_f_famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_famille
    ADD CONSTRAINT controle_f_famille_pkey PRIMARY KEY (f_famille);


--
-- Name: controle_f_fossilisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_fossilisation
    ADD CONSTRAINT controle_f_fossilisation_pkey PRIMARY KEY (f_fossilisation);


--
-- Name: controle_f_fragde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_fragde
    ADD CONSTRAINT controle_f_fragde_pkey PRIMARY KEY (f_fragde);


--
-- Name: controle_f_fragge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_fragge
    ADD CONSTRAINT controle_f_fragge_pkey PRIMARY KEY (f_fragge);


--
-- Name: controle_f_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_genre
    ADD CONSTRAINT controle_f_genre_pkey PRIMARY KEY (f_genre);


--
-- Name: controle_f_icirconference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_icirconference
    ADD CONSTRAINT controle_f_icirconference_pkey PRIMARY KEY (f_icirconference);


--
-- Name: controle_f_ilongueur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_ilongueur
    ADD CONSTRAINT controle_f_ilongueur_pkey PRIMARY KEY (f_ilongueur);


--
-- Name: controle_f_lateralite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_lateralite
    ADD CONSTRAINT controle_f_lateralite_pkey PRIMARY KEY (f_lateralite);


--
-- Name: controle_f_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_mode
    ADD CONSTRAINT controle_f_mode_pkey PRIMARY KEY (f_mode);


--
-- Name: controle_f_moulage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_moulage
    ADD CONSTRAINT controle_f_moulage_pkey PRIMARY KEY (f_moulage);


--
-- Name: controle_f_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_ordre
    ADD CONSTRAINT controle_f_ordre_pkey PRIMARY KEY (f_ordre);


--
-- Name: controle_f_oxyde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_oxyde
    ADD CONSTRAINT controle_f_oxyde_pkey PRIMARY KEY (f_oxyde);


--
-- Name: controle_f_pathologie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_pathologie
    ADD CONSTRAINT controle_f_pathologie_pkey PRIMARY KEY (f_pathologie);


--
-- Name: controle_f_pelote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_pelote
    ADD CONSTRAINT controle_f_pelote_pkey PRIMARY KEY (f_pelote);


--
-- Name: controle_f_percussion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_percussion
    ADD CONSTRAINT controle_f_percussion_pkey PRIMARY KEY (f_percussion);


--
-- Name: controle_f_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_photo
    ADD CONSTRAINT controle_f_photo_pkey PRIMARY KEY (f_photo);


--
-- Name: controle_f_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_reference
    ADD CONSTRAINT controle_f_reference_pkey PRIMARY KEY (f_reference);


--
-- Name: controle_f_responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_responsable
    ADD CONSTRAINT controle_f_responsable_pkey PRIMARY KEY (f_responsable);


--
-- Name: controle_f_restauration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_restauration
    ADD CONSTRAINT controle_f_restauration_pkey PRIMARY KEY (f_restauration);


--
-- Name: controle_f_saisie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_saisie
    ADD CONSTRAINT controle_f_saisie_pkey PRIMARY KEY (f_saisie);


--
-- Name: controle_f_sauvefrag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_sauvefrag
    ADD CONSTRAINT controle_f_sauvefrag_pkey PRIMARY KEY (f_sauvefrag);


--
-- Name: controle_f_sexe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_sexe
    ADD CONSTRAINT controle_f_sexe_pkey PRIMARY KEY (f_sexe);


--
-- Name: controle_f_ssespece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_ssespece
    ADD CONSTRAINT controle_f_ssespece_pkey PRIMARY KEY (f_ssespece);


--
-- Name: controle_f_ssfamille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_ssfamille
    ADD CONSTRAINT controle_f_ssfamille_pkey PRIMARY KEY (f_ssfamille);


--
-- Name: controle_f_stdent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_stdent
    ADD CONSTRAINT controle_f_stdent_pkey PRIMARY KEY (f_stdent);


--
-- Name: controle_f_stserie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_stserie
    ADD CONSTRAINT controle_f_stserie_pkey PRIMARY KEY (f_stserie);


--
-- Name: controle_f_taille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_taille
    ADD CONSTRAINT controle_f_taille_pkey PRIMARY KEY (f_taille);


--
-- Name: controle_f_tissu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_tissu
    ADD CONSTRAINT controle_f_tissu_pkey PRIMARY KEY (f_tissu);


--
-- Name: controle_f_traitement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_traitement
    ADD CONSTRAINT controle_f_traitement_pkey PRIMARY KEY (f_traitement);


--
-- Name: controle_f_tranchant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_tranchant
    ADD CONSTRAINT controle_f_tranchant_pkey PRIMARY KEY (f_tranchant);


--
-- Name: controle_f_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_type
    ADD CONSTRAINT controle_f_type_pkey PRIMARY KEY (f_type);


--
-- Name: controle_f_typedos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typedos
    ADD CONSTRAINT controle_f_typedos_pkey PRIMARY KEY (f_typedos);


--
-- Name: controle_f_typos1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos1
    ADD CONSTRAINT controle_f_typos1_pkey PRIMARY KEY (f_typos1);


--
-- Name: controle_f_typos2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos2
    ADD CONSTRAINT controle_f_typos2_pkey PRIMARY KEY (f_typos2);


--
-- Name: controle_f_typos3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos3
    ADD CONSTRAINT controle_f_typos3_pkey PRIMARY KEY (f_typos3);


--
-- Name: controle_f_typos4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos4
    ADD CONSTRAINT controle_f_typos4_pkey PRIMARY KEY (f_typos4);


--
-- Name: controle_f_typos5_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos5
    ADD CONSTRAINT controle_f_typos5_pkey PRIMARY KEY (f_typos5);


--
-- Name: controle_f_typos6_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_f_typos6
    ADD CONSTRAINT controle_f_typos6_pkey PRIMARY KEY (f_typos6);


--
-- Name: controle_ff_angle1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_angle1
    ADD CONSTRAINT controle_ff_angle1_pkey PRIMARY KEY (ff_angle1);


--
-- Name: controle_ff_angle2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_angle2
    ADD CONSTRAINT controle_ff_angle2_pkey PRIMARY KEY (ff_angle2);


--
-- Name: controle_ff_aspect1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_aspect1
    ADD CONSTRAINT controle_ff_aspect1_pkey PRIMARY KEY (ff_aspect1);


--
-- Name: controle_ff_aspect2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_aspect2
    ADD CONSTRAINT controle_ff_aspect2_pkey PRIMARY KEY (ff_aspect2);


--
-- Name: controle_ff_localisation1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_localisation1
    ADD CONSTRAINT controle_ff_localisation1_pkey PRIMARY KEY (ff_localisation1);


--
-- Name: controle_ff_localisation2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_localisation2
    ADD CONSTRAINT controle_ff_localisation2_pkey PRIMARY KEY (ff_localisation2);


--
-- Name: controle_ff_morphologie1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_morphologie1
    ADD CONSTRAINT controle_ff_morphologie1_pkey PRIMARY KEY (ff_morphologie1);


--
-- Name: controle_ff_morphologie2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_morphologie2
    ADD CONSTRAINT controle_ff_morphologie2_pkey PRIMARY KEY (ff_morphologie2);


--
-- Name: controle_ff_non1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_non1
    ADD CONSTRAINT controle_ff_non1_pkey PRIMARY KEY (ff_non1);


--
-- Name: controle_ff_non2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_non2
    ADD CONSTRAINT controle_ff_non2_pkey PRIMARY KEY (ff_non2);


--
-- Name: controle_ff_profil1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_profil1
    ADD CONSTRAINT controle_ff_profil1_pkey PRIMARY KEY (ff_profil1);


--
-- Name: controle_ff_profil2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ff_profil2
    ADD CONSTRAINT controle_ff_profil2_pkey PRIMARY KEY (ff_profil2);


--
-- Name: controle_fi_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_fi_mode
    ADD CONSTRAINT controle_fi_mode_pkey PRIMARY KEY (fi_mode);


--
-- Name: controle_fi_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_fi_ordre
    ADD CONSTRAINT controle_fi_ordre_pkey PRIMARY KEY (fi_ordre);


--
-- Name: controle_fi_percussion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_fi_percussion
    ADD CONSTRAINT controle_fi_percussion_pkey PRIMARY KEY (fi_percussion);


--
-- Name: controle_fi_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_fi_type
    ADD CONSTRAINT controle_fi_type_pkey PRIMARY KEY (fi_type);


--
-- Name: controle_ga_arete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_arete
    ADD CONSTRAINT controle_ga_arete_pkey PRIMARY KEY (ga_arete);


--
-- Name: controle_ga_chf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_chf
    ADD CONSTRAINT controle_ga_chf_pkey PRIMARY KEY (ga_chf);


--
-- Name: controle_ga_facture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_facture
    ADD CONSTRAINT controle_ga_facture_pkey PRIMARY KEY (ga_facture);


--
-- Name: controle_ga_forme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_forme
    ADD CONSTRAINT controle_ga_forme_pkey PRIMARY KEY (ga_forme);


--
-- Name: controle_ga_orientation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_orientation
    ADD CONSTRAINT controle_ga_orientation_pkey PRIMARY KEY (ga_orientation);


--
-- Name: controle_ga_qualite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_qualite
    ADD CONSTRAINT controle_ga_qualite_pkey PRIMARY KEY (ga_qualite);


--
-- Name: controle_ga_retouche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_retouche
    ADD CONSTRAINT controle_ga_retouche_pkey PRIMARY KEY (ga_retouche);


--
-- Name: controle_ga_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ga_type
    ADD CONSTRAINT controle_ga_type_pkey PRIMARY KEY (ga_type);


--
-- Name: controle_h_amenagement_bor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_amenagement_bord
    ADD CONSTRAINT controle_h_amenagement_bor_pkey PRIMARY KEY (h_amenagement_bord);


--
-- Name: controle_h_amenagement_dis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_amenagement_distal
    ADD CONSTRAINT controle_h_amenagement_dis_pkey PRIMARY KEY (amenagement_h_distal);


--
-- Name: controle_h_arete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_arete
    ADD CONSTRAINT controle_h_arete_pkey PRIMARY KEY (h_arete);


--
-- Name: controle_h_base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_base
    ADD CONSTRAINT controle_h_base_pkey PRIMARY KEY (h_base);


--
-- Name: controle_h_bilaterale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_bilaterale
    ADD CONSTRAINT controle_h_bilaterale_pkey PRIMARY KEY (h_bilaterale);


--
-- Name: controle_h_biseau_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_biseau
    ADD CONSTRAINT controle_h_biseau_pkey PRIMARY KEY (h_biseau);


--
-- Name: controle_h_bord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_bord
    ADD CONSTRAINT controle_h_bord_pkey PRIMARY KEY (h_bord);


--
-- Name: controle_h_distale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_distale
    ADD CONSTRAINT controle_h_distale_pkey PRIMARY KEY (h_distale);


--
-- Name: controle_h_extension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_extension
    ADD CONSTRAINT controle_h_extension_pkey PRIMARY KEY (h_extension);


--
-- Name: controle_h_facture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_facture
    ADD CONSTRAINT controle_h_facture_pkey PRIMARY KEY (h_facture);


--
-- Name: controle_h_meplat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_meplat
    ADD CONSTRAINT controle_h_meplat_pkey PRIMARY KEY (h_meplat);


--
-- Name: controle_h_retouche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_retouche
    ADD CONSTRAINT controle_h_retouche_pkey PRIMARY KEY (h_retouche);


--
-- Name: controle_h_surface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_surface
    ADD CONSTRAINT controle_h_surface_pkey PRIMARY KEY (h_surface);


--
-- Name: controle_h_symetrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_h_symetrie
    ADD CONSTRAINT controle_h_symetrie_pkey PRIMARY KEY (h_symetrie);


--
-- Name: controle_i_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_action
    ADD CONSTRAINT controle_i_action_pkey PRIMARY KEY (i_action);


--
-- Name: controle_i_alteration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_alteration
    ADD CONSTRAINT controle_i_alteration_pkey PRIMARY KEY (i_alteration);


--
-- Name: controle_i_desilicificatio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_desilicification
    ADD CONSTRAINT controle_i_desilicificatio_pkey PRIMARY KEY (i_desilicification);


--
-- Name: controle_i_dpatine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_dpatine
    ADD CONSTRAINT controle_i_dpatine_pkey PRIMARY KEY (i_dpatine);


--
-- Name: controle_i_encroutement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_encroutement
    ADD CONSTRAINT controle_i_encroutement_pkey PRIMARY KEY (i_encroutement);


--
-- Name: controle_i_eolisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_eolisation
    ADD CONSTRAINT controle_i_eolisation_pkey PRIMARY KEY (i_eolisation);


--
-- Name: controle_i_forme_galet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_forme_galet
    ADD CONSTRAINT controle_i_forme_galet_pkey PRIMARY KEY (i_forme_galet);


--
-- Name: controle_i_lustrage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_lustrage
    ADD CONSTRAINT controle_i_lustrage_pkey PRIMARY KEY (i_lustrage);


--
-- Name: controle_i_matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_matiere
    ADD CONSTRAINT controle_i_matiere_pkey PRIMARY KEY (i_matiere);


--
-- Name: controle_i_objet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_objet
    ADD CONSTRAINT controle_i_objet_pkey PRIMARY KEY (i_objet);


--
-- Name: controle_i_patine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_patine
    ADD CONSTRAINT controle_i_patine_pkey PRIMARY KEY (i_patine);


--
-- Name: controle_i_pmycellium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_pmycellium
    ADD CONSTRAINT controle_i_pmycellium_pkey PRIMARY KEY (i_pmycellium);


--
-- Name: controle_i_roulage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_roulage
    ADD CONSTRAINT controle_i_roulage_pkey PRIMARY KEY (i_roulage);


--
-- Name: controle_i_support_originel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_support_originel
    ADD CONSTRAINT controle_i_support_originel_pkey PRIMARY KEY (i_support_originel);


--
-- Name: controle_i_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_i_support
    ADD CONSTRAINT controle_i_support_pkey PRIMARY KEY (i_support);


--
-- Name: controle_localite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_localite
    ADD CONSTRAINT controle_localite_pkey PRIMARY KEY (localite);


--
-- Name: controle_locus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_locus
    ADD CONSTRAINT controle_locus_pkey PRIMARY KEY (locus);


--
-- Name: controle_mf_serie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_mf_serie
    ADD CONSTRAINT controle_mf_serie_pkey PRIMARY KEY (mf_serie);


--
-- Name: controle_mf_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_mf_type
    ADD CONSTRAINT controle_mf_type_pkey PRIMARY KEY (mf_type);


--
-- Name: controle_n_cortotal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_n_cortotal
    ADD CONSTRAINT controle_n_cortotal_pkey PRIMARY KEY (n_cortotal);


--
-- Name: controle_n_epuisement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_n_epuisement
    ADD CONSTRAINT controle_n_epuisement_pkey PRIMARY KEY (n_epuisement);


--
-- Name: controle_n_forme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_n_forme
    ADD CONSTRAINT controle_n_forme_pkey PRIMARY KEY (n_forme);


--
-- Name: controle_n_orientation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_n_orientation
    ADD CONSTRAINT controle_n_orientation_pkey PRIMARY KEY (n_orientation);


--
-- Name: controle_n_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_n_type
    ADD CONSTRAINT controle_n_type_pkey PRIMARY KEY (n_type);


--
-- Name: controle_nature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_nature
    ADD CONSTRAINT controle_nature_pkey PRIMARY KEY (nature);


--
-- Name: controle_niveau_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_niveau
    ADD CONSTRAINT controle_niveau_pkey PRIMARY KEY (niveau);


--
-- Name: controle_o_chronologie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_chronologie
    ADD CONSTRAINT controle_o_chronologie_pkey PRIMARY KEY (o_chronologie);


--
-- Name: controle_o_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_code
    ADD CONSTRAINT controle_o_code_pkey PRIMARY KEY (o_code);


--
-- Name: controle_o_destination_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_destination
    ADD CONSTRAINT controle_o_destination_pkey PRIMARY KEY (o_destination);


--
-- Name: controle_o_etat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_etat
    ADD CONSTRAINT controle_o_etat_pkey PRIMARY KEY (o_etat);


--
-- Name: controle_o_forme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_forme
    ADD CONSTRAINT controle_o_forme_pkey PRIMARY KEY (o_forme);


--
-- Name: controle_o_localisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_localisation
    ADD CONSTRAINT controle_o_localisation_pkey PRIMARY KEY (o_localisation);


--
-- Name: controle_o_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_ordre
    ADD CONSTRAINT controle_o_ordre_pkey PRIMARY KEY (o_ordre);


--
-- Name: controle_o_orientation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_orientation
    ADD CONSTRAINT controle_o_orientation_pkey PRIMARY KEY (o_orientation);


--
-- Name: controle_o_origine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_origine
    ADD CONSTRAINT controle_o_origine_pkey PRIMARY KEY (o_origine);


--
-- Name: controle_o_retouche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_retouche
    ADD CONSTRAINT controle_o_retouche_pkey PRIMARY KEY (o_retouche);


--
-- Name: controle_o_sens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_sens
    ADD CONSTRAINT controle_o_sens_pkey PRIMARY KEY (o_sens);


--
-- Name: controle_o_serie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_o_serie
    ADD CONSTRAINT controle_o_serie_pkey PRIMARY KEY (o_serie);


--
-- Name: controle_orientation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_orientation
    ADD CONSTRAINT controle_orientation_pkey PRIMARY KEY (orientation);


--
-- Name: controle_pendage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_pendage
    ADD CONSTRAINT controle_pendage_pkey PRIMARY KEY (pendage);


--
-- Name: controle_r_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_association
    ADD CONSTRAINT controle_r_association_pkey PRIMARY KEY (r_association);


--
-- Name: controle_r_bord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_bord
    ADD CONSTRAINT controle_r_bord_pkey PRIMARY KEY (r_bord);


--
-- Name: controle_r_cas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_cas
    ADD CONSTRAINT controle_r_cas_pkey PRIMARY KEY (r_cas);


--
-- Name: controle_r_denticulation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_denticulation
    ADD CONSTRAINT controle_r_denticulation_pkey PRIMARY KEY (r_denticulation);


--
-- Name: controle_r_destination_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_destination
    ADD CONSTRAINT controle_r_destination_pkey PRIMARY KEY (r_destination);


--
-- Name: controle_r_dimension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_dimension
    ADD CONSTRAINT controle_r_dimension_pkey PRIMARY KEY (r_dimension);


--
-- Name: controle_r_ecrasement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_ecrasement
    ADD CONSTRAINT controle_r_ecrasement_pkey PRIMARY KEY (r_ecrasement);


--
-- Name: controle_r_extremite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_extremite
    ADD CONSTRAINT controle_r_extremite_pkey PRIMARY KEY (r_extremite);


--
-- Name: controle_r_frequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_frequence
    ADD CONSTRAINT controle_r_frequence_pkey PRIMARY KEY (r_frequence);


--
-- Name: controle_r_lustrage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_lustrage
    ADD CONSTRAINT controle_r_lustrage_pkey PRIMARY KEY (r_lustrage);


--
-- Name: controle_r_obliquite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_obliquite
    ADD CONSTRAINT controle_r_obliquite_pkey PRIMARY KEY (r_obliquite);


--
-- Name: controle_r_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_ordre
    ADD CONSTRAINT controle_r_ordre_pkey PRIMARY KEY (r_ordre);


--
-- Name: controle_r_origine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_origine
    ADD CONSTRAINT controle_r_origine_pkey PRIMARY KEY (r_origine);


--
-- Name: controle_r_sens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_sens
    ADD CONSTRAINT controle_r_sens_pkey PRIMARY KEY (r_sens);


--
-- Name: controle_r_strie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_strie
    ADD CONSTRAINT controle_r_strie_pkey PRIMARY KEY (r_strie);


--
-- Name: controle_r_superposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_superposition
    ADD CONSTRAINT controle_r_superposition_pkey PRIMARY KEY (r_superposition);


--
-- Name: controle_r_tranchant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_tranchant
    ADD CONSTRAINT controle_r_tranchant_pkey PRIMARY KEY (r_tranchant);


--
-- Name: controle_r_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_type
    ADD CONSTRAINT controle_r_type_pkey PRIMARY KEY (r_type);


--
-- Name: controle_r_utilisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_r_utilisation
    ADD CONSTRAINT controle_r_utilisation_pkey PRIMARY KEY (r_utilisation);


--
-- Name: controle_responsable_fouil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_responsable_fouille
    ADD CONSTRAINT controle_responsable_fouil_pkey PRIMARY KEY (responsable_fouille);


--
-- Name: controle_s_localisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_localisation
    ADD CONSTRAINT controle_s_localisation_pkey PRIMARY KEY (s_localisation);


--
-- Name: controle_s_lustrage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_lustrage
    ADD CONSTRAINT controle_s_lustrage_pkey PRIMARY KEY (s_lustrage);


--
-- Name: controle_s_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_ordre
    ADD CONSTRAINT controle_s_ordre_pkey PRIMARY KEY (s_ordre);


--
-- Name: controle_s_polissage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_polissage
    ADD CONSTRAINT controle_s_polissage_pkey PRIMARY KEY (s_polissage);


--
-- Name: controle_s_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_relation
    ADD CONSTRAINT controle_s_relation_pkey PRIMARY KEY (s_relation);


--
-- Name: controle_s_situation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_situation
    ADD CONSTRAINT controle_s_situation_pkey PRIMARY KEY (s_situation);


--
-- Name: controle_s_sous_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_sous_type
    ADD CONSTRAINT controle_s_sous_type_pkey PRIMARY KEY (s_sous_type);


--
-- Name: controle_s_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_s_type
    ADD CONSTRAINT controle_s_type_pkey PRIMARY KEY (s_type);


--
-- Name: controle_sol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_sol
    ADD CONSTRAINT controle_sol_pkey PRIMARY KEY (sol);


--
-- Name: controle_souscarre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_souscarre
    ADD CONSTRAINT controle_souscarre_pkey PRIMARY KEY (souscarre);


--
-- Name: controle_t_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_agent
    ADD CONSTRAINT controle_t_agent_pkey PRIMARY KEY (t_agent);


--
-- Name: controle_t_allure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_allure
    ADD CONSTRAINT controle_t_allure_pkey PRIMARY KEY (t_allure);


--
-- Name: controle_t_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_classe
    ADD CONSTRAINT controle_t_classe_pkey PRIMARY KEY (t_classe);


--
-- Name: controle_t_dessin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_dessin
    ADD CONSTRAINT controle_t_dessin_pkey PRIMARY KEY (t_dessin);


--
-- Name: controle_t_direction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_direction
    ADD CONSTRAINT controle_t_direction_pkey PRIMARY KEY (t_direction);


--
-- Name: controle_t_dstrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_dstrie
    ADD CONSTRAINT controle_t_dstrie_pkey PRIMARY KEY (t_dstrie);


--
-- Name: controle_t_ensemble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_ensemble
    ADD CONSTRAINT controle_t_ensemble_pkey PRIMARY KEY (t_ensemble);


--
-- Name: controle_t_largeur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_largeur
    ADD CONSTRAINT controle_t_largeur_pkey PRIMARY KEY (t_largeur);


--
-- Name: controle_t_locmusc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_locmusc
    ADD CONSTRAINT controle_t_locmusc_pkey PRIMARY KEY (t_locmusc);


--
-- Name: controle_t_nature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_nature
    ADD CONSTRAINT controle_t_nature_pkey PRIMARY KEY (t_nature);


--
-- Name: controle_t_phenomene_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_phenomene
    ADD CONSTRAINT controle_t_phenomene_pkey PRIMARY KEY (t_phenomene);


--
-- Name: controle_t_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_photo
    ADD CONSTRAINT controle_t_photo_pkey PRIMARY KEY (t_photo);


--
-- Name: controle_t_profondeur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_profondeur
    ADD CONSTRAINT controle_t_profondeur_pkey PRIMARY KEY (t_profondeur);


--
-- Name: controle_t_replique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_replique
    ADD CONSTRAINT controle_t_replique_pkey PRIMARY KEY (t_replique);


--
-- Name: controle_t_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_section
    ADD CONSTRAINT controle_t_section_pkey PRIMARY KEY (t_section);


--
-- Name: controle_t_sens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_sens
    ADD CONSTRAINT controle_t_sens_pkey PRIMARY KEY (t_sens);


--
-- Name: controle_t_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_t_trace
    ADD CONSTRAINT controle_t_trace_pkey PRIMARY KEY (t_trace);


--
-- Name: controle_ud_fragmentation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ud_fragmentation
    ADD CONSTRAINT controle_ud_fragmentation_pkey PRIMARY KEY (ud_fragmentation);


--
-- Name: controle_ud_lateralite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ud_lateralite
    ADD CONSTRAINT controle_ud_lateralite_pkey PRIMARY KEY (ud_lateralite);


--
-- Name: controle_ud_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ud_type
    ADD CONSTRAINT controle_ud_type_pkey PRIMARY KEY (ud_type);


--
-- Name: controle_ud_usure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_ud_usure
    ADD CONSTRAINT controle_ud_usure_pkey PRIMARY KEY (ud_usure);


--
-- Name: controle_vers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_vers
    ADD CONSTRAINT controle_vers_pkey PRIMARY KEY (vers);


--
-- Name: controle_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_zone
    ADD CONSTRAINT controle_zone_pkey PRIMARY KEY ("zone");


--
-- Name: controlec__forme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controlec__forme
    ADD CONSTRAINT controlec__forme_pkey PRIMARY KEY (c_forme);


--
-- Name: coprolithe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY coprolithe
    ADD CONSTRAINT coprolithe_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: dent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dent
    ADD CONSTRAINT dent_pkey PRIMARY KEY ("zone", numero, bis, d_serie, d_type);


--
-- Name: eclat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eclat
    ADD CONSTRAINT eclat_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: enlevement_biface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enlevement_biface
    ADD CONSTRAINT enlevement_biface_pkey PRIMARY KEY ("zone", numero, bis, eb_rang);


--
-- Name: enlevement_galet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enlevement_galet
    ADD CONSTRAINT enlevement_galet_pkey PRIMARY KEY ("zone", numero, bis, ga_ordre, eg_rang);


--
-- Name: enlevement_nucleus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enlevement_nucleus
    ADD CONSTRAINT enlevement_nucleus_pkey PRIMARY KEY ("zone", numero, bis, n_ordre, en_rang);


--
-- Name: faune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faune
    ADD CONSTRAINT faune_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: fracture_faune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fracture_faune
    ADD CONSTRAINT fracture_faune_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: fracture_industrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fracture_industrie
    ADD CONSTRAINT fracture_industrie_pkey PRIMARY KEY ("zone", numero, bis, fi_ordre);


--
-- Name: galet_amenage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY galet_amenage
    ADD CONSTRAINT galet_amenage_pkey PRIMARY KEY ("zone", numero, bis, ga_ordre);


--
-- Name: hachereau_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hachereau
    ADD CONSTRAINT hachereau_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: industrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY industrie
    ADD CONSTRAINT industrie_pkey PRIMARY KEY ("zone", numero, bis);


--
-- Name: microfaune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY microfaune
    ADD CONSTRAINT microfaune_pkey PRIMARY KEY ("zone", numero, bis, mf_serie, mf_type);


--
-- Name: nucleus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nucleus
    ADD CONSTRAINT nucleus_pkey PRIMARY KEY ("zone", numero, bis, n_ordre);


--
-- Name: os_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY os
    ADD CONSTRAINT os_pkey PRIMARY KEY ("zone", numero, bis, o_serie);


--
-- Name: outil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY outil
    ADD CONSTRAINT outil_pkey PRIMARY KEY ("zone", numero, bis, o_ordre);


--
-- Name: photocoprolithe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photocoprolithe
    ADD CONSTRAINT photocoprolithe_pkey PRIMARY KEY (idphoto);


--
-- Name: photofaune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photofaune
    ADD CONSTRAINT photofaune_pkey PRIMARY KEY (idphoto);


--
-- Name: photoindustrie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photoindustrie
    ADD CONSTRAINT photoindustrie_pkey PRIMARY KEY (idphoto);


--
-- Name: phototrace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phototrace
    ADD CONSTRAINT phototrace_pkey PRIMARY KEY (idphoto);


--
-- Name: remonte_famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY remonte_famille
    ADD CONSTRAINT remonte_famille_pkey PRIMARY KEY (famille);


--
-- Name: remonte_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY remonte_genre
    ADD CONSTRAINT remonte_genre_pkey PRIMARY KEY (genre);


--
-- Name: remonte_ordre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY remonte_ordre
    ADD CONSTRAINT remonte_ordre_pkey PRIMARY KEY (ordre);


--
-- Name: requete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT requete_pkey PRIMARY KEY (nomrequete);


--
-- Name: retouche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY retouche
    ADD CONSTRAINT retouche_pkey PRIMARY KEY ("zone", numero, bis, r_ordre);


--
-- Name: stigmate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stigmate
    ADD CONSTRAINT stigmate_pkey PRIMARY KEY ("zone", numero, bis, s_ordre);


--
-- Name: trace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trace
    ADD CONSTRAINT trace_pkey PRIMARY KEY ("zone", numero, bis, t_ensemble);


--
-- Name: usure_dent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usure_dent
    ADD CONSTRAINT usure_dent_pkey PRIMARY KEY ("zone", numero, bis, ud_serie);


--
-- Name: index_carnet_numero; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_carnet_numero ON carnet USING btree (numero);


--
-- Name: index_faune_numero; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_faune_numero ON faune USING btree (numero);


--
-- Name: index_faune_zone; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_faune_zone ON faune USING btree ("zone");


--
-- Name: index_industrie_numero; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_industrie_numero ON industrie USING btree (numero);


--
-- Name: index_industrie_zone; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_industrie_zone ON industrie USING btree ("zone");


--
-- Name: index_x_carnet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_x_carnet ON carnet USING btree (x);


--
-- Name: index_y_carnet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_y_carnet ON carnet USING btree (y);


--
-- Name: index_zone_carnet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_zone_carnet ON carnet USING btree ("zone");


--
-- Name: RI_ConstraintTrigger_230538; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON fracture_faune
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230539; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM fracture_faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230540; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM fracture_faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230541; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON photofaune
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'photofaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230542; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM photofaune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'photofaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230543; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM photofaune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'photofaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230544; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON microfaune
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230545; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM microfaune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230546; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM microfaune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230547; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON dent
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230548; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM dent
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230549; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM dent
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230550; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON os
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230551; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM os
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230552; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM os
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230553; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON trace
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230554; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM trace
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230555; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM trace
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230556; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON phototrace
    FROM trace
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'phototrace', 'trace', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 't_ensemble', 't_ensemble');


--
-- Name: RI_ConstraintTrigger_230557; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON trace
    FROM phototrace
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'phototrace', 'trace', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 't_ensemble', 't_ensemble');


--
-- Name: RI_ConstraintTrigger_230558; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON trace
    FROM phototrace
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'phototrace', 'trace', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 't_ensemble', 't_ensemble');


--
-- Name: RI_ConstraintTrigger_230559; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON eclat
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'eclat', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230560; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM eclat
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'eclat', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230561; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM eclat
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'eclat', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230562; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON biface
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'biface', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230563; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM biface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'biface', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230564; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM biface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'biface', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230565; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON hachereau
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'hachereau', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230566; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM hachereau
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'hachereau', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230567; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM hachereau
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'hachereau', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230568; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON photoindustrie
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'photoindustrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230569; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM photoindustrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'photoindustrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230570; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM photoindustrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'photoindustrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230571; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON stigmate
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'stigmate', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230572; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM stigmate
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'stigmate', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230573; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM stigmate
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'stigmate', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230574; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON fracture_industrie
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'fracture_industrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230575; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM fracture_industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'fracture_industrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230576; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM fracture_industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'fracture_industrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230577; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bord
    FROM eclat
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230578; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON eclat
    FROM bord
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230579; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON eclat
    FROM bord
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230580; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON galet_amenage
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'galet_amenage', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230581; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM galet_amenage
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'galet_amenage', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230582; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM galet_amenage
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'galet_amenage', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230583; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON enlevement_galet
    FROM galet_amenage
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');


--
-- Name: RI_ConstraintTrigger_230584; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON galet_amenage
    FROM enlevement_galet
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');


--
-- Name: RI_ConstraintTrigger_230585; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON galet_amenage
    FROM enlevement_galet
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');


--
-- Name: RI_ConstraintTrigger_230588; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON photocoprolithe
    FROM coprolithe
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'photocoprolithe', 'coprolithe', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230589; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON coprolithe
    FROM photocoprolithe
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'photocoprolithe', 'coprolithe', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230590; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON coprolithe
    FROM photocoprolithe
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'photocoprolithe', 'coprolithe', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230591; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON fracture_faune
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230592; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM fracture_faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230593; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM fracture_faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230594; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON retouche
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'retouche', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230595; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM retouche
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'retouche', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230596; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM retouche
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'retouche', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230597; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON enlevement_biface
    FROM biface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230598; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON biface
    FROM enlevement_biface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230599; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON biface
    FROM enlevement_biface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230600; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON nucleus
    FROM industrie
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230601; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON industrie
    FROM nucleus
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230602; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON industrie
    FROM nucleus
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230603; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON enlevement_nucleus
    FROM nucleus
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');


--
-- Name: RI_ConstraintTrigger_230604; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON nucleus
    FROM enlevement_nucleus
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');


--
-- Name: RI_ConstraintTrigger_230605; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON nucleus
    FROM enlevement_nucleus
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');


--
-- Name: RI_ConstraintTrigger_230606; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON usure_dent
    FROM faune
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230607; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON faune
    FROM usure_dent
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: RI_ConstraintTrigger_230608; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON faune
    FROM usure_dent
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: biface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE biface FROM PUBLIC;
REVOKE ALL ON TABLE biface FROM postgres;
GRANT ALL ON TABLE biface TO postgres;
GRANT ALL ON TABLE biface TO lazaret;
GRANT ALL ON TABLE biface TO superlazaret;
GRANT SELECT ON TABLE biface TO visiteurlazaret;
GRANT SELECT ON TABLE biface TO PUBLIC;


--
-- Name: bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE bord FROM PUBLIC;
REVOKE ALL ON TABLE bord FROM postgres;
GRANT ALL ON TABLE bord TO postgres;
GRANT ALL ON TABLE bord TO lazaret;
GRANT ALL ON TABLE bord TO superlazaret;
GRANT SELECT ON TABLE bord TO visiteurlazaret;


--
-- Name: carnet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE carnet FROM PUBLIC;
REVOKE ALL ON TABLE carnet FROM postgres;
GRANT ALL ON TABLE carnet TO postgres;
GRANT ALL ON TABLE carnet TO lazaret;
GRANT ALL ON TABLE carnet TO superlazaret;
GRANT SELECT ON TABLE carnet TO visiteurlazaret;


--
-- Name: controle_b_amenagement_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amenagement_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amenagement_bord FROM postgres;
GRANT ALL ON TABLE controle_b_amenagement_bord TO postgres;
GRANT SELECT ON TABLE controle_b_amenagement_bord TO PUBLIC;
GRANT SELECT ON TABLE controle_b_amenagement_bord TO lazaret;
GRANT ALL ON TABLE controle_b_amenagement_bord TO superlazaret;


--
-- Name: controle_b_amenagement_distal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amenagement_distal FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amenagement_distal FROM postgres;
GRANT ALL ON TABLE controle_b_amenagement_distal TO postgres;
GRANT SELECT ON TABLE controle_b_amenagement_distal TO lazaret;
GRANT ALL ON TABLE controle_b_amenagement_distal TO superlazaret;


--
-- Name: controle_b_amincissement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amincissement FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amincissement FROM postgres;
GRANT ALL ON TABLE controle_b_amincissement TO postgres;
GRANT SELECT ON TABLE controle_b_amincissement TO lazaret;
GRANT ALL ON TABLE controle_b_amincissement TO superlazaret;


--
-- Name: controle_b_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_arete FROM postgres;
GRANT ALL ON TABLE controle_b_arete TO postgres;
GRANT SELECT ON TABLE controle_b_arete TO lazaret;
GRANT ALL ON TABLE controle_b_arete TO superlazaret;


--
-- Name: controle_b_base; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_base FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_base FROM postgres;
GRANT ALL ON TABLE controle_b_base TO postgres;
GRANT SELECT ON TABLE controle_b_base TO lazaret;
GRANT ALL ON TABLE controle_b_base TO superlazaret;


--
-- Name: controle_b_bifaciale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bifaciale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bifaciale FROM postgres;
GRANT ALL ON TABLE controle_b_bifaciale TO postgres;
GRANT SELECT ON TABLE controle_b_bifaciale TO lazaret;
GRANT ALL ON TABLE controle_b_bifaciale TO superlazaret;


--
-- Name: controle_b_bilaterale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bilaterale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bilaterale FROM postgres;
GRANT ALL ON TABLE controle_b_bilaterale TO postgres;
GRANT SELECT ON TABLE controle_b_bilaterale TO lazaret;
GRANT ALL ON TABLE controle_b_bilaterale TO superlazaret;


--
-- Name: controle_b_biseau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_biseau FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_biseau FROM postgres;
GRANT ALL ON TABLE controle_b_biseau TO postgres;
GRANT SELECT ON TABLE controle_b_biseau TO lazaret;
GRANT ALL ON TABLE controle_b_biseau TO superlazaret;


--
-- Name: controle_b_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bord FROM postgres;
GRANT ALL ON TABLE controle_b_bord TO postgres;
GRANT SELECT ON TABLE controle_b_bord TO lazaret;
GRANT ALL ON TABLE controle_b_bord TO superlazaret;


--
-- Name: controle_b_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_code FROM postgres;
GRANT ALL ON TABLE controle_b_code TO postgres;
GRANT SELECT ON TABLE controle_b_code TO lazaret;
GRANT ALL ON TABLE controle_b_code TO superlazaret;


--
-- Name: controle_b_dat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat FROM postgres;
GRANT ALL ON TABLE controle_b_dat TO postgres;
GRANT SELECT ON TABLE controle_b_dat TO lazaret;
GRANT ALL ON TABLE controle_b_dat TO superlazaret;


--
-- Name: controle_b_dat1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat1 FROM postgres;
GRANT ALL ON TABLE controle_b_dat1 TO postgres;
GRANT SELECT ON TABLE controle_b_dat1 TO lazaret;
GRANT ALL ON TABLE controle_b_dat1 TO superlazaret;


--
-- Name: controle_b_dat2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat2 FROM postgres;
GRANT ALL ON TABLE controle_b_dat2 TO postgres;
GRANT SELECT ON TABLE controle_b_dat2 TO lazaret;
GRANT ALL ON TABLE controle_b_dat2 TO superlazaret;


--
-- Name: controle_b_distale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_distale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_distale FROM postgres;
GRANT ALL ON TABLE controle_b_distale TO postgres;
GRANT SELECT ON TABLE controle_b_distale TO lazaret;
GRANT ALL ON TABLE controle_b_distale TO superlazaret;


--
-- Name: controle_b_enlevement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_enlevement FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_enlevement FROM postgres;
GRANT ALL ON TABLE controle_b_enlevement TO postgres;
GRANT SELECT ON TABLE controle_b_enlevement TO lazaret;
GRANT ALL ON TABLE controle_b_enlevement TO superlazaret;


--
-- Name: controle_b_extension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_extension FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_extension FROM postgres;
GRANT ALL ON TABLE controle_b_extension TO postgres;
GRANT SELECT ON TABLE controle_b_extension TO lazaret;
GRANT ALL ON TABLE controle_b_extension TO superlazaret;


--
-- Name: controle_b_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_extremite FROM postgres;
GRANT ALL ON TABLE controle_b_extremite TO postgres;
GRANT SELECT ON TABLE controle_b_extremite TO lazaret;
GRANT ALL ON TABLE controle_b_extremite TO superlazaret;


--
-- Name: controle_b_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_facture FROM postgres;
GRANT ALL ON TABLE controle_b_facture TO postgres;
GRANT SELECT ON TABLE controle_b_facture TO lazaret;
GRANT ALL ON TABLE controle_b_facture TO superlazaret;


--
-- Name: controle_b_meplat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_meplat FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_meplat FROM postgres;
GRANT ALL ON TABLE controle_b_meplat TO postgres;
GRANT SELECT ON TABLE controle_b_meplat TO lazaret;
GRANT ALL ON TABLE controle_b_meplat TO superlazaret;


--
-- Name: controle_b_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_retouche FROM postgres;
GRANT ALL ON TABLE controle_b_retouche TO postgres;
GRANT SELECT ON TABLE controle_b_retouche TO lazaret;
GRANT ALL ON TABLE controle_b_retouche TO superlazaret;


--
-- Name: controle_b_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_support FROM postgres;
GRANT ALL ON TABLE controle_b_support TO postgres;
GRANT ALL ON TABLE controle_b_support TO lazaret;
GRANT ALL ON TABLE controle_b_support TO superlazaret;


--
-- Name: controle_b_surface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_surface FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_surface FROM postgres;
GRANT ALL ON TABLE controle_b_surface TO postgres;
GRANT SELECT ON TABLE controle_b_surface TO lazaret;
GRANT ALL ON TABLE controle_b_surface TO superlazaret;


--
-- Name: controle_b_symetrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_symetrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_symetrie FROM postgres;
GRANT ALL ON TABLE controle_b_symetrie TO postgres;
GRANT SELECT ON TABLE controle_b_symetrie TO lazaret;
GRANT ALL ON TABLE controle_b_symetrie TO superlazaret;


--
-- Name: controle_b_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_type FROM postgres;
GRANT ALL ON TABLE controle_b_type TO postgres;
GRANT SELECT ON TABLE controle_b_type TO lazaret;
GRANT ALL ON TABLE controle_b_type TO superlazaret;


--
-- Name: controle_bis; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_bis FROM PUBLIC;
REVOKE ALL ON TABLE controle_bis FROM postgres;
GRANT ALL ON TABLE controle_bis TO postgres;
GRANT SELECT ON TABLE controle_bis TO lazaret;
GRANT ALL ON TABLE controle_bis TO superlazaret;


--
-- Name: controle_c_alteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_alteration FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_alteration FROM postgres;
GRANT ALL ON TABLE controle_c_alteration TO postgres;
GRANT ALL ON TABLE controle_c_alteration TO superlazaret;
GRANT SELECT ON TABLE controle_c_alteration TO lazaret;


--
-- Name: controle_c_altnat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_altnat FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_altnat FROM postgres;
GRANT ALL ON TABLE controle_c_altnat TO postgres;
GRANT ALL ON TABLE controle_c_altnat TO superlazaret;
GRANT SELECT ON TABLE controle_c_altnat TO lazaret;


--
-- Name: controle_c_autre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_autre FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_autre FROM postgres;
GRANT ALL ON TABLE controle_c_autre TO postgres;
GRANT ALL ON TABLE controle_c_autre TO superlazaret;


--
-- Name: controle_c_consistance; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_consistance FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_consistance FROM postgres;
GRANT ALL ON TABLE controle_c_consistance TO postgres;
GRANT ALL ON TABLE controle_c_consistance TO superlazaret;
GRANT SELECT ON TABLE controle_c_consistance TO lazaret;


--
-- Name: controle_c_couleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_couleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_couleur FROM postgres;
GRANT ALL ON TABLE controle_c_couleur TO postgres;
GRANT ALL ON TABLE controle_c_couleur TO superlazaret;
GRANT SELECT ON TABLE controle_c_couleur TO lazaret;


--
-- Name: controle_c_element; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_element FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_element FROM postgres;
GRANT ALL ON TABLE controle_c_element TO postgres;
GRANT ALL ON TABLE controle_c_element TO superlazaret;


--
-- Name: controle_c_ext1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_ext1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_ext1 FROM postgres;
GRANT ALL ON TABLE controle_c_ext1 TO postgres;
GRANT ALL ON TABLE controle_c_ext1 TO superlazaret;
GRANT SELECT ON TABLE controle_c_ext1 TO lazaret;


--
-- Name: controle_c_ext2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_ext2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_ext2 FROM postgres;
GRANT ALL ON TABLE controle_c_ext2 TO postgres;
GRANT ALL ON TABLE controle_c_ext2 TO superlazaret;
GRANT SELECT ON TABLE controle_c_ext2 TO lazaret;


--
-- Name: controle_c_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_extremite FROM postgres;
GRANT ALL ON TABLE controle_c_extremite TO postgres;
GRANT ALL ON TABLE controle_c_extremite TO superlazaret;


--
-- Name: controle_c_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_famille FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_famille FROM postgres;
GRANT ALL ON TABLE controle_c_famille TO postgres;
GRANT ALL ON TABLE controle_c_famille TO superlazaret;


--
-- Name: controle_c_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_forme FROM postgres;
GRANT ALL ON TABLE controle_c_forme TO postgres;
GRANT ALL ON TABLE controle_c_forme TO lazaret;
GRANT ALL ON TABLE controle_c_forme TO superlazaret;


--
-- Name: controle_c_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_genre FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_genre FROM postgres;
GRANT ALL ON TABLE controle_c_genre TO postgres;
GRANT ALL ON TABLE controle_c_genre TO superlazaret;


--
-- Name: controle_c_granulometrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_granulometrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_granulometrie FROM postgres;
GRANT ALL ON TABLE controle_c_granulometrie TO postgres;
GRANT ALL ON TABLE controle_c_granulometrie TO superlazaret;
GRANT SELECT ON TABLE controle_c_granulometrie TO lazaret;


--
-- Name: controle_c_incl1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl1 FROM postgres;
GRANT ALL ON TABLE controle_c_incl1 TO postgres;
GRANT ALL ON TABLE controle_c_incl1 TO superlazaret;
GRANT SELECT ON TABLE controle_c_incl1 TO lazaret;


--
-- Name: controle_c_incl2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl2 FROM postgres;
GRANT ALL ON TABLE controle_c_incl2 TO postgres;
GRANT ALL ON TABLE controle_c_incl2 TO superlazaret;


--
-- Name: controle_c_incl3; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl3 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl3 FROM postgres;
GRANT ALL ON TABLE controle_c_incl3 TO postgres;
GRANT ALL ON TABLE controle_c_incl3 TO superlazaret;
GRANT SELECT ON TABLE controle_c_incl3 TO lazaret;


--
-- Name: controle_c_inclusion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_inclusion FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_inclusion FROM postgres;
GRANT ALL ON TABLE controle_c_inclusion TO postgres;
GRANT ALL ON TABLE controle_c_inclusion TO superlazaret;


--
-- Name: controle_c_lame; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_lame FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_lame FROM postgres;
GRANT ALL ON TABLE controle_c_lame TO postgres;
GRANT ALL ON TABLE controle_c_lame TO superlazaret;
GRANT SELECT ON TABLE controle_c_lame TO lazaret;


--
-- Name: controle_c_liant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_liant FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_liant FROM postgres;
GRANT ALL ON TABLE controle_c_liant TO postgres;
GRANT ALL ON TABLE controle_c_liant TO superlazaret;


--
-- Name: controle_c_macroreste; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_macroreste FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_macroreste FROM postgres;
GRANT ALL ON TABLE controle_c_macroreste TO postgres;
GRANT ALL ON TABLE controle_c_macroreste TO superlazaret;
GRANT SELECT ON TABLE controle_c_macroreste TO lazaret;


--
-- Name: controle_c_mif; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_mif FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_mif FROM postgres;
GRANT ALL ON TABLE controle_c_mif TO postgres;
GRANT ALL ON TABLE controle_c_mif TO superlazaret;
GRANT SELECT ON TABLE controle_c_mif TO lazaret;


--
-- Name: controle_c_motcou; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motcou FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motcou FROM postgres;
GRANT ALL ON TABLE controle_c_motcou TO postgres;
GRANT ALL ON TABLE controle_c_motcou TO superlazaret;
GRANT SELECT ON TABLE controle_c_motcou TO lazaret;


--
-- Name: controle_c_motif; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motif FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motif FROM postgres;
GRANT ALL ON TABLE controle_c_motif TO postgres;
GRANT ALL ON TABLE controle_c_motif TO superlazaret;
GRANT SELECT ON TABLE controle_c_motif TO lazaret;


--
-- Name: controle_c_motnat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motnat FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motnat FROM postgres;
GRANT ALL ON TABLE controle_c_motnat TO postgres;
GRANT ALL ON TABLE controle_c_motnat TO superlazaret;
GRANT SELECT ON TABLE controle_c_motnat TO lazaret;


--
-- Name: controle_c_palyno; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_palyno FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_palyno FROM postgres;
GRANT ALL ON TABLE controle_c_palyno TO postgres;
GRANT ALL ON TABLE controle_c_palyno TO superlazaret;
GRANT SELECT ON TABLE controle_c_palyno TO lazaret;


--
-- Name: controle_c_parasito; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_parasito FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_parasito FROM postgres;
GRANT ALL ON TABLE controle_c_parasito TO postgres;
GRANT ALL ON TABLE controle_c_parasito TO superlazaret;


--
-- Name: controle_c_retrecissement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_retrecissement FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_retrecissement FROM postgres;
GRANT ALL ON TABLE controle_c_retrecissement TO postgres;
GRANT ALL ON TABLE controle_c_retrecissement TO superlazaret;


--
-- Name: controle_c_sediment; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_sediment FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_sediment FROM postgres;
GRANT ALL ON TABLE controle_c_sediment TO postgres;
GRANT ALL ON TABLE controle_c_sediment TO superlazaret;
GRANT SELECT ON TABLE controle_c_sediment TO lazaret;


--
-- Name: controle_c_vol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_vol FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_vol FROM postgres;
GRANT ALL ON TABLE controle_c_vol TO postgres;
GRANT ALL ON TABLE controle_c_vol TO superlazaret;
GRANT SELECT ON TABLE controle_c_vol TO lazaret;


--
-- Name: controle_c_volext; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_volext FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_volext FROM postgres;
GRANT ALL ON TABLE controle_c_volext TO postgres;
GRANT ALL ON TABLE controle_c_volext TO superlazaret;
GRANT SELECT ON TABLE controle_c_volext TO lazaret;


--
-- Name: controle_carre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_carre FROM PUBLIC;
REVOKE ALL ON TABLE controle_carre FROM postgres;
GRANT ALL ON TABLE controle_carre TO postgres;
GRANT SELECT ON TABLE controle_carre TO lazaret;
GRANT ALL ON TABLE controle_carre TO superlazaret;


--
-- Name: controle_d_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_d_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_d_serie FROM postgres;
GRANT ALL ON TABLE controle_d_serie TO postgres;
GRANT SELECT ON TABLE controle_d_serie TO lazaret;
GRANT ALL ON TABLE controle_d_serie TO superlazaret;


--
-- Name: controle_d_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_d_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_d_type FROM postgres;
GRANT ALL ON TABLE controle_d_type TO postgres;
GRANT SELECT ON TABLE controle_d_type TO lazaret;
GRANT ALL ON TABLE controle_d_type TO superlazaret;


--
-- Name: controle_e_bulbe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_bulbe FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_bulbe FROM postgres;
GRANT ALL ON TABLE controle_e_bulbe TO postgres;
GRANT SELECT ON TABLE controle_e_bulbe TO lazaret;
GRANT ALL ON TABLE controle_e_bulbe TO superlazaret;


--
-- Name: controle_e_carene; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_carene FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_carene FROM postgres;
GRANT ALL ON TABLE controle_e_carene TO postgres;
GRANT SELECT ON TABLE controle_e_carene TO lazaret;
GRANT ALL ON TABLE controle_e_carene TO superlazaret;


--
-- Name: controle_e_charniere; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_charniere FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_charniere FROM postgres;
GRANT ALL ON TABLE controle_e_charniere TO postgres;
GRANT SELECT ON TABLE controle_e_charniere TO lazaret;
GRANT ALL ON TABLE controle_e_charniere TO superlazaret;


--
-- Name: controle_e_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_code FROM postgres;
GRANT ALL ON TABLE controle_e_code TO postgres;
GRANT SELECT ON TABLE controle_e_code TO lazaret;
GRANT ALL ON TABLE controle_e_code TO superlazaret;


--
-- Name: controle_e_cone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_cone FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_cone FROM postgres;
GRANT ALL ON TABLE controle_e_cone TO postgres;
GRANT SELECT ON TABLE controle_e_cone TO lazaret;
GRANT ALL ON TABLE controle_e_cone TO superlazaret;


--
-- Name: controle_e_contour; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_contour FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_contour FROM postgres;
GRANT ALL ON TABLE controle_e_contour TO postgres;
GRANT SELECT ON TABLE controle_e_contour TO lazaret;
GRANT ALL ON TABLE controle_e_contour TO superlazaret;


--
-- Name: controle_e_debitage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_debitage FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_debitage FROM postgres;
GRANT ALL ON TABLE controle_e_debitage TO postgres;
GRANT SELECT ON TABLE controle_e_debitage TO lazaret;
GRANT ALL ON TABLE controle_e_debitage TO superlazaret;


--
-- Name: controle_e_enlevement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_enlevement FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_enlevement FROM postgres;
GRANT ALL ON TABLE controle_e_enlevement TO postgres;
GRANT SELECT ON TABLE controle_e_enlevement TO lazaret;
GRANT ALL ON TABLE controle_e_enlevement TO superlazaret;


--
-- Name: controle_e_epi; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_epi FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_epi FROM postgres;
GRANT ALL ON TABLE controle_e_epi TO postgres;
GRANT SELECT ON TABLE controle_e_epi TO lazaret;
GRANT ALL ON TABLE controle_e_epi TO superlazaret;


--
-- Name: controle_e_onde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_onde FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_onde FROM postgres;
GRANT ALL ON TABLE controle_e_onde TO postgres;
GRANT SELECT ON TABLE controle_e_onde TO lazaret;
GRANT ALL ON TABLE controle_e_onde TO superlazaret;


--
-- Name: controle_e_parasite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_parasite FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_parasite FROM postgres;
GRANT ALL ON TABLE controle_e_parasite TO postgres;
GRANT SELECT ON TABLE controle_e_parasite TO lazaret;
GRANT ALL ON TABLE controle_e_parasite TO superlazaret;


--
-- Name: controle_e_secondaire; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_secondaire FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_secondaire FROM postgres;
GRANT ALL ON TABLE controle_e_secondaire TO postgres;
GRANT SELECT ON TABLE controle_e_secondaire TO lazaret;
GRANT ALL ON TABLE controle_e_secondaire TO superlazaret;


--
-- Name: controle_e_section_long; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_section_long FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_section_long FROM postgres;
GRANT ALL ON TABLE controle_e_section_long TO postgres;
GRANT SELECT ON TABLE controle_e_section_long TO lazaret;
GRANT ALL ON TABLE controle_e_section_long TO superlazaret;


--
-- Name: controle_e_section_trans; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_section_trans FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_section_trans FROM postgres;
GRANT ALL ON TABLE controle_e_section_trans TO postgres;
GRANT SELECT ON TABLE controle_e_section_trans TO lazaret;
GRANT ALL ON TABLE controle_e_section_trans TO superlazaret;


--
-- Name: controle_e_strie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_strie FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_strie FROM postgres;
GRANT ALL ON TABLE controle_e_strie TO postgres;
GRANT SELECT ON TABLE controle_e_strie TO lazaret;
GRANT ALL ON TABLE controle_e_strie TO superlazaret;


--
-- Name: controle_e_talon; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_talon FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_talon FROM postgres;
GRANT ALL ON TABLE controle_e_talon TO postgres;
GRANT SELECT ON TABLE controle_e_talon TO lazaret;
GRANT ALL ON TABLE controle_e_talon TO superlazaret;


--
-- Name: controle_e_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_type FROM postgres;
GRANT ALL ON TABLE controle_e_type TO postgres;
GRANT SELECT ON TABLE controle_e_type TO lazaret;
GRANT ALL ON TABLE controle_e_type TO superlazaret;


--
-- Name: controle_eg_element; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_element FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_element FROM postgres;
GRANT ALL ON TABLE controle_eg_element TO postgres;
GRANT SELECT ON TABLE controle_eg_element TO lazaret;
GRANT ALL ON TABLE controle_eg_element TO superlazaret;


--
-- Name: controle_eg_epaisseur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_epaisseur FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_epaisseur FROM postgres;
GRANT ALL ON TABLE controle_eg_epaisseur TO postgres;
GRANT SELECT ON TABLE controle_eg_epaisseur TO lazaret;
GRANT ALL ON TABLE controle_eg_epaisseur TO superlazaret;


--
-- Name: controle_eg_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_extremite FROM postgres;
GRANT ALL ON TABLE controle_eg_extremite TO postgres;
GRANT SELECT ON TABLE controle_eg_extremite TO lazaret;
GRANT ALL ON TABLE controle_eg_extremite TO superlazaret;


--
-- Name: controle_eg_longueur_generale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_longueur_generale FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_longueur_generale FROM postgres;
GRANT ALL ON TABLE controle_eg_longueur_generale TO postgres;
GRANT SELECT ON TABLE controle_eg_longueur_generale TO lazaret;
GRANT ALL ON TABLE controle_eg_longueur_generale TO superlazaret;


--
-- Name: controle_eg_proeminence; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_proeminence FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_proeminence FROM postgres;
GRANT ALL ON TABLE controle_eg_proeminence TO postgres;
GRANT SELECT ON TABLE controle_eg_proeminence TO lazaret;
GRANT ALL ON TABLE controle_eg_proeminence TO superlazaret;


--
-- Name: controle_eg_profil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_profil FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_profil FROM postgres;
GRANT ALL ON TABLE controle_eg_profil TO postgres;
GRANT SELECT ON TABLE controle_eg_profil TO lazaret;
GRANT ALL ON TABLE controle_eg_profil TO superlazaret;


--
-- Name: controle_eg_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_profondeur FROM postgres;
GRANT ALL ON TABLE controle_eg_profondeur TO postgres;
GRANT SELECT ON TABLE controle_eg_profondeur TO lazaret;
GRANT ALL ON TABLE controle_eg_profondeur TO superlazaret;


--
-- Name: controle_eg_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_sens FROM postgres;
GRANT ALL ON TABLE controle_eg_sens TO postgres;
GRANT SELECT ON TABLE controle_eg_sens TO lazaret;
GRANT ALL ON TABLE controle_eg_sens TO superlazaret;


--
-- Name: controle_eg_situation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_situation FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_situation FROM postgres;
GRANT ALL ON TABLE controle_eg_situation TO postgres;
GRANT SELECT ON TABLE controle_eg_situation TO lazaret;
GRANT ALL ON TABLE controle_eg_situation TO superlazaret;


--
-- Name: controle_eg_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_support FROM postgres;
GRANT ALL ON TABLE controle_eg_support TO postgres;
GRANT SELECT ON TABLE controle_eg_support TO lazaret;
GRANT ALL ON TABLE controle_eg_support TO superlazaret;


--
-- Name: controle_en_direction; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_direction FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_direction FROM postgres;
GRANT ALL ON TABLE controle_en_direction TO postgres;
GRANT SELECT ON TABLE controle_en_direction TO lazaret;
GRANT ALL ON TABLE controle_en_direction TO superlazaret;


--
-- Name: controle_en_dptimpact; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_dptimpact FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_dptimpact FROM postgres;
GRANT ALL ON TABLE controle_en_dptimpact TO postgres;
GRANT SELECT ON TABLE controle_en_dptimpact TO lazaret;
GRANT ALL ON TABLE controle_en_dptimpact TO superlazaret;


--
-- Name: controle_en_frappe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_frappe FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_frappe FROM postgres;
GRANT ALL ON TABLE controle_en_frappe TO postgres;
GRANT SELECT ON TABLE controle_en_frappe TO lazaret;
GRANT ALL ON TABLE controle_en_frappe TO superlazaret;


--
-- Name: controle_en_inclinaison; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_inclinaison FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_inclinaison FROM postgres;
GRANT ALL ON TABLE controle_en_inclinaison TO postgres;
GRANT SELECT ON TABLE controle_en_inclinaison TO lazaret;
GRANT ALL ON TABLE controle_en_inclinaison TO superlazaret;


--
-- Name: controle_en_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_obliquite FROM postgres;
GRANT ALL ON TABLE controle_en_obliquite TO postgres;
GRANT SELECT ON TABLE controle_en_obliquite TO lazaret;
GRANT ALL ON TABLE controle_en_obliquite TO superlazaret;


--
-- Name: controle_en_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_profondeur FROM postgres;
GRANT ALL ON TABLE controle_en_profondeur TO postgres;
GRANT SELECT ON TABLE controle_en_profondeur TO lazaret;
GRANT ALL ON TABLE controle_en_profondeur TO superlazaret;


--
-- Name: controle_ensemble; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ensemble FROM PUBLIC;
REVOKE ALL ON TABLE controle_ensemble FROM postgres;
GRANT ALL ON TABLE controle_ensemble TO postgres;
GRANT SELECT ON TABLE controle_ensemble TO lazaret;
GRANT ALL ON TABLE controle_ensemble TO superlazaret;


--
-- Name: controle_f_affespece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_affespece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_affespece FROM postgres;
GRANT ALL ON TABLE controle_f_affespece TO postgres;
GRANT ALL ON TABLE controle_f_affespece TO lazaret;
GRANT ALL ON TABLE controle_f_affespece TO superlazaret;


--
-- Name: controle_f_affgenre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_affgenre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_affgenre FROM postgres;
GRANT ALL ON TABLE controle_f_affgenre TO postgres;
GRANT ALL ON TABLE controle_f_affgenre TO lazaret;
GRANT ALL ON TABLE controle_f_affgenre TO superlazaret;


--
-- Name: controle_f_agecl; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agecl FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agecl FROM postgres;
GRANT ALL ON TABLE controle_f_agecl TO postgres;
GRANT SELECT ON TABLE controle_f_agecl TO lazaret;
GRANT ALL ON TABLE controle_f_agecl TO superlazaret;


--
-- Name: controle_f_agent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agent FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agent FROM postgres;
GRANT ALL ON TABLE controle_f_agent TO postgres;
GRANT SELECT ON TABLE controle_f_agent TO lazaret;
GRANT ALL ON TABLE controle_f_agent TO superlazaret;


--
-- Name: controle_f_agest; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agest FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agest FROM postgres;
GRANT ALL ON TABLE controle_f_agest TO postgres;
GRANT SELECT ON TABLE controle_f_agest TO lazaret;
GRANT ALL ON TABLE controle_f_agest TO superlazaret;


--
-- Name: controle_f_association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_association FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_association FROM postgres;
GRANT ALL ON TABLE controle_f_association TO postgres;
GRANT SELECT ON TABLE controle_f_association TO lazaret;
GRANT ALL ON TABLE controle_f_association TO superlazaret;


--
-- Name: controle_f_calcouleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_calcouleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_calcouleur FROM postgres;
GRANT ALL ON TABLE controle_f_calcouleur TO postgres;
GRANT SELECT ON TABLE controle_f_calcouleur TO lazaret;
GRANT ALL ON TABLE controle_f_calcouleur TO superlazaret;


--
-- Name: controle_f_caltype; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_caltype FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_caltype FROM postgres;
GRANT ALL ON TABLE controle_f_caltype TO postgres;
GRANT SELECT ON TABLE controle_f_caltype TO lazaret;
GRANT ALL ON TABLE controle_f_caltype TO superlazaret;


--
-- Name: controle_f_classe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_classe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_classe FROM postgres;
GRANT ALL ON TABLE controle_f_classe TO postgres;
GRANT SELECT ON TABLE controle_f_classe TO lazaret;
GRANT ALL ON TABLE controle_f_classe TO superlazaret;


--
-- Name: controle_f_complement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_complement FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_complement FROM postgres;
GRANT ALL ON TABLE controle_f_complement TO postgres;
GRANT ALL ON TABLE controle_f_complement TO lazaret;
GRANT ALL ON TABLE controle_f_complement TO superlazaret;


--
-- Name: controle_f_composite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_composite FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_composite FROM postgres;
GRANT ALL ON TABLE controle_f_composite TO postgres;
GRANT SELECT ON TABLE controle_f_composite TO lazaret;
GRANT ALL ON TABLE controle_f_composite TO superlazaret;


--
-- Name: controle_f_concretion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_concretion FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_concretion FROM postgres;
GRANT ALL ON TABLE controle_f_concretion TO postgres;
GRANT SELECT ON TABLE controle_f_concretion TO lazaret;
GRANT ALL ON TABLE controle_f_concretion TO superlazaret;


--
-- Name: controle_f_conservation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_conservation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_conservation FROM postgres;
GRANT ALL ON TABLE controle_f_conservation TO postgres;
GRANT SELECT ON TABLE controle_f_conservation TO lazaret;
GRANT ALL ON TABLE controle_f_conservation TO superlazaret;


--
-- Name: controle_f_coprolithe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_coprolithe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_coprolithe FROM postgres;
GRANT ALL ON TABLE controle_f_coprolithe TO postgres;
GRANT SELECT ON TABLE controle_f_coprolithe TO lazaret;
GRANT ALL ON TABLE controle_f_coprolithe TO superlazaret;


--
-- Name: controle_f_coraspect; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_coraspect FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_coraspect FROM postgres;
GRANT ALL ON TABLE controle_f_coraspect TO postgres;
GRANT SELECT ON TABLE controle_f_coraspect TO lazaret;
GRANT ALL ON TABLE controle_f_coraspect TO superlazaret;


--
-- Name: controle_f_corfissure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_corfissure FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_corfissure FROM postgres;
GRANT ALL ON TABLE controle_f_corfissure TO postgres;
GRANT SELECT ON TABLE controle_f_corfissure TO lazaret;
GRANT ALL ON TABLE controle_f_corfissure TO superlazaret;


--
-- Name: controle_f_couleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_couleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_couleur FROM postgres;
GRANT ALL ON TABLE controle_f_couleur TO postgres;
GRANT SELECT ON TABLE controle_f_couleur TO lazaret;
GRANT ALL ON TABLE controle_f_couleur TO superlazaret;


--
-- Name: controle_f_datation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_datation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_datation FROM postgres;
GRANT ALL ON TABLE controle_f_datation TO postgres;
GRANT SELECT ON TABLE controle_f_datation TO lazaret;
GRANT ALL ON TABLE controle_f_datation TO superlazaret;


--
-- Name: controle_f_description; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_description FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_description FROM postgres;
GRANT ALL ON TABLE controle_f_description TO postgres;
GRANT SELECT ON TABLE controle_f_description TO lazaret;
GRANT ALL ON TABLE controle_f_description TO superlazaret;


--
-- Name: controle_f_dessin; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_dessin FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_dessin FROM postgres;
GRANT ALL ON TABLE controle_f_dessin TO postgres;
GRANT SELECT ON TABLE controle_f_dessin TO lazaret;
GRANT ALL ON TABLE controle_f_dessin TO superlazaret;


--
-- Name: controle_f_eclat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_eclat FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_eclat FROM postgres;
GRANT ALL ON TABLE controle_f_eclat TO postgres;
GRANT SELECT ON TABLE controle_f_eclat TO lazaret;
GRANT ALL ON TABLE controle_f_eclat TO superlazaret;


--
-- Name: controle_f_espece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_espece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_espece FROM postgres;
GRANT ALL ON TABLE controle_f_espece TO postgres;
GRANT SELECT ON TABLE controle_f_espece TO lazaret;
GRANT ALL ON TABLE controle_f_espece TO superlazaret;


--
-- Name: controle_f_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_famille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_famille FROM postgres;
GRANT ALL ON TABLE controle_f_famille TO postgres;
GRANT SELECT ON TABLE controle_f_famille TO lazaret;
GRANT ALL ON TABLE controle_f_famille TO superlazaret;


--
-- Name: controle_f_fossilisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fossilisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fossilisation FROM postgres;
GRANT ALL ON TABLE controle_f_fossilisation TO postgres;
GRANT SELECT ON TABLE controle_f_fossilisation TO lazaret;
GRANT ALL ON TABLE controle_f_fossilisation TO superlazaret;


--
-- Name: controle_f_fragde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fragde FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fragde FROM postgres;
GRANT ALL ON TABLE controle_f_fragde TO postgres;
GRANT SELECT ON TABLE controle_f_fragde TO lazaret;
GRANT ALL ON TABLE controle_f_fragde TO superlazaret;


--
-- Name: controle_f_fragge; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fragge FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fragge FROM postgres;
GRANT ALL ON TABLE controle_f_fragge TO postgres;
GRANT SELECT ON TABLE controle_f_fragge TO lazaret;
GRANT ALL ON TABLE controle_f_fragge TO superlazaret;


--
-- Name: controle_f_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_genre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_genre FROM postgres;
GRANT ALL ON TABLE controle_f_genre TO postgres;
GRANT SELECT ON TABLE controle_f_genre TO lazaret;
GRANT ALL ON TABLE controle_f_genre TO superlazaret;


--
-- Name: controle_f_icirconference; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_icirconference FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_icirconference FROM postgres;
GRANT ALL ON TABLE controle_f_icirconference TO postgres;
GRANT SELECT ON TABLE controle_f_icirconference TO lazaret;
GRANT ALL ON TABLE controle_f_icirconference TO superlazaret;


--
-- Name: controle_f_ilongueur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ilongueur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ilongueur FROM postgres;
GRANT ALL ON TABLE controle_f_ilongueur TO postgres;
GRANT SELECT ON TABLE controle_f_ilongueur TO lazaret;
GRANT ALL ON TABLE controle_f_ilongueur TO superlazaret;


--
-- Name: controle_f_lateralite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_lateralite FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_lateralite FROM postgres;
GRANT ALL ON TABLE controle_f_lateralite TO postgres;
GRANT SELECT ON TABLE controle_f_lateralite TO lazaret;
GRANT ALL ON TABLE controle_f_lateralite TO superlazaret;


--
-- Name: controle_f_mode; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_mode FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_mode FROM postgres;
GRANT ALL ON TABLE controle_f_mode TO postgres;
GRANT SELECT ON TABLE controle_f_mode TO lazaret;
GRANT ALL ON TABLE controle_f_mode TO superlazaret;


--
-- Name: controle_f_moulage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_moulage FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_moulage FROM postgres;
GRANT ALL ON TABLE controle_f_moulage TO postgres;
GRANT SELECT ON TABLE controle_f_moulage TO lazaret;
GRANT ALL ON TABLE controle_f_moulage TO superlazaret;


--
-- Name: controle_f_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ordre FROM postgres;
GRANT ALL ON TABLE controle_f_ordre TO postgres;
GRANT SELECT ON TABLE controle_f_ordre TO lazaret;
GRANT ALL ON TABLE controle_f_ordre TO superlazaret;


--
-- Name: controle_f_oxyde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_oxyde FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_oxyde FROM postgres;
GRANT ALL ON TABLE controle_f_oxyde TO postgres;
GRANT SELECT ON TABLE controle_f_oxyde TO lazaret;
GRANT ALL ON TABLE controle_f_oxyde TO superlazaret;


--
-- Name: controle_f_pathologie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_pathologie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_pathologie FROM postgres;
GRANT ALL ON TABLE controle_f_pathologie TO postgres;
GRANT SELECT ON TABLE controle_f_pathologie TO lazaret;
GRANT ALL ON TABLE controle_f_pathologie TO superlazaret;


--
-- Name: controle_f_pelote; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_pelote FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_pelote FROM postgres;
GRANT ALL ON TABLE controle_f_pelote TO postgres;
GRANT SELECT ON TABLE controle_f_pelote TO lazaret;
GRANT ALL ON TABLE controle_f_pelote TO superlazaret;


--
-- Name: controle_f_percussion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_percussion FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_percussion FROM postgres;
GRANT ALL ON TABLE controle_f_percussion TO postgres;
GRANT SELECT ON TABLE controle_f_percussion TO lazaret;
GRANT ALL ON TABLE controle_f_percussion TO superlazaret;


--
-- Name: controle_f_photo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_photo FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_photo FROM postgres;
GRANT ALL ON TABLE controle_f_photo TO postgres;
GRANT SELECT ON TABLE controle_f_photo TO lazaret;
GRANT ALL ON TABLE controle_f_photo TO superlazaret;


--
-- Name: controle_f_reference; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_reference FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_reference FROM postgres;
GRANT ALL ON TABLE controle_f_reference TO postgres;
GRANT ALL ON TABLE controle_f_reference TO lazaret;
GRANT ALL ON TABLE controle_f_reference TO superlazaret;


--
-- Name: controle_f_responsable; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_responsable FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_responsable FROM postgres;
GRANT ALL ON TABLE controle_f_responsable TO postgres;
GRANT SELECT ON TABLE controle_f_responsable TO lazaret;
GRANT ALL ON TABLE controle_f_responsable TO superlazaret;


--
-- Name: controle_f_restauration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_restauration FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_restauration FROM postgres;
GRANT ALL ON TABLE controle_f_restauration TO postgres;
GRANT SELECT ON TABLE controle_f_restauration TO lazaret;
GRANT ALL ON TABLE controle_f_restauration TO superlazaret;


--
-- Name: controle_f_saisie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_saisie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_saisie FROM postgres;
GRANT ALL ON TABLE controle_f_saisie TO postgres;
GRANT SELECT ON TABLE controle_f_saisie TO lazaret;
GRANT ALL ON TABLE controle_f_saisie TO superlazaret;


--
-- Name: controle_f_sauvefrag; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_sauvefrag FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_sauvefrag FROM postgres;
GRANT ALL ON TABLE controle_f_sauvefrag TO postgres;
GRANT SELECT ON TABLE controle_f_sauvefrag TO lazaret;
GRANT ALL ON TABLE controle_f_sauvefrag TO superlazaret;


--
-- Name: controle_f_sexe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_sexe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_sexe FROM postgres;
GRANT ALL ON TABLE controle_f_sexe TO postgres;
GRANT SELECT ON TABLE controle_f_sexe TO lazaret;
GRANT ALL ON TABLE controle_f_sexe TO superlazaret;


--
-- Name: controle_f_ssespece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ssespece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ssespece FROM postgres;
GRANT ALL ON TABLE controle_f_ssespece TO postgres;
GRANT SELECT ON TABLE controle_f_ssespece TO lazaret;
GRANT ALL ON TABLE controle_f_ssespece TO superlazaret;


--
-- Name: controle_f_ssfamille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ssfamille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ssfamille FROM postgres;
GRANT ALL ON TABLE controle_f_ssfamille TO postgres;
GRANT SELECT ON TABLE controle_f_ssfamille TO lazaret;
GRANT ALL ON TABLE controle_f_ssfamille TO superlazaret;


--
-- Name: controle_f_stdent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_stdent FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_stdent FROM postgres;
GRANT ALL ON TABLE controle_f_stdent TO postgres;
GRANT SELECT ON TABLE controle_f_stdent TO lazaret;
GRANT ALL ON TABLE controle_f_stdent TO superlazaret;


--
-- Name: controle_f_stserie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_stserie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_stserie FROM postgres;
GRANT ALL ON TABLE controle_f_stserie TO postgres;
GRANT SELECT ON TABLE controle_f_stserie TO lazaret;
GRANT ALL ON TABLE controle_f_stserie TO superlazaret;


--
-- Name: controle_f_taille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_taille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_taille FROM postgres;
GRANT ALL ON TABLE controle_f_taille TO postgres;
GRANT SELECT ON TABLE controle_f_taille TO lazaret;
GRANT ALL ON TABLE controle_f_taille TO superlazaret;


--
-- Name: controle_f_tissu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_tissu FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_tissu FROM postgres;
GRANT ALL ON TABLE controle_f_tissu TO postgres;
GRANT SELECT ON TABLE controle_f_tissu TO lazaret;
GRANT ALL ON TABLE controle_f_tissu TO superlazaret;


--
-- Name: controle_f_traitement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_traitement FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_traitement FROM postgres;
GRANT ALL ON TABLE controle_f_traitement TO postgres;
GRANT SELECT ON TABLE controle_f_traitement TO lazaret;
GRANT ALL ON TABLE controle_f_traitement TO superlazaret;


--
-- Name: controle_f_tranchant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_tranchant FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_tranchant FROM postgres;
GRANT ALL ON TABLE controle_f_tranchant TO postgres;
GRANT SELECT ON TABLE controle_f_tranchant TO lazaret;
GRANT ALL ON TABLE controle_f_tranchant TO superlazaret;


--
-- Name: controle_f_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_type FROM postgres;
GRANT ALL ON TABLE controle_f_type TO postgres;
GRANT SELECT ON TABLE controle_f_type TO lazaret;
GRANT ALL ON TABLE controle_f_type TO superlazaret;


--
-- Name: controle_f_typedos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typedos FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typedos FROM postgres;
GRANT ALL ON TABLE controle_f_typedos TO postgres;
GRANT SELECT ON TABLE controle_f_typedos TO lazaret;
GRANT ALL ON TABLE controle_f_typedos TO superlazaret;


--
-- Name: controle_f_typos1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos1 FROM postgres;
GRANT ALL ON TABLE controle_f_typos1 TO postgres;
GRANT SELECT ON TABLE controle_f_typos1 TO lazaret;
GRANT ALL ON TABLE controle_f_typos1 TO superlazaret;


--
-- Name: controle_f_typos2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos2 FROM postgres;
GRANT ALL ON TABLE controle_f_typos2 TO postgres;
GRANT SELECT ON TABLE controle_f_typos2 TO lazaret;
GRANT ALL ON TABLE controle_f_typos2 TO superlazaret;


--
-- Name: controle_f_typos3; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos3 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos3 FROM postgres;
GRANT ALL ON TABLE controle_f_typos3 TO postgres;
GRANT SELECT ON TABLE controle_f_typos3 TO lazaret;
GRANT ALL ON TABLE controle_f_typos3 TO superlazaret;


--
-- Name: controle_f_typos4; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos4 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos4 FROM postgres;
GRANT ALL ON TABLE controle_f_typos4 TO postgres;
GRANT SELECT ON TABLE controle_f_typos4 TO lazaret;
GRANT ALL ON TABLE controle_f_typos4 TO superlazaret;


--
-- Name: controle_f_typos5; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos5 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos5 FROM postgres;
GRANT ALL ON TABLE controle_f_typos5 TO postgres;
GRANT SELECT ON TABLE controle_f_typos5 TO lazaret;
GRANT ALL ON TABLE controle_f_typos5 TO superlazaret;


--
-- Name: controle_f_typos6; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos6 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos6 FROM postgres;
GRANT ALL ON TABLE controle_f_typos6 TO postgres;
GRANT ALL ON TABLE controle_f_typos6 TO lazaret;
GRANT ALL ON TABLE controle_f_typos6 TO superlazaret;


--
-- Name: controle_ff_angle1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_angle1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_angle1 FROM postgres;
GRANT ALL ON TABLE controle_ff_angle1 TO postgres;
GRANT SELECT ON TABLE controle_ff_angle1 TO lazaret;
GRANT ALL ON TABLE controle_ff_angle1 TO superlazaret;


--
-- Name: controle_ff_angle2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_angle2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_angle2 FROM postgres;
GRANT ALL ON TABLE controle_ff_angle2 TO postgres;
GRANT SELECT ON TABLE controle_ff_angle2 TO lazaret;
GRANT ALL ON TABLE controle_ff_angle2 TO superlazaret;


--
-- Name: controle_ff_aspect1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_aspect1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_aspect1 FROM postgres;
GRANT ALL ON TABLE controle_ff_aspect1 TO postgres;
GRANT SELECT ON TABLE controle_ff_aspect1 TO lazaret;
GRANT ALL ON TABLE controle_ff_aspect1 TO superlazaret;


--
-- Name: controle_ff_aspect2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_aspect2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_aspect2 FROM postgres;
GRANT ALL ON TABLE controle_ff_aspect2 TO postgres;
GRANT SELECT ON TABLE controle_ff_aspect2 TO lazaret;
GRANT ALL ON TABLE controle_ff_aspect2 TO superlazaret;


--
-- Name: controle_ff_localisation1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_localisation1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_localisation1 FROM postgres;
GRANT ALL ON TABLE controle_ff_localisation1 TO postgres;
GRANT SELECT ON TABLE controle_ff_localisation1 TO lazaret;
GRANT ALL ON TABLE controle_ff_localisation1 TO superlazaret;


--
-- Name: controle_ff_localisation2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_localisation2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_localisation2 FROM postgres;
GRANT ALL ON TABLE controle_ff_localisation2 TO postgres;
GRANT SELECT ON TABLE controle_ff_localisation2 TO lazaret;
GRANT ALL ON TABLE controle_ff_localisation2 TO superlazaret;


--
-- Name: controle_ff_morphologie1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_morphologie1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_morphologie1 FROM postgres;
GRANT ALL ON TABLE controle_ff_morphologie1 TO postgres;
GRANT SELECT ON TABLE controle_ff_morphologie1 TO lazaret;
GRANT ALL ON TABLE controle_ff_morphologie1 TO superlazaret;


--
-- Name: controle_ff_morphologie2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_morphologie2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_morphologie2 FROM postgres;
GRANT ALL ON TABLE controle_ff_morphologie2 TO postgres;
GRANT SELECT ON TABLE controle_ff_morphologie2 TO lazaret;
GRANT ALL ON TABLE controle_ff_morphologie2 TO superlazaret;


--
-- Name: controle_ff_non1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_non1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_non1 FROM postgres;
GRANT ALL ON TABLE controle_ff_non1 TO postgres;
GRANT SELECT ON TABLE controle_ff_non1 TO lazaret;
GRANT ALL ON TABLE controle_ff_non1 TO superlazaret;


--
-- Name: controle_ff_non2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_non2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_non2 FROM postgres;
GRANT ALL ON TABLE controle_ff_non2 TO postgres;
GRANT SELECT ON TABLE controle_ff_non2 TO lazaret;
GRANT ALL ON TABLE controle_ff_non2 TO superlazaret;


--
-- Name: controle_ff_profil1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_profil1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_profil1 FROM postgres;
GRANT ALL ON TABLE controle_ff_profil1 TO postgres;
GRANT SELECT ON TABLE controle_ff_profil1 TO lazaret;
GRANT ALL ON TABLE controle_ff_profil1 TO superlazaret;


--
-- Name: controle_ff_profil2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_profil2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_profil2 FROM postgres;
GRANT ALL ON TABLE controle_ff_profil2 TO postgres;
GRANT SELECT ON TABLE controle_ff_profil2 TO lazaret;
GRANT ALL ON TABLE controle_ff_profil2 TO superlazaret;


--
-- Name: controle_fi_mode; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_mode FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_mode FROM postgres;
GRANT ALL ON TABLE controle_fi_mode TO postgres;
GRANT SELECT ON TABLE controle_fi_mode TO lazaret;
GRANT ALL ON TABLE controle_fi_mode TO superlazaret;


--
-- Name: controle_fi_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_ordre FROM postgres;
GRANT ALL ON TABLE controle_fi_ordre TO postgres;
GRANT SELECT ON TABLE controle_fi_ordre TO lazaret;
GRANT ALL ON TABLE controle_fi_ordre TO superlazaret;


--
-- Name: controle_fi_percussion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_percussion FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_percussion FROM postgres;
GRANT ALL ON TABLE controle_fi_percussion TO postgres;
GRANT SELECT ON TABLE controle_fi_percussion TO lazaret;
GRANT ALL ON TABLE controle_fi_percussion TO superlazaret;


--
-- Name: controle_fi_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_type FROM postgres;
GRANT ALL ON TABLE controle_fi_type TO postgres;
GRANT SELECT ON TABLE controle_fi_type TO lazaret;
GRANT ALL ON TABLE controle_fi_type TO superlazaret;


--
-- Name: controle_ga_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_arete FROM postgres;
GRANT ALL ON TABLE controle_ga_arete TO postgres;
GRANT SELECT ON TABLE controle_ga_arete TO lazaret;
GRANT ALL ON TABLE controle_ga_arete TO superlazaret;


--
-- Name: controle_ga_chf; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_chf FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_chf FROM postgres;
GRANT ALL ON TABLE controle_ga_chf TO postgres;
GRANT SELECT ON TABLE controle_ga_chf TO lazaret;
GRANT ALL ON TABLE controle_ga_chf TO superlazaret;


--
-- Name: controle_ga_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_facture FROM postgres;
GRANT ALL ON TABLE controle_ga_facture TO postgres;
GRANT SELECT ON TABLE controle_ga_facture TO lazaret;
GRANT ALL ON TABLE controle_ga_facture TO superlazaret;


--
-- Name: controle_ga_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_forme FROM postgres;
GRANT ALL ON TABLE controle_ga_forme TO postgres;
GRANT SELECT ON TABLE controle_ga_forme TO lazaret;
GRANT ALL ON TABLE controle_ga_forme TO superlazaret;


--
-- Name: controle_ga_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_obliquite FROM postgres;
GRANT ALL ON TABLE controle_ga_obliquite TO postgres;
GRANT SELECT ON TABLE controle_ga_obliquite TO lazaret;
GRANT ALL ON TABLE controle_ga_obliquite TO superlazaret;


--
-- Name: controle_ga_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_orientation FROM postgres;
GRANT ALL ON TABLE controle_ga_orientation TO postgres;
GRANT SELECT ON TABLE controle_ga_orientation TO lazaret;
GRANT ALL ON TABLE controle_ga_orientation TO superlazaret;


--
-- Name: controle_ga_qualite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_qualite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_qualite FROM postgres;
GRANT ALL ON TABLE controle_ga_qualite TO postgres;
GRANT SELECT ON TABLE controle_ga_qualite TO lazaret;
GRANT ALL ON TABLE controle_ga_qualite TO superlazaret;


--
-- Name: controle_ga_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_retouche FROM postgres;
GRANT ALL ON TABLE controle_ga_retouche TO postgres;
GRANT SELECT ON TABLE controle_ga_retouche TO lazaret;
GRANT ALL ON TABLE controle_ga_retouche TO superlazaret;


--
-- Name: controle_ga_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_type FROM postgres;
GRANT ALL ON TABLE controle_ga_type TO postgres;
GRANT SELECT ON TABLE controle_ga_type TO lazaret;
GRANT ALL ON TABLE controle_ga_type TO superlazaret;


--
-- Name: controle_h_amenagement_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_amenagement_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_amenagement_bord FROM postgres;
GRANT ALL ON TABLE controle_h_amenagement_bord TO postgres;
GRANT SELECT ON TABLE controle_h_amenagement_bord TO lazaret;
GRANT ALL ON TABLE controle_h_amenagement_bord TO superlazaret;


--
-- Name: controle_h_amenagement_distal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_amenagement_distal FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_amenagement_distal FROM postgres;
GRANT ALL ON TABLE controle_h_amenagement_distal TO postgres;
GRANT SELECT ON TABLE controle_h_amenagement_distal TO lazaret;
GRANT ALL ON TABLE controle_h_amenagement_distal TO superlazaret;


--
-- Name: controle_h_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_arete FROM postgres;
GRANT ALL ON TABLE controle_h_arete TO postgres;
GRANT SELECT ON TABLE controle_h_arete TO lazaret;
GRANT ALL ON TABLE controle_h_arete TO superlazaret;


--
-- Name: controle_h_base; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_base FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_base FROM postgres;
GRANT ALL ON TABLE controle_h_base TO postgres;
GRANT SELECT ON TABLE controle_h_base TO lazaret;
GRANT ALL ON TABLE controle_h_base TO superlazaret;


--
-- Name: controle_h_bilaterale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_bilaterale FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_bilaterale FROM postgres;
GRANT ALL ON TABLE controle_h_bilaterale TO postgres;
GRANT SELECT ON TABLE controle_h_bilaterale TO lazaret;
GRANT ALL ON TABLE controle_h_bilaterale TO superlazaret;


--
-- Name: controle_h_biseau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_biseau FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_biseau FROM postgres;
GRANT ALL ON TABLE controle_h_biseau TO postgres;
GRANT SELECT ON TABLE controle_h_biseau TO lazaret;
GRANT ALL ON TABLE controle_h_biseau TO superlazaret;


--
-- Name: controle_h_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_bord FROM postgres;
GRANT ALL ON TABLE controle_h_bord TO postgres;
GRANT SELECT ON TABLE controle_h_bord TO lazaret;
GRANT ALL ON TABLE controle_h_bord TO superlazaret;


--
-- Name: controle_h_distale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_distale FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_distale FROM postgres;
GRANT ALL ON TABLE controle_h_distale TO postgres;
GRANT SELECT ON TABLE controle_h_distale TO lazaret;
GRANT ALL ON TABLE controle_h_distale TO superlazaret;


--
-- Name: controle_h_extension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_extension FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_extension FROM postgres;
GRANT ALL ON TABLE controle_h_extension TO postgres;
GRANT SELECT ON TABLE controle_h_extension TO lazaret;
GRANT ALL ON TABLE controle_h_extension TO superlazaret;


--
-- Name: controle_h_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_facture FROM postgres;
GRANT ALL ON TABLE controle_h_facture TO postgres;
GRANT SELECT ON TABLE controle_h_facture TO lazaret;
GRANT ALL ON TABLE controle_h_facture TO superlazaret;


--
-- Name: controle_h_meplat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_meplat FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_meplat FROM postgres;
GRANT ALL ON TABLE controle_h_meplat TO postgres;
GRANT SELECT ON TABLE controle_h_meplat TO lazaret;
GRANT ALL ON TABLE controle_h_meplat TO superlazaret;


--
-- Name: controle_h_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_retouche FROM postgres;
GRANT ALL ON TABLE controle_h_retouche TO postgres;
GRANT SELECT ON TABLE controle_h_retouche TO lazaret;
GRANT ALL ON TABLE controle_h_retouche TO superlazaret;


--
-- Name: controle_h_surface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_surface FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_surface FROM postgres;
GRANT ALL ON TABLE controle_h_surface TO postgres;
GRANT SELECT ON TABLE controle_h_surface TO lazaret;
GRANT ALL ON TABLE controle_h_surface TO superlazaret;


--
-- Name: controle_h_symetrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_symetrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_symetrie FROM postgres;
GRANT ALL ON TABLE controle_h_symetrie TO postgres;
GRANT SELECT ON TABLE controle_h_symetrie TO lazaret;
GRANT ALL ON TABLE controle_h_symetrie TO superlazaret;


--
-- Name: controle_i_action; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_action FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_action FROM postgres;
GRANT ALL ON TABLE controle_i_action TO postgres;
GRANT SELECT ON TABLE controle_i_action TO lazaret;
GRANT ALL ON TABLE controle_i_action TO superlazaret;


--
-- Name: controle_i_alteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_alteration FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_alteration FROM postgres;
GRANT ALL ON TABLE controle_i_alteration TO postgres;
GRANT SELECT ON TABLE controle_i_alteration TO lazaret;
GRANT ALL ON TABLE controle_i_alteration TO superlazaret;


--
-- Name: controle_i_desilicification; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_desilicification FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_desilicification FROM postgres;
GRANT ALL ON TABLE controle_i_desilicification TO postgres;
GRANT SELECT ON TABLE controle_i_desilicification TO lazaret;
GRANT ALL ON TABLE controle_i_desilicification TO superlazaret;


--
-- Name: controle_i_dpatine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_dpatine FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_dpatine FROM postgres;
GRANT ALL ON TABLE controle_i_dpatine TO postgres;
GRANT SELECT ON TABLE controle_i_dpatine TO lazaret;
GRANT ALL ON TABLE controle_i_dpatine TO superlazaret;


--
-- Name: controle_i_encroutement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_encroutement FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_encroutement FROM postgres;
GRANT ALL ON TABLE controle_i_encroutement TO postgres;
GRANT SELECT ON TABLE controle_i_encroutement TO lazaret;
GRANT ALL ON TABLE controle_i_encroutement TO superlazaret;


--
-- Name: controle_i_eolisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_eolisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_eolisation FROM postgres;
GRANT ALL ON TABLE controle_i_eolisation TO postgres;
GRANT SELECT ON TABLE controle_i_eolisation TO lazaret;
GRANT ALL ON TABLE controle_i_eolisation TO superlazaret;


--
-- Name: controle_i_forme_galet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_forme_galet FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_forme_galet FROM postgres;
GRANT ALL ON TABLE controle_i_forme_galet TO postgres;
GRANT SELECT ON TABLE controle_i_forme_galet TO lazaret;
GRANT ALL ON TABLE controle_i_forme_galet TO superlazaret;


--
-- Name: controle_i_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_lustrage FROM postgres;
GRANT ALL ON TABLE controle_i_lustrage TO postgres;
GRANT SELECT ON TABLE controle_i_lustrage TO lazaret;
GRANT ALL ON TABLE controle_i_lustrage TO superlazaret;


--
-- Name: controle_i_matiere; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_matiere FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_matiere FROM postgres;
GRANT ALL ON TABLE controle_i_matiere TO postgres;
GRANT SELECT ON TABLE controle_i_matiere TO lazaret;
GRANT ALL ON TABLE controle_i_matiere TO superlazaret;


--
-- Name: controle_i_objet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_objet FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_objet FROM postgres;
GRANT ALL ON TABLE controle_i_objet TO postgres;
GRANT SELECT ON TABLE controle_i_objet TO lazaret;
GRANT ALL ON TABLE controle_i_objet TO superlazaret;


--
-- Name: controle_i_patine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_patine FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_patine FROM postgres;
GRANT ALL ON TABLE controle_i_patine TO postgres;
GRANT SELECT ON TABLE controle_i_patine TO lazaret;
GRANT ALL ON TABLE controle_i_patine TO superlazaret;


--
-- Name: controle_i_pmycellium; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_pmycellium FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_pmycellium FROM postgres;
GRANT ALL ON TABLE controle_i_pmycellium TO postgres;
GRANT SELECT ON TABLE controle_i_pmycellium TO lazaret;
GRANT ALL ON TABLE controle_i_pmycellium TO superlazaret;


--
-- Name: controle_i_roulage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_roulage FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_roulage FROM postgres;
GRANT ALL ON TABLE controle_i_roulage TO postgres;
GRANT SELECT ON TABLE controle_i_roulage TO lazaret;
GRANT ALL ON TABLE controle_i_roulage TO superlazaret;


--
-- Name: controle_i_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_support FROM postgres;
GRANT ALL ON TABLE controle_i_support TO postgres;
GRANT SELECT ON TABLE controle_i_support TO lazaret;
GRANT ALL ON TABLE controle_i_support TO superlazaret;


--
-- Name: controle_i_support_originel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_support_originel FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_support_originel FROM postgres;
GRANT ALL ON TABLE controle_i_support_originel TO postgres;
GRANT SELECT ON TABLE controle_i_support_originel TO lazaret;
GRANT ALL ON TABLE controle_i_support_originel TO superlazaret;


--
-- Name: controle_localite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_localite FROM PUBLIC;
REVOKE ALL ON TABLE controle_localite FROM postgres;
GRANT ALL ON TABLE controle_localite TO postgres;
GRANT SELECT ON TABLE controle_localite TO lazaret;
GRANT ALL ON TABLE controle_localite TO superlazaret;


--
-- Name: controle_locus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_locus FROM PUBLIC;
REVOKE ALL ON TABLE controle_locus FROM postgres;
GRANT ALL ON TABLE controle_locus TO postgres;
GRANT SELECT ON TABLE controle_locus TO lazaret;
GRANT ALL ON TABLE controle_locus TO superlazaret;


--
-- Name: controle_mf_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_mf_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_mf_serie FROM postgres;
GRANT ALL ON TABLE controle_mf_serie TO postgres;
GRANT SELECT ON TABLE controle_mf_serie TO lazaret;
GRANT ALL ON TABLE controle_mf_serie TO superlazaret;


--
-- Name: controle_mf_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_mf_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_mf_type FROM postgres;
GRANT ALL ON TABLE controle_mf_type TO postgres;
GRANT SELECT ON TABLE controle_mf_type TO lazaret;
GRANT ALL ON TABLE controle_mf_type TO superlazaret;


--
-- Name: controle_n_cortotal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_cortotal FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_cortotal FROM postgres;
GRANT ALL ON TABLE controle_n_cortotal TO postgres;
GRANT SELECT ON TABLE controle_n_cortotal TO lazaret;
GRANT ALL ON TABLE controle_n_cortotal TO superlazaret;


--
-- Name: controle_n_epuisement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_epuisement FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_epuisement FROM postgres;
GRANT ALL ON TABLE controle_n_epuisement TO postgres;
GRANT ALL ON TABLE controle_n_epuisement TO lazaret;
GRANT ALL ON TABLE controle_n_epuisement TO superlazaret;
GRANT SELECT ON TABLE controle_n_epuisement TO visiteurlazaret;


--
-- Name: controle_n_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_forme FROM postgres;
GRANT ALL ON TABLE controle_n_forme TO postgres;
GRANT SELECT ON TABLE controle_n_forme TO lazaret;
GRANT ALL ON TABLE controle_n_forme TO superlazaret;


--
-- Name: controle_n_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_orientation FROM postgres;
GRANT ALL ON TABLE controle_n_orientation TO postgres;
GRANT SELECT ON TABLE controle_n_orientation TO lazaret;
GRANT ALL ON TABLE controle_n_orientation TO superlazaret;


--
-- Name: controle_n_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_type FROM postgres;
GRANT ALL ON TABLE controle_n_type TO postgres;
GRANT SELECT ON TABLE controle_n_type TO lazaret;
GRANT ALL ON TABLE controle_n_type TO superlazaret;


--
-- Name: controle_nature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_nature FROM PUBLIC;
REVOKE ALL ON TABLE controle_nature FROM postgres;
GRANT ALL ON TABLE controle_nature TO postgres;
GRANT SELECT ON TABLE controle_nature TO lazaret;
GRANT ALL ON TABLE controle_nature TO superlazaret;


--
-- Name: controle_niveau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_niveau FROM PUBLIC;
REVOKE ALL ON TABLE controle_niveau FROM postgres;
GRANT ALL ON TABLE controle_niveau TO postgres;
GRANT SELECT ON TABLE controle_niveau TO lazaret;
GRANT ALL ON TABLE controle_niveau TO superlazaret;


--
-- Name: controle_o_chronologie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_chronologie FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_chronologie FROM postgres;
GRANT ALL ON TABLE controle_o_chronologie TO postgres;
GRANT SELECT ON TABLE controle_o_chronologie TO lazaret;
GRANT ALL ON TABLE controle_o_chronologie TO superlazaret;


--
-- Name: controle_o_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_code FROM postgres;
GRANT ALL ON TABLE controle_o_code TO postgres;
GRANT SELECT ON TABLE controle_o_code TO lazaret;
GRANT ALL ON TABLE controle_o_code TO superlazaret;


--
-- Name: controle_o_destination; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_destination FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_destination FROM postgres;
GRANT ALL ON TABLE controle_o_destination TO postgres;
GRANT SELECT ON TABLE controle_o_destination TO lazaret;
GRANT ALL ON TABLE controle_o_destination TO superlazaret;


--
-- Name: controle_o_etat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_etat FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_etat FROM postgres;
GRANT ALL ON TABLE controle_o_etat TO postgres;
GRANT SELECT ON TABLE controle_o_etat TO lazaret;
GRANT ALL ON TABLE controle_o_etat TO superlazaret;


--
-- Name: controle_o_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_forme FROM postgres;
GRANT ALL ON TABLE controle_o_forme TO postgres;
GRANT SELECT ON TABLE controle_o_forme TO lazaret;
GRANT ALL ON TABLE controle_o_forme TO superlazaret;


--
-- Name: controle_o_localisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_localisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_localisation FROM postgres;
GRANT ALL ON TABLE controle_o_localisation TO postgres;
GRANT SELECT ON TABLE controle_o_localisation TO lazaret;
GRANT ALL ON TABLE controle_o_localisation TO superlazaret;


--
-- Name: controle_o_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_ordre FROM postgres;
GRANT ALL ON TABLE controle_o_ordre TO postgres;
GRANT SELECT ON TABLE controle_o_ordre TO lazaret;
GRANT ALL ON TABLE controle_o_ordre TO superlazaret;


--
-- Name: controle_o_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_orientation FROM postgres;
GRANT ALL ON TABLE controle_o_orientation TO postgres;
GRANT SELECT ON TABLE controle_o_orientation TO lazaret;
GRANT ALL ON TABLE controle_o_orientation TO superlazaret;


--
-- Name: controle_o_origine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_origine FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_origine FROM postgres;
GRANT ALL ON TABLE controle_o_origine TO postgres;
GRANT SELECT ON TABLE controle_o_origine TO lazaret;
GRANT ALL ON TABLE controle_o_origine TO superlazaret;


--
-- Name: controle_o_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_retouche FROM postgres;
GRANT ALL ON TABLE controle_o_retouche TO postgres;
GRANT SELECT ON TABLE controle_o_retouche TO lazaret;
GRANT ALL ON TABLE controle_o_retouche TO superlazaret;


--
-- Name: controle_o_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_sens FROM postgres;
GRANT ALL ON TABLE controle_o_sens TO postgres;
GRANT SELECT ON TABLE controle_o_sens TO lazaret;
GRANT ALL ON TABLE controle_o_sens TO superlazaret;


--
-- Name: controle_o_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_serie FROM postgres;
GRANT ALL ON TABLE controle_o_serie TO postgres;
GRANT SELECT ON TABLE controle_o_serie TO lazaret;
GRANT ALL ON TABLE controle_o_serie TO superlazaret;


--
-- Name: controle_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_orientation FROM postgres;
GRANT ALL ON TABLE controle_orientation TO postgres;
GRANT SELECT ON TABLE controle_orientation TO lazaret;
GRANT ALL ON TABLE controle_orientation TO superlazaret;


--
-- Name: controle_pendage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_pendage FROM PUBLIC;
REVOKE ALL ON TABLE controle_pendage FROM postgres;
GRANT ALL ON TABLE controle_pendage TO postgres;
GRANT SELECT ON TABLE controle_pendage TO lazaret;
GRANT ALL ON TABLE controle_pendage TO superlazaret;


--
-- Name: controle_r_association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_association FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_association FROM postgres;
GRANT ALL ON TABLE controle_r_association TO postgres;
GRANT SELECT ON TABLE controle_r_association TO lazaret;
GRANT ALL ON TABLE controle_r_association TO superlazaret;


--
-- Name: controle_r_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_bord FROM postgres;
GRANT ALL ON TABLE controle_r_bord TO postgres;
GRANT SELECT ON TABLE controle_r_bord TO lazaret;
GRANT ALL ON TABLE controle_r_bord TO superlazaret;


--
-- Name: controle_r_cas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_cas FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_cas FROM postgres;
GRANT ALL ON TABLE controle_r_cas TO postgres;
GRANT SELECT ON TABLE controle_r_cas TO lazaret;
GRANT ALL ON TABLE controle_r_cas TO superlazaret;


--
-- Name: controle_r_denticulation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_denticulation FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_denticulation FROM postgres;
GRANT ALL ON TABLE controle_r_denticulation TO postgres;
GRANT SELECT ON TABLE controle_r_denticulation TO lazaret;
GRANT ALL ON TABLE controle_r_denticulation TO superlazaret;


--
-- Name: controle_r_destination; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_destination FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_destination FROM postgres;
GRANT ALL ON TABLE controle_r_destination TO postgres;
GRANT SELECT ON TABLE controle_r_destination TO lazaret;
GRANT ALL ON TABLE controle_r_destination TO superlazaret;


--
-- Name: controle_r_dimension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_dimension FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_dimension FROM postgres;
GRANT ALL ON TABLE controle_r_dimension TO postgres;
GRANT SELECT ON TABLE controle_r_dimension TO lazaret;
GRANT ALL ON TABLE controle_r_dimension TO superlazaret;


--
-- Name: controle_r_ecrasement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_ecrasement FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_ecrasement FROM postgres;
GRANT ALL ON TABLE controle_r_ecrasement TO postgres;
GRANT SELECT ON TABLE controle_r_ecrasement TO lazaret;
GRANT ALL ON TABLE controle_r_ecrasement TO superlazaret;


--
-- Name: controle_r_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_extremite FROM postgres;
GRANT ALL ON TABLE controle_r_extremite TO postgres;
GRANT SELECT ON TABLE controle_r_extremite TO lazaret;
GRANT ALL ON TABLE controle_r_extremite TO superlazaret;


--
-- Name: controle_r_frequence; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_frequence FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_frequence FROM postgres;
GRANT ALL ON TABLE controle_r_frequence TO postgres;
GRANT SELECT ON TABLE controle_r_frequence TO lazaret;
GRANT ALL ON TABLE controle_r_frequence TO superlazaret;


--
-- Name: controle_r_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_lustrage FROM postgres;
GRANT ALL ON TABLE controle_r_lustrage TO postgres;
GRANT SELECT ON TABLE controle_r_lustrage TO lazaret;
GRANT ALL ON TABLE controle_r_lustrage TO superlazaret;


--
-- Name: controle_r_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_obliquite FROM postgres;
GRANT ALL ON TABLE controle_r_obliquite TO postgres;
GRANT SELECT ON TABLE controle_r_obliquite TO lazaret;
GRANT ALL ON TABLE controle_r_obliquite TO superlazaret;


--
-- Name: controle_r_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_ordre FROM postgres;
GRANT ALL ON TABLE controle_r_ordre TO postgres;
GRANT SELECT ON TABLE controle_r_ordre TO lazaret;
GRANT ALL ON TABLE controle_r_ordre TO superlazaret;


--
-- Name: controle_r_origine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_origine FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_origine FROM postgres;
GRANT ALL ON TABLE controle_r_origine TO postgres;
GRANT SELECT ON TABLE controle_r_origine TO lazaret;
GRANT ALL ON TABLE controle_r_origine TO superlazaret;


--
-- Name: controle_r_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_sens FROM postgres;
GRANT ALL ON TABLE controle_r_sens TO postgres;
GRANT SELECT ON TABLE controle_r_sens TO lazaret;
GRANT ALL ON TABLE controle_r_sens TO superlazaret;


--
-- Name: controle_r_strie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_strie FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_strie FROM postgres;
GRANT ALL ON TABLE controle_r_strie TO postgres;
GRANT SELECT ON TABLE controle_r_strie TO lazaret;
GRANT ALL ON TABLE controle_r_strie TO superlazaret;


--
-- Name: controle_r_superposition; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_superposition FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_superposition FROM postgres;
GRANT ALL ON TABLE controle_r_superposition TO postgres;
GRANT SELECT ON TABLE controle_r_superposition TO lazaret;
GRANT ALL ON TABLE controle_r_superposition TO superlazaret;


--
-- Name: controle_r_tranchant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_tranchant FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_tranchant FROM postgres;
GRANT ALL ON TABLE controle_r_tranchant TO postgres;
GRANT SELECT ON TABLE controle_r_tranchant TO lazaret;
GRANT ALL ON TABLE controle_r_tranchant TO superlazaret;


--
-- Name: controle_r_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_type FROM postgres;
GRANT ALL ON TABLE controle_r_type TO postgres;
GRANT SELECT ON TABLE controle_r_type TO lazaret;
GRANT ALL ON TABLE controle_r_type TO superlazaret;


--
-- Name: controle_r_utilisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_utilisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_utilisation FROM postgres;
GRANT ALL ON TABLE controle_r_utilisation TO postgres;
GRANT SELECT ON TABLE controle_r_utilisation TO lazaret;
GRANT ALL ON TABLE controle_r_utilisation TO superlazaret;


--
-- Name: controle_responsable_fouille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_responsable_fouille FROM PUBLIC;
REVOKE ALL ON TABLE controle_responsable_fouille FROM postgres;
GRANT ALL ON TABLE controle_responsable_fouille TO postgres;
GRANT SELECT ON TABLE controle_responsable_fouille TO lazaret;
GRANT ALL ON TABLE controle_responsable_fouille TO superlazaret;
GRANT ALL ON TABLE controle_responsable_fouille TO superchoukoutien;
GRANT SELECT ON TABLE controle_responsable_fouille TO choukoutien;
GRANT SELECT ON TABLE controle_responsable_fouille TO visiteurchoukoutien;


--
-- Name: controle_s_localisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_localisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_localisation FROM postgres;
GRANT ALL ON TABLE controle_s_localisation TO postgres;
GRANT SELECT ON TABLE controle_s_localisation TO lazaret;
GRANT ALL ON TABLE controle_s_localisation TO superlazaret;


--
-- Name: controle_s_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_lustrage FROM postgres;
GRANT ALL ON TABLE controle_s_lustrage TO postgres;
GRANT SELECT ON TABLE controle_s_lustrage TO lazaret;
GRANT ALL ON TABLE controle_s_lustrage TO superlazaret;


--
-- Name: controle_s_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_ordre FROM postgres;
GRANT ALL ON TABLE controle_s_ordre TO postgres;
GRANT SELECT ON TABLE controle_s_ordre TO lazaret;
GRANT ALL ON TABLE controle_s_ordre TO superlazaret;


--
-- Name: controle_s_polissage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_polissage FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_polissage FROM postgres;
GRANT ALL ON TABLE controle_s_polissage TO postgres;
GRANT SELECT ON TABLE controle_s_polissage TO lazaret;
GRANT ALL ON TABLE controle_s_polissage TO superlazaret;


--
-- Name: controle_s_relation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_relation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_relation FROM postgres;
GRANT ALL ON TABLE controle_s_relation TO postgres;
GRANT SELECT ON TABLE controle_s_relation TO lazaret;
GRANT ALL ON TABLE controle_s_relation TO superlazaret;


--
-- Name: controle_s_situation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_situation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_situation FROM postgres;
GRANT ALL ON TABLE controle_s_situation TO postgres;
GRANT SELECT ON TABLE controle_s_situation TO lazaret;
GRANT ALL ON TABLE controle_s_situation TO superlazaret;


--
-- Name: controle_s_sous_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_sous_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_sous_type FROM postgres;
GRANT ALL ON TABLE controle_s_sous_type TO postgres;
GRANT SELECT ON TABLE controle_s_sous_type TO lazaret;
GRANT ALL ON TABLE controle_s_sous_type TO superlazaret;


--
-- Name: controle_s_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_type FROM postgres;
GRANT ALL ON TABLE controle_s_type TO postgres;
GRANT SELECT ON TABLE controle_s_type TO lazaret;
GRANT ALL ON TABLE controle_s_type TO superlazaret;


--
-- Name: controle_sol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_sol FROM PUBLIC;
REVOKE ALL ON TABLE controle_sol FROM postgres;
GRANT ALL ON TABLE controle_sol TO postgres;
GRANT SELECT ON TABLE controle_sol TO lazaret;
GRANT ALL ON TABLE controle_sol TO superlazaret;


--
-- Name: controle_souscarre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_souscarre FROM PUBLIC;
REVOKE ALL ON TABLE controle_souscarre FROM postgres;
GRANT ALL ON TABLE controle_souscarre TO postgres;
GRANT SELECT ON TABLE controle_souscarre TO lazaret;
GRANT ALL ON TABLE controle_souscarre TO superlazaret;


--
-- Name: controle_t_agent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_agent FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_agent FROM postgres;
GRANT ALL ON TABLE controle_t_agent TO postgres;
GRANT SELECT ON TABLE controle_t_agent TO lazaret;
GRANT ALL ON TABLE controle_t_agent TO superlazaret;


--
-- Name: controle_t_allure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_allure FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_allure FROM postgres;
GRANT ALL ON TABLE controle_t_allure TO postgres;
GRANT SELECT ON TABLE controle_t_allure TO lazaret;
GRANT ALL ON TABLE controle_t_allure TO superlazaret;


--
-- Name: controle_t_classe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_classe FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_classe FROM postgres;
GRANT ALL ON TABLE controle_t_classe TO postgres;
GRANT SELECT ON TABLE controle_t_classe TO lazaret;
GRANT ALL ON TABLE controle_t_classe TO superlazaret;


--
-- Name: controle_t_dessin; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_dessin FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_dessin FROM postgres;
GRANT ALL ON TABLE controle_t_dessin TO postgres;
GRANT SELECT ON TABLE controle_t_dessin TO lazaret;
GRANT ALL ON TABLE controle_t_dessin TO superlazaret;


--
-- Name: controle_t_direction; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_direction FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_direction FROM postgres;
GRANT ALL ON TABLE controle_t_direction TO postgres;
GRANT SELECT ON TABLE controle_t_direction TO lazaret;
GRANT ALL ON TABLE controle_t_direction TO superlazaret;


--
-- Name: controle_t_dstrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_dstrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_dstrie FROM postgres;
GRANT ALL ON TABLE controle_t_dstrie TO postgres;
GRANT SELECT ON TABLE controle_t_dstrie TO lazaret;
GRANT ALL ON TABLE controle_t_dstrie TO superlazaret;


--
-- Name: controle_t_ensemble; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_ensemble FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_ensemble FROM postgres;
GRANT ALL ON TABLE controle_t_ensemble TO postgres;
GRANT SELECT ON TABLE controle_t_ensemble TO lazaret;
GRANT ALL ON TABLE controle_t_ensemble TO superlazaret;


--
-- Name: controle_t_largeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_largeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_largeur FROM postgres;
GRANT ALL ON TABLE controle_t_largeur TO postgres;
GRANT SELECT ON TABLE controle_t_largeur TO lazaret;
GRANT ALL ON TABLE controle_t_largeur TO superlazaret;


--
-- Name: controle_t_locmusc; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_locmusc FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_locmusc FROM postgres;
GRANT ALL ON TABLE controle_t_locmusc TO postgres;
GRANT SELECT ON TABLE controle_t_locmusc TO lazaret;
GRANT ALL ON TABLE controle_t_locmusc TO superlazaret;


--
-- Name: controle_t_nature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_nature FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_nature FROM postgres;
GRANT ALL ON TABLE controle_t_nature TO postgres;
GRANT SELECT ON TABLE controle_t_nature TO lazaret;
GRANT ALL ON TABLE controle_t_nature TO superlazaret;


--
-- Name: controle_t_phenomene; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_phenomene FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_phenomene FROM postgres;
GRANT ALL ON TABLE controle_t_phenomene TO postgres;
GRANT SELECT ON TABLE controle_t_phenomene TO lazaret;
GRANT ALL ON TABLE controle_t_phenomene TO superlazaret;


--
-- Name: controle_t_photo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_photo FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_photo FROM postgres;
GRANT ALL ON TABLE controle_t_photo TO postgres;
GRANT SELECT ON TABLE controle_t_photo TO lazaret;
GRANT ALL ON TABLE controle_t_photo TO superlazaret;


--
-- Name: controle_t_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_profondeur FROM postgres;
GRANT ALL ON TABLE controle_t_profondeur TO postgres;
GRANT SELECT ON TABLE controle_t_profondeur TO lazaret;
GRANT ALL ON TABLE controle_t_profondeur TO superlazaret;


--
-- Name: controle_t_replique; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_replique FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_replique FROM postgres;
GRANT ALL ON TABLE controle_t_replique TO postgres;
GRANT SELECT ON TABLE controle_t_replique TO lazaret;
GRANT ALL ON TABLE controle_t_replique TO superlazaret;


--
-- Name: controle_t_section; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_section FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_section FROM postgres;
GRANT ALL ON TABLE controle_t_section TO postgres;
GRANT SELECT ON TABLE controle_t_section TO lazaret;
GRANT ALL ON TABLE controle_t_section TO superlazaret;


--
-- Name: controle_t_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_sens FROM postgres;
GRANT ALL ON TABLE controle_t_sens TO postgres;
GRANT SELECT ON TABLE controle_t_sens TO lazaret;
GRANT ALL ON TABLE controle_t_sens TO superlazaret;


--
-- Name: controle_t_trace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_trace FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_trace FROM postgres;
GRANT ALL ON TABLE controle_t_trace TO postgres;
GRANT SELECT ON TABLE controle_t_trace TO lazaret;
GRANT ALL ON TABLE controle_t_trace TO superlazaret;


--
-- Name: controle_ud_fragmentation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_fragmentation FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_fragmentation FROM postgres;
GRANT ALL ON TABLE controle_ud_fragmentation TO postgres;
GRANT ALL ON TABLE controle_ud_fragmentation TO lazaret;
GRANT ALL ON TABLE controle_ud_fragmentation TO superlazaret;


--
-- Name: controle_ud_lateralite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_lateralite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_lateralite FROM postgres;
GRANT ALL ON TABLE controle_ud_lateralite TO postgres;
GRANT ALL ON TABLE controle_ud_lateralite TO lazaret;
GRANT ALL ON TABLE controle_ud_lateralite TO superlazaret;


--
-- Name: controle_ud_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_type FROM postgres;
GRANT ALL ON TABLE controle_ud_type TO postgres;
GRANT ALL ON TABLE controle_ud_type TO lazaret;
GRANT ALL ON TABLE controle_ud_type TO superlazaret;


--
-- Name: controle_ud_usure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_usure FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_usure FROM postgres;
GRANT ALL ON TABLE controle_ud_usure TO postgres;
GRANT ALL ON TABLE controle_ud_usure TO lazaret;
GRANT ALL ON TABLE controle_ud_usure TO superlazaret;


--
-- Name: controle_vers; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_vers FROM PUBLIC;
REVOKE ALL ON TABLE controle_vers FROM postgres;
GRANT ALL ON TABLE controle_vers TO postgres;
GRANT SELECT ON TABLE controle_vers TO lazaret;
GRANT ALL ON TABLE controle_vers TO superlazaret;


--
-- Name: controle_zone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_zone FROM PUBLIC;
REVOKE ALL ON TABLE controle_zone FROM postgres;
GRANT ALL ON TABLE controle_zone TO postgres;
GRANT SELECT ON TABLE controle_zone TO lazaret;
GRANT ALL ON TABLE controle_zone TO superlazaret;


--
-- Name: dent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE dent FROM PUBLIC;
REVOKE ALL ON TABLE dent FROM postgres;
GRANT ALL ON TABLE dent TO postgres;
GRANT ALL ON TABLE dent TO lazaret;
GRANT ALL ON TABLE dent TO superlazaret;


--
-- Name: eclat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE eclat FROM PUBLIC;
REVOKE ALL ON TABLE eclat FROM postgres;
GRANT ALL ON TABLE eclat TO postgres;
GRANT ALL ON TABLE eclat TO lazaret;
GRANT ALL ON TABLE eclat TO superlazaret;


--
-- Name: enlevement_biface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_biface FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_biface FROM postgres;
GRANT ALL ON TABLE enlevement_biface TO postgres;
GRANT SELECT ON TABLE enlevement_biface TO PUBLIC;
GRANT ALL ON TABLE enlevement_biface TO lazaret;
GRANT ALL ON TABLE enlevement_biface TO superlazaret;


--
-- Name: enlevement_galet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_galet FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_galet FROM postgres;
GRANT ALL ON TABLE enlevement_galet TO postgres;
GRANT ALL ON TABLE enlevement_galet TO lazaret;
GRANT ALL ON TABLE enlevement_galet TO superlazaret;
GRANT SELECT ON TABLE enlevement_galet TO visiteurlazaret;


--
-- Name: enlevement_nucleus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_nucleus FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_nucleus FROM postgres;
GRANT ALL ON TABLE enlevement_nucleus TO postgres;
GRANT ALL ON TABLE enlevement_nucleus TO lazaret;
GRANT ALL ON TABLE enlevement_nucleus TO superlazaret;
GRANT SELECT ON TABLE enlevement_nucleus TO visiteurlazaret;


--
-- Name: faune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE faune FROM PUBLIC;
REVOKE ALL ON TABLE faune FROM postgres;
GRANT ALL ON TABLE faune TO postgres;
GRANT ALL ON TABLE faune TO lazaret;
GRANT ALL ON TABLE faune TO superlazaret;
GRANT SELECT ON TABLE faune TO visiteurlazaret;


--
-- Name: fracture_faune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fracture_faune FROM PUBLIC;
REVOKE ALL ON TABLE fracture_faune FROM postgres;
GRANT ALL ON TABLE fracture_faune TO postgres;
GRANT ALL ON TABLE fracture_faune TO lazaret;
GRANT ALL ON TABLE fracture_faune TO superlazaret;


--
-- Name: fracture_industrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fracture_industrie FROM PUBLIC;
REVOKE ALL ON TABLE fracture_industrie FROM postgres;
GRANT ALL ON TABLE fracture_industrie TO postgres;
GRANT ALL ON TABLE fracture_industrie TO lazaret;
GRANT ALL ON TABLE fracture_industrie TO superlazaret;


--
-- Name: galet_amenage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE galet_amenage FROM PUBLIC;
REVOKE ALL ON TABLE galet_amenage FROM postgres;
GRANT ALL ON TABLE galet_amenage TO postgres;
GRANT ALL ON TABLE galet_amenage TO lazaret;
GRANT ALL ON TABLE galet_amenage TO superlazaret;


--
-- Name: hachereau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hachereau FROM PUBLIC;
REVOKE ALL ON TABLE hachereau FROM postgres;
GRANT ALL ON TABLE hachereau TO postgres;
GRANT ALL ON TABLE hachereau TO lazaret;
GRANT ALL ON TABLE hachereau TO superlazaret;


--
-- Name: industrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE industrie FROM PUBLIC;
REVOKE ALL ON TABLE industrie FROM postgres;
GRANT ALL ON TABLE industrie TO postgres;
GRANT ALL ON TABLE industrie TO lazaret;
GRANT ALL ON TABLE industrie TO superlazaret;


--
-- Name: microfaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE microfaune FROM PUBLIC;
REVOKE ALL ON TABLE microfaune FROM postgres;
GRANT ALL ON TABLE microfaune TO postgres;
GRANT ALL ON TABLE microfaune TO lazaret;
GRANT ALL ON TABLE microfaune TO superlazaret;


--
-- Name: nucleus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE nucleus FROM PUBLIC;
REVOKE ALL ON TABLE nucleus FROM postgres;
GRANT ALL ON TABLE nucleus TO postgres;
GRANT ALL ON TABLE nucleus TO lazaret;
GRANT ALL ON TABLE nucleus TO superlazaret;


--
-- Name: os; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE os FROM PUBLIC;
REVOKE ALL ON TABLE os FROM postgres;
GRANT ALL ON TABLE os TO postgres;
GRANT ALL ON TABLE os TO lazaret;
GRANT ALL ON TABLE os TO superlazaret;


--
-- Name: outil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE outil FROM PUBLIC;
REVOKE ALL ON TABLE outil FROM postgres;
GRANT ALL ON TABLE outil TO postgres;
GRANT ALL ON TABLE outil TO lazaret;
GRANT ALL ON TABLE outil TO superlazaret;


--
-- Name: photocoprolithe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photocoprolithe FROM PUBLIC;
REVOKE ALL ON TABLE photocoprolithe FROM postgres;
GRANT ALL ON TABLE photocoprolithe TO postgres;
GRANT ALL ON TABLE photocoprolithe TO lazaret;
GRANT ALL ON TABLE photocoprolithe TO superlazaret;


--
-- Name: photofaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photofaune FROM PUBLIC;
REVOKE ALL ON TABLE photofaune FROM postgres;
GRANT ALL ON TABLE photofaune TO postgres;
GRANT ALL ON TABLE photofaune TO lazaret;
GRANT ALL ON TABLE photofaune TO superlazaret;


--
-- Name: photoindustrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photoindustrie FROM PUBLIC;
REVOKE ALL ON TABLE photoindustrie FROM postgres;
GRANT ALL ON TABLE photoindustrie TO postgres;
GRANT ALL ON TABLE photoindustrie TO lazaret;
GRANT ALL ON TABLE photoindustrie TO superlazaret;


--
-- Name: phototrace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE phototrace FROM PUBLIC;
REVOKE ALL ON TABLE phototrace FROM postgres;
GRANT ALL ON TABLE phototrace TO postgres;
GRANT ALL ON TABLE phototrace TO lazaret;
GRANT ALL ON TABLE phototrace TO superlazaret;


--
-- Name: remonte_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_famille FROM PUBLIC;
REVOKE ALL ON TABLE remonte_famille FROM postgres;
GRANT ALL ON TABLE remonte_famille TO postgres;
GRANT ALL ON TABLE remonte_famille TO lazaret;
GRANT ALL ON TABLE remonte_famille TO superlazaret;


--
-- Name: remonte_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_genre FROM PUBLIC;
REVOKE ALL ON TABLE remonte_genre FROM postgres;
GRANT ALL ON TABLE remonte_genre TO postgres;
GRANT ALL ON TABLE remonte_genre TO lazaret;
GRANT ALL ON TABLE remonte_genre TO superlazaret;


--
-- Name: remonte_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_ordre FROM PUBLIC;
REVOKE ALL ON TABLE remonte_ordre FROM postgres;
GRANT ALL ON TABLE remonte_ordre TO postgres;
GRANT ALL ON TABLE remonte_ordre TO lazaret;
GRANT ALL ON TABLE remonte_ordre TO superlazaret;


--
-- Name: requete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE requete FROM PUBLIC;
REVOKE ALL ON TABLE requete FROM postgres;
GRANT ALL ON TABLE requete TO postgres;
GRANT ALL ON TABLE requete TO lazaret;
GRANT ALL ON TABLE requete TO superlazaret;


--
-- Name: retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE retouche FROM PUBLIC;
REVOKE ALL ON TABLE retouche FROM postgres;
GRANT ALL ON TABLE retouche TO postgres;
GRANT ALL ON TABLE retouche TO lazaret;
GRANT ALL ON TABLE retouche TO superlazaret;


--
-- Name: seq_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_bord FROM PUBLIC;
REVOKE ALL ON TABLE seq_bord FROM postgres;
GRANT ALL ON TABLE seq_bord TO postgres;
GRANT ALL ON TABLE seq_bord TO lazaret;
GRANT ALL ON TABLE seq_bord TO superlazaret;


--
-- Name: seq_photofaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_photofaune FROM PUBLIC;
REVOKE ALL ON TABLE seq_photofaune FROM postgres;
GRANT ALL ON TABLE seq_photofaune TO postgres;
GRANT ALL ON TABLE seq_photofaune TO lazaret;
GRANT ALL ON TABLE seq_photofaune TO superlazaret;


--
-- Name: seq_photoindustrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_photoindustrie FROM PUBLIC;
REVOKE ALL ON TABLE seq_photoindustrie FROM postgres;
GRANT ALL ON TABLE seq_photoindustrie TO postgres;
GRANT ALL ON TABLE seq_photoindustrie TO lazaret;
GRANT ALL ON TABLE seq_photoindustrie TO superlazaret;


--
-- Name: seq_phototrace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_phototrace FROM PUBLIC;
REVOKE ALL ON TABLE seq_phototrace FROM postgres;
GRANT ALL ON TABLE seq_phototrace TO postgres;
GRANT ALL ON TABLE seq_phototrace TO lazaret;
GRANT ALL ON TABLE seq_phototrace TO superlazaret;


--
-- Name: stigmate; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stigmate FROM PUBLIC;
REVOKE ALL ON TABLE stigmate FROM postgres;
GRANT ALL ON TABLE stigmate TO postgres;
GRANT ALL ON TABLE stigmate TO lazaret;
GRANT ALL ON TABLE stigmate TO superlazaret;


--
-- Name: trace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE trace FROM PUBLIC;
REVOKE ALL ON TABLE trace FROM postgres;
GRANT ALL ON TABLE trace TO postgres;
GRANT ALL ON TABLE trace TO lazaret;
GRANT ALL ON TABLE trace TO superlazaret;


--
-- Name: usure_dent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usure_dent FROM PUBLIC;
REVOKE ALL ON TABLE usure_dent FROM postgres;
GRANT ALL ON TABLE usure_dent TO postgres;
GRANT ALL ON TABLE usure_dent TO lazaret;
GRANT ALL ON TABLE usure_dent TO superlazaret;
GRANT SELECT ON TABLE usure_dent TO visiteurlazaret;


--
-- PostgreSQL database dump complete
--

