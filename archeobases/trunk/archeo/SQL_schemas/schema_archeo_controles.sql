--
-- PostgreSQL database dump
--
-- replace 'databasename' 'superdatabasename' 'visiterdatabasename' by the names of the users of the database
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
-- Name: controle_i_responsable; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_i_responsable (
    i_responsable text NOT NULL,
    description text
);


ALTER TABLE public.controle_i_responsable OWNER TO postgres;

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
    i_support text,
    i_responsable text,
    i_saisie date DEFAULT date('now'::text)
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



--
-- Data for Name: bord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: carnet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_b_amenagement_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_amenagement_bord VALUES ('AB0', NULL);
INSERT INTO controle_b_amenagement_bord VALUES ('AB1', NULL);
INSERT INTO controle_b_amenagement_bord VALUES ('AB2', NULL);
INSERT INTO controle_b_amenagement_bord VALUES ('AB3', NULL);
INSERT INTO controle_b_amenagement_bord VALUES ('AB4', NULL);


--
-- Data for Name: controle_b_amenagement_distal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_amenagement_distal VALUES ('1', NULL);
INSERT INTO controle_b_amenagement_distal VALUES ('2', NULL);


--
-- Data for Name: controle_b_amincissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_amincissement VALUES ('ALCD', NULL);
INSERT INTO controle_b_amincissement VALUES ('ALCI', NULL);
INSERT INTO controle_b_amincissement VALUES ('ALCM', NULL);
INSERT INTO controle_b_amincissement VALUES ('ALED', NULL);
INSERT INTO controle_b_amincissement VALUES ('ALEI', NULL);
INSERT INTO controle_b_amincissement VALUES ('ALEM', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADCD', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADCI', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADCM', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADCP', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADED', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADEI', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADEM', NULL);
INSERT INTO controle_b_amincissement VALUES ('ADEP', NULL);
INSERT INTO controle_b_amincissement VALUES ('APCD', NULL);
INSERT INTO controle_b_amincissement VALUES ('APCI', NULL);
INSERT INTO controle_b_amincissement VALUES ('APCM', NULL);
INSERT INTO controle_b_amincissement VALUES ('APCP', NULL);
INSERT INTO controle_b_amincissement VALUES ('APED', NULL);
INSERT INTO controle_b_amincissement VALUES ('APEI', NULL);
INSERT INTO controle_b_amincissement VALUES ('APEM', NULL);
INSERT INTO controle_b_amincissement VALUES ('APEP', NULL);


--
-- Data for Name: controle_b_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_arete VALUES ('ALR', NULL);
INSERT INTO controle_b_arete VALUES ('ALI', NULL);
INSERT INTO controle_b_arete VALUES ('ALS', NULL);
INSERT INTO controle_b_arete VALUES ('ALSI', NULL);
INSERT INTO controle_b_arete VALUES ('ALSR', NULL);
INSERT INTO controle_b_arete VALUES ('ALRI', NULL);
INSERT INTO controle_b_arete VALUES ('ALRS', NULL);
INSERT INTO controle_b_arete VALUES ('ALIS', NULL);
INSERT INTO controle_b_arete VALUES ('AL0', NULL);


--
-- Data for Name: controle_b_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_base VALUES ('B1', NULL);
INSERT INTO controle_b_base VALUES ('B2', NULL);


--
-- Data for Name: controle_b_bifaciale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_bifaciale VALUES ('EQ1', NULL);
INSERT INTO controle_b_bifaciale VALUES ('EQ2', NULL);


--
-- Data for Name: controle_b_bilaterale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_bilaterale VALUES ('SB0', NULL);
INSERT INTO controle_b_bilaterale VALUES ('SB1', NULL);


--
-- Data for Name: controle_b_biseau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_biseau VALUES ('BT0', NULL);
INSERT INTO controle_b_biseau VALUES ('BT1', NULL);
INSERT INTO controle_b_biseau VALUES ('BT1A', NULL);
INSERT INTO controle_b_biseau VALUES ('BT1B', NULL);
INSERT INTO controle_b_biseau VALUES ('BT1C', NULL);


--
-- Data for Name: controle_b_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_bord VALUES ('FB1', NULL);
INSERT INTO controle_b_bord VALUES ('FB2', NULL);
INSERT INTO controle_b_bord VALUES ('FB3', NULL);
INSERT INTO controle_b_bord VALUES ('FB4', NULL);
INSERT INTO controle_b_bord VALUES ('FB23', NULL);
INSERT INTO controle_b_bord VALUES ('FB12', NULL);
INSERT INTO controle_b_bord VALUES ('FB13', NULL);


--
-- Data for Name: controle_b_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_code VALUES ('MC', NULL);
INSERT INTO controle_b_code VALUES ('MNC', NULL);
INSERT INTO controle_b_code VALUES ('MBN', NULL);
INSERT INTO controle_b_code VALUES ('MRD', NULL);
INSERT INTO controle_b_code VALUES ('MRI', NULL);
INSERT INTO controle_b_code VALUES ('MRM', NULL);
INSERT INTO controle_b_code VALUES ('TL', NULL);
INSERT INTO controle_b_code VALUES ('TLC', NULL);
INSERT INTO controle_b_code VALUES ('TNC', NULL);
INSERT INTO controle_b_code VALUES ('TLD', NULL);
INSERT INTO controle_b_code VALUES ('TLI', NULL);
INSERT INTO controle_b_code VALUES ('TLM', NULL);
INSERT INTO controle_b_code VALUES ('BIT', NULL);
INSERT INTO controle_b_code VALUES ('I', NULL);
INSERT INTO controle_b_code VALUES ('PP', NULL);
INSERT INTO controle_b_code VALUES ('TT', NULL);
INSERT INTO controle_b_code VALUES ('CH', NULL);
INSERT INTO controle_b_code VALUES ('MBC', NULL);
INSERT INTO controle_b_code VALUES ('MBNC', NULL);
INSERT INTO controle_b_code VALUES ('MBPF', NULL);
INSERT INTO controle_b_code VALUES ('MBCA', NULL);
INSERT INTO controle_b_code VALUES ('MBFV', NULL);
INSERT INTO controle_b_code VALUES ('EC', NULL);
INSERT INTO controle_b_code VALUES ('ENC', NULL);
INSERT INTO controle_b_code VALUES ('PUA', NULL);
INSERT INTO controle_b_code VALUES ('PUG', NULL);
INSERT INTO controle_b_code VALUES ('PUD', NULL);
INSERT INTO controle_b_code VALUES ('PBA', NULL);
INSERT INTO controle_b_code VALUES ('PBG', NULL);
INSERT INTO controle_b_code VALUES ('PBD', NULL);
INSERT INTO controle_b_code VALUES ('TTD', NULL);
INSERT INTO controle_b_code VALUES ('TTI', NULL);
INSERT INTO controle_b_code VALUES ('TTM', NULL);
INSERT INTO controle_b_code VALUES ('TRD', NULL);
INSERT INTO controle_b_code VALUES ('TRI', NULL);
INSERT INTO controle_b_code VALUES ('TRM', NULL);
INSERT INTO controle_b_code VALUES ('MTRD', NULL);
INSERT INTO controle_b_code VALUES ('MTRI', NULL);
INSERT INTO controle_b_code VALUES ('MTRM', NULL);
INSERT INTO controle_b_code VALUES ('O', NULL);
INSERT INTO controle_b_code VALUES ('POL', NULL);


--
-- Data for Name: controle_b_dat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_b_dat1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_b_dat2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_b_distale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_distale VALUES ('ED1', NULL);
INSERT INTO controle_b_distale VALUES ('ED2', NULL);
INSERT INTO controle_b_distale VALUES ('ED3', NULL);
INSERT INTO controle_b_distale VALUES ('ED4', NULL);
INSERT INTO controle_b_distale VALUES ('ED5', NULL);
INSERT INTO controle_b_distale VALUES ('ED6', NULL);


--
-- Data for Name: controle_b_enlevement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_enlevement VALUES ('EB1', NULL);
INSERT INTO controle_b_enlevement VALUES ('EB2', NULL);
INSERT INTO controle_b_enlevement VALUES ('EB3', NULL);


--
-- Data for Name: controle_b_extension; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_extension VALUES ('ERU', NULL);
INSERT INTO controle_b_extension VALUES ('EAU', NULL);
INSERT INTO controle_b_extension VALUES ('EMU', NULL);
INSERT INTO controle_b_extension VALUES ('ER', NULL);
INSERT INTO controle_b_extension VALUES ('ERA', NULL);
INSERT INTO controle_b_extension VALUES ('EA', NULL);
INSERT INTO controle_b_extension VALUES ('EMA', NULL);
INSERT INTO controle_b_extension VALUES ('EMM', NULL);
INSERT INTO controle_b_extension VALUES ('EMR', NULL);


--
-- Data for Name: controle_b_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_extremite VALUES ('LATG', NULL);
INSERT INTO controle_b_extremite VALUES ('TRDIS', NULL);
INSERT INTO controle_b_extremite VALUES ('LATD', NULL);
INSERT INTO controle_b_extremite VALUES ('TRPROX', NULL);
INSERT INTO controle_b_extremite VALUES ('ANGGPROX', NULL);
INSERT INTO controle_b_extremite VALUES ('ANGGDIS', NULL);
INSERT INTO controle_b_extremite VALUES ('ANGDPROX', NULL);
INSERT INTO controle_b_extremite VALUES ('ANGDDIS', NULL);


--
-- Data for Name: controle_b_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_facture VALUES ('FHB', NULL);
INSERT INTO controle_b_facture VALUES ('FHM', NULL);
INSERT INTO controle_b_facture VALUES ('HT', NULL);


--
-- Data for Name: controle_b_meplat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_meplat VALUES ('ML0', NULL);
INSERT INTO controle_b_meplat VALUES ('ML1', NULL);
INSERT INTO controle_b_meplat VALUES ('ML1U', NULL);
INSERT INTO controle_b_meplat VALUES ('ML1B', NULL);


--
-- Data for Name: controle_b_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_retouche VALUES ('RS0', NULL);
INSERT INTO controle_b_retouche VALUES ('RS1', NULL);
INSERT INTO controle_b_retouche VALUES ('RS2', NULL);
INSERT INTO controle_b_retouche VALUES ('RS5', NULL);


--
-- Data for Name: controle_b_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_support VALUES ('NLE', NULL);
INSERT INTO controle_b_support VALUES ('G0', NULL);
INSERT INTO controle_b_support VALUES ('G1', NULL);
INSERT INTO controle_b_support VALUES ('G2', NULL);
INSERT INTO controle_b_support VALUES ('G3', NULL);
INSERT INTO controle_b_support VALUES ('IND', NULL);
INSERT INTO controle_b_support VALUES ('D', NULL);


--
-- Data for Name: controle_b_surface; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_surface VALUES ('SO0', NULL);
INSERT INTO controle_b_surface VALUES ('SO1', NULL);
INSERT INTO controle_b_surface VALUES ('SO2', NULL);
INSERT INTO controle_b_surface VALUES ('SO3', NULL);


--
-- Data for Name: controle_b_symetrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_b_symetrie VALUES ('SMD0', NULL);
INSERT INTO controle_b_symetrie VALUES ('SMD1', NULL);


--
-- Data for Name: controle_b_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_bis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_bis VALUES ('R', NULL);
INSERT INTO controle_bis VALUES ('--', NULL);
INSERT INTO controle_bis VALUES ('A', NULL);
INSERT INTO controle_bis VALUES ('B', NULL);
INSERT INTO controle_bis VALUES ('C', NULL);
INSERT INTO controle_bis VALUES ('D', NULL);
INSERT INTO controle_bis VALUES ('E', NULL);


--
-- Data for Name: controle_c_alteration; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_altnat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_autre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_consistance; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_couleur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_element; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_ext1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_ext2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_granulometrie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_incl1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_incl2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_incl3; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_lame; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_liant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_macroreste; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_mif; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_motcou; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_motif; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_motnat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_palyno; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_parasito; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_retrecissement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_sediment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_vol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_c_volext; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_carre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_d_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_d_serie VALUES ('1', NULL);
INSERT INTO controle_d_serie VALUES ('2', NULL);
INSERT INTO controle_d_serie VALUES ('3', NULL);
INSERT INTO controle_d_serie VALUES ('4', NULL);


--
-- Data for Name: controle_d_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_d_type VALUES ('M1', NULL);
INSERT INTO controle_d_type VALUES ('M2', NULL);
INSERT INTO controle_d_type VALUES ('P2', NULL);
INSERT INTO controle_d_type VALUES ('M3', NULL);
INSERT INTO controle_d_type VALUES ('I3', NULL);
INSERT INTO controle_d_type VALUES ('P4', NULL);
INSERT INTO controle_d_type VALUES ('CA', NULL);
INSERT INTO controle_d_type VALUES ('P3', NULL);
INSERT INTO controle_d_type VALUES ('I2', NULL);
INSERT INTO controle_d_type VALUES ('D3', NULL);
INSERT INTO controle_d_type VALUES ('D4', NULL);
INSERT INTO controle_d_type VALUES ('D2', NULL);
INSERT INTO controle_d_type VALUES ('I1', NULL);
INSERT INTO controle_d_type VALUES ('C', NULL);
INSERT INTO controle_d_type VALUES ('M4', NULL);
INSERT INTO controle_d_type VALUES ('IG', NULL);
INSERT INTO controle_d_type VALUES ('P2I', NULL);
INSERT INTO controle_d_type VALUES ('P3I', NULL);
INSERT INTO controle_d_type VALUES ('P4I', NULL);
INSERT INTO controle_d_type VALUES ('M1I', NULL);
INSERT INTO controle_d_type VALUES ('I1I', NULL);
INSERT INTO controle_d_type VALUES ('CI', NULL);
INSERT INTO controle_d_type VALUES ('P4S', NULL);
INSERT INTO controle_d_type VALUES ('I3S', NULL);
INSERT INTO controle_d_type VALUES ('CS', NULL);
INSERT INTO controle_d_type VALUES ('P1S', NULL);
INSERT INTO controle_d_type VALUES ('P2S', NULL);
INSERT INTO controle_d_type VALUES ('P3S', NULL);
INSERT INTO controle_d_type VALUES ('M1S', NULL);
INSERT INTO controle_d_type VALUES ('M2S', NULL);
INSERT INTO controle_d_type VALUES ('I1S', NULL);
INSERT INTO controle_d_type VALUES ('I2S', NULL);
INSERT INTO controle_d_type VALUES ('I3I', NULL);
INSERT INTO controle_d_type VALUES ('I2I', NULL);
INSERT INTO controle_d_type VALUES ('M3I', NULL);
INSERT INTO controle_d_type VALUES ('M2I', NULL);
INSERT INTO controle_d_type VALUES ('P1I', NULL);


--
-- Data for Name: controle_e_bulbe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_bulbe VALUES ('A', NULL);
INSERT INTO controle_e_bulbe VALUES ('E1', NULL);
INSERT INTO controle_e_bulbe VALUES ('E2', NULL);
INSERT INTO controle_e_bulbe VALUES ('E3', NULL);
INSERT INTO controle_e_bulbe VALUES ('I', NULL);
INSERT INTO controle_e_bulbe VALUES ('UTC', NULL);
INSERT INTO controle_e_bulbe VALUES ('UC', NULL);
INSERT INTO controle_e_bulbe VALUES ('UPD', NULL);
INSERT INTO controle_e_bulbe VALUES ('UD', NULL);
INSERT INTO controle_e_bulbe VALUES ('UP', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1A', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1B', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1C', NULL);
INSERT INTO controle_e_bulbe VALUES ('M2A', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1D', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1E', NULL);
INSERT INTO controle_e_bulbe VALUES ('M2B', NULL);
INSERT INTO controle_e_bulbe VALUES ('M2C', NULL);
INSERT INTO controle_e_bulbe VALUES ('M2D', NULL);
INSERT INTO controle_e_bulbe VALUES ('UN', NULL);
INSERT INTO controle_e_bulbe VALUES ('UE1', NULL);
INSERT INTO controle_e_bulbe VALUES ('UE2', NULL);
INSERT INTO controle_e_bulbe VALUES ('UE3', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1AC', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1AP', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1APD', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1AD', NULL);
INSERT INTO controle_e_bulbe VALUES ('M1ATC', NULL);


--
-- Data for Name: controle_e_carene; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_carene VALUES ('N', NULL);
INSERT INTO controle_e_carene VALUES ('A', NULL);
INSERT INTO controle_e_carene VALUES ('P', NULL);


--
-- Data for Name: controle_e_charniere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_charniere VALUES ('N', NULL);
INSERT INTO controle_e_charniere VALUES ('O', NULL);
INSERT INTO controle_e_charniere VALUES ('AN', NULL);
INSERT INTO controle_e_charniere VALUES ('S', NULL);
INSERT INTO controle_e_charniere VALUES ('P', NULL);
INSERT INTO controle_e_charniere VALUES ('A', NULL);


--
-- Data for Name: controle_e_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_code VALUES ('ECL', NULL);
INSERT INTO controle_e_code VALUES ('ECLF', NULL);
INSERT INTO controle_e_code VALUES ('ECLU', NULL);
INSERT INTO controle_e_code VALUES ('PTE', NULL);
INSERT INTO controle_e_code VALUES ('PTEU', NULL);
INSERT INTO controle_e_code VALUES ('PTEF', NULL);
INSERT INTO controle_e_code VALUES ('LAM', NULL);
INSERT INTO controle_e_code VALUES ('LAMU', NULL);
INSERT INTO controle_e_code VALUES ('LAMF', NULL);
INSERT INTO controle_e_code VALUES ('OUT', NULL);
INSERT INTO controle_e_code VALUES ('PEC', NULL);
INSERT INTO controle_e_code VALUES ('PECU', NULL);
INSERT INTO controle_e_code VALUES ('PECF', NULL);
INSERT INTO controle_e_code VALUES ('LAML', NULL);
INSERT INTO controle_e_code VALUES ('ERT', NULL);
INSERT INTO controle_e_code VALUES ('CHBU', NULL);
INSERT INTO controle_e_code VALUES ('PEL', NULL);
INSERT INTO controle_e_code VALUES ('ECLTH', NULL);


--
-- Data for Name: controle_e_cone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_cone VALUES ('N', NULL);
INSERT INTO controle_e_cone VALUES ('FD', NULL);
INSERT INTO controle_e_cone VALUES ('D', NULL);
INSERT INTO controle_e_cone VALUES ('TD', NULL);
INSERT INTO controle_e_cone VALUES ('A', NULL);


--
-- Data for Name: controle_e_contour; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_contour VALUES ('A1', NULL);
INSERT INTO controle_e_contour VALUES ('A2', NULL);
INSERT INTO controle_e_contour VALUES ('A3', NULL);
INSERT INTO controle_e_contour VALUES ('Q1', NULL);
INSERT INTO controle_e_contour VALUES ('Q2', NULL);
INSERT INTO controle_e_contour VALUES ('Q3', NULL);
INSERT INTO controle_e_contour VALUES ('Q4', NULL);
INSERT INTO controle_e_contour VALUES ('Q5', NULL);
INSERT INTO controle_e_contour VALUES ('Q6', NULL);
INSERT INTO controle_e_contour VALUES ('P', NULL);
INSERT INTO controle_e_contour VALUES ('TC', NULL);
INSERT INTO controle_e_contour VALUES ('TD', NULL);
INSERT INTO controle_e_contour VALUES ('R', NULL);
INSERT INTO controle_e_contour VALUES ('I', NULL);


--
-- Data for Name: controle_e_debitage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_debitage VALUES ('IA', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IAC6', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL1', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL2', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL3', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL4', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL5', NULL);
INSERT INTO controle_e_debitage VALUES ('IAL6', NULL);
INSERT INTO controle_e_debitage VALUES ('IB', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IBC6', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL1', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL2', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL3', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL4', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL5', NULL);
INSERT INTO controle_e_debitage VALUES ('IBL6', NULL);
INSERT INTO controle_e_debitage VALUES ('IC', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC1', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC2', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC3', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC4', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC5', NULL);
INSERT INTO controle_e_debitage VALUES ('ICC6', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL1', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL2', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL3', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL4', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL5', NULL);
INSERT INTO controle_e_debitage VALUES ('ICL6', NULL);
INSERT INTO controle_e_debitage VALUES ('ID', NULL);
INSERT INTO controle_e_debitage VALUES ('ID1', NULL);
INSERT INTO controle_e_debitage VALUES ('ID2', NULL);
INSERT INTO controle_e_debitage VALUES ('II', NULL);
INSERT INTO controle_e_debitage VALUES ('IIA', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAC6', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIAL6', NULL);
INSERT INTO controle_e_debitage VALUES ('IIB', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBC6', NULL);
INSERT INTO controle_e_debitage VALUES ('II BL', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIBL6', NULL);
INSERT INTO controle_e_debitage VALUES ('IIC', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IICC6', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL1', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL2', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL3', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL4', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL5', NULL);
INSERT INTO controle_e_debitage VALUES ('IICL6', NULL);
INSERT INTO controle_e_debitage VALUES ('IID', NULL);
INSERT INTO controle_e_debitage VALUES ('IID1', NULL);
INSERT INTO controle_e_debitage VALUES ('IID2', NULL);
INSERT INTO controle_e_debitage VALUES ('III', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA1A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA1B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA2A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA2B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA2C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA2D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA3A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA3B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA3C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA3D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA4A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA4B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA4C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA4D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA5A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA5B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA5C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIA5D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB1A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB1B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB2A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB2B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB2C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB2D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB3A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB3B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB3C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB3D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB4A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB4B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB4C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB4D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB5A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIB5B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC1', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC1A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC1B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC2A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC2B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC2C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC2D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC3A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC3B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC3C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC3D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC4A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC4B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC4C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC4D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC5A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC5B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC5C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIIC5D', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID1A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID2', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID2A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID2C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID3', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID3A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID3C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID4', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID4A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID4C', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID5', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID5A', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID5C', NULL);
INSERT INTO controle_e_debitage VALUES ('IV', NULL);
INSERT INTO controle_e_debitage VALUES ('IVA', NULL);
INSERT INTO controle_e_debitage VALUES ('IVA1', NULL);
INSERT INTO controle_e_debitage VALUES ('IVA2', NULL);
INSERT INTO controle_e_debitage VALUES ('IVB', NULL);
INSERT INTO controle_e_debitage VALUES ('IVB1', NULL);
INSERT INTO controle_e_debitage VALUES ('IVB2', NULL);
INSERT INTO controle_e_debitage VALUES ('IVC', NULL);
INSERT INTO controle_e_debitage VALUES ('IVD', NULL);
INSERT INTO controle_e_debitage VALUES ('I', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID3B', NULL);
INSERT INTO controle_e_debitage VALUES ('IIID2B', NULL);


--
-- Data for Name: controle_e_enlevement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_enlevement VALUES ('O', NULL);
INSERT INTO controle_e_enlevement VALUES ('LC', NULL);
INSERT INTO controle_e_enlevement VALUES ('LU', NULL);
INSERT INTO controle_e_enlevement VALUES ('LB', NULL);
INSERT INTO controle_e_enlevement VALUES ('TU', NULL);
INSERT INTO controle_e_enlevement VALUES ('TB', NULL);
INSERT INTO controle_e_enlevement VALUES ('OR', NULL);
INSERT INTO controle_e_enlevement VALUES ('E', NULL);
INSERT INTO controle_e_enlevement VALUES ('C', NULL);
INSERT INTO controle_e_enlevement VALUES ('I', NULL);
INSERT INTO controle_e_enlevement VALUES ('D', NULL);


--
-- Data for Name: controle_e_epi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_epi VALUES ('N', NULL);
INSERT INTO controle_e_epi VALUES ('FD', NULL);
INSERT INTO controle_e_epi VALUES ('D', NULL);
INSERT INTO controle_e_epi VALUES ('TD', NULL);
INSERT INTO controle_e_epi VALUES ('A', NULL);


--
-- Data for Name: controle_e_onde; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_onde VALUES ('N', NULL);
INSERT INTO controle_e_onde VALUES ('FD', NULL);
INSERT INTO controle_e_onde VALUES ('D', NULL);
INSERT INTO controle_e_onde VALUES ('TD', NULL);
INSERT INTO controle_e_onde VALUES ('A', NULL);
INSERT INTO controle_e_onde VALUES ('BIP', NULL);


--
-- Data for Name: controle_e_parasite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_parasite VALUES ('N', NULL);
INSERT INTO controle_e_parasite VALUES ('PP', NULL);
INSERT INTO controle_e_parasite VALUES ('PM', NULL);
INSERT INTO controle_e_parasite VALUES ('PG', NULL);
INSERT INTO controle_e_parasite VALUES ('PTG', NULL);
INSERT INTO controle_e_parasite VALUES ('A', NULL);


--
-- Data for Name: controle_e_secondaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_secondaire VALUES ('N', NULL);
INSERT INTO controle_e_secondaire VALUES ('PU', NULL);
INSERT INTO controle_e_secondaire VALUES ('PQ', NULL);
INSERT INTO controle_e_secondaire VALUES ('PN', NULL);
INSERT INTO controle_e_secondaire VALUES ('A', NULL);


--
-- Data for Name: controle_e_section_long; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_section_long VALUES ('LA', NULL);
INSERT INTO controle_e_section_long VALUES ('LB', NULL);
INSERT INTO controle_e_section_long VALUES ('LC', NULL);
INSERT INTO controle_e_section_long VALUES ('LD', NULL);
INSERT INTO controle_e_section_long VALUES ('LE', NULL);
INSERT INTO controle_e_section_long VALUES ('LF', NULL);
INSERT INTO controle_e_section_long VALUES ('LG', NULL);
INSERT INTO controle_e_section_long VALUES ('LJ', NULL);


--
-- Data for Name: controle_e_section_trans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_section_trans VALUES ('A', NULL);
INSERT INTO controle_e_section_trans VALUES ('B', NULL);
INSERT INTO controle_e_section_trans VALUES ('C', NULL);
INSERT INTO controle_e_section_trans VALUES ('D', NULL);
INSERT INTO controle_e_section_trans VALUES ('E', NULL);
INSERT INTO controle_e_section_trans VALUES ('F', NULL);
INSERT INTO controle_e_section_trans VALUES ('G', NULL);
INSERT INTO controle_e_section_trans VALUES ('H', NULL);
INSERT INTO controle_e_section_trans VALUES ('I', NULL);
INSERT INTO controle_e_section_trans VALUES ('J', NULL);
INSERT INTO controle_e_section_trans VALUES ('P', NULL);
INSERT INTO controle_e_section_trans VALUES ('R', NULL);


--
-- Data for Name: controle_e_strie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_strie VALUES ('N', NULL);
INSERT INTO controle_e_strie VALUES ('A', NULL);
INSERT INTO controle_e_strie VALUES ('P', NULL);


--
-- Data for Name: controle_e_talon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_talon VALUES ('TL', NULL);
INSERT INTO controle_e_talon VALUES ('TL1', NULL);
INSERT INTO controle_e_talon VALUES ('TL2', NULL);
INSERT INTO controle_e_talon VALUES ('TL3', NULL);
INSERT INTO controle_e_talon VALUES ('TLP', NULL);
INSERT INTO controle_e_talon VALUES ('TD', NULL);
INSERT INTO controle_e_talon VALUES ('TD1A', NULL);
INSERT INTO controle_e_talon VALUES ('TD1B', NULL);
INSERT INTO controle_e_talon VALUES ('TDA', NULL);
INSERT INTO controle_e_talon VALUES ('TD4B', NULL);
INSERT INTO controle_e_talon VALUES ('TD5A', NULL);
INSERT INTO controle_e_talon VALUES ('TD5B', NULL);
INSERT INTO controle_e_talon VALUES ('TD3A', NULL);
INSERT INTO controle_e_talon VALUES ('TD3B', NULL);
INSERT INTO controle_e_talon VALUES ('TF', NULL);
INSERT INTO controle_e_talon VALUES ('TF1A', NULL);
INSERT INTO controle_e_talon VALUES ('TF1B', NULL);
INSERT INTO controle_e_talon VALUES ('TF2A', NULL);
INSERT INTO controle_e_talon VALUES ('TF2B', NULL);
INSERT INTO controle_e_talon VALUES ('TF3A', NULL);
INSERT INTO controle_e_talon VALUES ('TF3B', NULL);
INSERT INTO controle_e_talon VALUES ('TF4A', NULL);
INSERT INTO controle_e_talon VALUES ('TF4B', NULL);
INSERT INTO controle_e_talon VALUES ('TF5A', NULL);
INSERT INTO controle_e_talon VALUES ('TF5B', NULL);
INSERT INTO controle_e_talon VALUES ('TR', NULL);
INSERT INTO controle_e_talon VALUES ('TR6C', NULL);
INSERT INTO controle_e_talon VALUES ('TR6D', NULL);
INSERT INTO controle_e_talon VALUES ('TR7', NULL);
INSERT INTO controle_e_talon VALUES ('TC', NULL);
INSERT INTO controle_e_talon VALUES ('TO', NULL);
INSERT INTO controle_e_talon VALUES ('TO8', NULL);
INSERT INTO controle_e_talon VALUES ('TO9', NULL);
INSERT INTO controle_e_talon VALUES ('TI', NULL);
INSERT INTO controle_e_talon VALUES ('TA', NULL);
INSERT INTO controle_e_talon VALUES ('TP2', NULL);
INSERT INTO controle_e_talon VALUES ('TP3', NULL);
INSERT INTO controle_e_talon VALUES ('TP4', NULL);
INSERT INTO controle_e_talon VALUES ('TD4A', NULL);


--
-- Data for Name: controle_e_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_e_type VALUES ('G0', NULL);
INSERT INTO controle_e_type VALUES ('G', NULL);
INSERT INTO controle_e_type VALUES ('G1', NULL);
INSERT INTO controle_e_type VALUES ('G2', NULL);
INSERT INTO controle_e_type VALUES ('G3', NULL);
INSERT INTO controle_e_type VALUES ('D', NULL);
INSERT INTO controle_e_type VALUES ('D1', NULL);
INSERT INTO controle_e_type VALUES ('D2', NULL);
INSERT INTO controle_e_type VALUES ('D3', NULL);
INSERT INTO controle_e_type VALUES ('D4', NULL);
INSERT INTO controle_e_type VALUES ('N', NULL);
INSERT INTO controle_e_type VALUES ('L', NULL);
INSERT INTO controle_e_type VALUES ('L0', NULL);
INSERT INTO controle_e_type VALUES ('LE1', NULL);
INSERT INTO controle_e_type VALUES ('LE2', NULL);
INSERT INTO controle_e_type VALUES ('LE3', NULL);
INSERT INTO controle_e_type VALUES ('LE4', NULL);
INSERT INTO controle_e_type VALUES ('LBN', NULL);
INSERT INTO controle_e_type VALUES ('LP1', NULL);
INSERT INTO controle_e_type VALUES ('LP2', NULL);
INSERT INTO controle_e_type VALUES ('LP3', NULL);
INSERT INTO controle_e_type VALUES ('LP4', NULL);
INSERT INTO controle_e_type VALUES ('LP5', NULL);
INSERT INTO controle_e_type VALUES ('LP6', NULL);
INSERT INTO controle_e_type VALUES ('LP7', NULL);
INSERT INTO controle_e_type VALUES ('LP8', NULL);
INSERT INTO controle_e_type VALUES ('LL1', NULL);
INSERT INTO controle_e_type VALUES ('LL2', NULL);
INSERT INTO controle_e_type VALUES ('LL3', NULL);
INSERT INTO controle_e_type VALUES ('NL', NULL);
INSERT INTO controle_e_type VALUES ('NL0', NULL);
INSERT INTO controle_e_type VALUES ('NLE1', NULL);
INSERT INTO controle_e_type VALUES ('NLE2', NULL);
INSERT INTO controle_e_type VALUES ('NLE3', NULL);
INSERT INTO controle_e_type VALUES ('NLE4', NULL);
INSERT INTO controle_e_type VALUES ('NLE5M', NULL);
INSERT INTO controle_e_type VALUES ('NLE6M', NULL);
INSERT INTO controle_e_type VALUES ('NLE7M', NULL);
INSERT INTO controle_e_type VALUES ('NLE5', NULL);
INSERT INTO controle_e_type VALUES ('NLE6', NULL);
INSERT INTO controle_e_type VALUES ('NLE7', NULL);
INSERT INTO controle_e_type VALUES ('NLBN', NULL);
INSERT INTO controle_e_type VALUES ('EP', NULL);
INSERT INTO controle_e_type VALUES ('EFB', NULL);
INSERT INTO controle_e_type VALUES ('NLP', NULL);
INSERT INTO controle_e_type VALUES ('NLPP1', NULL);
INSERT INTO controle_e_type VALUES ('NLPP2', NULL);
INSERT INTO controle_e_type VALUES ('NLPP3', NULL);
INSERT INTO controle_e_type VALUES ('NLL1', NULL);
INSERT INTO controle_e_type VALUES ('NLL2', NULL);
INSERT INTO controle_e_type VALUES ('NLL3', NULL);
INSERT INTO controle_e_type VALUES ('NLM', NULL);
INSERT INTO controle_e_type VALUES ('PE', NULL);
INSERT INTO controle_e_type VALUES ('PEE1', NULL);
INSERT INTO controle_e_type VALUES ('PEE2', NULL);
INSERT INTO controle_e_type VALUES ('PEL', NULL);
INSERT INTO controle_e_type VALUES ('ER', NULL);
INSERT INTO controle_e_type VALUES ('NLK', NULL);
INSERT INTO controle_e_type VALUES ('LK', NULL);
INSERT INTO controle_e_type VALUES ('ETH', NULL);
INSERT INTO controle_e_type VALUES ('NLBN7', NULL);
INSERT INTO controle_e_type VALUES ('NLBN6', NULL);
INSERT INTO controle_e_type VALUES ('NLE', NULL);
INSERT INTO controle_e_type VALUES ('NLPB', NULL);


--
-- Data for Name: controle_eg_element; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_element VALUES ('IA', NULL);
INSERT INTO controle_eg_element VALUES ('IA1', NULL);
INSERT INTO controle_eg_element VALUES ('E', NULL);
INSERT INTO controle_eg_element VALUES ('IA1E1', NULL);
INSERT INTO controle_eg_element VALUES ('IA1E2', NULL);
INSERT INTO controle_eg_element VALUES ('IA1ET', NULL);
INSERT INTO controle_eg_element VALUES ('A', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A5', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A2', NULL);
INSERT INTO controle_eg_element VALUES ('IA1AT', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A3', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A4', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A1', NULL);
INSERT INTO controle_eg_element VALUES ('IA1A6', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B1', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B2', NULL);
INSERT INTO controle_eg_element VALUES ('IA1BT', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B3', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B4', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B5', NULL);
INSERT INTO controle_eg_element VALUES ('IA1B6', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C1', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C2', NULL);
INSERT INTO controle_eg_element VALUES ('IA1CT', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C3', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C4', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C5', NULL);
INSERT INTO controle_eg_element VALUES ('IA1C6', NULL);
INSERT INTO controle_eg_element VALUES ('IA1D1', NULL);
INSERT INTO controle_eg_element VALUES ('IA1D2', NULL);
INSERT INTO controle_eg_element VALUES ('IA1DT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SE1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SE2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SET', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SAT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA4', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SA6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SBT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB4', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SB6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SCT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC4', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SC6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SD1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SD2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2SDT', NULL);
INSERT INTO controle_eg_element VALUES ('A2ME1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2ME2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MET', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MAT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA4', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MA6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MBT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB4', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MB6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MCT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MC6', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MD1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MD2', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MDT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFA1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFAT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFA3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFA5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFB1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFBT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFB3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MFB5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGA1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGAT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGA3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGA5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGB1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGBT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGB3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MGB5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHA1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHAT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHA3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHA5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHB1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHBT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHB3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHB5', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHC1', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHCT', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHC3', NULL);
INSERT INTO controle_eg_element VALUES ('IA2MHC5', NULL);


--
-- Data for Name: controle_eg_epaisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_epaisseur VALUES ('I', NULL);
INSERT INTO controle_eg_epaisseur VALUES ('E', NULL);
INSERT INTO controle_eg_epaisseur VALUES ('N', NULL);
INSERT INTO controle_eg_epaisseur VALUES ('M', NULL);


--
-- Data for Name: controle_eg_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_extremite VALUES ('I', NULL);
INSERT INTO controle_eg_extremite VALUES ('ATN', NULL);
INSERT INTO controle_eg_extremite VALUES ('PC', NULL);
INSERT INTO controle_eg_extremite VALUES ('CR', NULL);
INSERT INTO controle_eg_extremite VALUES ('COP', NULL);
INSERT INTO controle_eg_extremite VALUES ('FP', NULL);


--
-- Data for Name: controle_eg_longueur_generale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_longueur_generale VALUES ('C', NULL);
INSERT INTO controle_eg_longueur_generale VALUES ('SL', NULL);
INSERT INTO controle_eg_longueur_generale VALUES ('L', NULL);
INSERT INTO controle_eg_longueur_generale VALUES ('E', NULL);


--
-- Data for Name: controle_eg_proeminence; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_proeminence VALUES ('N', NULL);
INSERT INTO controle_eg_proeminence VALUES ('P', NULL);


--
-- Data for Name: controle_eg_profil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_profil VALUES ('P', NULL);
INSERT INTO controle_eg_profil VALUES ('CV', NULL);
INSERT INTO controle_eg_profil VALUES ('SC', NULL);
INSERT INTO controle_eg_profil VALUES ('CC', NULL);
INSERT INTO controle_eg_profil VALUES ('S', NULL);


--
-- Data for Name: controle_eg_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_profondeur VALUES ('C', NULL);
INSERT INTO controle_eg_profondeur VALUES ('M', NULL);
INSERT INTO controle_eg_profondeur VALUES ('E', NULL);
INSERT INTO controle_eg_profondeur VALUES ('P', NULL);


--
-- Data for Name: controle_eg_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_sens VALUES ('DIR', NULL);
INSERT INTO controle_eg_sens VALUES ('INV', NULL);
INSERT INTO controle_eg_sens VALUES ('MIX', NULL);
INSERT INTO controle_eg_sens VALUES ('MIXAL', NULL);
INSERT INTO controle_eg_sens VALUES ('PROFL', NULL);
INSERT INTO controle_eg_sens VALUES ('PROFT', NULL);
INSERT INTO controle_eg_sens VALUES ('PROFM', NULL);
INSERT INTO controle_eg_sens VALUES ('MP', NULL);


--
-- Data for Name: controle_eg_situation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_situation VALUES ('I', NULL);
INSERT INTO controle_eg_situation VALUES ('P', NULL);
INSERT INTO controle_eg_situation VALUES ('B', NULL);


--
-- Data for Name: controle_eg_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_eg_support VALUES ('IND', NULL);
INSERT INTO controle_eg_support VALUES ('ANGGPROX', NULL);
INSERT INTO controle_eg_support VALUES ('LATGT', NULL);
INSERT INTO controle_eg_support VALUES ('LATGPROX', NULL);
INSERT INTO controle_eg_support VALUES ('LATGMES', NULL);
INSERT INTO controle_eg_support VALUES ('LATGDIS', NULL);
INSERT INTO controle_eg_support VALUES ('ANGGDIS', NULL);
INSERT INTO controle_eg_support VALUES ('TRDIST', NULL);
INSERT INTO controle_eg_support VALUES ('TRDISG', NULL);
INSERT INTO controle_eg_support VALUES ('TRDISMES', NULL);
INSERT INTO controle_eg_support VALUES ('TRDID', NULL);
INSERT INTO controle_eg_support VALUES ('PTDIS', NULL);
INSERT INTO controle_eg_support VALUES ('ANGDDIS', NULL);
INSERT INTO controle_eg_support VALUES ('LATDT', NULL);
INSERT INTO controle_eg_support VALUES ('LATDPROX', NULL);
INSERT INTO controle_eg_support VALUES ('LATDMES', NULL);
INSERT INTO controle_eg_support VALUES ('LATDDIS', NULL);
INSERT INTO controle_eg_support VALUES ('ANGDPROX', NULL);
INSERT INTO controle_eg_support VALUES ('TRPROXT', NULL);
INSERT INTO controle_eg_support VALUES ('TRPROXG', NULL);
INSERT INTO controle_eg_support VALUES ('TRPROXMES', NULL);
INSERT INTO controle_eg_support VALUES ('TRPROXD', NULL);
INSERT INTO controle_eg_support VALUES ('PTPROX', NULL);


--
-- Data for Name: controle_en_direction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_en_direction VALUES ('C', NULL);
INSERT INTO controle_en_direction VALUES ('L', NULL);
INSERT INTO controle_en_direction VALUES ('L1', NULL);
INSERT INTO controle_en_direction VALUES ('L2', NULL);
INSERT INTO controle_en_direction VALUES ('T', NULL);
INSERT INTO controle_en_direction VALUES ('T1', NULL);
INSERT INTO controle_en_direction VALUES ('T2', NULL);
INSERT INTO controle_en_direction VALUES ('H', NULL);
INSERT INTO controle_en_direction VALUES ('H1', NULL);
INSERT INTO controle_en_direction VALUES ('H2', NULL);
INSERT INTO controle_en_direction VALUES ('P', NULL);


--
-- Data for Name: controle_en_dptimpact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_en_frappe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_en_frappe VALUES ('PFC', NULL);
INSERT INTO controle_en_frappe VALUES ('PFF', NULL);
INSERT INTO controle_en_frappe VALUES ('PFAR', NULL);
INSERT INTO controle_en_frappe VALUES ('PFAE', NULL);


--
-- Data for Name: controle_en_inclinaison; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_en_inclinaison VALUES ('PAR', NULL);
INSERT INTO controle_en_inclinaison VALUES ('OBL', NULL);
INSERT INTO controle_en_inclinaison VALUES ('PER', NULL);
INSERT INTO controle_en_inclinaison VALUES ('PRO', NULL);


--
-- Data for Name: controle_en_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_en_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_en_profondeur VALUES ('C', NULL);
INSERT INTO controle_en_profondeur VALUES ('M', NULL);
INSERT INTO controle_en_profondeur VALUES ('E', NULL);
INSERT INTO controle_en_profondeur VALUES ('P', NULL);


--
-- Data for Name: controle_ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ensemble VALUES ('CII', NULL);
INSERT INTO controle_ensemble VALUES ('CIII', NULL);


--
-- Data for Name: controle_f_affespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_affespece VALUES ('AFF', NULL);
INSERT INTO controle_f_affespece VALUES ('CONF', NULL);


--
-- Data for Name: controle_f_affgenre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_affgenre VALUES ('CONF', NULL);
INSERT INTO controle_f_affgenre VALUES ('AFF', 'affinité');


--
-- Data for Name: controle_f_agecl; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_agecl VALUES ('F', 'FOETUS');
INSERT INTO controle_f_agecl VALUES ('JA', NULL);
INSERT INTO controle_f_agecl VALUES ('A', NULL);
INSERT INTO controle_f_agecl VALUES ('AA', NULL);
INSERT INTO controle_f_agecl VALUES ('ATA', NULL);
INSERT INTO controle_f_agecl VALUES ('J', NULL);


--
-- Data for Name: controle_f_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_agent VALUES ('S', 'STRIE');
INSERT INTO controle_f_agent VALUES ('L', 'RACLAGE');
INSERT INTO controle_f_agent VALUES ('C', 'CARNIVORE');
INSERT INTO controle_f_agent VALUES ('P', 'point impact');


--
-- Data for Name: controle_f_agest; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_ancien_oss; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_association; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_calcouleur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_calcouleur VALUES ('NOI', NULL);
INSERT INTO controle_f_calcouleur VALUES ('GRI', NULL);
INSERT INTO controle_f_calcouleur VALUES ('MAR', NULL);
INSERT INTO controle_f_calcouleur VALUES ('BLA', NULL);
INSERT INTO controle_f_calcouleur VALUES ('N+M', NULL);
INSERT INTO controle_f_calcouleur VALUES ('BLE', NULL);
INSERT INTO controle_f_calcouleur VALUES ('B+B', NULL);
INSERT INTO controle_f_calcouleur VALUES ('GC', NULL);
INSERT INTO controle_f_calcouleur VALUES ('GF', NULL);
INSERT INTO controle_f_calcouleur VALUES ('G+M', NULL);
INSERT INTO controle_f_calcouleur VALUES ('N+BRR', NULL);
INSERT INTO controle_f_calcouleur VALUES ('BRR', NULL);
INSERT INTO controle_f_calcouleur VALUES ('G+BLA', NULL);
INSERT INTO controle_f_calcouleur VALUES ('G+BLE', NULL);
INSERT INTO controle_f_calcouleur VALUES ('G+N', NULL);
INSERT INTO controle_f_calcouleur VALUES ('G+G', NULL);
INSERT INTO controle_f_calcouleur VALUES ('BRG', NULL);
INSERT INTO controle_f_calcouleur VALUES ('N+BLE', NULL);
INSERT INTO controle_f_calcouleur VALUES ('N+BLA', NULL);
INSERT INTO controle_f_calcouleur VALUES ('N+BRG', NULL);


--
-- Data for Name: controle_f_caltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_caltype VALUES ('TOT', NULL);
INSERT INTO controle_f_caltype VALUES ('PAR', NULL);


--
-- Data for Name: controle_f_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_classe VALUES ('MAMMALIA', NULL);
INSERT INTO controle_f_classe VALUES ('AVES', NULL);
INSERT INTO controle_f_classe VALUES ('REPTILIA', NULL);
INSERT INTO controle_f_classe VALUES ('MOLLUSCA', NULL);
INSERT INTO controle_f_classe VALUES ('AMPHIBIA', NULL);


--
-- Data for Name: controle_f_complement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_composite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_concretion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_concretion VALUES ('P', NULL);
INSERT INTO controle_f_concretion VALUES ('.', NULL);
INSERT INTO controle_f_concretion VALUES ('Q', NULL);
INSERT INTO controle_f_concretion VALUES ('4', NULL);
INSERT INTO controle_f_concretion VALUES ('*', NULL);
INSERT INTO controle_f_concretion VALUES ('R', NULL);


--
-- Data for Name: controle_f_conservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_conservation VALUES ('898', NULL);
INSERT INTO controle_f_conservation VALUES ('PK', NULL);
INSERT INTO controle_f_conservation VALUES ('F01', NULL);
INSERT INTO controle_f_conservation VALUES ('P1', NULL);
INSERT INTO controle_f_conservation VALUES ('BRU', NULL);
INSERT INTO controle_f_conservation VALUES ('DIG', NULL);
INSERT INTO controle_f_conservation VALUES ('P2', NULL);
INSERT INTO controle_f_conservation VALUES ('R11', NULL);
INSERT INTO controle_f_conservation VALUES ('0', NULL);
INSERT INTO controle_f_conservation VALUES ('913', NULL);
INSERT INTO controle_f_conservation VALUES ('FC1', NULL);
INSERT INTO controle_f_conservation VALUES ('P6', NULL);
INSERT INTO controle_f_conservation VALUES ('470', NULL);
INSERT INTO controle_f_conservation VALUES ('464', NULL);
INSERT INTO controle_f_conservation VALUES ('151', NULL);
INSERT INTO controle_f_conservation VALUES ('P', NULL);
INSERT INTO controle_f_conservation VALUES ('P7', NULL);
INSERT INTO controle_f_conservation VALUES ('*', NULL);


--
-- Data for Name: controle_f_coprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_coraspect; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_coraspect VALUES ('FIB', NULL);
INSERT INTO controle_f_coraspect VALUES ('LES', NULL);
INSERT INTO controle_f_coraspect VALUES ('COM', NULL);
INSERT INTO controle_f_coraspect VALUES ('CAL', NULL);
INSERT INTO controle_f_coraspect VALUES ('IND', NULL);


--
-- Data for Name: controle_f_corfissure; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_corfissure VALUES ('FNOM', NULL);
INSERT INTO controle_f_corfissure VALUES ('FPEU', NULL);
INSERT INTO controle_f_corfissure VALUES ('FDIF', NULL);
INSERT INTO controle_f_corfissure VALUES ('COM', NULL);
INSERT INTO controle_f_corfissure VALUES ('M', NULL);
INSERT INTO controle_f_corfissure VALUES ('PNOM', NULL);
INSERT INTO controle_f_corfissure VALUES ('FPEN', NULL);


--
-- Data for Name: controle_f_couleur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_couleur VALUES ('D', NULL);
INSERT INTO controle_f_couleur VALUES ('FIB', NULL);
INSERT INTO controle_f_couleur VALUES ('G', NULL);
INSERT INTO controle_f_couleur VALUES ('SPO', NULL);
INSERT INTO controle_f_couleur VALUES ('M2', NULL);
INSERT INTO controle_f_couleur VALUES ('M1', NULL);
INSERT INTO controle_f_couleur VALUES ('0', NULL);
INSERT INTO controle_f_couleur VALUES ('O', NULL);
INSERT INTO controle_f_couleur VALUES ('.', NULL);
INSERT INTO controle_f_couleur VALUES ('ORY', NULL);


--
-- Data for Name: controle_f_datation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_datation VALUES ('M', NULL);
INSERT INTO controle_f_datation VALUES ('D', NULL);


--
-- Data for Name: controle_f_description; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_dessin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_dessin VALUES ('0', NULL);
INSERT INTO controle_f_dessin VALUES ('18', NULL);
INSERT INTO controle_f_dessin VALUES ('1', NULL);
INSERT INTO controle_f_dessin VALUES ('39', NULL);
INSERT INTO controle_f_dessin VALUES ('9', NULL);
INSERT INTO controle_f_dessin VALUES ('10', NULL);
INSERT INTO controle_f_dessin VALUES ('12', NULL);
INSERT INTO controle_f_dessin VALUES ('11', NULL);
INSERT INTO controle_f_dessin VALUES ('17', NULL);
INSERT INTO controle_f_dessin VALUES ('2', NULL);
INSERT INTO controle_f_dessin VALUES ('51', NULL);
INSERT INTO controle_f_dessin VALUES ('61', NULL);
INSERT INTO controle_f_dessin VALUES ('43', NULL);
INSERT INTO controle_f_dessin VALUES ('19', NULL);
INSERT INTO controle_f_dessin VALUES ('4', NULL);


--
-- Data for Name: controle_f_eclat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_eclat VALUES ('P', 'pr�sent');


--
-- Data for Name: controle_f_espece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_espece VALUES ('LIVIA', NULL);
INSERT INTO controle_f_espece VALUES ('ASPIS', NULL);
INSERT INTO controle_f_espece VALUES ('BERUS', NULL);
INSERT INTO controle_f_espece VALUES ('URSINI', NULL);
INSERT INTO controle_f_espece VALUES ('GIRONDICA', NULL);
INSERT INTO controle_f_espece VALUES ('AUSTRIACA', NULL);
INSERT INTO controle_f_espece VALUES ('VIRIDIFLAVUS', NULL);
INSERT INTO controle_f_espece VALUES ('SCALARIS', NULL);
INSERT INTO controle_f_espece VALUES ('LONGISSIMA', NULL);
INSERT INTO controle_f_espece VALUES ('FRAGILIS', NULL);
INSERT INTO controle_f_espece VALUES ('LEPIDA', NULL);
INSERT INTO controle_f_espece VALUES ('VIRIDIS', NULL);
INSERT INTO controle_f_espece VALUES ('ERYTHROPUS', NULL);
INSERT INTO controle_f_espece VALUES ('AGRESTIS', NULL);
INSERT INTO controle_f_espece VALUES ('SP', NULL);
INSERT INTO controle_f_espece VALUES ('GLAREOLUS', NULL);
INSERT INTO controle_f_espece VALUES ('GLIS', NULL);
INSERT INTO controle_f_espece VALUES ('QUERCINUS', NULL);
INSERT INTO controle_f_espece VALUES ('CRICETUS', NULL);
INSERT INTO controle_f_espece VALUES ('AVELLANARIUS', NULL);
INSERT INTO controle_f_espece VALUES ('MALEI-OECONOMUS', NULL);
INSERT INTO controle_f_espece VALUES ('LAGURUS', NULL);
INSERT INTO controle_f_espece VALUES ('NIVALIS', NULL);
INSERT INTO controle_f_espece VALUES ('GRACULUS', NULL);
INSERT INTO controle_f_espece VALUES ('GREGALIS', NULL);
INSERT INTO controle_f_espece VALUES ('GLANDARIUS', NULL);
INSERT INTO controle_f_espece VALUES ('PUNCTATUS', NULL);
INSERT INTO controle_f_espece VALUES ('CHRYSAETOS', NULL);
INSERT INTO controle_f_espece VALUES ('ALUCO', NULL);
INSERT INTO controle_f_espece VALUES ('SCOPS', NULL);
INSERT INTO controle_f_espece VALUES ('OTUS', NULL);
INSERT INTO controle_f_espece VALUES ('FUNEREUS', NULL);
INSERT INTO controle_f_espece VALUES ('NOCTUA', NULL);
INSERT INTO controle_f_espece VALUES ('FLAMMEUS', NULL);
INSERT INTO controle_f_espece VALUES ('BUBO', NULL);
INSERT INTO controle_f_espece VALUES ('FASCIATUS', NULL);
INSERT INTO controle_f_espece VALUES ('CYANEUS', NULL);
INSERT INTO controle_f_espece VALUES ('SUBBUTEO', NULL);
INSERT INTO controle_f_espece VALUES ('BUTEO', NULL);
INSERT INTO controle_f_espece VALUES ('TINNUNCULUS', NULL);
INSERT INTO controle_f_espece VALUES ('VESPERTINUS', NULL);
INSERT INTO controle_f_espece VALUES ('MONACHUS', NULL);
INSERT INTO controle_f_espece VALUES ('BARBATUS', NULL);
INSERT INTO controle_f_espece VALUES ('ELEONARAE', NULL);
INSERT INTO controle_f_espece VALUES ('MACROURUS', NULL);
INSERT INTO controle_f_espece VALUES ('COTURNIX', NULL);
INSERT INTO controle_f_espece VALUES ('CALAMITA', NULL);
INSERT INTO controle_f_espece VALUES ('BUFO', NULL);
INSERT INTO controle_f_espece VALUES ('MONEDULA', NULL);
INSERT INTO controle_f_espece VALUES ('PYRRHOCORAX', NULL);
INSERT INTO controle_f_espece VALUES ('GRAECA', NULL);
INSERT INTO controle_f_espece VALUES ('TEMPORARIA', NULL);
INSERT INTO controle_f_espece VALUES ('PALAEOPERDIX', NULL);
INSERT INTO controle_f_espece VALUES ('CORAX', NULL);
INSERT INTO controle_f_espece VALUES ('VISCIVORUS', NULL);
INSERT INTO controle_f_espece VALUES ('PICA', NULL);
INSERT INTO controle_f_espece VALUES ('MERULA', NULL);
INSERT INTO controle_f_espece VALUES ('CANORUS', NULL);
INSERT INTO controle_f_espece VALUES ('ARVENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('PALUMBUS', NULL);
INSERT INTO controle_f_espece VALUES ('OENAS', NULL);
INSERT INTO controle_f_espece VALUES ('CREX', NULL);
INSERT INTO controle_f_espece VALUES ('SCANDIACA', NULL);
INSERT INTO controle_f_espece VALUES ('CHLORIS', NULL);
INSERT INTO controle_f_espece VALUES ('CF.FLAVA', NULL);
INSERT INTO controle_f_espece VALUES ('AQUATICUS', NULL);
INSERT INTO controle_f_espece VALUES ('ALBICOLLIS', NULL);
INSERT INTO controle_f_espece VALUES ('CARYOCATACTES', NULL);
INSERT INTO controle_f_espece VALUES ('CF.VISCIVORUS', NULL);
INSERT INTO controle_f_espece VALUES ('CALANDRA', NULL);
INSERT INTO controle_f_espece VALUES ('RUSTICA', NULL);
INSERT INTO controle_f_espece VALUES ('CF.OENAS', NULL);
INSERT INTO controle_f_espece VALUES ('CF.PALUMBUS', NULL);
INSERT INTO controle_f_espece VALUES ('HYBRIDA', NULL);
INSERT INTO controle_f_espece VALUES ('COLUMBARIUS', NULL);
INSERT INTO controle_f_espece VALUES ('ALBICILLA', NULL);
INSERT INTO controle_f_espece VALUES ('STAGNATILIS', NULL);
INSERT INTO controle_f_espece VALUES ('RUSTICOLA', NULL);
INSERT INTO controle_f_espece VALUES ('CF.HIRUNDO', NULL);
INSERT INTO controle_f_espece VALUES ('ARCTICA', NULL);
INSERT INTO controle_f_espece VALUES ('AALGE/LOMVIA', NULL);
INSERT INTO controle_f_espece VALUES ('SQUATAROLA', NULL);
INSERT INTO controle_f_espece VALUES ('DUBIUS', NULL);
INSERT INTO controle_f_espece VALUES ('CF. CANUS', NULL);
INSERT INTO controle_f_espece VALUES ('PETRONIA', NULL);
INSERT INTO controle_f_espece VALUES ('HISPANICA', NULL);
INSERT INTO controle_f_espece VALUES ('PHOENICURUS', NULL);
INSERT INTO controle_f_espece VALUES ('RUBECULA', NULL);
INSERT INTO controle_f_espece VALUES ('URBICA', NULL);
INSERT INTO controle_f_espece VALUES ('CINCLUS', NULL);
INSERT INTO controle_f_espece VALUES ('PYTYOPSITTACUS', NULL);
INSERT INTO controle_f_espece VALUES ('COCCOTHRAUSTES', NULL);
INSERT INTO controle_f_espece VALUES ('ENUCLEATOR', NULL);
INSERT INTO controle_f_espece VALUES ('PYRRHULA', NULL);
INSERT INTO controle_f_espece VALUES ('ERYTHRINUS', NULL);
INSERT INTO controle_f_espece VALUES ('COELEBS', NULL);
INSERT INTO controle_f_espece VALUES ('HORTULANA', NULL);
INSERT INTO controle_f_espece VALUES ('ALBA', NULL);
INSERT INTO controle_f_espece VALUES ('PRATENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('VULGARIS', NULL);
INSERT INTO controle_f_espece VALUES ('CORONE', NULL);
INSERT INTO controle_f_espece VALUES ('ILIACUS', NULL);
INSERT INTO controle_f_espece VALUES ('ARBOREA', NULL);
INSERT INTO controle_f_espece VALUES ('CUITATA', NULL);
INSERT INTO controle_f_espece VALUES ('CRISTATA', NULL);
INSERT INTO controle_f_espece VALUES ('PILARIS', NULL);
INSERT INTO controle_f_espece VALUES ('APUS', NULL);
INSERT INTO controle_f_espece VALUES ('DAURICO', NULL);
INSERT INTO controle_f_espece VALUES ('GALLUS', NULL);
INSERT INTO controle_f_espece VALUES ('PALLIDUS', NULL);
INSERT INTO controle_f_espece VALUES ('MELBA', NULL);
INSERT INTO controle_f_espece VALUES ('MAJOR', NULL);
INSERT INTO controle_f_espece VALUES ('MINOR', NULL);
INSERT INTO controle_f_espece VALUES ('MEDIUS', NULL);
INSERT INTO controle_f_espece VALUES ('MARILA', NULL);
INSERT INTO controle_f_espece VALUES ('CLYPEATA', NULL);
INSERT INTO controle_f_espece VALUES ('CF. ACUTA', NULL);
INSERT INTO controle_f_espece VALUES ('CLANGULA', NULL);
INSERT INTO controle_f_espece VALUES ('PARETI', NULL);
INSERT INTO controle_f_espece VALUES ('NICIENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('CUNICULUS', NULL);
INSERT INTO controle_f_espece VALUES ('SIMILIS', NULL);
INSERT INTO controle_f_espece VALUES ('ELEGANS', NULL);
INSERT INTO controle_f_espece VALUES ('UNIFASCIATA', NULL);
INSERT INTO controle_f_espece VALUES ('OBVOLUTA', NULL);
INSERT INTO controle_f_espece VALUES ('DECOLATTA', NULL);
INSERT INTO controle_f_espece VALUES ('BIDENTATA', NULL);
INSERT INTO controle_f_espece VALUES ('CESPITUM', NULL);
INSERT INTO controle_f_espece VALUES ('GIGAXI', NULL);
INSERT INTO controle_f_espece VALUES ('CANDIDISSIMA', NULL);
INSERT INTO controle_f_espece VALUES ('ELAPHUS', NULL);
INSERT INTO controle_f_espece VALUES ('AVENACEA', NULL);
INSERT INTO controle_f_espece VALUES ('TRIPLICATA', NULL);
INSERT INTO controle_f_espece VALUES ('PURA', NULL);
INSERT INTO controle_f_espece VALUES ('RUGOSIUSCULA', NULL);
INSERT INTO controle_f_espece VALUES ('ACICULA', NULL);
INSERT INTO controle_f_espece VALUES ('EUROPEA', NULL);
INSERT INTO controle_f_espece VALUES ('DEPRESSUS', NULL);
INSERT INTO controle_f_espece VALUES ('ACICULOIDES', NULL);
INSERT INTO controle_f_espece VALUES ('QUADRIDENS', NULL);
INSERT INTO controle_f_espece VALUES ('SECALE', NULL);
INSERT INTO controle_f_espece VALUES ('GEYERI', NULL);
INSERT INTO controle_f_espece VALUES ('CANTIANA', NULL);
INSERT INTO controle_f_espece VALUES ('CABALLUS', NULL);
INSERT INTO controle_f_espece VALUES ('IBEX', NULL);
INSERT INTO controle_f_espece VALUES ('CAPREOLUS', NULL);
INSERT INTO controle_f_espece VALUES ('ANTIQUUS', NULL);
INSERT INTO controle_f_espece VALUES ('LATREILLI', NULL);
INSERT INTO controle_f_espece VALUES ('RETICULATUM', NULL);
INSERT INTO controle_f_espece VALUES ('LUPUS', NULL);
INSERT INTO controle_f_espece VALUES ('PRISCUS', NULL);
INSERT INTO controle_f_espece VALUES ('SPELAEA', NULL);
INSERT INTO controle_f_espece VALUES ('VULPES', NULL);
INSERT INTO controle_f_espece VALUES ('SYLVATICUS', NULL);
INSERT INTO controle_f_espece VALUES ('TARANDUS', NULL);
INSERT INTO controle_f_espece VALUES ('PRIMIGENIUS', NULL);
INSERT INTO controle_f_espece VALUES ('RUPICAPRA', NULL);
INSERT INTO controle_f_espece VALUES ('ANTIQUITATIS', NULL);
INSERT INTO controle_f_espece VALUES ('TERRESTRIS', NULL);
INSERT INTO controle_f_espece VALUES ('LENKI', NULL);
INSERT INTO controle_f_espece VALUES ('BRECCIENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('ARVALIS', NULL);
INSERT INTO controle_f_espece VALUES ('NORVEGICUS', NULL);
INSERT INTO controle_f_espece VALUES ('MUSCULUS', NULL);
INSERT INTO controle_f_espece VALUES ('BORONENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('EUROPAEA', NULL);
INSERT INTO controle_f_espece VALUES ('MINUTUS', NULL);
INSERT INTO controle_f_espece VALUES ('FODIENS', NULL);
INSERT INTO controle_f_espece VALUES ('HIPPOSIDEROS', NULL);
INSERT INTO controle_f_espece VALUES ('SCHREIBERSI', NULL);
INSERT INTO controle_f_espece VALUES ('BARBASTELLUS', NULL);
INSERT INTO controle_f_espece VALUES ('DAMA', NULL);
INSERT INTO controle_f_espece VALUES ('MYOTIS', NULL);
INSERT INTO controle_f_espece VALUES ('PARDUS', NULL);
INSERT INTO controle_f_espece VALUES ('ARCTOS', NULL);
INSERT INTO controle_f_espece VALUES ('SPELAEUS', NULL);
INSERT INTO controle_f_espece VALUES ('MELES', NULL);
INSERT INTO controle_f_espece VALUES ('SILVESTRIS', NULL);
INSERT INTO controle_f_espece VALUES ('OEDICNEMUS', NULL);
INSERT INTO controle_f_espece VALUES ('NERITOIDES', NULL);
INSERT INTO controle_f_espece VALUES ('SAXATILIS', NULL);
INSERT INTO controle_f_espece VALUES ('FABALIS', NULL);
INSERT INTO controle_f_espece VALUES ('CRUCIATUS', NULL);
INSERT INTO controle_f_espece VALUES ('CORALLINUS', NULL);
INSERT INTO controle_f_espece VALUES ('STRIATUS', NULL);
INSERT INTO controle_f_espece VALUES ('EXASPERATUS', NULL);
INSERT INTO controle_f_espece VALUES ('SANGUINEUM', NULL);
INSERT INTO controle_f_espece VALUES ('FERRUGINEA', NULL);
INSERT INTO controle_f_espece VALUES ('VULGATUM', NULL);
INSERT INTO controle_f_espece VALUES ('CALYCULATA', NULL);
INSERT INTO controle_f_espece VALUES ('COMMUNIS', NULL);
INSERT INTO controle_f_espece VALUES ('NATRIX', NULL);
INSERT INTO controle_f_espece VALUES ('DONOVANIA', NULL);
INSERT INTO controle_f_espece VALUES ('SCABRIDA', NULL);
INSERT INTO controle_f_espece VALUES ('VARIABILIS', NULL);
INSERT INTO controle_f_espece VALUES ('TORQUATUS', NULL);
INSERT INTO controle_f_espece VALUES ('PERDIX', NULL);
INSERT INTO controle_f_espece VALUES ('MUSICUS', NULL);
INSERT INTO controle_f_espece VALUES ('TETRIX', NULL);
INSERT INTO controle_f_espece VALUES ('ARVALIS-AGRESTIS', NULL);
INSERT INTO controle_f_espece VALUES ('DUODECIMCOSTATUS', NULL);
INSERT INTO controle_f_espece VALUES ('ESCULENTA', NULL);
INSERT INTO controle_f_espece VALUES ('MONTAGUI', NULL);
INSERT INTO controle_f_espece VALUES ('ZIZYPHINUM', NULL);
INSERT INTO controle_f_espece VALUES ('DISCORS', NULL);
INSERT INTO controle_f_espece VALUES ('ALUCASTER', NULL);
INSERT INTO controle_f_espece VALUES ('CRISTATUS', NULL);
INSERT INTO controle_f_espece VALUES ('EDULIS', NULL);
INSERT INTO controle_f_espece VALUES ('APERTUS', NULL);
INSERT INTO controle_f_espece VALUES ('TRUNCATULA', NULL);
INSERT INTO controle_f_espece VALUES ('VERMICULATA', NULL);
INSERT INTO controle_f_espece VALUES ('VARIA', NULL);
INSERT INTO controle_f_espece VALUES ('CAERULEA', NULL);
INSERT INTO controle_f_espece VALUES ('ULYSSIPONENSIS', NULL);
INSERT INTO controle_f_espece VALUES ('NOAE', NULL);
INSERT INTO controle_f_espece VALUES ('TUBERCULATA', NULL);


--
-- Data for Name: controle_f_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_famille VALUES ('COLUMBIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('VIPERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('COLUBRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ANGUIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LACERTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SCOLOPACIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ARVICOLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MURIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GLIRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CRICETIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CORVIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PELODYTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BUFONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ACCIPITRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('STRIGIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('FALCONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHASIANIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RANIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TURDIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CUCULIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ALAUDIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RALLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('FRINGILLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MOTACILLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MUSCICAPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('EMBERIZIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HIRUNDINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('STERNIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ALCIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHARADRIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LARIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PASSERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CINCLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('STURNIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('APODIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GALLINACAE', NULL);
INSERT INTO controle_f_famille VALUES ('PICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ANATIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HELICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LEPORIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHONDRINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('POMATIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ZONITIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CERVIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PUPILLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('FERUSSACIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TESTACELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BOVIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('EQUIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ELEPHANTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SYLVIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MONTICILLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LANIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LUCINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LIMIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHAMIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('VENERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PRUNELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CAPRIMULGIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CORACIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TETRAONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TROGLODYTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PASSERIFORMA', NULL);
INSERT INTO controle_f_famille VALUES ('SALAMANDRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CANIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LITTORINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TURBINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PATELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('COLUMBELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('COLLONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHIAMYS', NULL);
INSERT INTO controle_f_famille VALUES ('ARCIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TONNIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MURICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TRIVIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CERITTHIM', NULL);
INSERT INTO controle_f_famille VALUES ('FISSURELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MITRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CYPRAEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SPONDYLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('FELIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('OSTREIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('NEOTAENOGLOSSA', NULL);
INSERT INTO controle_f_famille VALUES ('SUIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RHINOCEROTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('URSIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('OSD', NULL);
INSERT INTO controle_f_famille VALUES ('PEPORIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SCIURIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TALPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MAMMIFERES', NULL);
INSERT INTO controle_f_famille VALUES ('DE', NULL);
INSERT INTO controle_f_famille VALUES ('GEKKONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PROCELLARIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HOMINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PELOBATIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DIPODIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SORICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RHINOLOPHIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MUSTELIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BURHINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CERCOPITHECIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PONGIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ERINACEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MOLOSSIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('VESPERTILIONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SPALACIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CASTORIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CAPROMYIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYSTRICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYDROCHOERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LAGOMYIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('AILURIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('VIVERRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYAENIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ODOBAENIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHOCIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HIPPOPOTAMIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CAMELIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GIRAFFIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ANTILOCAPRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TAPIRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GOMPHOTERIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DELPHINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHOCAENIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MONODONLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHYSETERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ZIPHIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BALAONOPTERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BALAENIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GAVIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PODICIPEDIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DIOMEDEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYDROBATIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SULIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PELECANIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHALACROCORACIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ARDEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('THRESKIORNITHIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CICONIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHOENICOPTERIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PANDIODIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TURNICIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GRUIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('OTITIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PTEROCLIDIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TYTONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ALCEDINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MEROPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('UPUPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HAEMATOPODIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHALAROPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('STERCORIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RECURVIROSTRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GLAREOLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ORIOLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BOMBYCILLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PARIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('AEGITHALIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TIMALIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('REMIZIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SITTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TICHODROMADIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TESTUDINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('EMYDIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DERMOCHELYDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHELONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('AMPHISBAENIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('GECKONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('AGAMIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CHAMELEONTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CARDITIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ACANTHOCHITONIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BARLEEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BUCCINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CERITHIOPSIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MARGINELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TRIPHORIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CERITHIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SCINCIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TURRITELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RISSOIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TYPHLOPIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('BOIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TRIVIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('NASSARIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('COSTELLARIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TURRIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('CLAUSILIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SUBULINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SUCCINEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DISCIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HYGROMIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LIMACIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PLETHODONTIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PROTEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('DISCOGLOSSIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SERPENTES', NULL);
INSERT INTO controle_f_famille VALUES ('BULIMINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('RISSOINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('FASCIOLARIIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('MYTILIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('ARGNIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('LYMNAEIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('SPHINCTEROCHILIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('HELICODONTIAE', NULL);
INSERT INTO controle_f_famille VALUES ('ACICULIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PECTINIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('VERMETIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('PHASIANELLIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('TROCHIDAE', NULL);
INSERT INTO controle_f_famille VALUES ('NOETIIDAE', NULL);


--
-- Data for Name: controle_f_fossilisation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_fragde; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_fragde VALUES ('DEF6', NULL);
INSERT INTO controle_f_fragde VALUES ('FEE', NULL);
INSERT INTO controle_f_fragde VALUES ('CODIE', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCD', NULL);
INSERT INTO controle_f_fragde VALUES ('TITD', NULL);
INSERT INTO controle_f_fragde VALUES ('SCP', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('HUD', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS36', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS27', NULL);
INSERT INTO controle_f_fragde VALUES ('MTP', NULL);
INSERT INTO controle_f_fragde VALUES ('MCE', NULL);
INSERT INTO controle_f_fragde VALUES ('MCP', NULL);
INSERT INTO controle_f_fragde VALUES ('PHE', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS11', NULL);
INSERT INTO controle_f_fragde VALUES ('HUP', NULL);
INSERT INTO controle_f_fragde VALUES ('FEM', NULL);
INSERT INTO controle_f_fragde VALUES ('CRF', NULL);
INSERT INTO controle_f_fragde VALUES ('HUE', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFE', NULL);
INSERT INTO controle_f_fragde VALUES ('CSSCF', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('DEE3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS4', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('TAE', NULL);
INSERT INTO controle_f_fragde VALUES ('FED', NULL);
INSERT INTO controle_f_fragde VALUES ('CSSCART', NULL);
INSERT INTO controle_f_fragde VALUES ('RAE', NULL);
INSERT INTO controle_f_fragde VALUES ('V3EU', NULL);
INSERT INTO controle_f_fragde VALUES ('ULP', NULL);
INSERT INTO controle_f_fragde VALUES ('ULPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFD', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFPM', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS6', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCSE', NULL);
INSERT INTO controle_f_fragde VALUES ('ULDM', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I1-I2D+I1G', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFM', NULL);
INSERT INTO controle_f_fragde VALUES ('CE', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDF', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I1-I2D+G', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP', NULL);
INSERT INTO controle_f_fragde VALUES ('HUPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD2D3', NULL);
INSERT INTO controle_f_fragde VALUES ('COQ F', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM2', NULL);
INSERT INTO controle_f_fragde VALUES ('HUDM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS346', NULL);
INSERT INTO controle_f_fragde VALUES ('MTE', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4B', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTPM', NULL);
INSERT INTO controle_f_fragde VALUES ('HUMP', NULL);
INSERT INTO controle_f_fragde VALUES ('M', NULL);
INSERT INTO controle_f_fragde VALUES ('HUM', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF', NULL);
INSERT INTO controle_f_fragde VALUES ('DEE1', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF5', NULL);
INSERT INTO controle_f_fragde VALUES ('RAPM', NULL);
INSERT INTO controle_f_fragde VALUES ('RAP', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP0', NULL);
INSERT INTO controle_f_fragde VALUES ('CODM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFMD', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTP', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCP', NULL);
INSERT INTO controle_f_fragde VALUES ('HP2', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS234', NULL);
INSERT INTO controle_f_fragde VALUES ('FED6', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFP', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF3', NULL);
INSERT INTO controle_f_fragde VALUES ('COQ-F', NULL);
INSERT INTO controle_f_fragde VALUES ('PH6', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2', NULL);
INSERT INTO controle_f_fragde VALUES ('COPM', NULL);
INSERT INTO controle_f_fragde VALUES ('F-P', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP2', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS24', NULL);
INSERT INTO controle_f_fragde VALUES ('FEPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS4', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDM', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTSE', NULL);
INSERT INTO controle_f_fragde VALUES ('TITMD', NULL);
INSERT INTO controle_f_fragde VALUES ('HUMD', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDSE', NULL);
INSERT INTO controle_f_fragde VALUES ('CNE', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS24', NULL);
INSERT INTO controle_f_fragde VALUES ('COE', NULL);
INSERT INTO controle_f_fragde VALUES ('RAM', NULL);
INSERT INTO controle_f_fragde VALUES ('VEF', NULL);
INSERT INTO controle_f_fragde VALUES ('SEE', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3A', NULL);
INSERT INTO controle_f_fragde VALUES ('CHI', NULL);
INSERT INTO controle_f_fragde VALUES ('SM6', NULL);
INSERT INTO controle_f_fragde VALUES ('TITM', NULL);
INSERT INTO controle_f_fragde VALUES ('SCPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS9', NULL);
INSERT INTO controle_f_fragde VALUES ('FB2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEMD', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS8911', NULL);
INSERT INTO controle_f_fragde VALUES ('FB10', NULL);
INSERT INTO controle_f_fragde VALUES ('COP', NULL);
INSERT INTO controle_f_fragde VALUES ('CTF', NULL);
INSERT INTO controle_f_fragde VALUES ('ULMP', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2P3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS2A', NULL);
INSERT INTO controle_f_fragde VALUES ('FED5', NULL);
INSERT INTO controle_f_fragde VALUES ('ULM', NULL);
INSERT INTO controle_f_fragde VALUES ('CTE', NULL);
INSERT INTO controle_f_fragde VALUES ('IF', NULL);
INSERT INTO controle_f_fragde VALUES ('PAE', NULL);
INSERT INTO controle_f_fragde VALUES ('PAF', NULL);
INSERT INTO controle_f_fragde VALUES ('RAMD', NULL);
INSERT INTO controle_f_fragde VALUES ('RAD', NULL);
INSERT INTO controle_f_fragde VALUES ('MDF', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P2-P3-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I1', NULL);
INSERT INTO controle_f_fragde VALUES ('MADF', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P2-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-F', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I2', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I2D+G', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('CRAF', NULL);
INSERT INTO controle_f_fragde VALUES ('MPD', NULL);
INSERT INTO controle_f_fragde VALUES ('ULE', NULL);
INSERT INTO controle_f_fragde VALUES ('ULMD', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4-M1-M2-', NULL);
INSERT INTO controle_f_fragde VALUES ('MXP2-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-F', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3', NULL);
INSERT INTO controle_f_fragde VALUES ('VEE', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MTD', NULL);
INSERT INTO controle_f_fragde VALUES ('MTM', NULL);
INSERT INTO controle_f_fragde VALUES ('PHF', NULL);
INSERT INTO controle_f_fragde VALUES ('ULD', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I1-I2', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-I1D+G', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P2-P3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('CRANE-SUB-COMPLET', NULL);
INSERT INTO controle_f_fragde VALUES ('MDD', NULL);
INSERT INTO controle_f_fragde VALUES ('MTMD', NULL);
INSERT INTO controle_f_fragde VALUES ('MCD', NULL);
INSERT INTO controle_f_fragde VALUES ('MDSF', NULL);
INSERT INTO controle_f_fragde VALUES ('MAS-F', NULL);
INSERT INTO controle_f_fragde VALUES ('CRAE', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2P3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2P3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDLD3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2P3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2P3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2P3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2P3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDGDM2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDGDM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDGLD4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDLD3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLDD3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS8', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMDD3D4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMGD2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('CSCSART', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C456', NULL);
INSERT INTO controle_f_fragde VALUES ('VC24', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C346', NULL);
INSERT INTO controle_f_fragde VALUES ('V3DC7ED', NULL);
INSERT INTO controle_f_fragde VALUES ('V83456', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C3456', NULL);
INSERT INTO controle_f_fragde VALUES ('V3EE', NULL);
INSERT INTO controle_f_fragde VALUES ('VD', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C46', NULL);
INSERT INTO controle_f_fragde VALUES ('VC14D', NULL);
INSERT INTO controle_f_fragde VALUES ('V2D', NULL);
INSERT INTO controle_f_fragde VALUES ('V2G', NULL);
INSERT INTO controle_f_fragde VALUES ('V3GU', NULL);
INSERT INTO controle_f_fragde VALUES ('VC26I', NULL);
INSERT INTO controle_f_fragde VALUES ('SACRF', NULL);
INSERT INTO controle_f_fragde VALUES ('V2I', NULL);
INSERT INTO controle_f_fragde VALUES ('SA1AB', NULL);
INSERT INTO controle_f_fragde VALUES ('V1D', NULL);
INSERT INTO controle_f_fragde VALUES ('VC14G', NULL);
INSERT INTO controle_f_fragde VALUES ('V82B', NULL);
INSERT INTO controle_f_fragde VALUES ('V5EE', NULL);
INSERT INTO controle_f_fragde VALUES ('V1G', NULL);
INSERT INTO controle_f_fragde VALUES ('V3A', NULL);
INSERT INTO controle_f_fragde VALUES ('V2E7ED', NULL);
INSERT INTO controle_f_fragde VALUES ('V81A2A3456', NULL);
INSERT INTO controle_f_fragde VALUES ('V81A', NULL);
INSERT INTO controle_f_fragde VALUES ('V3GC', NULL);
INSERT INTO controle_f_fragde VALUES ('V9', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C4', NULL);
INSERT INTO controle_f_fragde VALUES ('VC11B', NULL);
INSERT INTO controle_f_fragde VALUES ('V3DD', NULL);
INSERT INTO controle_f_fragde VALUES ('V3DC', NULL);
INSERT INTO controle_f_fragde VALUES ('V7EI', NULL);
INSERT INTO controle_f_fragde VALUES ('V81B', NULL);
INSERT INTO controle_f_fragde VALUES ('V1G2G', NULL);
INSERT INTO controle_f_fragde VALUES ('V82A', NULL);
INSERT INTO controle_f_fragde VALUES ('V1B', NULL);
INSERT INTO controle_f_fragde VALUES ('V3EC', NULL);
INSERT INTO controle_f_fragde VALUES ('V3DU', NULL);
INSERT INTO controle_f_fragde VALUES ('V2E', NULL);
INSERT INTO controle_f_fragde VALUES ('V1E', NULL);
INSERT INTO controle_f_fragde VALUES ('SA2E', NULL);
INSERT INTO controle_f_fragde VALUES ('V81A2A4', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C', NULL);
INSERT INTO controle_f_fragde VALUES ('SAAUG', NULL);
INSERT INTO controle_f_fragde VALUES ('VA12', NULL);
INSERT INTO controle_f_fragde VALUES ('VA13', NULL);
INSERT INTO controle_f_fragde VALUES ('SA1C', NULL);
INSERT INTO controle_f_fragde VALUES ('V81A2C3456', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2A', NULL);
INSERT INTO controle_f_fragde VALUES ('COCC', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVT1', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVC', NULL);
INSERT INTO controle_f_fragde VALUES ('CODITC', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVE', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVT2', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVE1', NULL);
INSERT INTO controle_f_fragde VALUES ('CODICV1', NULL);
INSERT INTO controle_f_fragde VALUES ('CODICC', NULL);
INSERT INTO controle_f_fragde VALUES ('CODICA', NULL);
INSERT INTO controle_f_fragde VALUES ('CODICV', NULL);
INSERT INTO controle_f_fragde VALUES ('CODICR', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVCV', NULL);
INSERT INTO controle_f_fragde VALUES ('STME', NULL);
INSERT INTO controle_f_fragde VALUES ('CODIC', NULL);
INSERT INTO controle_f_fragde VALUES ('FEEP1', NULL);
INSERT INTO controle_f_fragde VALUES ('V81A2A34', NULL);
INSERT INTO controle_f_fragde VALUES ('VSEU', NULL);
INSERT INTO controle_f_fragde VALUES ('SA1A', NULL);
INSERT INTO controle_f_fragde VALUES ('COACC', NULL);
INSERT INTO controle_f_fragde VALUES ('COCVA', NULL);
INSERT INTO controle_f_fragde VALUES ('STI', NULL);
INSERT INTO controle_f_fragde VALUES ('STMC', NULL);
INSERT INTO controle_f_fragde VALUES ('ST1', NULL);
INSERT INTO controle_f_fragde VALUES ('STXE', NULL);
INSERT INTO controle_f_fragde VALUES ('SD4M256', NULL);
INSERT INTO controle_f_fragde VALUES ('SM4', NULL);
INSERT INTO controle_f_fragde VALUES ('SM23', NULL);
INSERT INTO controle_f_fragde VALUES ('SM7', NULL);
INSERT INTO controle_f_fragde VALUES ('SM236', NULL);
INSERT INTO controle_f_fragde VALUES ('SM67', NULL);
INSERT INTO controle_f_fragde VALUES ('SM2', NULL);
INSERT INTO controle_f_fragde VALUES ('SD124', NULL);
INSERT INTO controle_f_fragde VALUES ('SM34', NULL);
INSERT INTO controle_f_fragde VALUES ('SM26', NULL);
INSERT INTO controle_f_fragde VALUES ('SD145M246', NULL);
INSERT INTO controle_f_fragde VALUES ('SD14', NULL);
INSERT INTO controle_f_fragde VALUES ('SD4M2', NULL);
INSERT INTO controle_f_fragde VALUES ('SD1', NULL);
INSERT INTO controle_f_fragde VALUES ('SM2356', NULL);
INSERT INTO controle_f_fragde VALUES ('SD145', NULL);
INSERT INTO controle_f_fragde VALUES ('SM4P4', NULL);
INSERT INTO controle_f_fragde VALUES ('SM235', NULL);
INSERT INTO controle_f_fragde VALUES ('SM16', NULL);
INSERT INTO controle_f_fragde VALUES ('SDE', NULL);
INSERT INTO controle_f_fragde VALUES ('HP23', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2B', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS12C3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS12B3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0C', NULL);
INSERT INTO controle_f_fragde VALUES ('HD4', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2B3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2C', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0', NULL);
INSERT INTO controle_f_fragde VALUES ('HDN', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0C3C', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS12A3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0C3B', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0AC3', NULL);
INSERT INTO controle_f_fragde VALUES ('HD0', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS1A', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS12C', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS12B', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0C3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2A', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0D1', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0A3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS123', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2B3A', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS1A2', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0B1A2A', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS2', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS1A23', NULL);
INSERT INTO controle_f_fragde VALUES ('HEP2', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS23', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS01', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS1A', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0A13', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS4', NULL);
INSERT INTO controle_f_fragde VALUES ('RP3', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS123', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS3A', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS4A', NULL);
INSERT INTO controle_f_fragde VALUES ('RP0', NULL);
INSERT INTO controle_f_fragde VALUES ('RD1A', NULL);
INSERT INTO controle_f_fragde VALUES ('RD34UD0', NULL);
INSERT INTO controle_f_fragde VALUES ('RUD', NULL);
INSERT INTO controle_f_fragde VALUES ('RD0UD0', NULL);
INSERT INTO controle_f_fragde VALUES ('RP0UD0', NULL);
INSERT INTO controle_f_fragde VALUES ('UO346', NULL);
INSERT INTO controle_f_fragde VALUES ('UDS7', NULL);
INSERT INTO controle_f_fragde VALUES ('UTN56', NULL);
INSERT INTO controle_f_fragde VALUES ('UO3456', NULL);
INSERT INTO controle_f_fragde VALUES ('UO6', NULL);
INSERT INTO controle_f_fragde VALUES ('UO67', NULL);
INSERT INTO controle_f_fragde VALUES ('UTN0', NULL);
INSERT INTO controle_f_fragde VALUES ('UDS356', NULL);
INSERT INTO controle_f_fragde VALUES ('UDN', NULL);
INSERT INTO controle_f_fragde VALUES ('UO3467', NULL);
INSERT INTO controle_f_fragde VALUES ('UO23467', NULL);
INSERT INTO controle_f_fragde VALUES ('UD0', NULL);
INSERT INTO controle_f_fragde VALUES ('UO36', NULL);
INSERT INTO controle_f_fragde VALUES ('UO7', NULL);
INSERT INTO controle_f_fragde VALUES ('UO234', NULL);
INSERT INTO controle_f_fragde VALUES ('RDN', NULL);
INSERT INTO controle_f_fragde VALUES ('UED', NULL);
INSERT INTO controle_f_fragde VALUES ('UEP', NULL);
INSERT INTO controle_f_fragde VALUES ('UO15', NULL);
INSERT INTO controle_f_fragde VALUES ('UTN12356', NULL);
INSERT INTO controle_f_fragde VALUES ('HA2', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS2', NULL);
INSERT INTO controle_f_fragde VALUES ('RD1', NULL);
INSERT INTO controle_f_fragde VALUES ('HAE', NULL);
INSERT INTO controle_f_fragde VALUES ('RP2', NULL);
INSERT INTO controle_f_fragde VALUES ('HA4', NULL);
INSERT INTO controle_f_fragde VALUES ('CT2', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS134', NULL);
INSERT INTO controle_f_fragde VALUES ('RD34', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS3A4', NULL);
INSERT INTO controle_f_fragde VALUES ('PIE', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS23', NULL);
INSERT INTO controle_f_fragde VALUES ('REP3', NULL);
INSERT INTO controle_f_fragde VALUES ('PYE', NULL);
INSERT INTO controle_f_fragde VALUES ('RD0', NULL);
INSERT INTO controle_f_fragde VALUES ('RP23', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS23A', NULL);
INSERT INTO controle_f_fragde VALUES ('SLE', NULL);
INSERT INTO controle_f_fragde VALUES ('SLD0', NULL);
INSERT INTO controle_f_fragde VALUES ('SCE', NULL);
INSERT INTO controle_f_fragde VALUES ('SC1', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD1', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS236', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP12', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD0', NULL);
INSERT INTO controle_f_fragde VALUES ('CAED1', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP0', NULL);
INSERT INTO controle_f_fragde VALUES ('RED0', NULL);
INSERT INTO controle_f_fragde VALUES ('RDN0', NULL);
INSERT INTO controle_f_fragde VALUES ('RD23', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS3A5', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS12', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP1', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS123', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS36', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS34', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS1', NULL);
INSERT INTO controle_f_fragde VALUES ('RD2', NULL);
INSERT INTO controle_f_fragde VALUES ('RED23', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS56', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS67', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD3', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP27', NULL);
INSERT INTO controle_f_fragde VALUES ('CAED0', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD11', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS267', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS7', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS0', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS346', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS46', NULL);
INSERT INTO controle_f_fragde VALUES ('CAE1', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS456', NULL);
INSERT INTO controle_f_fragde VALUES ('CADN', NULL);
INSERT INTO controle_f_fragde VALUES ('CAED3', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD2', NULL);
INSERT INTO controle_f_fragde VALUES ('MECE', NULL);
INSERT INTO controle_f_fragde VALUES ('MECSD', NULL);
INSERT INTO controle_f_fragde VALUES ('CAE', NULL);
INSERT INTO controle_f_fragde VALUES ('SEF', NULL);
INSERT INTO controle_f_fragde VALUES ('PH1', NULL);
INSERT INTO controle_f_fragde VALUES ('PHE1', NULL);
INSERT INTO controle_f_fragde VALUES ('PH2', NULL);
INSERT INTO controle_f_fragde VALUES ('PHEI', NULL);
INSERT INTO controle_f_fragde VALUES ('PH8', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3H', NULL);
INSERT INTO controle_f_fragde VALUES ('IS3', NULL);
INSERT INTO controle_f_fragde VALUES ('IA3', NULL);
INSERT INTO controle_f_fragde VALUES ('IL1', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP13', NULL);
INSERT INTO controle_f_fragde VALUES ('IL178', NULL);
INSERT INTO controle_f_fragde VALUES ('IL18', NULL);
INSERT INTO controle_f_fragde VALUES ('TID0', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP2', NULL);
INSERT INTO controle_f_fragde VALUES ('TID13', NULL);
INSERT INTO controle_f_fragde VALUES ('IA6', NULL);
INSERT INTO controle_f_fragde VALUES ('FEEP1P3', NULL);
INSERT INTO controle_f_fragde VALUES ('IL6789', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A23', NULL);
INSERT INTO controle_f_fragde VALUES ('IA4', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP3', NULL);
INSERT INTO controle_f_fragde VALUES ('FED1', NULL);
INSERT INTO controle_f_fragde VALUES ('IP2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP1', NULL);
INSERT INTO controle_f_fragde VALUES ('IA3IS1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS234A', NULL);
INSERT INTO controle_f_fragde VALUES ('IL2', NULL);
INSERT INTO controle_f_fragde VALUES ('FED2', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A2', NULL);
INSERT INTO controle_f_fragde VALUES ('IA2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS3B4A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP2', NULL);
INSERT INTO controle_f_fragde VALUES ('IP13', NULL);
INSERT INTO controle_f_fragde VALUES ('IA24', NULL);
INSERT INTO controle_f_fragde VALUES ('TIEP1', NULL);
INSERT INTO controle_f_fragde VALUES ('IA2IL238', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP1', NULL);
INSERT INTO controle_f_fragde VALUES ('IP1', NULL);
INSERT INTO controle_f_fragde VALUES ('IA4IPE', NULL);
INSERT INTO controle_f_fragde VALUES ('IS5', NULL);
INSERT INTO controle_f_fragde VALUES ('IS10', NULL);
INSERT INTO controle_f_fragde VALUES ('IL10', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2A34C', NULL);
INSERT INTO controle_f_fragde VALUES ('TID5', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS234B', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS34C', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS2AP3', NULL);
INSERT INTO controle_f_fragde VALUES ('IS1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS124', NULL);
INSERT INTO controle_f_fragde VALUES ('FEED6', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS24A', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS24B', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS34B', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS3B4AC', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4C', NULL);
INSERT INTO controle_f_fragde VALUES ('TIED0', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4D', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A23A', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS123', NULL);
INSERT INTO controle_f_fragde VALUES ('FEE3', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP3DS2A', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2B4', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS4A', NULL);
INSERT INTO controle_f_fragde VALUES ('TID3', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4A', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2B34A4C', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDN', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS34A4C', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS34B', NULL);
INSERT INTO controle_f_fragde VALUES ('SM25', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS34A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS4B', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS124A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS234', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS234C', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS134B', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS34', NULL);
INSERT INTO controle_f_fragde VALUES ('TIED3', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP3DS1A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP3DS1A23A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A', NULL);
INSERT INTO controle_f_fragde VALUES ('FEEP2', NULL);
INSERT INTO controle_f_fragde VALUES ('FED123', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS13', NULL);
INSERT INTO controle_f_fragde VALUES ('FED56', NULL);
INSERT INTO controle_f_fragde VALUES ('TIPNDS34', NULL);
INSERT INTO controle_f_fragde VALUES ('FED0', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS3', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS234B', NULL);
INSERT INTO controle_f_fragde VALUES ('IL1789', NULL);
INSERT INTO controle_f_fragde VALUES ('IS35', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1', NULL);
INSERT INTO controle_f_fragde VALUES ('MAE', NULL);
INSERT INTO controle_f_fragde VALUES ('CL4', NULL);
INSERT INTO controle_f_fragde VALUES ('CEE', NULL);
INSERT INTO controle_f_fragde VALUES ('CL2', NULL);
INSERT INTO controle_f_fragde VALUES ('CE1', NULL);
INSERT INTO controle_f_fragde VALUES ('CL1', NULL);
INSERT INTO controle_f_fragde VALUES ('CLE', NULL);
INSERT INTO controle_f_fragde VALUES ('CL245', NULL);
INSERT INTO controle_f_fragde VALUES ('CL6', NULL);
INSERT INTO controle_f_fragde VALUES ('CL7', NULL);
INSERT INTO controle_f_fragde VALUES ('CEF', NULL);
INSERT INTO controle_f_fragde VALUES ('CNE-CEE', NULL);
INSERT INTO controle_f_fragde VALUES ('TA125', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS35', NULL);
INSERT INTO controle_f_fragde VALUES ('TA3', NULL);
INSERT INTO controle_f_fragde VALUES ('CAED2', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD46', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS23', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP24', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP234', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP13', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP23', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP346', NULL);
INSERT INTO controle_f_fragde VALUES ('FED12', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP4', NULL);
INSERT INTO controle_f_fragde VALUES ('DEE2', NULL);
INSERT INTO controle_f_fragde VALUES ('DB2', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF1', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF2', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF7', NULL);
INSERT INTO controle_f_fragde VALUES ('DEF4', NULL);
INSERT INTO controle_f_fragde VALUES ('DEB2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP2P3', NULL);
INSERT INTO controle_f_fragde VALUES ('V7ED', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS24C', NULL);
INSERT INTO controle_f_fragde VALUES ('SDEM256', NULL);
INSERT INTO controle_f_fragde VALUES ('SM347', NULL);
INSERT INTO controle_f_fragde VALUES ('SD14SM2', NULL);
INSERT INTO controle_f_fragde VALUES ('SM56', NULL);
INSERT INTO controle_f_fragde VALUES ('SM4SP4', NULL);
INSERT INTO controle_f_fragde VALUES ('SD1A4SM246', NULL);
INSERT INTO controle_f_fragde VALUES ('SDESM234567', NULL);
INSERT INTO controle_f_fragde VALUES ('HD12', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0D2D', NULL);
INSERT INTO controle_f_fragde VALUES ('HDSE', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0A', NULL);
INSERT INTO controle_f_fragde VALUES ('HP0', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS234', NULL);
INSERT INTO controle_f_fragde VALUES ('RD3', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS13A4', NULL);
INSERT INTO controle_f_fragde VALUES ('RED1', NULL);
INSERT INTO controle_f_fragde VALUES ('RD12', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS0', NULL);
INSERT INTO controle_f_fragde VALUES ('RP3DS3UO0DS7', NULL);
INSERT INTO controle_f_fragde VALUES ('RD0UO7', NULL);
INSERT INTO controle_f_fragde VALUES ('RD0U067', NULL);
INSERT INTO controle_f_fragde VALUES ('UO2346', NULL);
INSERT INTO controle_f_fragde VALUES ('UTN1235', NULL);
INSERT INTO controle_f_fragde VALUES ('PI2', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS246', NULL);
INSERT INTO controle_f_fragde VALUES ('HA3', NULL);
INSERT INTO controle_f_fragde VALUES ('PH7', NULL);
INSERT INTO controle_f_fragde VALUES ('IL789', NULL);
INSERT INTO controle_f_fragde VALUES ('IAE', NULL);
INSERT INTO controle_f_fragde VALUES ('IP4', NULL);
INSERT INTO controle_f_fragde VALUES ('IPE', NULL);
INSERT INTO controle_f_fragde VALUES ('IA23ILE', NULL);
INSERT INTO controle_f_fragde VALUES ('IL12789', NULL);
INSERT INTO controle_f_fragde VALUES ('IAEIPE', NULL);
INSERT INTO controle_f_fragde VALUES ('I912', NULL);
INSERT INTO controle_f_fragde VALUES ('IA1IS1', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP0', NULL);
INSERT INTO controle_f_fragde VALUES ('FED3456', NULL);
INSERT INTO controle_f_fragde VALUES ('FEEP1PN', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4B4C', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS4', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP3DS12A4', NULL);
INSERT INTO controle_f_fragde VALUES ('FEPN', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS3', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDSE', NULL);
INSERT INTO controle_f_fragde VALUES ('TID45', NULL);
INSERT INTO controle_f_fragde VALUES ('TIEP2', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A3A', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP4', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3G', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3F', NULL);
INSERT INTO controle_f_fragde VALUES ('PH5', NULL);
INSERT INTO controle_f_fragde VALUES ('PHE12', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3D', NULL);
INSERT INTO controle_f_fragde VALUES ('CN1', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS10', NULL);
INSERT INTO controle_f_fragde VALUES ('TIPN', NULL);
INSERT INTO controle_f_fragde VALUES ('TIEP14', NULL);
INSERT INTO controle_f_fragde VALUES ('TIE', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS3A3B4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS5', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS123', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS2', NULL);
INSERT INTO controle_f_fragde VALUES ('TA6', NULL);
INSERT INTO controle_f_fragde VALUES ('TA4', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP3', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP124', NULL);
INSERT INTO controle_f_fragde VALUES ('2DS23A', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS257', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMDD2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLDD3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLGD2D3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDM1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP2P3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP2', NULL);
INSERT INTO controle_f_fragde VALUES ('CL14', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP2P3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('CL124', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS8', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLDD4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS15', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS811', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS891011', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMDI1I2I3D2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS10', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMDD2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLDI2I3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLDD2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3P4M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGD3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDI1', NULL);
INSERT INTO controle_f_fragde VALUES ('TIED34', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS243', NULL);
INSERT INTO controle_f_fragde VALUES ('COVT2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2A4', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS124C', NULL);
INSERT INTO controle_f_fragde VALUES ('ST7', NULL);
INSERT INTO controle_f_fragde VALUES ('V3E', NULL);
INSERT INTO controle_f_fragde VALUES ('MXSDC', NULL);
INSERT INTO controle_f_fragde VALUES ('MXSII', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS34A', NULL);
INSERT INTO controle_f_fragde VALUES ('HD2', NULL);
INSERT INTO controle_f_fragde VALUES ('FED3A', NULL);
INSERT INTO controle_f_fragde VALUES ('DEFE', NULL);
INSERT INTO controle_f_fragde VALUES ('DB3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS3A', NULL);
INSERT INTO controle_f_fragde VALUES ('DB1', NULL);
INSERT INTO controle_f_fragde VALUES ('ED0', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP14', NULL);
INSERT INTO controle_f_fragde VALUES ('SM234567', NULL);
INSERT INTO controle_f_fragde VALUES ('SDEM24567', NULL);
INSERT INTO controle_f_fragde VALUES ('FB7', NULL);
INSERT INTO controle_f_fragde VALUES ('FB11', NULL);
INSERT INTO controle_f_fragde VALUES ('PHE2', NULL);
INSERT INTO controle_f_fragde VALUES ('CAP0DS0', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS1', NULL);
INSERT INTO controle_f_fragde VALUES ('ND0', NULL);
INSERT INTO controle_f_fragde VALUES ('SDEM23456', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS5', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS0', NULL);
INSERT INTO controle_f_fragde VALUES ('SA1B', NULL);
INSERT INTO controle_f_fragde VALUES ('SACRD', NULL);
INSERT INTO controle_f_fragde VALUES ('SACRG', NULL);
INSERT INTO controle_f_fragde VALUES ('V81C2C34', NULL);
INSERT INTO controle_f_fragde VALUES ('VC12A', NULL);
INSERT INTO controle_f_fragde VALUES ('SA10', NULL);
INSERT INTO controle_f_fragde VALUES ('VC11A', NULL);
INSERT INTO controle_f_fragde VALUES ('V2A', NULL);
INSERT INTO controle_f_fragde VALUES ('VE1', NULL);
INSERT INTO controle_f_fragde VALUES ('SA2F', NULL);
INSERT INTO controle_f_fragde VALUES ('V846', NULL);
INSERT INTO controle_f_fragde VALUES ('V82A346', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('IAEIL178', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS3B4B', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0D13', NULL);
INSERT INTO controle_f_fragde VALUES ('SDEM2', NULL);
INSERT INTO controle_f_fragde VALUES ('HENT', NULL);
INSERT INTO controle_f_fragde VALUES ('HED0', NULL);
INSERT INTO controle_f_fragde VALUES ('IAF', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS322', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS89', NULL);
INSERT INTO controle_f_fragde VALUES ('SD4SM23457', NULL);
INSERT INTO controle_f_fragde VALUES ('CL5', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS1234', NULL);
INSERT INTO controle_f_fragde VALUES ('ZDSO', NULL);
INSERT INTO controle_f_fragde VALUES ('UO27', NULL);
INSERT INTO controle_f_fragde VALUES ('2D23', NULL);
INSERT INTO controle_f_fragde VALUES ('ZDO', NULL);
INSERT INTO controle_f_fragde VALUES ('IAE34IPE', NULL);
INSERT INTO controle_f_fragde VALUES ('IL145789', NULL);
INSERT INTO controle_f_fragde VALUES ('IA4IP3', NULL);
INSERT INTO controle_f_fragde VALUES ('HDO', NULL);
INSERT INTO controle_f_fragde VALUES ('SM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMGD2D3M1', NULL);
INSERT INTO controle_f_fragde VALUES ('SD14SM246', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS0', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A2A4A', NULL);
INSERT INTO controle_f_fragde VALUES ('FED23', NULL);
INSERT INTO controle_f_fragde VALUES ('MDFM1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM1-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('CH3', NULL);
INSERT INTO controle_f_fragde VALUES ('CH2', NULL);
INSERT INTO controle_f_fragde VALUES ('CHE', NULL);
INSERT INTO controle_f_fragde VALUES ('FB9', NULL);
INSERT INTO controle_f_fragde VALUES ('FB1', NULL);
INSERT INTO controle_f_fragde VALUES ('BO1258', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS10', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS03', NULL);
INSERT INTO controle_f_fragde VALUES ('HD1', NULL);
INSERT INTO controle_f_fragde VALUES ('UO56', NULL);
INSERT INTO controle_f_fragde VALUES ('SME', NULL);
INSERT INTO controle_f_fragde VALUES ('IL4', NULL);
INSERT INTO controle_f_fragde VALUES ('HUSE', NULL);
INSERT INTO controle_f_fragde VALUES ('TID4', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS1A34B', NULL);
INSERT INTO controle_f_fragde VALUES ('ULSE', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS2', NULL);
INSERT INTO controle_f_fragde VALUES ('PH4', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3B', NULL);
INSERT INTO controle_f_fragde VALUES ('SAAUD', NULL);
INSERT INTO controle_f_fragde VALUES ('VC14I', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFSE', NULL);
INSERT INTO controle_f_fragde VALUES ('CL2345', NULL);
INSERT INTO controle_f_fragde VALUES ('CE4', NULL);
INSERT INTO controle_f_fragde VALUES ('PY345', NULL);
INSERT INTO controle_f_fragde VALUES ('SC3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP2-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP1-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP1-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDM2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDC', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP1-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDE', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP2-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXS3', NULL);
INSERT INTO controle_f_fragde VALUES ('HYI', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS3A4', NULL);
INSERT INTO controle_f_fragde VALUES ('IL7', NULL);
INSERT INTO controle_f_fragde VALUES ('CH1', NULL);
INSERT INTO controle_f_fragde VALUES ('CRIN', NULL);
INSERT INTO controle_f_fragde VALUES ('CROI', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDI-P3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDP4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDI-P3-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDI-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDI-P3-P4-M1-M1-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXM1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDI-P3-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS3A', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGM12', NULL);
INSERT INTO controle_f_fragde VALUES ('UO5UDS2456', NULL);
INSERT INTO controle_f_fragde VALUES ('SD1ASM234567', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDIP3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1D+G', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCE', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD67', NULL);
INSERT INTO controle_f_fragde VALUES ('CADS2346', NULL);
INSERT INTO controle_f_fragde VALUES ('CAPN', NULL);
INSERT INTO controle_f_fragde VALUES ('CAD06', NULL);
INSERT INTO controle_f_fragde VALUES ('CAE3', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3E', NULL);
INSERT INTO controle_f_fragde VALUES ('PH3DEF', NULL);
INSERT INTO controle_f_fragde VALUES ('MA1', NULL);
INSERT INTO controle_f_fragde VALUES ('FEDS46', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLDD3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMDD3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMGD4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDIMI', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGE', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLGD2D3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDM3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMDD4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGM1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDM1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP2P3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP2P3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS6', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS7', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS46', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS34', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS234', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS14', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS58911', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS1011', NULL);
INSERT INTO controle_f_fragde VALUES ('SDEM246', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS124', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS0', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS23', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS22', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS911', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS24', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS236', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS210', NULL);
INSERT INTO controle_f_fragde VALUES ('MDIDMI', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDM2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMDD4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGI2I3CA', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMGD2D3D4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDJI', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDI3CA', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMGD4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLDD2D3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGI2I3C', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMDD4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMDD3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDLGD2D3D4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDMI', NULL);
INSERT INTO controle_f_fragde VALUES ('FEP134', NULL);
INSERT INTO controle_f_fragde VALUES ('RUS', NULL);
INSERT INTO controle_f_fragde VALUES ('PH34', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDM1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDM1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDP4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('DEE', NULL);
INSERT INTO controle_f_fragde VALUES ('SE', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMGD2D3D4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDGDP4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MX', NULL);
INSERT INTO controle_f_fragde VALUES ('MDMGD3D4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('TNAE', NULL);
INSERT INTO controle_f_fragde VALUES ('MT3P', NULL);
INSERT INTO controle_f_fragde VALUES ('CRE', NULL);
INSERT INTO controle_f_fragde VALUES ('INDGI1I2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP4', NULL);
INSERT INTO controle_f_fragde VALUES ('INS', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXS', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGP4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDP3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS111', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS810', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP1P2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGI2CP2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDP3M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDCP1P2P3M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGI3CP1P2P3P4M1M2M', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDI2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP1P2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDMI1I2I3C', NULL);
INSERT INTO controle_f_fragde VALUES ('MXCP1P2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGI1I2I3CP1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDCP1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGCP2P3P4M1M2M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDCP2P3P4M1M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGP3M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS13', NULL);
INSERT INTO controle_f_fragde VALUES ('MXMDD3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDGCP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDCP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDCP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGCP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDGCP3P4M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDI2I3CP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDMI2I3CP3P4', NULL);
INSERT INTO controle_f_fragde VALUES ('VF', NULL);
INSERT INTO controle_f_fragde VALUES ('VE', NULL);
INSERT INTO controle_f_fragde VALUES ('MID', NULL);
INSERT INTO controle_f_fragde VALUES ('UO0', NULL);
INSERT INTO controle_f_fragde VALUES ('FEED', NULL);
INSERT INTO controle_f_fragde VALUES ('FEED3', NULL);
INSERT INTO controle_f_fragde VALUES ('PHFD', NULL);
INSERT INTO controle_f_fragde VALUES ('RDS', NULL);
INSERT INTO controle_f_fragde VALUES ('RPN', NULL);
INSERT INTO controle_f_fragde VALUES ('ISE', NULL);
INSERT INTO controle_f_fragde VALUES ('MIE', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLGD4', NULL);
INSERT INTO controle_f_fragde VALUES ('MXDDPI', NULL);
INSERT INTO controle_f_fragde VALUES ('MIDX', NULL);
INSERT INTO controle_f_fragde VALUES ('MIED', NULL);
INSERT INTO controle_f_fragde VALUES ('MIM6', NULL);
INSERT INTO controle_f_fragde VALUES ('MIM5', NULL);
INSERT INTO controle_f_fragde VALUES ('MIDF', NULL);
INSERT INTO controle_f_fragde VALUES ('MIMDX', NULL);
INSERT INTO controle_f_fragde VALUES ('MIM', NULL);
INSERT INTO controle_f_fragde VALUES ('TA1', NULL);
INSERT INTO controle_f_fragde VALUES ('CUE', NULL);
INSERT INTO controle_f_fragde VALUES ('NAE', NULL);
INSERT INTO controle_f_fragde VALUES ('FID', NULL);
INSERT INTO controle_f_fragde VALUES ('FIM', NULL);
INSERT INTO controle_f_fragde VALUES ('TIDS', NULL);
INSERT INTO controle_f_fragde VALUES ('ILE', NULL);
INSERT INTO controle_f_fragde VALUES ('SUE', NULL);
INSERT INTO controle_f_fragde VALUES ('HAF', NULL);
INSERT INTO controle_f_fragde VALUES ('UENT', NULL);
INSERT INTO controle_f_fragde VALUES ('UDS', NULL);
INSERT INTO controle_f_fragde VALUES ('RENT', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0123', NULL);
INSERT INTO controle_f_fragde VALUES ('HED234', NULL);
INSERT INTO controle_f_fragde VALUES ('STE', NULL);
INSERT INTO controle_f_fragde VALUES ('VC15G', NULL);
INSERT INTO controle_f_fragde VALUES ('VC14', NULL);
INSERT INTO controle_f_fragde VALUES ('VC15D', NULL);
INSERT INTO controle_f_fragde VALUES ('MIP', NULL);
INSERT INTO controle_f_fragde VALUES ('CIE', NULL);
INSERT INTO controle_f_fragde VALUES ('TAF', NULL);
INSERT INTO controle_f_fragde VALUES ('PHFP', NULL);
INSERT INTO controle_f_fragde VALUES ('IE', NULL);
INSERT INTO controle_f_fragde VALUES ('SAF', NULL);
INSERT INTO controle_f_fragde VALUES ('VC1A4D5D', NULL);
INSERT INTO controle_f_fragde VALUES ('HD14', NULL);
INSERT INTO controle_f_fragde VALUES ('TOE', NULL);
INSERT INTO controle_f_fragde VALUES ('CSF', NULL);
INSERT INTO controle_f_fragde VALUES ('CLF', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS013', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDDI1I2I3', NULL);
INSERT INTO controle_f_fragde VALUES ('MDS29', NULL);
INSERT INTO controle_f_fragde VALUES ('HDS0D', NULL);
INSERT INTO controle_f_fragde VALUES ('FRBE', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTDM', NULL);
INSERT INTO controle_f_fragde VALUES ('CRTI', NULL);
INSERT INTO controle_f_fragde VALUES ('CRPI', NULL);
INSERT INTO controle_f_fragde VALUES ('IQ2', NULL);
INSERT INTO controle_f_fragde VALUES ('SM2467', NULL);
INSERT INTO controle_f_fragde VALUES ('CRFI', NULL);
INSERT INTO controle_f_fragde VALUES ('MXLDPI', NULL);
INSERT INTO controle_f_fragde VALUES ('MTF', NULL);
INSERT INTO controle_f_fragde VALUES ('MCF', NULL);
INSERT INTO controle_f_fragde VALUES ('ULF', NULL);
INSERT INTO controle_f_fragde VALUES ('RAF', NULL);
INSERT INTO controle_f_fragde VALUES ('TCAE', NULL);
INSERT INTO controle_f_fragde VALUES ('TCAF', NULL);
INSERT INTO controle_f_fragde VALUES ('TTAE', NULL);
INSERT INTO controle_f_fragde VALUES ('TTAF', NULL);
INSERT INTO controle_f_fragde VALUES ('CSSCE', NULL);
INSERT INTO controle_f_fragde VALUES ('PHD', NULL);
INSERT INTO controle_f_fragde VALUES ('PHP', NULL);
INSERT INTO controle_f_fragde VALUES ('HUF', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P2', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MDDP4', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P4-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-P4-M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-COMPLETED+G', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1+I2D+G', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-', NULL);
INSERT INTO controle_f_fragde VALUES ('FEF', NULL);
INSERT INTO controle_f_fragde VALUES ('VRF', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFF', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-P3-P4M1-M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P4-M1', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P2-P3', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-P4', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1-P3-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-I1G+I1D', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M1_M2-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-COMPLETE', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-', NULL);
INSERT INTO controle_f_fragde VALUES ('CF', NULL);
INSERT INTO controle_f_fragde VALUES ('CR-F', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-MIND', NULL);
INSERT INTO controle_f_fragde VALUES ('TTCAF', NULL);
INSERT INTO controle_f_fragde VALUES ('MXF', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-SUBCOMPLET', NULL);
INSERT INTO controle_f_fragde VALUES ('MTPM', NULL);
INSERT INTO controle_f_fragde VALUES ('MCPM', NULL);
INSERT INTO controle_f_fragde VALUES ('FEMP', NULL);
INSERT INTO controle_f_fragde VALUES ('TIFMP', NULL);
INSERT INTO controle_f_fragde VALUES ('MD-M1-M3', NULL);
INSERT INTO controle_f_fragde VALUES ('MX-P3-M1-M2', NULL);
INSERT INTO controle_f_fragde VALUES ('UNE', NULL);
INSERT INTO controle_f_fragde VALUES ('PVXF', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCMP', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCDM', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCM', NULL);
INSERT INTO controle_f_fragde VALUES ('CMCMD', NULL);
INSERT INTO controle_f_fragde VALUES ('RDE', NULL);
INSERT INTO controle_f_fragde VALUES ('CS-SC-PM', NULL);
INSERT INTO controle_f_fragde VALUES ('SCSE', NULL);
INSERT INTO controle_f_fragde VALUES ('VE-F', NULL);
INSERT INTO controle_f_fragde VALUES ('FE', NULL);
INSERT INTO controle_f_fragde VALUES ('FIB', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTD', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTM', NULL);
INSERT INTO controle_f_fragde VALUES ('TMTE', NULL);
INSERT INTO controle_f_fragde VALUES ('TITDM', NULL);
INSERT INTO controle_f_fragde VALUES ('TTS-MD', NULL);
INSERT INTO controle_f_fragde VALUES ('TITP', NULL);
INSERT INTO controle_f_fragde VALUES ('TITPM', NULL);
INSERT INTO controle_f_fragde VALUES ('STF', NULL);
INSERT INTO controle_f_fragde VALUES ('CSST', NULL);
INSERT INTO controle_f_fragde VALUES ('COSE', NULL);
INSERT INTO controle_f_fragde VALUES ('COD', NULL);
INSERT INTO controle_f_fragde VALUES ('COMD', NULL);
INSERT INTO controle_f_fragde VALUES ('COM', NULL);
INSERT INTO controle_f_fragde VALUES ('TIP0DS1A2A34', NULL);


--
-- Data for Name: controle_f_fragge; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_genre VALUES ('COLUMBA', NULL);
INSERT INTO controle_f_genre VALUES ('VIPERA', NULL);
INSERT INTO controle_f_genre VALUES ('NATRIX', NULL);
INSERT INTO controle_f_genre VALUES ('CORONELLA', NULL);
INSERT INTO controle_f_genre VALUES ('COLUBER', NULL);
INSERT INTO controle_f_genre VALUES ('MALPOLON', NULL);
INSERT INTO controle_f_genre VALUES ('ELAPHE', NULL);
INSERT INTO controle_f_genre VALUES ('ANGUIS', NULL);
INSERT INTO controle_f_genre VALUES ('LACERTA', NULL);
INSERT INTO controle_f_genre VALUES ('TRINGA', NULL);
INSERT INTO controle_f_genre VALUES ('MICROTUS', NULL);
INSERT INTO controle_f_genre VALUES ('APODEMUS', NULL);
INSERT INTO controle_f_genre VALUES ('ARVICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('PLIOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('TERRICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('CLETHRIONOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('GLIS', NULL);
INSERT INTO controle_f_genre VALUES ('ELIOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('CRICETUS', NULL);
INSERT INTO controle_f_genre VALUES ('MUSCARDINUS', NULL);
INSERT INTO controle_f_genre VALUES ('LAGURUS', NULL);
INSERT INTO controle_f_genre VALUES ('PYRRHOCORAX', NULL);
INSERT INTO controle_f_genre VALUES ('GARRULUS', NULL);
INSERT INTO controle_f_genre VALUES ('PELODYTES', NULL);
INSERT INTO controle_f_genre VALUES ('HYLA', NULL);
INSERT INTO controle_f_genre VALUES ('BUFO', NULL);
INSERT INTO controle_f_genre VALUES ('AQUILA', NULL);
INSERT INTO controle_f_genre VALUES ('STRIX', NULL);
INSERT INTO controle_f_genre VALUES ('OTUS', NULL);
INSERT INTO controle_f_genre VALUES ('ASIO', NULL);
INSERT INTO controle_f_genre VALUES ('AEGOLIUS', NULL);
INSERT INTO controle_f_genre VALUES ('ATHENE', NULL);
INSERT INTO controle_f_genre VALUES ('BUBO', NULL);
INSERT INTO controle_f_genre VALUES ('HIERAAETUS', NULL);
INSERT INTO controle_f_genre VALUES ('CIRCUS', NULL);
INSERT INTO controle_f_genre VALUES ('FALCO', NULL);
INSERT INTO controle_f_genre VALUES ('CF.BUTEO', NULL);
INSERT INTO controle_f_genre VALUES ('AEGYPIUS', NULL);
INSERT INTO controle_f_genre VALUES ('GYPAETUS', NULL);
INSERT INTO controle_f_genre VALUES ('COTURNIX', NULL);
INSERT INTO controle_f_genre VALUES ('CORVUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALECTORIS', NULL);
INSERT INTO controle_f_genre VALUES ('RANA', NULL);
INSERT INTO controle_f_genre VALUES ('PERDIX', NULL);
INSERT INTO controle_f_genre VALUES ('TURDUS', NULL);
INSERT INTO controle_f_genre VALUES ('PICA', NULL);
INSERT INTO controle_f_genre VALUES ('CUCULUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALAUDA', NULL);
INSERT INTO controle_f_genre VALUES ('CREX', NULL);
INSERT INTO controle_f_genre VALUES ('NYCTEA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.CARDUELIS', NULL);
INSERT INTO controle_f_genre VALUES ('CARDUELIS', NULL);
INSERT INTO controle_f_genre VALUES ('MOTACILLA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.RALLUS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.FICEDULA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.NUCIFRAGA', NULL);
INSERT INTO controle_f_genre VALUES ('PHYLLOSCOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('EMBERIZA', NULL);
INSERT INTO controle_f_genre VALUES ('HIRUNDO', NULL);
INSERT INTO controle_f_genre VALUES ('CHLIDONIAS', NULL);
INSERT INTO controle_f_genre VALUES ('HALIAETUS', NULL);
INSERT INTO controle_f_genre VALUES ('SCOLOPAX', NULL);
INSERT INTO controle_f_genre VALUES ('STERNA', NULL);
INSERT INTO controle_f_genre VALUES ('FRATERCULA', NULL);
INSERT INTO controle_f_genre VALUES ('URIA', NULL);
INSERT INTO controle_f_genre VALUES ('PLUVIALIS', NULL);
INSERT INTO controle_f_genre VALUES ('CHARADRIUS', NULL);
INSERT INTO controle_f_genre VALUES ('LARUS', NULL);
INSERT INTO controle_f_genre VALUES ('MONTIFRINGILLA', NULL);
INSERT INTO controle_f_genre VALUES ('PETRONIA', NULL);
INSERT INTO controle_f_genre VALUES ('OENANTHE', NULL);
INSERT INTO controle_f_genre VALUES ('PHOENICURUS', NULL);
INSERT INTO controle_f_genre VALUES ('ERITHACUS', NULL);
INSERT INTO controle_f_genre VALUES ('DELICHON', NULL);
INSERT INTO controle_f_genre VALUES ('CINCLUS', NULL);
INSERT INTO controle_f_genre VALUES ('LOXIA', NULL);
INSERT INTO controle_f_genre VALUES ('COCCOTHRAUSTES', NULL);
INSERT INTO controle_f_genre VALUES ('PINICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('PYRRHULA', NULL);
INSERT INTO controle_f_genre VALUES ('CARPODACUS', NULL);
INSERT INTO controle_f_genre VALUES ('FRINGILLA', NULL);
INSERT INTO controle_f_genre VALUES ('PLECTROPHENAX', NULL);
INSERT INTO controle_f_genre VALUES ('ANTHUS', NULL);
INSERT INTO controle_f_genre VALUES ('STURNUS', NULL);
INSERT INTO controle_f_genre VALUES ('LULLULA', NULL);
INSERT INTO controle_f_genre VALUES ('GALERIDA', NULL);
INSERT INTO controle_f_genre VALUES ('APUS', NULL);
INSERT INTO controle_f_genre VALUES ('GALLUS', NULL);
INSERT INTO controle_f_genre VALUES ('RALLUS', NULL);
INSERT INTO controle_f_genre VALUES ('DENDROCOPOS', NULL);
INSERT INTO controle_f_genre VALUES ('AYTHYA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.ANAS', NULL);
INSERT INTO controle_f_genre VALUES ('ANAS', NULL);
INSERT INTO controle_f_genre VALUES ('BUCEPHALA', NULL);
INSERT INTO controle_f_genre VALUES ('MACULARIA', NULL);
INSERT INTO controle_f_genre VALUES ('ORYCTOLAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('CHONDRINA', NULL);
INSERT INTO controle_f_genre VALUES ('CANDIDULA', NULL);
INSERT INTO controle_f_genre VALUES ('HELICODONTA', NULL);
INSERT INTO controle_f_genre VALUES ('RUMINA', NULL);
INSERT INTO controle_f_genre VALUES ('CEPAEA', NULL);
INSERT INTO controle_f_genre VALUES ('CLAUSILIA', NULL);
INSERT INTO controle_f_genre VALUES ('HELICELLA', NULL);
INSERT INTO controle_f_genre VALUES ('JAMINIA', NULL);
INSERT INTO controle_f_genre VALUES ('OXYCHILUS', NULL);
INSERT INTO controle_f_genre VALUES ('RETINELLA', NULL);
INSERT INTO controle_f_genre VALUES ('EOBANIA', NULL);
INSERT INTO controle_f_genre VALUES ('CERVUS', NULL);
INSERT INTO controle_f_genre VALUES ('PUPILLA', NULL);
INSERT INTO controle_f_genre VALUES ('CECILIOIDES', NULL);
INSERT INTO controle_f_genre VALUES ('TESTACELLA', NULL);
INSERT INTO controle_f_genre VALUES ('LIMAX', NULL);
INSERT INTO controle_f_genre VALUES ('ACICULA', NULL);
INSERT INTO controle_f_genre VALUES ('ABIDA', NULL);
INSERT INTO controle_f_genre VALUES ('TROCHOIDEA', NULL);
INSERT INTO controle_f_genre VALUES ('MONACHA', NULL);
INSERT INTO controle_f_genre VALUES ('BOS/BISON', NULL);
INSERT INTO controle_f_genre VALUES ('EQUUS', NULL);
INSERT INTO controle_f_genre VALUES ('CAPRA', NULL);
INSERT INTO controle_f_genre VALUES ('CAPREOLUS', NULL);
INSERT INTO controle_f_genre VALUES ('ELEPHAS', NULL);
INSERT INTO controle_f_genre VALUES ('BITTIUM', NULL);
INSERT INTO controle_f_genre VALUES ('BOS', NULL);
INSERT INTO controle_f_genre VALUES ('PASSER', NULL);
INSERT INTO controle_f_genre VALUES ('PRUNELLA', NULL);
INSERT INTO controle_f_genre VALUES ('SYLVIA', NULL);
INSERT INTO controle_f_genre VALUES ('LANIUS', NULL);
INSERT INTO controle_f_genre VALUES ('SERINUS', NULL);
INSERT INTO controle_f_genre VALUES ('MYTILUS', NULL);
INSERT INTO controle_f_genre VALUES ('LUCINOMA', NULL);
INSERT INTO controle_f_genre VALUES ('LIMA', NULL);
INSERT INTO controle_f_genre VALUES ('CHAMA', NULL);
INSERT INTO controle_f_genre VALUES ('CARDITA', NULL);
INSERT INTO controle_f_genre VALUES ('VENUS', NULL);
INSERT INTO controle_f_genre VALUES ('STRIARCA', NULL);
INSERT INTO controle_f_genre VALUES ('CHLAMYS', NULL);
INSERT INTO controle_f_genre VALUES ('GIBBULA', NULL);
INSERT INTO controle_f_genre VALUES ('ARCA', NULL);
INSERT INTO controle_f_genre VALUES ('ACCIPITER', NULL);
INSERT INTO controle_f_genre VALUES ('SAXICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('PTYONOPROGNE', NULL);
INSERT INTO controle_f_genre VALUES ('CAPRIMULGUS', NULL);
INSERT INTO controle_f_genre VALUES ('PICOIDES', NULL);
INSERT INTO controle_f_genre VALUES ('JYNX', NULL);
INSERT INTO controle_f_genre VALUES ('CORACIAS', NULL);
INSERT INTO controle_f_genre VALUES ('EUDROMIAS', NULL);
INSERT INTO controle_f_genre VALUES ('TETRAO', NULL);
INSERT INTO controle_f_genre VALUES ('GALLINAGO', NULL);
INSERT INTO controle_f_genre VALUES ('BUTEO', NULL);
INSERT INTO controle_f_genre VALUES ('NUMENIUS', NULL);
INSERT INTO controle_f_genre VALUES ('PORZANA', NULL);
INSERT INTO controle_f_genre VALUES ('TROGLODYTES', NULL);
INSERT INTO controle_f_genre VALUES ('CORACIA', NULL);
INSERT INTO controle_f_genre VALUES ('TRITURUS', NULL);
INSERT INTO controle_f_genre VALUES ('PODARCIS', NULL);
INSERT INTO controle_f_genre VALUES ('DAMA', NULL);
INSERT INTO controle_f_genre VALUES ('CANIS', NULL);
INSERT INTO controle_f_genre VALUES ('LITTORINA', NULL);
INSERT INTO controle_f_genre VALUES ('HOMALOPOMA', NULL);
INSERT INTO controle_f_genre VALUES ('JUJUBINUS', NULL);
INSERT INTO controle_f_genre VALUES ('PATELLA', NULL);
INSERT INTO controle_f_genre VALUES ('VEXILLUM', NULL);
INSERT INTO controle_f_genre VALUES ('IND', NULL);
INSERT INTO controle_f_genre VALUES ('CALLIOSTOMA', NULL);
INSERT INTO controle_f_genre VALUES ('VRAIA', NULL);
INSERT INTO controle_f_genre VALUES ('CALLISTA', NULL);
INSERT INTO controle_f_genre VALUES ('CLANCULUS', NULL);
INSERT INTO controle_f_genre VALUES ('PECTENIDAE', NULL);
INSERT INTO controle_f_genre VALUES ('MONODONTA', NULL);
INSERT INTO controle_f_genre VALUES ('NASSARIUS', NULL);
INSERT INTO controle_f_genre VALUES ('TRIVIA', NULL);
INSERT INTO controle_f_genre VALUES ('RISSOA', NULL);
INSERT INTO controle_f_genre VALUES ('DIODORA', NULL);
INSERT INTO controle_f_genre VALUES ('COLUMBELLA', NULL);
INSERT INTO controle_f_genre VALUES ('FUSINUS', NULL);
INSERT INTO controle_f_genre VALUES ('TRICOLIA', NULL);
INSERT INTO controle_f_genre VALUES ('PECTINIDAE', NULL);
INSERT INTO controle_f_genre VALUES ('MITRA', NULL);
INSERT INTO controle_f_genre VALUES ('EROSARIA', NULL);
INSERT INTO controle_f_genre VALUES ('MELARAPHE', NULL);
INSERT INTO controle_f_genre VALUES ('TUBERCULATA', NULL);
INSERT INTO controle_f_genre VALUES ('SPONDYLUS', NULL);
INSERT INTO controle_f_genre VALUES ('OSTREA', NULL);
INSERT INTO controle_f_genre VALUES ('PANTHERA', NULL);
INSERT INTO controle_f_genre VALUES ('ALVANIA', NULL);
INSERT INTO controle_f_genre VALUES ('RUPICAPRA', NULL);
INSERT INTO controle_f_genre VALUES ('SUS', NULL);
INSERT INTO controle_f_genre VALUES ('BISON', NULL);
INSERT INTO controle_f_genre VALUES ('DICERORHINUS', NULL);
INSERT INTO controle_f_genre VALUES ('LYNX', NULL);
INSERT INTO controle_f_genre VALUES ('URSUS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.RUPICAPRA', NULL);
INSERT INTO controle_f_genre VALUES ('VULPES', NULL);
INSERT INTO controle_f_genre VALUES ('MARMOTA', NULL);
INSERT INTO controle_f_genre VALUES ('TALPA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.EQUUS', NULL);
INSERT INTO controle_f_genre VALUES ('TARENTOLA', NULL);
INSERT INTO controle_f_genre VALUES ('PUFFINUS', NULL);
INSERT INTO controle_f_genre VALUES ('CF. AYTHYA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.CHARADRIUS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.EUDROMIAS', NULL);
INSERT INTO controle_f_genre VALUES ('CF. CALIDRIS', NULL);
INSERT INTO controle_f_genre VALUES ('HOMO', NULL);
INSERT INTO controle_f_genre VALUES ('COELODONTA', NULL);
INSERT INTO controle_f_genre VALUES ('PELOBATES', NULL);
INSERT INTO controle_f_genre VALUES ('MUSCICAPA', NULL);
INSERT INTO controle_f_genre VALUES ('CF.TURDUS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.AEGYPIUS', NULL);
INSERT INTO controle_f_genre VALUES ('RANGIFER', NULL);
INSERT INTO controle_f_genre VALUES ('MEGALOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('RATTUS', NULL);
INSERT INTO controle_f_genre VALUES ('MUS', NULL);
INSERT INTO controle_f_genre VALUES ('SOREX', NULL);
INSERT INTO controle_f_genre VALUES ('CROCIDURA', NULL);
INSERT INTO controle_f_genre VALUES ('NEOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('RHINOLOPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('MINIOPTERUS', NULL);
INSERT INTO controle_f_genre VALUES ('BARBASTELLA', NULL);
INSERT INTO controle_f_genre VALUES ('MYOTIS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.CANIS', NULL);
INSERT INTO controle_f_genre VALUES ('PANTHERA LEO', NULL);
INSERT INTO controle_f_genre VALUES ('MELES', NULL);
INSERT INTO controle_f_genre VALUES ('FELIS', NULL);
INSERT INTO controle_f_genre VALUES ('CF.DAMA', NULL);
INSERT INTO controle_f_genre VALUES ('BURHINUS', NULL);
INSERT INTO controle_f_genre VALUES ('MACACA', NULL);
INSERT INTO controle_f_genre VALUES ('PONGO', NULL);
INSERT INTO controle_f_genre VALUES ('GORILLA', NULL);
INSERT INTO controle_f_genre VALUES ('PAN', NULL);
INSERT INTO controle_f_genre VALUES ('AUSTRALOPITHECUS', NULL);
INSERT INTO controle_f_genre VALUES ('EUROPAEUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALGIRUS', NULL);
INSERT INTO controle_f_genre VALUES ('DAVIDI', NULL);
INSERT INTO controle_f_genre VALUES ('HEMIECHINUS', NULL);
INSERT INTO controle_f_genre VALUES ('GALEMYS', NULL);
INSERT INTO controle_f_genre VALUES ('DESMANA', NULL);
INSERT INTO controle_f_genre VALUES ('SUNCUS', NULL);
INSERT INTO controle_f_genre VALUES ('MYOSOREX', NULL);
INSERT INTO controle_f_genre VALUES ('DEPRANOSOREX', NULL);
INSERT INTO controle_f_genre VALUES ('PETENYIA', NULL);
INSERT INTO controle_f_genre VALUES ('DEINSDORFIA', NULL);
INSERT INTO controle_f_genre VALUES ('BLARINELLA', NULL);
INSERT INTO controle_f_genre VALUES ('BERENENDIA', NULL);
INSERT INTO controle_f_genre VALUES ('EPISORICULUS', NULL);
INSERT INTO controle_f_genre VALUES ('SORICULUS', NULL);
INSERT INTO controle_f_genre VALUES ('BLARINOIDES', NULL);
INSERT INTO controle_f_genre VALUES ('TADARIDA', NULL);
INSERT INTO controle_f_genre VALUES ('SAUROMYS', NULL);
INSERT INTO controle_f_genre VALUES ('VESPERTILIO', NULL);
INSERT INTO controle_f_genre VALUES ('EPTESICUS', NULL);
INSERT INTO controle_f_genre VALUES ('NYCTALUS', NULL);
INSERT INTO controle_f_genre VALUES ('PIPISTRELLUS', NULL);
INSERT INTO controle_f_genre VALUES ('PLECOTUS', NULL);
INSERT INTO controle_f_genre VALUES ('LASIURUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALLOPHAIOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('DYNAROMYS', NULL);
INSERT INTO controle_f_genre VALUES ('ONDRATA', NULL);
INSERT INTO controle_f_genre VALUES ('LEMMUS', NULL);
INSERT INTO controle_f_genre VALUES ('MYOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('DICROSTONYX', NULL);
INSERT INTO controle_f_genre VALUES ('ELLOBIUS', NULL);
INSERT INTO controle_f_genre VALUES ('MIMOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('UNGAROMYS', NULL);
INSERT INTO controle_f_genre VALUES ('SPALAX', NULL);
INSERT INTO controle_f_genre VALUES ('PROSIPHNEUS', NULL);
INSERT INTO controle_f_genre VALUES ('MYOSPALAX', NULL);
INSERT INTO controle_f_genre VALUES ('SICISTA', NULL);
INSERT INTO controle_f_genre VALUES ('ALLACTAGA', NULL);
INSERT INTO controle_f_genre VALUES ('VILLANYIA', NULL);
INSERT INTO controle_f_genre VALUES ('MESOCRICETUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALLOCRICETUS', NULL);
INSERT INTO controle_f_genre VALUES ('PEROMYSCUS', NULL);
INSERT INTO controle_f_genre VALUES ('CRICETULUS', NULL);
INSERT INTO controle_f_genre VALUES ('MERIONES', NULL);
INSERT INTO controle_f_genre VALUES ('CRICETINUS', NULL);
INSERT INTO controle_f_genre VALUES ('CASTOR', NULL);
INSERT INTO controle_f_genre VALUES ('TROGONTHERIUM', NULL);
INSERT INTO controle_f_genre VALUES ('MYOCASTOR', NULL);
INSERT INTO controle_f_genre VALUES ('HYSTRIX', NULL);
INSERT INTO controle_f_genre VALUES ('GLIRULUS', NULL);
INSERT INTO controle_f_genre VALUES ('MYOMIMUS', NULL);
INSERT INTO controle_f_genre VALUES ('DRYOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('SCIURUS', NULL);
INSERT INTO controle_f_genre VALUES ('PTEROMYS', NULL);
INSERT INTO controle_f_genre VALUES ('TAMIAS', NULL);
INSERT INTO controle_f_genre VALUES ('CITELLUS', NULL);
INSERT INTO controle_f_genre VALUES ('CYNONYS', NULL);
INSERT INTO controle_f_genre VALUES ('RHAGAMYS', NULL);
INSERT INTO controle_f_genre VALUES ('ACOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('MICROMYS', NULL);
INSERT INTO controle_f_genre VALUES ('LEMNISCONYS', NULL);
INSERT INTO controle_f_genre VALUES ('HYDROCHOERUS', NULL);
INSERT INTO controle_f_genre VALUES ('LEPUS', NULL);
INSERT INTO controle_f_genre VALUES ('HYPOLAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('OCHOTONOIDES', NULL);
INSERT INTO controle_f_genre VALUES ('PROLAGOMYS', NULL);
INSERT INTO controle_f_genre VALUES ('OCHOTONA', NULL);
INSERT INTO controle_f_genre VALUES ('PROLAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('MUSTELA', NULL);
INSERT INTO controle_f_genre VALUES ('MARTES', NULL);
INSERT INTO controle_f_genre VALUES ('GULO', NULL);
INSERT INTO controle_f_genre VALUES ('LUTRA', NULL);
INSERT INTO controle_f_genre VALUES ('GALICTIS', NULL);
INSERT INTO controle_f_genre VALUES ('MEPHITIS', NULL);
INSERT INTO controle_f_genre VALUES ('BARANOGALE', NULL);
INSERT INTO controle_f_genre VALUES ('VORMELA', NULL);
INSERT INTO controle_f_genre VALUES ('PANONICTIS', NULL);
INSERT INTO controle_f_genre VALUES ('MELLIVORA', NULL);
INSERT INTO controle_f_genre VALUES ('ENHYDRA', NULL);
INSERT INTO controle_f_genre VALUES ('CUON', NULL);
INSERT INTO controle_f_genre VALUES ('FENNECUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALOPEX', NULL);
INSERT INTO controle_f_genre VALUES ('NYCTEREUTES', NULL);
INSERT INTO controle_f_genre VALUES ('LYCAON', NULL);
INSERT INTO controle_f_genre VALUES ('AILURUS', NULL);
INSERT INTO controle_f_genre VALUES ('HELARCTOS', NULL);
INSERT INTO controle_f_genre VALUES ('TREMARCTOS', NULL);
INSERT INTO controle_f_genre VALUES ('MELUSUS', NULL);
INSERT INTO controle_f_genre VALUES ('PLIONARCTOS', NULL);
INSERT INTO controle_f_genre VALUES ('ACINONYX', NULL);
INSERT INTO controle_f_genre VALUES ('CARACAL', NULL);
INSERT INTO controle_f_genre VALUES ('PUMA', NULL);
INSERT INTO controle_f_genre VALUES ('HOMOTHERIUM', NULL);
INSERT INTO controle_f_genre VALUES ('MACHAIRODUS', NULL);
INSERT INTO controle_f_genre VALUES ('MEGANTERON', NULL);
INSERT INTO controle_f_genre VALUES ('GENETTA', NULL);
INSERT INTO controle_f_genre VALUES ('HERPESTES', NULL);
INSERT INTO controle_f_genre VALUES ('VIVERRA', NULL);
INSERT INTO controle_f_genre VALUES ('MUNGO', NULL);
INSERT INTO controle_f_genre VALUES ('FOSSA', NULL);
INSERT INTO controle_f_genre VALUES ('SURICATA', NULL);
INSERT INTO controle_f_genre VALUES ('CROCUTA', NULL);
INSERT INTO controle_f_genre VALUES ('HYAENA', NULL);
INSERT INTO controle_f_genre VALUES ('PROTELES', NULL);
INSERT INTO controle_f_genre VALUES ('EURYBOAS', NULL);
INSERT INTO controle_f_genre VALUES ('ODOBAENUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHOCA', NULL);
INSERT INTO controle_f_genre VALUES ('PUSA', NULL);
INSERT INTO controle_f_genre VALUES ('PAGOPHILUS', NULL);
INSERT INTO controle_f_genre VALUES ('HALICHOERUS', NULL);
INSERT INTO controle_f_genre VALUES ('ERIGNATHUS', NULL);
INSERT INTO controle_f_genre VALUES ('CYSTOPHORA', NULL);
INSERT INTO controle_f_genre VALUES ('MONACHUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHACOCHOERUS', NULL);
INSERT INTO controle_f_genre VALUES ('HIPPOPOTAMUS', NULL);
INSERT INTO controle_f_genre VALUES ('CAMELUS', NULL);
INSERT INTO controle_f_genre VALUES ('LAMA', NULL);
INSERT INTO controle_f_genre VALUES ('GIRAFFA', NULL);
INSERT INTO controle_f_genre VALUES ('OKAPIA', NULL);
INSERT INTO controle_f_genre VALUES ('SIVATHERIUM', NULL);
INSERT INTO controle_f_genre VALUES ('CROIZETOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('EUCLADOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('ALCES', NULL);
INSERT INTO controle_f_genre VALUES ('PRAEMEGACEROS', NULL);
INSERT INTO controle_f_genre VALUES ('ARVERNOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('MUNTIACUS', NULL);
INSERT INTO controle_f_genre VALUES ('ELAPHURUS', NULL);
INSERT INTO controle_f_genre VALUES ('AXIS', NULL);
INSERT INTO controle_f_genre VALUES ('HYELOPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('SIKA', NULL);
INSERT INTO controle_f_genre VALUES ('RUCERVUS', NULL);
INSERT INTO controle_f_genre VALUES ('PRJEVALSKIUM', NULL);
INSERT INTO controle_f_genre VALUES ('PUDU', NULL);
INSERT INTO controle_f_genre VALUES ('OZOTOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('MAZAMA', NULL);
INSERT INTO controle_f_genre VALUES ('ODOCOILEUS', NULL);
INSERT INTO controle_f_genre VALUES ('HYDROPOTES', NULL);
INSERT INTO controle_f_genre VALUES ('ANTILOCAPRA', NULL);
INSERT INTO controle_f_genre VALUES ('LEPTOBOS', NULL);
INSERT INTO controle_f_genre VALUES ('BUBALUS', NULL);
INSERT INTO controle_f_genre VALUES ('SYNCERUS', NULL);
INSERT INTO controle_f_genre VALUES ('SOERGILIA', NULL);
INSERT INTO controle_f_genre VALUES ('OVIBOS', NULL);
INSERT INTO controle_f_genre VALUES ('PRAEOVIBOS', NULL);
INSERT INTO controle_f_genre VALUES ('GAZELLOSPIRA', NULL);
INSERT INTO controle_f_genre VALUES ('ALCELAPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('ANTIDORCAS', NULL);
INSERT INTO controle_f_genre VALUES ('ADDAX', NULL);
INSERT INTO controle_f_genre VALUES ('BOSELAPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('GAZELLA', NULL);
INSERT INTO controle_f_genre VALUES ('CONNOCHAETES', NULL);
INSERT INTO controle_f_genre VALUES ('DAMALISCUS', NULL);
INSERT INTO controle_f_genre VALUES ('HIPPOTRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('KOBUS', NULL);
INSERT INTO controle_f_genre VALUES ('ORYX', NULL);
INSERT INTO controle_f_genre VALUES ('SYLVICAPRA', NULL);
INSERT INTO controle_f_genre VALUES ('TAUROTRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('TRAGELAPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('SAIGA', NULL);
INSERT INTO controle_f_genre VALUES ('MYOTRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('GALLOGORAL', NULL);
INSERT INTO controle_f_genre VALUES ('PROCAMPTOCERAS', NULL);
INSERT INTO controle_f_genre VALUES ('OVIS', NULL);
INSERT INTO controle_f_genre VALUES ('MEGALOVIS', NULL);
INSERT INTO controle_f_genre VALUES ('AMNOTRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('HEMITRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('PLIOTRAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('HIPPARION', NULL);
INSERT INTO controle_f_genre VALUES ('TAPIRUS', NULL);
INSERT INTO controle_f_genre VALUES ('COELONDONTA', NULL);
INSERT INTO controle_f_genre VALUES ('ELASMOTHERIUM', NULL);
INSERT INTO controle_f_genre VALUES ('DICEROS', NULL);
INSERT INTO controle_f_genre VALUES ('RHINOCEROS', NULL);
INSERT INTO controle_f_genre VALUES ('CERAROTHERIUM', NULL);
INSERT INTO controle_f_genre VALUES ('STEPHANORHINUS', NULL);
INSERT INTO controle_f_genre VALUES ('ANANCUS', NULL);
INSERT INTO controle_f_genre VALUES ('LOXODONTA', NULL);
INSERT INTO controle_f_genre VALUES ('MAMMUTHUS', NULL);
INSERT INTO controle_f_genre VALUES ('DELPHINUS', NULL);
INSERT INTO controle_f_genre VALUES ('TURSIOPS', NULL);
INSERT INTO controle_f_genre VALUES ('GLOBICEPHALA', NULL);
INSERT INTO controle_f_genre VALUES ('GRAMPUS', NULL);
INSERT INTO controle_f_genre VALUES ('ORCINUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHOCAENA', NULL);
INSERT INTO controle_f_genre VALUES ('DELPHINAPTERUS', NULL);
INSERT INTO controle_f_genre VALUES ('MONODON', NULL);
INSERT INTO controle_f_genre VALUES ('PHYSETER', NULL);
INSERT INTO controle_f_genre VALUES ('HYPEROODON', NULL);
INSERT INTO controle_f_genre VALUES ('ZYPHIUS', NULL);
INSERT INTO controle_f_genre VALUES ('BALAENOPTERA', NULL);
INSERT INTO controle_f_genre VALUES ('MEGAPTERA', NULL);
INSERT INTO controle_f_genre VALUES ('BALAENA', NULL);
INSERT INTO controle_f_genre VALUES ('GAVIA', NULL);
INSERT INTO controle_f_genre VALUES ('PODICEPS', NULL);
INSERT INTO controle_f_genre VALUES ('TACHYBAPTUS', NULL);
INSERT INTO controle_f_genre VALUES ('PODILYMBUS', NULL);
INSERT INTO controle_f_genre VALUES ('DIOMEDEA', NULL);
INSERT INTO controle_f_genre VALUES ('OCEANODROMA', NULL);
INSERT INTO controle_f_genre VALUES ('OCEANITES', NULL);
INSERT INTO controle_f_genre VALUES ('HYDROBATES', NULL);
INSERT INTO controle_f_genre VALUES ('PELAGODROMA', NULL);
INSERT INTO controle_f_genre VALUES ('BULWERIA', NULL);
INSERT INTO controle_f_genre VALUES ('PTERODROMA', NULL);
INSERT INTO controle_f_genre VALUES ('FULMARUS', NULL);
INSERT INTO controle_f_genre VALUES ('CALONECTRIS', NULL);
INSERT INTO controle_f_genre VALUES ('SULA ', NULL);
INSERT INTO controle_f_genre VALUES ('PELECANUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHALACROCORAX', NULL);
INSERT INTO controle_f_genre VALUES ('BOTAURUS', NULL);
INSERT INTO controle_f_genre VALUES ('IXOBRYCHUS', NULL);
INSERT INTO controle_f_genre VALUES ('ARDEOLA', NULL);
INSERT INTO controle_f_genre VALUES ('NYCTICORAX', NULL);
INSERT INTO controle_f_genre VALUES ('BULBUCUS', NULL);
INSERT INTO controle_f_genre VALUES ('EGRETTA', NULL);
INSERT INTO controle_f_genre VALUES ('ARDEA', NULL);
INSERT INTO controle_f_genre VALUES ('PLATALEA', NULL);
INSERT INTO controle_f_genre VALUES ('PLEGADIS', NULL);
INSERT INTO controle_f_genre VALUES ('THRESKIORNIS', NULL);
INSERT INTO controle_f_genre VALUES ('GERONTICUS', NULL);
INSERT INTO controle_f_genre VALUES ('CICONIA', NULL);
INSERT INTO controle_f_genre VALUES ('PHOENICOPTRUS', NULL);
INSERT INTO controle_f_genre VALUES ('CYGNUS', NULL);
INSERT INTO controle_f_genre VALUES ('BRANTA', NULL);
INSERT INTO controle_f_genre VALUES ('ANSER', NULL);
INSERT INTO controle_f_genre VALUES ('MARMARONETTA', NULL);
INSERT INTO controle_f_genre VALUES ('ALOPOCHEN', NULL);
INSERT INTO controle_f_genre VALUES ('AIX', NULL);
INSERT INTO controle_f_genre VALUES ('TADORNA', NULL);
INSERT INTO controle_f_genre VALUES ('NETTA', NULL);
INSERT INTO controle_f_genre VALUES ('HISTRIONICUS', NULL);
INSERT INTO controle_f_genre VALUES ('CLANGULA', NULL);
INSERT INTO controle_f_genre VALUES ('MELANITTA', NULL);
INSERT INTO controle_f_genre VALUES ('SOMATERIA', NULL);
INSERT INTO controle_f_genre VALUES ('POLYCTICTA', NULL);
INSERT INTO controle_f_genre VALUES ('MERGUS', NULL);
INSERT INTO controle_f_genre VALUES ('OXYURA', NULL);
INSERT INTO controle_f_genre VALUES ('NEOPHRON', NULL);
INSERT INTO controle_f_genre VALUES ('GYPS', NULL);
INSERT INTO controle_f_genre VALUES ('HALIAEETUS', NULL);
INSERT INTO controle_f_genre VALUES ('CIRCAETUS', NULL);
INSERT INTO controle_f_genre VALUES ('PERNIS', NULL);
INSERT INTO controle_f_genre VALUES ('MILVUS', NULL);
INSERT INTO controle_f_genre VALUES ('ELANUS', NULL);
INSERT INTO controle_f_genre VALUES ('PANDION', NULL);
INSERT INTO controle_f_genre VALUES ('LAGOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('TETRAOGALLUS', NULL);
INSERT INTO controle_f_genre VALUES ('BONASA', NULL);
INSERT INTO controle_f_genre VALUES ('FRANCOLINUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHASIANUS', NULL);
INSERT INTO controle_f_genre VALUES ('CHRYSOLOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('TURNIX', NULL);
INSERT INTO controle_f_genre VALUES ('GRUS', NULL);
INSERT INTO controle_f_genre VALUES ('ANTHROPOIDES', NULL);
INSERT INTO controle_f_genre VALUES ('OTIS', NULL);
INSERT INTO controle_f_genre VALUES ('TETRAX', NULL);
INSERT INTO controle_f_genre VALUES ('CHLAMYDOTIS', NULL);
INSERT INTO controle_f_genre VALUES ('PORPHYRIO', NULL);
INSERT INTO controle_f_genre VALUES ('PORPHYRULLA', NULL);
INSERT INTO controle_f_genre VALUES ('GALLINULA', NULL);
INSERT INTO controle_f_genre VALUES ('FULICA', NULL);
INSERT INTO controle_f_genre VALUES ('SYRRHAPTES', NULL);
INSERT INTO controle_f_genre VALUES ('PTEROCLES', NULL);
INSERT INTO controle_f_genre VALUES ('STREPTOPELIA', NULL);
INSERT INTO controle_f_genre VALUES ('CLAMATOR', NULL);
INSERT INTO controle_f_genre VALUES ('COCCYZUS', NULL);
INSERT INTO controle_f_genre VALUES ('TYTO', NULL);
INSERT INTO controle_f_genre VALUES ('GLAUCIDIUM', NULL);
INSERT INTO controle_f_genre VALUES ('CHORDEILES', NULL);
INSERT INTO controle_f_genre VALUES ('ALCEDO', NULL);
INSERT INTO controle_f_genre VALUES ('CERYLE', NULL);
INSERT INTO controle_f_genre VALUES ('MEROPS', NULL);
INSERT INTO controle_f_genre VALUES ('UPUPA', NULL);
INSERT INTO controle_f_genre VALUES ('PICUS', NULL);
INSERT INTO controle_f_genre VALUES ('DENDROCOPS', NULL);
INSERT INTO controle_f_genre VALUES ('DRYOCOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('HAEMATOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('VANELLUS', NULL);
INSERT INTO controle_f_genre VALUES ('HOPLOPTERUS', NULL);
INSERT INTO controle_f_genre VALUES ('CHETTUSIA', NULL);
INSERT INTO controle_f_genre VALUES ('ARENARIA', NULL);
INSERT INTO controle_f_genre VALUES ('CALIDRIS', NULL);
INSERT INTO controle_f_genre VALUES ('LIMICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('LIMNODROMUS', NULL);
INSERT INTO controle_f_genre VALUES ('MICROPALAMA', NULL);
INSERT INTO controle_f_genre VALUES ('LYMNOCRYPTES', NULL);
INSERT INTO controle_f_genre VALUES ('PHALAROPUS', NULL);
INSERT INTO controle_f_genre VALUES ('STERCORARIUS', NULL);
INSERT INTO controle_f_genre VALUES ('PAGOPHILA', NULL);
INSERT INTO controle_f_genre VALUES ('RHODOSTHETIA', NULL);
INSERT INTO controle_f_genre VALUES ('RISSA', NULL);
INSERT INTO controle_f_genre VALUES ('LIMOSA', NULL);
INSERT INTO controle_f_genre VALUES ('ACTITIS', NULL);
INSERT INTO controle_f_genre VALUES ('XENUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHILOMACHUS', NULL);
INSERT INTO controle_f_genre VALUES ('TRYNGITES', NULL);
INSERT INTO controle_f_genre VALUES ('BARTRAMIA', NULL);
INSERT INTO controle_f_genre VALUES ('RECURVIROSTRA', NULL);
INSERT INTO controle_f_genre VALUES ('HIMANTOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('CURSORIUS', NULL);
INSERT INTO controle_f_genre VALUES ('GLAEROLA', NULL);
INSERT INTO controle_f_genre VALUES ('GELOCHELIDON', NULL);
INSERT INTO controle_f_genre VALUES ('ALCA', NULL);
INSERT INTO controle_f_genre VALUES ('ALLE', NULL);
INSERT INTO controle_f_genre VALUES ('CEPHUS', NULL);
INSERT INTO controle_f_genre VALUES ('CHERSOPHILUS', NULL);
INSERT INTO controle_f_genre VALUES ('CALANDRELLA', NULL);
INSERT INTO controle_f_genre VALUES ('MELANOCRYPHA', NULL);
INSERT INTO controle_f_genre VALUES ('EREMOPHILA', NULL);
INSERT INTO controle_f_genre VALUES ('RIPARIA', NULL);
INSERT INTO controle_f_genre VALUES ('ORIOLUS', NULL);
INSERT INTO controle_f_genre VALUES ('BOMBYCILLA', NULL);
INSERT INTO controle_f_genre VALUES ('PERISOREUS', NULL);
INSERT INTO controle_f_genre VALUES ('CYANOPICA', NULL);
INSERT INTO controle_f_genre VALUES ('NUCIFRAGA', NULL);
INSERT INTO controle_f_genre VALUES ('CETTIA', NULL);
INSERT INTO controle_f_genre VALUES ('LOCUSTELLA', NULL);
INSERT INTO controle_f_genre VALUES ('ACROCEPHALUS', NULL);
INSERT INTO controle_f_genre VALUES ('CISTICOLA', NULL);
INSERT INTO controle_f_genre VALUES ('HIPPOLAIS', NULL);
INSERT INTO controle_f_genre VALUES ('CERCOTRICHAS', NULL);
INSERT INTO controle_f_genre VALUES ('REGULUS', NULL);
INSERT INTO controle_f_genre VALUES ('CATHARUS', NULL);
INSERT INTO controle_f_genre VALUES ('ZOOTHERA', NULL);
INSERT INTO controle_f_genre VALUES ('PARUS', NULL);
INSERT INTO controle_f_genre VALUES ('AEGITHALOS', NULL);
INSERT INTO controle_f_genre VALUES ('REMIZ', NULL);
INSERT INTO controle_f_genre VALUES ('SITTA', NULL);
INSERT INTO controle_f_genre VALUES ('TICHODROMA', NULL);
INSERT INTO controle_f_genre VALUES ('CERTHIA', NULL);
INSERT INTO controle_f_genre VALUES ('BUCANETES', NULL);
INSERT INTO controle_f_genre VALUES ('MILARIA', NULL);
INSERT INTO controle_f_genre VALUES ('CALCARIUS', NULL);
INSERT INTO controle_f_genre VALUES ('MUSICAPA', NULL);
INSERT INTO controle_f_genre VALUES ('FICEDULA', NULL);
INSERT INTO controle_f_genre VALUES ('ACANTHOCHITONA', NULL);
INSERT INTO controle_f_genre VALUES ('BARLEEIA', NULL);
INSERT INTO controle_f_genre VALUES ('CYCLOPE', NULL);
INSERT INTO controle_f_genre VALUES ('POLLIA', NULL);
INSERT INTO controle_f_genre VALUES ('PISANIA', NULL);
INSERT INTO controle_f_genre VALUES ('CERITHIOPSIS', NULL);
INSERT INTO controle_f_genre VALUES ('MARSHALLORA', NULL);
INSERT INTO controle_f_genre VALUES ('FISSURELLA', NULL);
INSERT INTO controle_f_genre VALUES ('TARSIGER', NULL);
INSERT INTO controle_f_genre VALUES ('LUSCINIA', NULL);
INSERT INTO controle_f_genre VALUES ('CERITHIUM', NULL);
INSERT INTO controle_f_genre VALUES ('IRANIA', NULL);
INSERT INTO controle_f_genre VALUES ('TESTUDO', NULL);
INSERT INTO controle_f_genre VALUES ('TURRITELLA', NULL);
INSERT INTO controle_f_genre VALUES ('EMYS', NULL);
INSERT INTO controle_f_genre VALUES ('MAUREMYS', NULL);
INSERT INTO controle_f_genre VALUES ('DERMOCHELYS', NULL);
INSERT INTO controle_f_genre VALUES ('CARETTA', NULL);
INSERT INTO controle_f_genre VALUES ('LEPIDOCHELYS', NULL);
INSERT INTO controle_f_genre VALUES ('CHELONIA', NULL);
INSERT INTO controle_f_genre VALUES ('ERETHMOCHELYS', NULL);
INSERT INTO controle_f_genre VALUES ('BLANUS', NULL);
INSERT INTO controle_f_genre VALUES ('HEMIDACTYLUS', NULL);
INSERT INTO controle_f_genre VALUES ('PHYLLODACTYLUS', NULL);
INSERT INTO controle_f_genre VALUES ('CYRTODACTYLUS', NULL);
INSERT INTO controle_f_genre VALUES ('AGAMA', NULL);
INSERT INTO controle_f_genre VALUES ('ALGYROIDES', NULL);
INSERT INTO controle_f_genre VALUES ('OPHISOPS', NULL);
INSERT INTO controle_f_genre VALUES ('PSAMMODROMUS', NULL);
INSERT INTO controle_f_genre VALUES ('MUREX', NULL);
INSERT INTO controle_f_genre VALUES ('ACANTHODACTYLUS', NULL);
INSERT INTO controle_f_genre VALUES ('EREMIAS', NULL);
INSERT INTO controle_f_genre VALUES ('MURICOPSIS', NULL);
INSERT INTO controle_f_genre VALUES ('OCENEBRA', NULL);
INSERT INTO controle_f_genre VALUES ('OCINEBRINA', NULL);
INSERT INTO controle_f_genre VALUES ('MITRELLA', NULL);
INSERT INTO controle_f_genre VALUES ('MANGELIA', NULL);
INSERT INTO controle_f_genre VALUES ('POMATIAS', NULL);
INSERT INTO controle_f_genre VALUES ('GRANARIA', NULL);
INSERT INTO controle_f_genre VALUES ('SOLATOPUPA', NULL);
INSERT INTO controle_f_genre VALUES ('SUCCINEA', NULL);
INSERT INTO controle_f_genre VALUES ('DISCUS', NULL);
INSERT INTO controle_f_genre VALUES ('VITREA', NULL);
INSERT INTO controle_f_genre VALUES ('AEGOPINELLA', NULL);
INSERT INTO controle_f_genre VALUES ('XEROTRICHA', NULL);
INSERT INTO controle_f_genre VALUES ('CERNUELLA', NULL);
INSERT INTO controle_f_genre VALUES ('OPHISAURUS', NULL);
INSERT INTO controle_f_genre VALUES ('ABLEPHARUS', NULL);
INSERT INTO controle_f_genre VALUES ('OPHIOMORUS', NULL);
INSERT INTO controle_f_genre VALUES ('CHALCYDES', NULL);
INSERT INTO controle_f_genre VALUES ('TYPHLOPS', NULL);
INSERT INTO controle_f_genre VALUES ('ERYX', NULL);
INSERT INTO controle_f_genre VALUES ('ARGNA', NULL);
INSERT INTO controle_f_genre VALUES ('MACROPROTODON', NULL);
INSERT INTO controle_f_genre VALUES ('TELESCOPUS', NULL);
INSERT INTO controle_f_genre VALUES ('SALAMANDRA', NULL);
INSERT INTO controle_f_genre VALUES ('SALAMANDRINA', NULL);
INSERT INTO controle_f_genre VALUES ('CHIOGLOSSA', NULL);
INSERT INTO controle_f_genre VALUES ('PLEURODELES', NULL);
INSERT INTO controle_f_genre VALUES ('EUPROCTUS', NULL);
INSERT INTO controle_f_genre VALUES ('PROTEUS', NULL);
INSERT INTO controle_f_genre VALUES ('BOMBINA', NULL);
INSERT INTO controle_f_genre VALUES ('DISCOGLOSSUS', NULL);
INSERT INTO controle_f_genre VALUES ('ALYTES', NULL);
INSERT INTO controle_f_genre VALUES ('PLIOLAGUS', NULL);
INSERT INTO controle_f_genre VALUES ('SPELEOMANTES', NULL);
INSERT INTO controle_f_genre VALUES ('CORNU', NULL);
INSERT INTO controle_f_genre VALUES ('CHAMAELEO', NULL);
INSERT INTO controle_f_genre VALUES ('VERMETUS', NULL);
INSERT INTO controle_f_genre VALUES ('RISSOINA', NULL);
INSERT INTO controle_f_genre VALUES ('CANTAREUS', NULL);
INSERT INTO controle_f_genre VALUES ('GALBA', NULL);
INSERT INTO controle_f_genre VALUES ('SPHINCTEROCHILA', NULL);
INSERT INTO controle_f_genre VALUES ('XEROSECTA', NULL);
INSERT INTO controle_f_genre VALUES ('TONNA', NULL);
INSERT INTO controle_f_genre VALUES ('HALIOTIS', NULL);


--
-- Data for Name: controle_f_icirconference; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_icirconference VALUES ('1', NULL);
INSERT INTO controle_f_icirconference VALUES ('2', NULL);
INSERT INTO controle_f_icirconference VALUES ('3', NULL);


--
-- Data for Name: controle_f_ilongueur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_ilongueur VALUES ('1', NULL);
INSERT INTO controle_f_ilongueur VALUES ('2', NULL);
INSERT INTO controle_f_ilongueur VALUES ('3', NULL);
INSERT INTO controle_f_ilongueur VALUES ('4', NULL);


--
-- Data for Name: controle_f_lateralite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_lateralite VALUES ('D', NULL);
INSERT INTO controle_f_lateralite VALUES ('G', NULL);
INSERT INTO controle_f_lateralite VALUES ('DG', NULL);
INSERT INTO controle_f_lateralite VALUES ('I', NULL);
INSERT INTO controle_f_lateralite VALUES ('...', NULL);


--
-- Data for Name: controle_f_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_moulage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_moulage VALUES ('0', NULL);
INSERT INTO controle_f_moulage VALUES ('412', NULL);
INSERT INTO controle_f_moulage VALUES ('493', NULL);
INSERT INTO controle_f_moulage VALUES ('165', NULL);
INSERT INTO controle_f_moulage VALUES ('502', NULL);
INSERT INTO controle_f_moulage VALUES ('1', NULL);
INSERT INTO controle_f_moulage VALUES ('508', NULL);
INSERT INTO controle_f_moulage VALUES ('2', NULL);
INSERT INTO controle_f_moulage VALUES ('475', NULL);
INSERT INTO controle_f_moulage VALUES ('153', NULL);
INSERT INTO controle_f_moulage VALUES ('12', NULL);
INSERT INTO controle_f_moulage VALUES ('16', NULL);
INSERT INTO controle_f_moulage VALUES ('807', NULL);


--
-- Data for Name: controle_f_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_ordre VALUES ('COLUMBIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('CHARADRIIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PASSERIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('ACCIPITRIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('STRIGIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('FALCONIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('GALLIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('CUCULIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('GRUIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('APODIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PICIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('ANSERIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('HERB', NULL);
INSERT INTO controle_f_ordre VALUES ('IND', NULL);
INSERT INTO controle_f_ordre VALUES ('MYTILOIDA', NULL);
INSERT INTO controle_f_ordre VALUES ('PTERIOIDA', NULL);
INSERT INTO controle_f_ordre VALUES ('CAPRIMULGIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('CORACIIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('URODELES', NULL);
INSERT INTO controle_f_ordre VALUES ('NEOGASTROPODA', NULL);
INSERT INTO controle_f_ordre VALUES ('ARCOIDA', NULL);
INSERT INTO controle_f_ordre VALUES ('CERITHIDAE', NULL);
INSERT INTO controle_f_ordre VALUES ('RISSOIDAT', NULL);
INSERT INTO controle_f_ordre VALUES ('LAGOMORPHA', NULL);
INSERT INTO controle_f_ordre VALUES ('SUP', NULL);
INSERT INTO controle_f_ordre VALUES ('PROCELLARIIFORM', NULL);
INSERT INTO controle_f_ordre VALUES ('PH', 'petit herbivore');
INSERT INTO controle_f_ordre VALUES ('GH', 'grand herbivore');
INSERT INTO controle_f_ordre VALUES ('PRIMATA', NULL);
INSERT INTO controle_f_ordre VALUES ('INSECTIVORA', NULL);
INSERT INTO controle_f_ordre VALUES ('CHIROPTERA', NULL);
INSERT INTO controle_f_ordre VALUES ('RODENTIA', NULL);
INSERT INTO controle_f_ordre VALUES ('CARNIVORA', NULL);
INSERT INTO controle_f_ordre VALUES ('ARTIODACTYLA', NULL);
INSERT INTO controle_f_ordre VALUES ('PERISSODACTYLA', NULL);
INSERT INTO controle_f_ordre VALUES ('PROBOSCIDEA', NULL);
INSERT INTO controle_f_ordre VALUES ('CETACEA', NULL);
INSERT INTO controle_f_ordre VALUES ('GAVIIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PODICIPEDIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PROCELLARIIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PELECANIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('CICONIIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PHOENICOPTERIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('PTEROCLIDIFORMA', NULL);
INSERT INTO controle_f_ordre VALUES ('CHELONIA', NULL);
INSERT INTO controle_f_ordre VALUES ('URODELA', NULL);
INSERT INTO controle_f_ordre VALUES ('ARCHAEOGASTROPODA', NULL);
INSERT INTO controle_f_ordre VALUES ('SQUAMATA', NULL);
INSERT INTO controle_f_ordre VALUES ('POLYPLACOPHORA', NULL);
INSERT INTO controle_f_ordre VALUES ('BIVALVIA', NULL);
INSERT INTO controle_f_ordre VALUES ('ANURA', NULL);
INSERT INTO controle_f_ordre VALUES ('APOGASTROPODA', NULL);
INSERT INTO controle_f_ordre VALUES ('PULMONATA', NULL);
INSERT INTO controle_f_ordre VALUES ('MESOGASTROPODA', NULL);
INSERT INTO controle_f_ordre VALUES ('VENEROIDA', NULL);


--
-- Data for Name: controle_f_oxyde; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_oxyde VALUES ('MN', NULL);


--
-- Data for Name: controle_f_pathologie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_pathologie VALUES ('P', NULL);


--
-- Data for Name: controle_f_pelote; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_percussion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_photo VALUES ('P1', NULL);
INSERT INTO controle_f_photo VALUES ('O1', NULL);
INSERT INTO controle_f_photo VALUES ('--', NULL);
INSERT INTO controle_f_photo VALUES ('T1', NULL);
INSERT INTO controle_f_photo VALUES ('U1', NULL);
INSERT INTO controle_f_photo VALUES ('S1', NULL);
INSERT INTO controle_f_photo VALUES ('R', NULL);
INSERT INTO controle_f_photo VALUES ('G1', NULL);
INSERT INTO controle_f_photo VALUES ('IN', NULL);


--
-- Data for Name: controle_f_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_restauration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_restauration VALUES ('P15', NULL);
INSERT INTO controle_f_restauration VALUES ('R13', NULL);
INSERT INTO controle_f_restauration VALUES ('G', NULL);
INSERT INTO controle_f_restauration VALUES ('I9', NULL);
INSERT INTO controle_f_restauration VALUES ('T13', NULL);
INSERT INTO controle_f_restauration VALUES ('Q13', NULL);


--
-- Data for Name: controle_f_saisie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_sauvefrag; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_sexe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_sexe VALUES ('M', NULL);
INSERT INTO controle_f_sexe VALUES ('F', NULL);


--
-- Data for Name: controle_f_ssespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_ssespece VALUES ('VETUS', NULL);
INSERT INTO controle_f_ssespece VALUES ('LAZARETENSIS', NULL);
INSERT INTO controle_f_ssespece VALUES ('MEDITERRANEUS', NULL);
INSERT INTO controle_f_ssespece VALUES ('PRIMIGENIUS', NULL);


--
-- Data for Name: controle_f_ssfamille; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_stdent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_stserie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_taille; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_taille VALUES ('G', NULL);
INSERT INTO controle_f_taille VALUES ('0', 'micro');
INSERT INTO controle_f_taille VALUES ('R', NULL);
INSERT INTO controle_f_taille VALUES ('.', NULL);
INSERT INTO controle_f_taille VALUES ('P', NULL);
INSERT INTO controle_f_taille VALUES ('1', 'petite');
INSERT INTO controle_f_taille VALUES ('2', 'moy');
INSERT INTO controle_f_taille VALUES ('12', 'pet/moy');
INSERT INTO controle_f_taille VALUES ('3', 'gde');
INSERT INTO controle_f_taille VALUES ('4', 'tr�s gde');
INSERT INTO controle_f_taille VALUES ('34', 'gd/t.gd');


--
-- Data for Name: controle_f_tissu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_tissu VALUES ('DEN', NULL);
INSERT INTO controle_f_tissu VALUES ('MIX', NULL);
INSERT INTO controle_f_tissu VALUES ('LAZ', NULL);
INSERT INTO controle_f_tissu VALUES ('COM', NULL);
INSERT INTO controle_f_tissu VALUES ('SPO', NULL);
INSERT INTO controle_f_tissu VALUES ('DE', NULL);
INSERT INTO controle_f_tissu VALUES ('IND', NULL);


--
-- Data for Name: controle_f_traitement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_traitement VALUES ('U', NULL);
INSERT INTO controle_f_traitement VALUES ('O10', NULL);


--
-- Data for Name: controle_f_tranchant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_f_typedos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typedos VALUES ('L', 'long');
INSERT INTO controle_f_typedos VALUES ('P', 'plat');
INSERT INTO controle_f_typedos VALUES ('C', 'court');


--
-- Data for Name: controle_f_typos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typos1 VALUES ('1', NULL);
INSERT INTO controle_f_typos1 VALUES ('2', NULL);
INSERT INTO controle_f_typos1 VALUES ('3', NULL);
INSERT INTO controle_f_typos1 VALUES ('I', NULL);
INSERT INTO controle_f_typos1 VALUES ('5', NULL);
INSERT INTO controle_f_typos1 VALUES ('6', NULL);


--
-- Data for Name: controle_f_typos2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typos2 VALUES ('DE', NULL);
INSERT INTO controle_f_typos2 VALUES ('FE', NULL);
INSERT INTO controle_f_typos2 VALUES ('MP', NULL);
INSERT INTO controle_f_typos2 VALUES ('TH', NULL);
INSERT INTO controle_f_typos2 VALUES ('MD', NULL);
INSERT INTO controle_f_typos2 VALUES ('HU', NULL);
INSERT INTO controle_f_typos2 VALUES ('AN', NULL);
INSERT INTO controle_f_typos2 VALUES ('MC', NULL);
INSERT INTO controle_f_typos2 VALUES ('TA', NULL);
INSERT INTO controle_f_typos2 VALUES ('CR', NULL);
INSERT INTO controle_f_typos2 VALUES ('MT', NULL);
INSERT INTO controle_f_typos2 VALUES ('PO', NULL);
INSERT INTO controle_f_typos2 VALUES ('ZA', NULL);
INSERT INTO controle_f_typos2 VALUES ('CS', NULL);
INSERT INTO controle_f_typos2 VALUES ('AX', NULL);
INSERT INTO controle_f_typos2 VALUES ('T', NULL);
INSERT INTO controle_f_typos2 VALUES ('C', NULL);
INSERT INTO controle_f_typos2 VALUES ('UL', NULL);
INSERT INTO controle_f_typos2 VALUES ('PH', NULL);
INSERT INTO controle_f_typos2 VALUES ('HY', NULL);
INSERT INTO controle_f_typos2 VALUES ('RA', NULL);
INSERT INTO controle_f_typos2 VALUES ('VE', NULL);
INSERT INTO controle_f_typos2 VALUES ('IN', NULL);
INSERT INTO controle_f_typos2 VALUES ('SC', NULL);
INSERT INTO controle_f_typos2 VALUES ('--', NULL);
INSERT INTO controle_f_typos2 VALUES ('CT', NULL);
INSERT INTO controle_f_typos2 VALUES ('PA', NULL);
INSERT INTO controle_f_typos2 VALUES ('CP', NULL);
INSERT INTO controle_f_typos2 VALUES ('MA', NULL);
INSERT INTO controle_f_typos2 VALUES ('SE', NULL);
INSERT INTO controle_f_typos2 VALUES ('IL', NULL);
INSERT INTO controle_f_typos2 VALUES ('EQ', NULL);
INSERT INTO controle_f_typos2 VALUES ('MI', NULL);


--
-- Data for Name: controle_f_typos3; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typos3 VALUES ('INF', NULL);
INSERT INTO controle_f_typos3 VALUES ('IND', NULL);
INSERT INTO controle_f_typos3 VALUES ('O7', NULL);
INSERT INTO controle_f_typos3 VALUES ('CMC', NULL);
INSERT INTO controle_f_typos3 VALUES ('TIT', NULL);
INSERT INTO controle_f_typos3 VALUES ('O1', NULL);
INSERT INTO controle_f_typos3 VALUES ('SC', NULL);
INSERT INTO controle_f_typos3 VALUES ('MET', NULL);
INSERT INTO controle_f_typos3 VALUES ('4', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHI', NULL);
INSERT INTO controle_f_typos3 VALUES ('I', NULL);
INSERT INTO controle_f_typos3 VALUES ('HU', NULL);
INSERT INTO controle_f_typos3 VALUES ('2', NULL);
INSERT INTO controle_f_typos3 VALUES ('TIF', NULL);
INSERT INTO controle_f_typos3 VALUES ('STY', NULL);
INSERT INTO controle_f_typos3 VALUES ('ZEU', NULL);
INSERT INTO controle_f_typos3 VALUES ('RU', NULL);
INSERT INTO controle_f_typos3 VALUES ('MXD', NULL);
INSERT INTO controle_f_typos3 VALUES ('BAS', NULL);
INSERT INTO controle_f_typos3 VALUES ('FE', NULL);
INSERT INTO controle_f_typos3 VALUES ('RA', NULL);
INSERT INTO controle_f_typos3 VALUES ('T3', NULL);
INSERT INTO controle_f_typos3 VALUES ('UL', NULL);
INSERT INTO controle_f_typos3 VALUES ('CA', NULL);
INSERT INTO controle_f_typos3 VALUES ('MDD', NULL);
INSERT INTO controle_f_typos3 VALUES ('CRA', NULL);
INSERT INTO controle_f_typos3 VALUES ('MAD', NULL);
INSERT INTO controle_f_typos3 VALUES ('COQ', NULL);
INSERT INTO controle_f_typos3 VALUES ('SUP', NULL);
INSERT INTO controle_f_typos3 VALUES ('O11', NULL);
INSERT INTO controle_f_typos3 VALUES ('TMT', NULL);
INSERT INTO controle_f_typos3 VALUES ('CO', NULL);
INSERT INTO controle_f_typos3 VALUES ('MAX', NULL);
INSERT INTO controle_f_typos3 VALUES ('5', NULL);
INSERT INTO controle_f_typos3 VALUES ('ACR', NULL);
INSERT INTO controle_f_typos3 VALUES ('3', NULL);
INSERT INTO controle_f_typos3 VALUES ('OI', NULL);
INSERT INTO controle_f_typos3 VALUES ('SES', NULL);
INSERT INTO controle_f_typos3 VALUES ('CH', NULL);
INSERT INTO controle_f_typos3 VALUES ('BI', NULL);
INSERT INTO controle_f_typos3 VALUES ('TA', NULL);
INSERT INTO controle_f_typos3 VALUES ('MD', NULL);
INSERT INTO controle_f_typos3 VALUES ('BA', NULL);
INSERT INTO controle_f_typos3 VALUES ('ZY', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHQ', NULL);
INSERT INTO controle_f_typos3 VALUES ('ST', NULL);
INSERT INTO controle_f_typos3 VALUES ('---', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHP', NULL);
INSERT INTO controle_f_typos3 VALUES ('TC3', NULL);
INSERT INTO controle_f_typos3 VALUES ('CU', NULL);
INSERT INTO controle_f_typos3 VALUES ('NA', NULL);
INSERT INTO controle_f_typos3 VALUES ('SA', NULL);
INSERT INTO controle_f_typos3 VALUES ('C1', NULL);
INSERT INTO controle_f_typos3 VALUES ('C2', NULL);
INSERT INTO controle_f_typos3 VALUES ('DV', NULL);
INSERT INTO controle_f_typos3 VALUES ('MDS', NULL);
INSERT INTO controle_f_typos3 VALUES ('MAS', NULL);
INSERT INTO controle_f_typos3 VALUES ('O6', NULL);
INSERT INTO controle_f_typos3 VALUES ('SCA', NULL);
INSERT INTO controle_f_typos3 VALUES ('T5', NULL);
INSERT INTO controle_f_typos3 VALUES ('CI', NULL);
INSERT INTO controle_f_typos3 VALUES ('TI', NULL);
INSERT INTO controle_f_typos3 VALUES ('LI', NULL);
INSERT INTO controle_f_typos3 VALUES ('T12', NULL);
INSERT INTO controle_f_typos3 VALUES ('T6', NULL);
INSERT INTO controle_f_typos3 VALUES ('T8', NULL);
INSERT INTO controle_f_typos3 VALUES ('L3', NULL);
INSERT INTO controle_f_typos3 VALUES ('C4', NULL);
INSERT INTO controle_f_typos3 VALUES ('C6', NULL);
INSERT INTO controle_f_typos3 VALUES ('C5', NULL);
INSERT INTO controle_f_typos3 VALUES ('L1', NULL);
INSERT INTO controle_f_typos3 VALUES ('L5', NULL);
INSERT INTO controle_f_typos3 VALUES ('VI', NULL);
INSERT INTO controle_f_typos3 VALUES ('C7', NULL);
INSERT INTO controle_f_typos3 VALUES ('T9', NULL);
INSERT INTO controle_f_typos3 VALUES ('C3', NULL);
INSERT INTO controle_f_typos3 VALUES ('T7', NULL);
INSERT INTO controle_f_typos3 VALUES ('T1', NULL);
INSERT INTO controle_f_typos3 VALUES ('L6', NULL);
INSERT INTO controle_f_typos3 VALUES ('T2', NULL);
INSERT INTO controle_f_typos3 VALUES ('T4', NULL);
INSERT INTO controle_f_typos3 VALUES ('L4', NULL);
INSERT INTO controle_f_typos3 VALUES ('T13', NULL);
INSERT INTO controle_f_typos3 VALUES ('L2', NULL);
INSERT INTO controle_f_typos3 VALUES ('CDI', NULL);
INSERT INTO controle_f_typos3 VALUES ('O3', NULL);
INSERT INTO controle_f_typos3 VALUES ('O8', NULL);
INSERT INTO controle_f_typos3 VALUES ('O10', NULL);
INSERT INTO controle_f_typos3 VALUES ('O13', NULL);
INSERT INTO controle_f_typos3 VALUES ('O2', NULL);
INSERT INTO controle_f_typos3 VALUES ('O4', NULL);
INSERT INTO controle_f_typos3 VALUES ('O5', NULL);
INSERT INTO controle_f_typos3 VALUES ('O9', NULL);
INSERT INTO controle_f_typos3 VALUES ('O12', NULL);
INSERT INTO controle_f_typos3 VALUES ('T11', NULL);
INSERT INTO controle_f_typos3 VALUES ('TL', NULL);
INSERT INTO controle_f_typos3 VALUES ('P5', NULL);
INSERT INTO controle_f_typos3 VALUES ('T10', NULL);
INSERT INTO controle_f_typos3 VALUES ('INC', NULL);
INSERT INTO controle_f_typos3 VALUES ('FRO', NULL);
INSERT INTO controle_f_typos3 VALUES ('ZYG', NULL);
INSERT INTO controle_f_typos3 VALUES ('PE', NULL);
INSERT INTO controle_f_typos3 VALUES ('NAS', NULL);
INSERT INTO controle_f_typos3 VALUES ('TEM', NULL);
INSERT INTO controle_f_typos3 VALUES ('PAR', NULL);
INSERT INTO controle_f_typos3 VALUES ('OCC', NULL);
INSERT INTO controle_f_typos3 VALUES ('PAL', NULL);
INSERT INTO controle_f_typos3 VALUES ('VOM', NULL);
INSERT INTO controle_f_typos3 VALUES ('BM', NULL);
INSERT INTO controle_f_typos3 VALUES ('BO', NULL);
INSERT INTO controle_f_typos3 VALUES ('PRE', NULL);
INSERT INTO controle_f_typos3 VALUES ('P', NULL);
INSERT INTO controle_f_typos3 VALUES ('IN', NULL);
INSERT INTO controle_f_typos3 VALUES ('CDD', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD9', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD5', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD2', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD7', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD4', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD8', NULL);
INSERT INTO controle_f_typos3 VALUES ('L7', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD6', NULL);
INSERT INTO controle_f_typos3 VALUES ('CD3', NULL);
INSERT INTO controle_f_typos3 VALUES ('FR', NULL);
INSERT INTO controle_f_typos3 VALUES ('3D', NULL);
INSERT INTO controle_f_typos3 VALUES ('MXS', NULL);
INSERT INTO controle_f_typos3 VALUES ('CN', NULL);
INSERT INTO controle_f_typos3 VALUES ('CER', NULL);
INSERT INTO controle_f_typos3 VALUES ('CR', NULL);
INSERT INTO controle_f_typos3 VALUES ('1', NULL);
INSERT INTO controle_f_typos3 VALUES ('MCV', NULL);
INSERT INTO controle_f_typos3 VALUES ('MX', NULL);
INSERT INTO controle_f_typos3 VALUES ('FEM', NULL);
INSERT INTO controle_f_typos3 VALUES ('UN', NULL);
INSERT INTO controle_f_typos3 VALUES ('PVX', NULL);
INSERT INTO controle_f_typos3 VALUES ('RD', NULL);
INSERT INTO controle_f_typos3 VALUES ('FIB', NULL);
INSERT INTO controle_f_typos3 VALUES ('CL', NULL);
INSERT INTO controle_f_typos3 VALUES ('VE', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHD', NULL);
INSERT INTO controle_f_typos3 VALUES ('MT', NULL);
INSERT INTO controle_f_typos3 VALUES ('MC', NULL);
INSERT INTO controle_f_typos3 VALUES ('MP', NULL);
INSERT INTO controle_f_typos3 VALUES ('PV', NULL);
INSERT INTO controle_f_typos3 VALUES ('T', NULL);
INSERT INTO controle_f_typos3 VALUES ('C', NULL);
INSERT INTO controle_f_typos3 VALUES ('PA', NULL);
INSERT INTO controle_f_typos3 VALUES ('DE', NULL);
INSERT INTO controle_f_typos3 VALUES ('TE', NULL);
INSERT INTO controle_f_typos3 VALUES ('PL', NULL);
INSERT INTO controle_f_typos3 VALUES ('OC', NULL);
INSERT INTO controle_f_typos3 VALUES ('SPH', NULL);
INSERT INTO controle_f_typos3 VALUES ('QI', NULL);
INSERT INTO controle_f_typos3 VALUES ('TIFI', NULL);
INSERT INTO controle_f_typos3 VALUES ('RAU', NULL);
INSERT INTO controle_f_typos3 VALUES ('UR', NULL);
INSERT INTO controle_f_typos3 VALUES ('SQ', NULL);
INSERT INTO controle_f_typos3 VALUES ('AGL', NULL);
INSERT INTO controle_f_typos3 VALUES ('ANG', NULL);
INSERT INTO controle_f_typos3 VALUES ('SPE', NULL);
INSERT INTO controle_f_typos3 VALUES ('DEN', NULL);
INSERT INTO controle_f_typos3 VALUES ('Q', NULL);
INSERT INTO controle_f_typos3 VALUES ('ETH', NULL);
INSERT INTO controle_f_typos3 VALUES ('LAC', NULL);
INSERT INTO controle_f_typos3 VALUES ('SIND', NULL);
INSERT INTO controle_f_typos3 VALUES ('PH', NULL);
INSERT INTO controle_f_typos3 VALUES ('PT', NULL);
INSERT INTO controle_f_typos3 VALUES ('SP', NULL);
INSERT INTO controle_f_typos3 VALUES ('GS', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHT', NULL);
INSERT INTO controle_f_typos3 VALUES ('PHC', NULL);


--
-- Data for Name: controle_f_typos4; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typos4 VALUES ('DE', NULL);
INSERT INTO controle_f_typos4 VALUES ('CA', NULL);
INSERT INTO controle_f_typos4 VALUES ('IN', NULL);
INSERT INTO controle_f_typos4 VALUES ('HU', NULL);
INSERT INTO controle_f_typos4 VALUES ('TI', NULL);
INSERT INTO controle_f_typos4 VALUES ('TA', NULL);
INSERT INTO controle_f_typos4 VALUES ('--', NULL);
INSERT INTO controle_f_typos4 VALUES ('34', NULL);
INSERT INTO controle_f_typos4 VALUES ('FE', NULL);
INSERT INTO controle_f_typos4 VALUES ('P1', NULL);
INSERT INTO controle_f_typos4 VALUES ('LA', NULL);
INSERT INTO controle_f_typos4 VALUES ('CN', NULL);
INSERT INTO controle_f_typos4 VALUES ('D', NULL);
INSERT INTO controle_f_typos4 VALUES ('L', NULL);
INSERT INTO controle_f_typos4 VALUES ('GR', NULL);
INSERT INTO controle_f_typos4 VALUES ('P3', NULL);
INSERT INTO controle_f_typos4 VALUES ('T', NULL);
INSERT INTO controle_f_typos4 VALUES ('3', NULL);
INSERT INTO controle_f_typos4 VALUES ('C', NULL);
INSERT INTO controle_f_typos4 VALUES ('25', NULL);
INSERT INTO controle_f_typos4 VALUES ('2', NULL);
INSERT INTO controle_f_typos4 VALUES ('Q', NULL);
INSERT INTO controle_f_typos4 VALUES ('RA', NULL);
INSERT INTO controle_f_typos4 VALUES ('MA', NULL);
INSERT INTO controle_f_typos4 VALUES ('C4', NULL);
INSERT INTO controle_f_typos4 VALUES ('CL', NULL);
INSERT INTO controle_f_typos4 VALUES ('UL', NULL);
INSERT INTO controle_f_typos4 VALUES ('SL', NULL);
INSERT INTO controle_f_typos4 VALUES ('PY', NULL);
INSERT INTO controle_f_typos4 VALUES ('HA', NULL);
INSERT INTO controle_f_typos4 VALUES ('CT', NULL);
INSERT INTO controle_f_typos4 VALUES ('PI', NULL);
INSERT INTO controle_f_typos4 VALUES ('SC', NULL);
INSERT INTO controle_f_typos4 VALUES ('PA', NULL);
INSERT INTO controle_f_typos4 VALUES ('RU', NULL);
INSERT INTO controle_f_typos4 VALUES ('6', NULL);
INSERT INTO controle_f_typos4 VALUES ('5', NULL);
INSERT INTO controle_f_typos4 VALUES ('P2', NULL);
INSERT INTO controle_f_typos4 VALUES ('C1', NULL);
INSERT INTO controle_f_typos4 VALUES ('PE', NULL);
INSERT INTO controle_f_typos4 VALUES ('CE', NULL);
INSERT INTO controle_f_typos4 VALUES ('.', NULL);
INSERT INTO controle_f_typos4 VALUES ('P', NULL);
INSERT INTO controle_f_typos4 VALUES ('C3', NULL);
INSERT INTO controle_f_typos4 VALUES ('AF', NULL);
INSERT INTO controle_f_typos4 VALUES ('I', NULL);
INSERT INTO controle_f_typos4 VALUES ('4', NULL);
INSERT INTO controle_f_typos4 VALUES ('CU', NULL);
INSERT INTO controle_f_typos4 VALUES ('NA', NULL);
INSERT INTO controle_f_typos4 VALUES ('FI', NULL);
INSERT INTO controle_f_typos4 VALUES ('1', NULL);
INSERT INTO controle_f_typos4 VALUES ('SU', NULL);
INSERT INTO controle_f_typos4 VALUES ('CI', NULL);
INSERT INTO controle_f_typos4 VALUES ('TO', NULL);
INSERT INTO controle_f_typos4 VALUES ('CS', NULL);
INSERT INTO controle_f_typos4 VALUES ('MI', NULL);
INSERT INTO controle_f_typos4 VALUES ('MD', NULL);
INSERT INTO controle_f_typos4 VALUES ('GO', NULL);
INSERT INTO controle_f_typos4 VALUES ('OI', NULL);
INSERT INTO controle_f_typos4 VALUES ('BTY', NULL);
INSERT INTO controle_f_typos4 VALUES ('PT', NULL);
INSERT INTO controle_f_typos4 VALUES ('IL', NULL);
INSERT INTO controle_f_typos4 VALUES ('E', NULL);
INSERT INTO controle_f_typos4 VALUES ('TIF', NULL);
INSERT INTO controle_f_typos4 VALUES ('MC', NULL);
INSERT INTO controle_f_typos4 VALUES ('S', NULL);


--
-- Data for Name: controle_f_typos5; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_f_typos5 VALUES ('J', NULL);
INSERT INTO controle_f_typos5 VALUES ('L', NULL);
INSERT INTO controle_f_typos5 VALUES ('34', 'doigt III ou IV');
INSERT INTO controle_f_typos5 VALUES ('I', NULL);
INSERT INTO controle_f_typos5 VALUES ('4', NULL);
INSERT INTO controle_f_typos5 VALUES ('6', NULL);
INSERT INTO controle_f_typos5 VALUES ('3', NULL);
INSERT INTO controle_f_typos5 VALUES ('D', NULL);
INSERT INTO controle_f_typos5 VALUES ('F', NULL);
INSERT INTO controle_f_typos5 VALUES ('M', NULL);
INSERT INTO controle_f_typos5 VALUES ('E', NULL);
INSERT INTO controle_f_typos5 VALUES ('A', NULL);
INSERT INTO controle_f_typos5 VALUES ('2', NULL);
INSERT INTO controle_f_typos5 VALUES ('5', NULL);
INSERT INTO controle_f_typos5 VALUES ('1', NULL);
INSERT INTO controle_f_typos5 VALUES ('P', NULL);
INSERT INTO controle_f_typos5 VALUES ('7', NULL);
INSERT INTO controle_f_typos5 VALUES ('25', 'doigt II ou V');
INSERT INTO controle_f_typos5 VALUES ('EX', NULL);
INSERT INTO controle_f_typos5 VALUES ('IN', NULL);
INSERT INTO controle_f_typos5 VALUES ('GR', NULL);


--
-- Data for Name: controle_f_typos6; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_angle1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_angle2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_aspect1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_aspect2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_localisation1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_localisation2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_morphologie1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_morphologie2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_non1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_non2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_profil1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ff_profil2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_fi_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_fi_mode VALUES ('FD', NULL);
INSERT INTO controle_fi_mode VALUES ('PL', NULL);
INSERT INTO controle_fi_mode VALUES ('IR', NULL);
INSERT INTO controle_fi_mode VALUES ('TH', NULL);
INSERT INTO controle_fi_mode VALUES ('ST', NULL);
INSERT INTO controle_fi_mode VALUES ('CR', NULL);
INSERT INTO controle_fi_mode VALUES ('ON', NULL);
INSERT INTO controle_fi_mode VALUES ('OND', NULL);
INSERT INTO controle_fi_mode VALUES ('ONA', NULL);
INSERT INTO controle_fi_mode VALUES ('ONF', NULL);
INSERT INTO controle_fi_mode VALUES ('FF', NULL);


--
-- Data for Name: controle_fi_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_fi_percussion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_fi_percussion VALUES ('A', NULL);
INSERT INTO controle_fi_percussion VALUES ('P', NULL);


--
-- Data for Name: controle_fi_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_fi_type VALUES ('FI', NULL);
INSERT INTO controle_fi_type VALUES ('FIA', NULL);
INSERT INTO controle_fi_type VALUES ('FIB', NULL);
INSERT INTO controle_fi_type VALUES ('FII', NULL);
INSERT INTO controle_fi_type VALUES ('FII1', NULL);
INSERT INTO controle_fi_type VALUES ('FII2', NULL);
INSERT INTO controle_fi_type VALUES ('FII3', NULL);
INSERT INTO controle_fi_type VALUES ('FII4', NULL);
INSERT INTO controle_fi_type VALUES ('FII5', NULL);
INSERT INTO controle_fi_type VALUES ('FII6', NULL);
INSERT INTO controle_fi_type VALUES ('FII7', NULL);
INSERT INTO controle_fi_type VALUES ('FII2BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII3BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII4BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII5BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII6BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII7BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII8', NULL);
INSERT INTO controle_fi_type VALUES ('FII8BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FII9', NULL);
INSERT INTO controle_fi_type VALUES ('FII10', NULL);
INSERT INTO controle_fi_type VALUES ('FII11', NULL);
INSERT INTO controle_fi_type VALUES ('FII12', NULL);
INSERT INTO controle_fi_type VALUES ('FIII', NULL);
INSERT INTO controle_fi_type VALUES ('FIII1', NULL);
INSERT INTO controle_fi_type VALUES ('FIII2', NULL);
INSERT INTO controle_fi_type VALUES ('FIII3', NULL);
INSERT INTO controle_fi_type VALUES ('FIII4', NULL);
INSERT INTO controle_fi_type VALUES ('FIII5', NULL);
INSERT INTO controle_fi_type VALUES ('FIII5BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FIII6', NULL);
INSERT INTO controle_fi_type VALUES ('FIII7', NULL);
INSERT INTO controle_fi_type VALUES ('FIII8', NULL);
INSERT INTO controle_fi_type VALUES ('FIII9', NULL);
INSERT INTO controle_fi_type VALUES ('FIV', NULL);
INSERT INTO controle_fi_type VALUES ('FIV1', NULL);
INSERT INTO controle_fi_type VALUES ('FIV2', NULL);
INSERT INTO controle_fi_type VALUES ('FIV3', NULL);
INSERT INTO controle_fi_type VALUES ('FIV4', NULL);
INSERT INTO controle_fi_type VALUES ('FIV5', NULL);
INSERT INTO controle_fi_type VALUES ('IV5BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FIV6', NULL);
INSERT INTO controle_fi_type VALUES ('FIV7', NULL);
INSERT INTO controle_fi_type VALUES ('FIV8', NULL);
INSERT INTO controle_fi_type VALUES ('FIV9', NULL);
INSERT INTO controle_fi_type VALUES ('FV', NULL);
INSERT INTO controle_fi_type VALUES ('FV0', NULL);
INSERT INTO controle_fi_type VALUES ('FV1', NULL);
INSERT INTO controle_fi_type VALUES ('FV2', NULL);
INSERT INTO controle_fi_type VALUES ('FV2BIS', NULL);
INSERT INTO controle_fi_type VALUES ('FV3', NULL);
INSERT INTO controle_fi_type VALUES ('FV4', NULL);
INSERT INTO controle_fi_type VALUES ('FV5', NULL);
INSERT INTO controle_fi_type VALUES ('FV6', NULL);
INSERT INTO controle_fi_type VALUES ('FVI', NULL);
INSERT INTO controle_fi_type VALUES ('FVI0', NULL);
INSERT INTO controle_fi_type VALUES ('FVI1', NULL);
INSERT INTO controle_fi_type VALUES ('FVI2', NULL);
INSERT INTO controle_fi_type VALUES ('FVI3', NULL);
INSERT INTO controle_fi_type VALUES ('FVI4', NULL);
INSERT INTO controle_fi_type VALUES ('FVI5', NULL);
INSERT INTO controle_fi_type VALUES ('FVI6', NULL);
INSERT INTO controle_fi_type VALUES ('FVI7', NULL);


--
-- Data for Name: controle_ga_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_arete VALUES ('CRD', NULL);
INSERT INTO controle_ga_arete VALUES ('CRI', NULL);
INSERT INTO controle_ga_arete VALUES ('CS', NULL);
INSERT INTO controle_ga_arete VALUES ('DR', NULL);
INSERT INTO controle_ga_arete VALUES ('DS', NULL);


--
-- Data for Name: controle_ga_chf; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ga_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_facture VALUES ('M', NULL);
INSERT INTO controle_ga_facture VALUES ('R', NULL);
INSERT INTO controle_ga_facture VALUES ('T', NULL);


--
-- Data for Name: controle_ga_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_forme VALUES ('R', NULL);
INSERT INTO controle_ga_forme VALUES ('RD', NULL);
INSERT INTO controle_ga_forme VALUES ('CONV', NULL);
INSERT INTO controle_ga_forme VALUES ('CONVD', NULL);
INSERT INTO controle_ga_forme VALUES ('TR', NULL);
INSERT INTO controle_ga_forme VALUES ('TRD', NULL);
INSERT INTO controle_ga_forme VALUES ('CONC', NULL);
INSERT INTO controle_ga_forme VALUES ('CONCD', NULL);
INSERT INTO controle_ga_forme VALUES ('COCL', NULL);
INSERT INTO controle_ga_forme VALUES ('COCLD', NULL);
INSERT INTO controle_ga_forme VALUES ('SCONV', NULL);
INSERT INTO controle_ga_forme VALUES ('SCONVD', NULL);
INSERT INTO controle_ga_forme VALUES ('SCONC', NULL);
INSERT INTO controle_ga_forme VALUES ('SCONCD', NULL);
INSERT INTO controle_ga_forme VALUES ('CIRC', NULL);
INSERT INTO controle_ga_forme VALUES ('BCP', NULL);
INSERT INTO controle_ga_forme VALUES ('BCPD', NULL);
INSERT INTO controle_ga_forme VALUES ('BCM', NULL);
INSERT INTO controle_ga_forme VALUES ('BCMD', NULL);
INSERT INTO controle_ga_forme VALUES ('BCT', NULL);
INSERT INTO controle_ga_forme VALUES ('BCTD', NULL);
INSERT INTO controle_ga_forme VALUES ('BCMS', NULL);
INSERT INTO controle_ga_forme VALUES ('BCMSD', NULL);
INSERT INTO controle_ga_forme VALUES ('IND', NULL);


--
-- Data for Name: controle_ga_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_obliquite VALUES ('H', NULL);
INSERT INTO controle_ga_obliquite VALUES ('O', NULL);
INSERT INTO controle_ga_obliquite VALUES ('SA', NULL);
INSERT INTO controle_ga_obliquite VALUES ('A', NULL);


--
-- Data for Name: controle_ga_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_orientation VALUES ('P', NULL);
INSERT INTO controle_ga_orientation VALUES ('NP', NULL);
INSERT INTO controle_ga_orientation VALUES ('I', NULL);


--
-- Data for Name: controle_ga_qualite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_qualite VALUES ('B', NULL);
INSERT INTO controle_ga_qualite VALUES ('M', NULL);
INSERT INTO controle_ga_qualite VALUES ('I', NULL);


--
-- Data for Name: controle_ga_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_retouche VALUES ('A', NULL);
INSERT INTO controle_ga_retouche VALUES ('M', NULL);
INSERT INTO controle_ga_retouche VALUES ('MD', NULL);
INSERT INTO controle_ga_retouche VALUES ('1/2E', NULL);
INSERT INTO controle_ga_retouche VALUES ('1/2ED', NULL);
INSERT INTO controle_ga_retouche VALUES ('E', NULL);
INSERT INTO controle_ga_retouche VALUES ('ED', NULL);
INSERT INTO controle_ga_retouche VALUES ('1/2Q', NULL);
INSERT INTO controle_ga_retouche VALUES ('1/2QD', NULL);
INSERT INTO controle_ga_retouche VALUES ('Q', NULL);
INSERT INTO controle_ga_retouche VALUES ('QD', NULL);
INSERT INTO controle_ga_retouche VALUES ('SE', NULL);
INSERT INTO controle_ga_retouche VALUES ('SED', NULL);
INSERT INTO controle_ga_retouche VALUES ('SA', NULL);
INSERT INTO controle_ga_retouche VALUES ('SAD', NULL);
INSERT INTO controle_ga_retouche VALUES ('AM', NULL);
INSERT INTO controle_ga_retouche VALUES ('AMD', NULL);
INSERT INTO controle_ga_retouche VALUES ('AE', NULL);
INSERT INTO controle_ga_retouche VALUES ('AED', NULL);
INSERT INTO controle_ga_retouche VALUES ('DM', NULL);
INSERT INTO controle_ga_retouche VALUES ('D1/2E', NULL);
INSERT INTO controle_ga_retouche VALUES ('DE', NULL);
INSERT INTO controle_ga_retouche VALUES ('DSE', NULL);
INSERT INTO controle_ga_retouche VALUES ('DSA', NULL);
INSERT INTO controle_ga_retouche VALUES ('DAM', NULL);
INSERT INTO controle_ga_retouche VALUES ('DAE', NULL);
INSERT INTO controle_ga_retouche VALUES ('DEV', NULL);
INSERT INTO controle_ga_retouche VALUES ('DEVS', NULL);
INSERT INTO controle_ga_retouche VALUES ('P', NULL);
INSERT INTO controle_ga_retouche VALUES ('PD', NULL);
INSERT INTO controle_ga_retouche VALUES ('EV', NULL);
INSERT INTO controle_ga_retouche VALUES ('EVD', NULL);
INSERT INTO controle_ga_retouche VALUES ('EVS', NULL);
INSERT INTO controle_ga_retouche VALUES ('EVSD', NULL);
INSERT INTO controle_ga_retouche VALUES ('LSP', NULL);
INSERT INTO controle_ga_retouche VALUES ('LP', NULL);
INSERT INTO controle_ga_retouche VALUES ('LE', NULL);


--
-- Data for Name: controle_ga_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_ga_type VALUES ('IA', NULL);
INSERT INTO controle_ga_type VALUES ('IA1', NULL);
INSERT INTO controle_ga_type VALUES ('E', NULL);
INSERT INTO controle_ga_type VALUES ('IA1E1', NULL);
INSERT INTO controle_ga_type VALUES ('IA1E2', NULL);
INSERT INTO controle_ga_type VALUES ('IA1ET', NULL);
INSERT INTO controle_ga_type VALUES ('A', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A5', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A2', NULL);
INSERT INTO controle_ga_type VALUES ('IA1AT', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A3', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A4', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A1', NULL);
INSERT INTO controle_ga_type VALUES ('IA1A6', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B1', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B2', NULL);
INSERT INTO controle_ga_type VALUES ('IA1BT', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B3', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B4', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B5', NULL);
INSERT INTO controle_ga_type VALUES ('IA1B6', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C1', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C2', NULL);
INSERT INTO controle_ga_type VALUES ('IA1CT', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C3', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C4', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C5', NULL);
INSERT INTO controle_ga_type VALUES ('IA1C6', NULL);
INSERT INTO controle_ga_type VALUES ('IA1D1', NULL);
INSERT INTO controle_ga_type VALUES ('IA1D2', NULL);
INSERT INTO controle_ga_type VALUES ('IA1DT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SE1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SE2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SET', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SAT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA4', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SA6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SBT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB4', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SB6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SCT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC4', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SC6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SD1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SD2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2SDT', NULL);
INSERT INTO controle_ga_type VALUES ('A2ME1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2ME2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MET', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MAT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA4', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MA6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MBT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB4', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MB6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MCT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MC6', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MD1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MD2', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MDT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFA1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFAT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFA5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFB1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFBT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFB3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MFB5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGA1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGAT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGA5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGB1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGBT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGB3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MGB5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHA1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHAT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHA5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHB1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHBT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHB3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHB5', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHC1', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHCT', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHC3', NULL);
INSERT INTO controle_ga_type VALUES ('IA2MHC5', NULL);
INSERT INTO controle_ga_type VALUES ('IA3', NULL);
INSERT INTO controle_ga_type VALUES ('IA31', NULL);
INSERT INTO controle_ga_type VALUES ('IA32', NULL);
INSERT INTO controle_ga_type VALUES ('IA33', NULL);
INSERT INTO controle_ga_type VALUES ('IA34', NULL);
INSERT INTO controle_ga_type VALUES ('ID', NULL);
INSERT INTO controle_ga_type VALUES ('ID1', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A1', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A2', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A3', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A4', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A5', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A6', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A7', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A8', NULL);
INSERT INTO controle_ga_type VALUES ('ID1A9', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B1', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B2', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B3', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B4', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B5', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B6', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B7', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B8', NULL);
INSERT INTO controle_ga_type VALUES ('ID1B9', NULL);
INSERT INTO controle_ga_type VALUES ('ID2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2A1', NULL);
INSERT INTO controle_ga_type VALUES ('ID2A2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2A3', NULL);
INSERT INTO controle_ga_type VALUES ('ID2A4', NULL);
INSERT INTO controle_ga_type VALUES ('ID2B1', NULL);
INSERT INTO controle_ga_type VALUES ('ID2B2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2B3', NULL);
INSERT INTO controle_ga_type VALUES ('ID2B4', NULL);
INSERT INTO controle_ga_type VALUES ('ID2C1', NULL);
INSERT INTO controle_ga_type VALUES ('ID2C2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2C3', NULL);
INSERT INTO controle_ga_type VALUES ('ID2C4', NULL);
INSERT INTO controle_ga_type VALUES ('ID2D1', NULL);
INSERT INTO controle_ga_type VALUES ('ID2D2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2D3', NULL);
INSERT INTO controle_ga_type VALUES ('ID2D4', NULL);
INSERT INTO controle_ga_type VALUES ('ID2E1', NULL);
INSERT INTO controle_ga_type VALUES ('ID2E2', NULL);
INSERT INTO controle_ga_type VALUES ('ID2E3', NULL);
INSERT INTO controle_ga_type VALUES ('ID2E4', NULL);
INSERT INTO controle_ga_type VALUES ('ID3', NULL);
INSERT INTO controle_ga_type VALUES ('ID3A', NULL);
INSERT INTO controle_ga_type VALUES ('ID3B', NULL);
INSERT INTO controle_ga_type VALUES ('IM', NULL);
INSERT INTO controle_ga_type VALUES ('IMS', NULL);
INSERT INTO controle_ga_type VALUES ('MS1A1', NULL);
INSERT INTO controle_ga_type VALUES ('IMS1A2', NULL);
INSERT INTO controle_ga_type VALUES ('IMS2A', NULL);
INSERT INTO controle_ga_type VALUES ('IMS2B1', NULL);
INSERT INTO controle_ga_type VALUES ('IMS2B2', NULL);
INSERT INTO controle_ga_type VALUES ('IMS3', NULL);
INSERT INTO controle_ga_type VALUES ('IMS4', NULL);
INSERT INTO controle_ga_type VALUES ('IMC', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1A1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1A2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1A3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1B1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1B2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC1B3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A4', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A5', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2A6', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B4', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B5', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2B6', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2C1', NULL);
INSERT INTO controle_ga_type VALUES ('MC2C2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2C3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2C4', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2C5', NULL);
INSERT INTO controle_ga_type VALUES ('IMC2C6', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A4', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A5', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3A6', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3', NULL);
INSERT INTO controle_ga_type VALUES ('IMC3C', NULL);
INSERT INTO controle_ga_type VALUES ('IMC4A1', NULL);
INSERT INTO controle_ga_type VALUES ('IMC4A2', NULL);
INSERT INTO controle_ga_type VALUES ('IMC4B', NULL);
INSERT INTO controle_ga_type VALUES ('IIR', NULL);
INSERT INTO controle_ga_type VALUES ('IIR1', NULL);
INSERT INTO controle_ga_type VALUES ('IIR2', NULL);
INSERT INTO controle_ga_type VALUES ('IIR3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1C1', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1C2', NULL);
INSERT INTO controle_ga_type VALUES ('IS1C3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1R1', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1R2', NULL);
INSERT INTO controle_ga_type VALUES ('IIS1R3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2C1', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2C2', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2C3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2R1', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2R2', NULL);
INSERT INTO controle_ga_type VALUES ('IIS2R3', NULL);
INSERT INTO controle_ga_type VALUES ('IISP', NULL);
INSERT INTO controle_ga_type VALUES ('IISP1', NULL);
INSERT INTO controle_ga_type VALUES ('IISP2', NULL);
INSERT INTO controle_ga_type VALUES ('IISP3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3A', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3B', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3C', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3D', NULL);
INSERT INTO controle_ga_type VALUES ('IIS3E', NULL);
INSERT INTO controle_ga_type VALUES ('IIA', NULL);
INSERT INTO controle_ga_type VALUES ('IIA1A', NULL);
INSERT INTO controle_ga_type VALUES ('IIA1B', NULL);
INSERT INTO controle_ga_type VALUES ('IIA1C', NULL);
INSERT INTO controle_ga_type VALUES ('IIA1D', NULL);
INSERT INTO controle_ga_type VALUES ('IIA2A', NULL);
INSERT INTO controle_ga_type VALUES ('IIA2B', NULL);
INSERT INTO controle_ga_type VALUES ('IIA2C', NULL);
INSERT INTO controle_ga_type VALUES ('IIA2D', NULL);
INSERT INTO controle_ga_type VALUES ('IIA3A', NULL);
INSERT INTO controle_ga_type VALUES ('IIA3B', NULL);
INSERT INTO controle_ga_type VALUES ('IIA3C', NULL);
INSERT INTO controle_ga_type VALUES ('IIA3D', NULL);
INSERT INTO controle_ga_type VALUES ('IIN', NULL);
INSERT INTO controle_ga_type VALUES ('IIB', NULL);
INSERT INTO controle_ga_type VALUES ('IIB1', NULL);
INSERT INTO controle_ga_type VALUES ('IIB1A', NULL);
INSERT INTO controle_ga_type VALUES ('IIB1B', NULL);
INSERT INTO controle_ga_type VALUES ('IIB1C', NULL);
INSERT INTO controle_ga_type VALUES ('IIB1D', NULL);
INSERT INTO controle_ga_type VALUES ('IIB2', NULL);
INSERT INTO controle_ga_type VALUES ('IIB2A', NULL);
INSERT INTO controle_ga_type VALUES ('IIB2B', NULL);
INSERT INTO controle_ga_type VALUES ('IIB2C', NULL);
INSERT INTO controle_ga_type VALUES ('IIB2D', NULL);
INSERT INTO controle_ga_type VALUES ('IIB3', NULL);
INSERT INTO controle_ga_type VALUES ('IIB3A', NULL);
INSERT INTO controle_ga_type VALUES ('IIB3B', NULL);
INSERT INTO controle_ga_type VALUES ('IIB3C', NULL);
INSERT INTO controle_ga_type VALUES ('IIB3D', NULL);
INSERT INTO controle_ga_type VALUES ('IIB4', NULL);
INSERT INTO controle_ga_type VALUES ('IIB4B', NULL);
INSERT INTO controle_ga_type VALUES ('IIC', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1AA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1AB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1BA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1BB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1CA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1CB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1DA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1DB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1EA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1EB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1FA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC1FB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2AA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2AB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2AC', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2AD', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2BA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2BB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2BC', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2BD', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2CA', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2CB', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2CC', NULL);
INSERT INTO controle_ga_type VALUES ('IIC2CD', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3A', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3B', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3C', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3D', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3E', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3F', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3G', NULL);
INSERT INTO controle_ga_type VALUES ('IIC3H', NULL);
INSERT INTO controle_ga_type VALUES ('IIT', NULL);
INSERT INTO controle_ga_type VALUES ('IIT1', NULL);
INSERT INTO controle_ga_type VALUES ('IIT2', NULL);
INSERT INTO controle_ga_type VALUES ('IID', NULL);
INSERT INTO controle_ga_type VALUES ('IID1', NULL);
INSERT INTO controle_ga_type VALUES ('IID2', NULL);
INSERT INTO controle_ga_type VALUES ('IIE', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1AA', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2AB', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1BA', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1BB', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1CA', NULL);
INSERT INTO controle_ga_type VALUES ('IIE1CB', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2A1A', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2A1B', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2A2A', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2A2B', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2B1A', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2B1B', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2B2A', NULL);
INSERT INTO controle_ga_type VALUES ('IIE2B2B', NULL);
INSERT INTO controle_ga_type VALUES ('IIF', NULL);
INSERT INTO controle_ga_type VALUES ('IIFE', NULL);
INSERT INTO controle_ga_type VALUES ('IIFE1', NULL);
INSERT INTO controle_ga_type VALUES ('IIFE2', NULL);
INSERT INTO controle_ga_type VALUES ('IIFE3', NULL);
INSERT INTO controle_ga_type VALUES ('IIFL', NULL);
INSERT INTO controle_ga_type VALUES ('IIFL1', NULL);
INSERT INTO controle_ga_type VALUES ('IIFL2', NULL);
INSERT INTO controle_ga_type VALUES ('IIFL3', NULL);
INSERT INTO controle_ga_type VALUES ('IIG', NULL);
INSERT INTO controle_ga_type VALUES ('III', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA1', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA2', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA3', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA4', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA5', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA6', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA7', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA8', NULL);
INSERT INTO controle_ga_type VALUES ('IIIA9', NULL);
INSERT INTO controle_ga_type VALUES ('IIIB', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA1', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA2', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA3', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA4', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA5', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA6', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA7', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA8', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBA9', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB1', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB3', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB5', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB7', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB8', NULL);
INSERT INTO controle_ga_type VALUES ('IIIBB9', NULL);
INSERT INTO controle_ga_type VALUES ('IIIC', NULL);
INSERT INTO controle_ga_type VALUES ('IIIC1', NULL);
INSERT INTO controle_ga_type VALUES ('IIIC2', NULL);
INSERT INTO controle_ga_type VALUES ('IIID', NULL);
INSERT INTO controle_ga_type VALUES ('IIID1', NULL);
INSERT INTO controle_ga_type VALUES ('IIID2', NULL);
INSERT INTO controle_ga_type VALUES ('VR', NULL);
INSERT INTO controle_ga_type VALUES ('IVR1', NULL);
INSERT INTO controle_ga_type VALUES ('IVR2', NULL);
INSERT INTO controle_ga_type VALUES ('IVR3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS1', NULL);
INSERT INTO controle_ga_type VALUES ('IVS1C2', NULL);
INSERT INTO controle_ga_type VALUES ('IVS1C3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS1R2', NULL);
INSERT INTO controle_ga_type VALUES ('IVS1R3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS2', NULL);
INSERT INTO controle_ga_type VALUES ('IVS2C2', NULL);
INSERT INTO controle_ga_type VALUES ('IVS2C3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS2R2', NULL);
INSERT INTO controle_ga_type VALUES ('IVS2R3', NULL);
INSERT INTO controle_ga_type VALUES ('IVSP', NULL);
INSERT INTO controle_ga_type VALUES ('IVSP2', NULL);
INSERT INTO controle_ga_type VALUES ('IVSP3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3A', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3B', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3C', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3D', NULL);
INSERT INTO controle_ga_type VALUES ('IVS3E', NULL);
INSERT INTO controle_ga_type VALUES ('IVA', NULL);
INSERT INTO controle_ga_type VALUES ('IVAA', NULL);
INSERT INTO controle_ga_type VALUES ('IVAB', NULL);
INSERT INTO controle_ga_type VALUES ('IVAC', NULL);
INSERT INTO controle_ga_type VALUES ('IVAD', NULL);
INSERT INTO controle_ga_type VALUES ('IVN', NULL);
INSERT INTO controle_ga_type VALUES ('IVB', NULL);
INSERT INTO controle_ga_type VALUES ('IVB1', NULL);
INSERT INTO controle_ga_type VALUES ('IVB1A', NULL);
INSERT INTO controle_ga_type VALUES ('IVB1B', NULL);
INSERT INTO controle_ga_type VALUES ('IVB2', NULL);
INSERT INTO controle_ga_type VALUES ('IVB2A', NULL);
INSERT INTO controle_ga_type VALUES ('IVB2B', NULL);
INSERT INTO controle_ga_type VALUES ('IVB3', NULL);
INSERT INTO controle_ga_type VALUES ('IVB3A', NULL);
INSERT INTO controle_ga_type VALUES ('IVB3B', NULL);
INSERT INTO controle_ga_type VALUES ('IVB4', NULL);
INSERT INTO controle_ga_type VALUES ('IVC', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1AA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1BA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1AB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1BB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1CA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1CB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1DA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1DB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1EA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC1EB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2AA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2BA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2AB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2BB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2CA', NULL);
INSERT INTO controle_ga_type VALUES ('IVC2CB', NULL);
INSERT INTO controle_ga_type VALUES ('IVC3', NULL);
INSERT INTO controle_ga_type VALUES ('IVC3A', NULL);
INSERT INTO controle_ga_type VALUES ('IVC3B', NULL);
INSERT INTO controle_ga_type VALUES ('IVD', NULL);
INSERT INTO controle_ga_type VALUES ('IVD1', NULL);
INSERT INTO controle_ga_type VALUES ('IVD2', NULL);
INSERT INTO controle_ga_type VALUES ('IVE', NULL);
INSERT INTO controle_ga_type VALUES ('V', NULL);
INSERT INTO controle_ga_type VALUES ('V1', NULL);
INSERT INTO controle_ga_type VALUES ('V2', NULL);
INSERT INTO controle_ga_type VALUES ('V2BIS', NULL);
INSERT INTO controle_ga_type VALUES ('V3', NULL);
INSERT INTO controle_ga_type VALUES ('V4', NULL);
INSERT INTO controle_ga_type VALUES ('V5', NULL);
INSERT INTO controle_ga_type VALUES ('V6', NULL);
INSERT INTO controle_ga_type VALUES ('V7', NULL);
INSERT INTO controle_ga_type VALUES ('V8', NULL);
INSERT INTO controle_ga_type VALUES ('V9', NULL);
INSERT INTO controle_ga_type VALUES ('V10', NULL);
INSERT INTO controle_ga_type VALUES ('V11', NULL);
INSERT INTO controle_ga_type VALUES ('VI', NULL);
INSERT INTO controle_ga_type VALUES ('VI1', NULL);
INSERT INTO controle_ga_type VALUES ('VI2', NULL);
INSERT INTO controle_ga_type VALUES ('VI2BIS', NULL);
INSERT INTO controle_ga_type VALUES ('VI3', NULL);
INSERT INTO controle_ga_type VALUES ('VI4', NULL);
INSERT INTO controle_ga_type VALUES ('VI5', NULL);
INSERT INTO controle_ga_type VALUES ('VI6', NULL);
INSERT INTO controle_ga_type VALUES ('VI7', NULL);
INSERT INTO controle_ga_type VALUES ('VI8', NULL);
INSERT INTO controle_ga_type VALUES ('VI9', NULL);
INSERT INTO controle_ga_type VALUES ('VI10', NULL);
INSERT INTO controle_ga_type VALUES ('VI11', NULL);
INSERT INTO controle_ga_type VALUES ('VI12', NULL);
INSERT INTO controle_ga_type VALUES ('VII', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA1', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA1A', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA1B', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA2', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA2A', NULL);
INSERT INTO controle_ga_type VALUES ('VIIA2B', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB1', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB1A', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB1B', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB2', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB2A', NULL);
INSERT INTO controle_ga_type VALUES ('VIIB2B', NULL);
INSERT INTO controle_ga_type VALUES ('VIIC', NULL);
INSERT INTO controle_ga_type VALUES ('VIII', NULL);
INSERT INTO controle_ga_type VALUES ('IX', NULL);
INSERT INTO controle_ga_type VALUES ('IXA', NULL);
INSERT INTO controle_ga_type VALUES ('IXB', NULL);


--
-- Data for Name: controle_h_amenagement_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_amenagement_bord VALUES ('AB0', NULL);
INSERT INTO controle_h_amenagement_bord VALUES ('AB1', NULL);
INSERT INTO controle_h_amenagement_bord VALUES ('AB2', NULL);
INSERT INTO controle_h_amenagement_bord VALUES ('AB3', NULL);


--
-- Data for Name: controle_h_amenagement_distal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_h_arete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_arete VALUES ('ALR', NULL);
INSERT INTO controle_h_arete VALUES ('ALI', NULL);
INSERT INTO controle_h_arete VALUES ('ALS', NULL);
INSERT INTO controle_h_arete VALUES ('ALSI', NULL);
INSERT INTO controle_h_arete VALUES ('ALSR', NULL);
INSERT INTO controle_h_arete VALUES ('ALRI', NULL);
INSERT INTO controle_h_arete VALUES ('ALRS', NULL);
INSERT INTO controle_h_arete VALUES ('ALIS', NULL);
INSERT INTO controle_h_arete VALUES ('AL0', NULL);


--
-- Data for Name: controle_h_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_base VALUES ('B1', NULL);
INSERT INTO controle_h_base VALUES ('B2', NULL);


--
-- Data for Name: controle_h_bilaterale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_bilaterale VALUES ('SB0', NULL);
INSERT INTO controle_h_bilaterale VALUES ('SB1', NULL);
INSERT INTO controle_h_bilaterale VALUES ('SMDI', NULL);


--
-- Data for Name: controle_h_biseau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_biseau VALUES ('BT0', NULL);
INSERT INTO controle_h_biseau VALUES ('BT1', NULL);
INSERT INTO controle_h_biseau VALUES ('BT1A', NULL);
INSERT INTO controle_h_biseau VALUES ('BT1B', NULL);
INSERT INTO controle_h_biseau VALUES ('BT1C', NULL);


--
-- Data for Name: controle_h_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_bord VALUES ('FB1', NULL);
INSERT INTO controle_h_bord VALUES ('FB2', NULL);
INSERT INTO controle_h_bord VALUES ('FB3', NULL);
INSERT INTO controle_h_bord VALUES ('FB4', NULL);
INSERT INTO controle_h_bord VALUES ('FB23', NULL);
INSERT INTO controle_h_bord VALUES ('FB12', NULL);
INSERT INTO controle_h_bord VALUES ('FB13', NULL);


--
-- Data for Name: controle_h_distale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_distale VALUES ('1', NULL);
INSERT INTO controle_h_distale VALUES ('2', NULL);


--
-- Data for Name: controle_h_extension; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_extension VALUES ('ERU', NULL);
INSERT INTO controle_h_extension VALUES ('EAU', NULL);
INSERT INTO controle_h_extension VALUES ('EMU', NULL);
INSERT INTO controle_h_extension VALUES ('ER', NULL);
INSERT INTO controle_h_extension VALUES ('ERA', NULL);
INSERT INTO controle_h_extension VALUES ('EA', NULL);
INSERT INTO controle_h_extension VALUES ('EMA', NULL);
INSERT INTO controle_h_extension VALUES ('EMM', NULL);
INSERT INTO controle_h_extension VALUES ('EMR', NULL);


--
-- Data for Name: controle_h_facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_facture VALUES ('FHB', NULL);
INSERT INTO controle_h_facture VALUES ('FHM', NULL);
INSERT INTO controle_h_facture VALUES ('HT', NULL);


--
-- Data for Name: controle_h_meplat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_meplat VALUES ('MI0', NULL);
INSERT INTO controle_h_meplat VALUES ('MI1', NULL);
INSERT INTO controle_h_meplat VALUES ('MI1U', NULL);
INSERT INTO controle_h_meplat VALUES ('MI1B', NULL);


--
-- Data for Name: controle_h_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_retouche VALUES ('RS0', NULL);
INSERT INTO controle_h_retouche VALUES ('RS1', NULL);
INSERT INTO controle_h_retouche VALUES ('RS2', NULL);
INSERT INTO controle_h_retouche VALUES ('RS5', NULL);
INSERT INTO controle_h_retouche VALUES ('2', NULL);
INSERT INTO controle_h_retouche VALUES ('Q', NULL);


--
-- Data for Name: controle_h_surface; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_surface VALUES ('SO0', NULL);
INSERT INTO controle_h_surface VALUES ('SO1', NULL);
INSERT INTO controle_h_surface VALUES ('SO2', NULL);
INSERT INTO controle_h_surface VALUES ('SO3', NULL);


--
-- Data for Name: controle_h_symetrie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_h_symetrie VALUES ('SMD0', NULL);
INSERT INTO controle_h_symetrie VALUES ('SMD1', NULL);


--
-- Data for Name: controle_i_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_action VALUES ('BL', NULL);
INSERT INTO controle_i_action VALUES ('GR', NULL);
INSERT INTO controle_i_action VALUES ('RB', NULL);
INSERT INTO controle_i_action VALUES ('RS', NULL);
INSERT INTO controle_i_action VALUES ('CQI', NULL);
INSERT INTO controle_i_action VALUES ('CQF', NULL);
INSERT INTO controle_i_action VALUES ('CQG', NULL);
INSERT INTO controle_i_action VALUES ('DPI', NULL);
INSERT INTO controle_i_action VALUES ('DPF', NULL);
INSERT INTO controle_i_action VALUES ('DPG', NULL);
INSERT INTO controle_i_action VALUES ('DCI', NULL);
INSERT INTO controle_i_action VALUES ('DCF', NULL);
INSERT INTO controle_i_action VALUES ('DCG', NULL);
INSERT INTO controle_i_action VALUES ('ECI', NULL);
INSERT INTO controle_i_action VALUES ('ECF', NULL);
INSERT INTO controle_i_action VALUES ('ECG', NULL);


--
-- Data for Name: controle_i_alteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_alteration VALUES ('NA', NULL);
INSERT INTO controle_i_alteration VALUES ('AF', NULL);
INSERT INTO controle_i_alteration VALUES ('AT', NULL);
INSERT INTO controle_i_alteration VALUES ('AM', NULL);


--
-- Data for Name: controle_i_desilicification; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_desilicification VALUES ('ND', NULL);
INSERT INTO controle_i_desilicification VALUES ('DF', NULL);
INSERT INTO controle_i_desilicification VALUES ('DM', NULL);
INSERT INTO controle_i_desilicification VALUES ('DT', NULL);


--
-- Data for Name: controle_i_dpatine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_dpatine VALUES ('H', NULL);
INSERT INTO controle_i_dpatine VALUES ('RD', NULL);
INSERT INTO controle_i_dpatine VALUES ('RDF', NULL);
INSERT INTO controle_i_dpatine VALUES ('RDS', NULL);
INSERT INTO controle_i_dpatine VALUES ('RN', NULL);
INSERT INTO controle_i_dpatine VALUES ('RNP', NULL);
INSERT INTO controle_i_dpatine VALUES ('RNO', NULL);
INSERT INTO controle_i_dpatine VALUES ('RNR', NULL);
INSERT INTO controle_i_dpatine VALUES ('RNI', NULL);
INSERT INTO controle_i_dpatine VALUES ('RND', NULL);
INSERT INTO controle_i_dpatine VALUES ('RNE', NULL);


--
-- Data for Name: controle_i_encroutement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_encroutement VALUES ('ECC', NULL);
INSERT INTO controle_i_encroutement VALUES ('ECE', NULL);
INSERT INTO controle_i_encroutement VALUES ('ECP', NULL);
INSERT INTO controle_i_encroutement VALUES ('ECF', NULL);
INSERT INTO controle_i_encroutement VALUES ('ECT', NULL);


--
-- Data for Name: controle_i_eolisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_eolisation VALUES ('NE', NULL);
INSERT INTO controle_i_eolisation VALUES ('FE', NULL);
INSERT INTO controle_i_eolisation VALUES ('TE', NULL);


--
-- Data for Name: controle_i_forme_galet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_forme_galet VALUES ('O', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PI', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC2', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC3', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC5', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC6', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PC8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PL1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PL4', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PL7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('PL8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EA', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EB', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBI', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBC1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBC2', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBC3', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBC7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBC8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBL1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBL4', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBL7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EBL8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EC', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECI', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECC1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECC2', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECC3', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECC7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECC8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECL1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECL4', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECL7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('ECL8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('D', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDI', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDC1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDC2', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDC3', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDC7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDC8', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDL1', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDL4', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDL7', NULL);
INSERT INTO controle_i_forme_galet VALUES ('EDL8', NULL);


--
-- Data for Name: controle_i_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_lustrage VALUES ('NL', NULL);
INSERT INTO controle_i_lustrage VALUES ('FL', NULL);
INSERT INTO controle_i_lustrage VALUES ('TL', NULL);


--
-- Data for Name: controle_i_matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_matiere VALUES ('IND', NULL);
INSERT INTO controle_i_matiere VALUES ('S', NULL);
INSERT INTO controle_i_matiere VALUES ('CAD', NULL);
INSERT INTO controle_i_matiere VALUES ('CAL', NULL);
INSERT INTO controle_i_matiere VALUES ('J', NULL);
INSERT INTO controle_i_matiere VALUES ('JS', NULL);
INSERT INTO controle_i_matiere VALUES ('CS', NULL);
INSERT INTO controle_i_matiere VALUES ('CH', NULL);
INSERT INTO controle_i_matiere VALUES ('Q', NULL);
INSERT INTO controle_i_matiere VALUES ('QI', NULL);
INSERT INTO controle_i_matiere VALUES ('QBO', NULL);
INSERT INTO controle_i_matiere VALUES ('QBT', NULL);
INSERT INTO controle_i_matiere VALUES ('QBB', NULL);
INSERT INTO controle_i_matiere VALUES ('QR', NULL);
INSERT INTO controle_i_matiere VALUES ('QZT', NULL);
INSERT INTO controle_i_matiere VALUES ('QZT0', NULL);
INSERT INTO controle_i_matiere VALUES ('QZT1', NULL);
INSERT INTO controle_i_matiere VALUES ('QZT2', NULL);
INSERT INTO controle_i_matiere VALUES ('QZT3', NULL);
INSERT INTO controle_i_matiere VALUES ('GQZT', NULL);
INSERT INTO controle_i_matiere VALUES ('GQZT1', NULL);
INSERT INTO controle_i_matiere VALUES ('GQZT2', NULL);
INSERT INTO controle_i_matiere VALUES ('G', NULL);
INSERT INTO controle_i_matiere VALUES ('SCH', NULL);
INSERT INTO controle_i_matiere VALUES ('V', NULL);
INSERT INTO controle_i_matiere VALUES ('VI', NULL);
INSERT INTO controle_i_matiere VALUES ('VA', NULL);
INSERT INTO controle_i_matiere VALUES ('VD', NULL);
INSERT INTO controle_i_matiere VALUES ('VR', NULL);
INSERT INTO controle_i_matiere VALUES ('VB', NULL);
INSERT INTO controle_i_matiere VALUES ('M', NULL);
INSERT INTO controle_i_matiere VALUES ('MI', NULL);
INSERT INTO controle_i_matiere VALUES ('MM', NULL);
INSERT INTO controle_i_matiere VALUES ('MGS', NULL);
INSERT INTO controle_i_matiere VALUES ('MG', NULL);
INSERT INTO controle_i_matiere VALUES ('GAB', NULL);
INSERT INTO controle_i_matiere VALUES ('CA', NULL);
INSERT INTO controle_i_matiere VALUES ('CAI', NULL);
INSERT INTO controle_i_matiere VALUES ('CAG', NULL);
INSERT INTO controle_i_matiere VALUES ('CAM', NULL);
INSERT INTO controle_i_matiere VALUES ('CAR', NULL);
INSERT INTO controle_i_matiere VALUES ('CSUB', NULL);
INSERT INTO controle_i_matiere VALUES ('CPS', NULL);
INSERT INTO controle_i_matiere VALUES ('CAGS', NULL);
INSERT INTO controle_i_matiere VALUES ('BS', NULL);
INSERT INTO controle_i_matiere VALUES ('CHT', NULL);
INSERT INTO controle_i_matiere VALUES ('ES', NULL);
INSERT INTO controle_i_matiere VALUES ('D', NULL);
INSERT INTO controle_i_matiere VALUES ('LYD', NULL);
INSERT INTO controle_i_matiere VALUES ('DNT', NULL);
INSERT INTO controle_i_matiere VALUES ('OS', NULL);
INSERT INTO controle_i_matiere VALUES ('CHC', NULL);


--
-- Data for Name: controle_i_objet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_objet VALUES ('ECL', NULL);
INSERT INTO controle_i_objet VALUES ('LAM', NULL);
INSERT INTO controle_i_objet VALUES ('PEC', NULL);
INSERT INTO controle_i_objet VALUES ('LAML', NULL);
INSERT INTO controle_i_objet VALUES ('ERT', NULL);
INSERT INTO controle_i_objet VALUES ('DEB', NULL);
INSERT INTO controle_i_objet VALUES ('PDE', NULL);
INSERT INTO controle_i_objet VALUES ('MDE', NULL);
INSERT INTO controle_i_objet VALUES ('GAL', NULL);
INSERT INTO controle_i_objet VALUES ('GALF', NULL);
INSERT INTO controle_i_objet VALUES ('PERC', NULL);
INSERT INTO controle_i_objet VALUES ('BIF', NULL);
INSERT INTO controle_i_objet VALUES ('HACH', NULL);
INSERT INTO controle_i_objet VALUES ('NUC', NULL);
INSERT INTO controle_i_objet VALUES ('OUT', NULL);
INSERT INTO controle_i_objet VALUES ('GAM', NULL);
INSERT INTO controle_i_objet VALUES ('CHBUR', NULL);
INSERT INTO controle_i_objet VALUES ('PEL', NULL);
INSERT INTO controle_i_objet VALUES ('RET', NULL);
INSERT INTO controle_i_objet VALUES ('GALENLV', NULL);


--
-- Data for Name: controle_i_patine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_patine VALUES ('N', NULL);
INSERT INTO controle_i_patine VALUES ('G', NULL);
INSERT INTO controle_i_patine VALUES ('GBG', NULL);
INSERT INTO controle_i_patine VALUES ('GM', NULL);
INSERT INTO controle_i_patine VALUES ('GBT', NULL);
INSERT INTO controle_i_patine VALUES ('GBL', NULL);
INSERT INTO controle_i_patine VALUES ('GR', NULL);
INSERT INTO controle_i_patine VALUES ('GV', NULL);
INSERT INTO controle_i_patine VALUES ('GVR', NULL);
INSERT INTO controle_i_patine VALUES ('BG', NULL);
INSERT INTO controle_i_patine VALUES ('BR', NULL);
INSERT INTO controle_i_patine VALUES ('BL', NULL);
INSERT INTO controle_i_patine VALUES ('J', NULL);
INSERT INTO controle_i_patine VALUES ('M', NULL);
INSERT INTO controle_i_patine VALUES ('RL', NULL);
INSERT INTO controle_i_patine VALUES ('RG', NULL);
INSERT INTO controle_i_patine VALUES ('GN', NULL);
INSERT INTO controle_i_patine VALUES ('VIO', NULL);
INSERT INTO controle_i_patine VALUES ('RS', NULL);
INSERT INTO controle_i_patine VALUES ('V', NULL);


--
-- Data for Name: controle_i_pmycellium; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_pmycellium VALUES ('PMC', NULL);
INSERT INTO controle_i_pmycellium VALUES ('PME', NULL);
INSERT INTO controle_i_pmycellium VALUES ('PMP', NULL);
INSERT INTO controle_i_pmycellium VALUES ('PMF', NULL);
INSERT INTO controle_i_pmycellium VALUES ('PMT', NULL);


--
-- Data for Name: controle_i_responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_i_roulage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_roulage VALUES ('NR', NULL);
INSERT INTO controle_i_roulage VALUES ('FR', NULL);
INSERT INTO controle_i_roulage VALUES ('TR', NULL);


--
-- Data for Name: controle_i_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_support VALUES ('I', NULL);
INSERT INTO controle_i_support VALUES ('PE', NULL);
INSERT INTO controle_i_support VALUES ('NLE', NULL);
INSERT INTO controle_i_support VALUES ('D', NULL);
INSERT INTO controle_i_support VALUES ('N', NULL);
INSERT INTO controle_i_support VALUES ('B', NULL);
INSERT INTO controle_i_support VALUES ('DTH', NULL);
INSERT INTO controle_i_support VALUES ('G0', NULL);
INSERT INTO controle_i_support VALUES ('G1', NULL);
INSERT INTO controle_i_support VALUES ('G2', NULL);
INSERT INTO controle_i_support VALUES ('G3', NULL);
INSERT INTO controle_i_support VALUES ('PEE', NULL);
INSERT INTO controle_i_support VALUES ('ER', NULL);
INSERT INTO controle_i_support VALUES ('EFB', NULL);
INSERT INTO controle_i_support VALUES ('NL', NULL);
INSERT INTO controle_i_support VALUES ('L', NULL);
INSERT INTO controle_i_support VALUES ('OS', NULL);
INSERT INTO controle_i_support VALUES ('DNT', NULL);
INSERT INTO controle_i_support VALUES ('PLQ', NULL);
INSERT INTO controle_i_support VALUES ('D1', NULL);
INSERT INTO controle_i_support VALUES ('D2', NULL);
INSERT INTO controle_i_support VALUES ('D3', NULL);
INSERT INTO controle_i_support VALUES ('D4', NULL);


--
-- Data for Name: controle_i_support_originel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_i_support_originel VALUES ('GAL', '');
INSERT INTO controle_i_support_originel VALUES ('PIE', '');
INSERT INTO controle_i_support_originel VALUES ('ROG', '');
INSERT INTO controle_i_support_originel VALUES ('BLOC', '');
INSERT INTO controle_i_support_originel VALUES ('NOD', '');
INSERT INTO controle_i_support_originel VALUES ('OS', '');
INSERT INTO controle_i_support_originel VALUES ('PLQ', '');


--
-- Data for Name: controle_localite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_localite VALUES ('N', NULL);
INSERT INTO controle_localite VALUES ('E', 'sol UA25');
INSERT INTO controle_localite VALUES ('ET', 'sol UA25');
INSERT INTO controle_localite VALUES ('A', 'sol UA25');
INSERT INTO controle_localite VALUES ('B', 'sol UA25');
INSERT INTO controle_localite VALUES ('C', 'sol UA25');
INSERT INTO controle_localite VALUES ('CT', 'sol UA25');
INSERT INTO controle_localite VALUES ('D', 'sol UA25');
INSERT INTO controle_localite VALUES ('F', 'sol UA25');
INSERT INTO controle_localite VALUES ('FF', 'sol UA25');
INSERT INTO controle_localite VALUES ('G', 'sol UA25');
INSERT INTO controle_localite VALUES ('H', 'sol UA25');
INSERT INTO controle_localite VALUES ('I1', 'sol UA25');
INSERT INTO controle_localite VALUES ('I2', 'sol UA25');


--
-- Data for Name: controle_locus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_locus VALUES ('LO8', NULL);
INSERT INTO controle_locus VALUES ('LO5', NULL);
INSERT INTO controle_locus VALUES ('-B', NULL);
INSERT INTO controle_locus VALUES ('-N', NULL);
INSERT INTO controle_locus VALUES ('CEN', NULL);
INSERT INTO controle_locus VALUES ('PUI', NULL);
INSERT INTO controle_locus VALUES ('-III', NULL);
INSERT INTO controle_locus VALUES ('--', NULL);
INSERT INTO controle_locus VALUES ('ENT', NULL);
INSERT INTO controle_locus VALUES ('LO6', NULL);
INSERT INTO controle_locus VALUES ('LO7', NULL);


--
-- Data for Name: controle_mf_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_mf_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_n_cortotal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_n_cortotal VALUES (3, NULL);
INSERT INTO controle_n_cortotal VALUES (2, NULL);
INSERT INTO controle_n_cortotal VALUES (1, NULL);
INSERT INTO controle_n_cortotal VALUES (0, NULL);


--
-- Data for Name: controle_n_epuisement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_n_epuisement VALUES (1, NULL);
INSERT INTO controle_n_epuisement VALUES (2, NULL);
INSERT INTO controle_n_epuisement VALUES (3, NULL);
INSERT INTO controle_n_epuisement VALUES (4, NULL);
INSERT INTO controle_n_epuisement VALUES (5, NULL);
INSERT INTO controle_n_epuisement VALUES (6, NULL);


--
-- Data for Name: controle_n_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_n_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_n_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_n_type VALUES ('N1', NULL);
INSERT INTO controle_n_type VALUES ('N1A', NULL);
INSERT INTO controle_n_type VALUES ('N1ARC', NULL);
INSERT INTO controle_n_type VALUES ('N1AEP', NULL);
INSERT INTO controle_n_type VALUES ('N1ARU', NULL);
INSERT INTO controle_n_type VALUES ('N1ARB', NULL);
INSERT INTO controle_n_type VALUES ('N1B', NULL);
INSERT INTO controle_n_type VALUES ('N1C', NULL);
INSERT INTO controle_n_type VALUES ('N1CRU', NULL);
INSERT INTO controle_n_type VALUES ('N1CRB', NULL);
INSERT INTO controle_n_type VALUES ('N2', NULL);
INSERT INTO controle_n_type VALUES ('N2DA', NULL);
INSERT INTO controle_n_type VALUES ('N2DB', NULL);
INSERT INTO controle_n_type VALUES ('N2DC', NULL);
INSERT INTO controle_n_type VALUES ('N2DD', NULL);
INSERT INTO controle_n_type VALUES ('N2DE', NULL);
INSERT INTO controle_n_type VALUES ('N2DF', NULL);
INSERT INTO controle_n_type VALUES ('N2RA', NULL);
INSERT INTO controle_n_type VALUES ('N2RB', NULL);
INSERT INTO controle_n_type VALUES ('N2RC', NULL);
INSERT INTO controle_n_type VALUES ('N2RD', NULL);
INSERT INTO controle_n_type VALUES ('N2RE', NULL);
INSERT INTO controle_n_type VALUES ('N2RF', NULL);
INSERT INTO controle_n_type VALUES ('N2IA', NULL);
INSERT INTO controle_n_type VALUES ('N2IB', NULL);
INSERT INTO controle_n_type VALUES ('N2IC', NULL);
INSERT INTO controle_n_type VALUES ('N2ID', NULL);
INSERT INTO controle_n_type VALUES ('N2IE', NULL);
INSERT INTO controle_n_type VALUES ('N2IF', NULL);
INSERT INTO controle_n_type VALUES ('N3', NULL);
INSERT INTO controle_n_type VALUES ('N3DA', NULL);
INSERT INTO controle_n_type VALUES ('N3DB', NULL);
INSERT INTO controle_n_type VALUES ('N3RA', NULL);
INSERT INTO controle_n_type VALUES ('N3RB', NULL);
INSERT INTO controle_n_type VALUES ('N3IA', NULL);
INSERT INTO controle_n_type VALUES ('N3IB', NULL);
INSERT INTO controle_n_type VALUES ('N4', NULL);
INSERT INTO controle_n_type VALUES ('N4A', NULL);
INSERT INTO controle_n_type VALUES ('N4B', NULL);
INSERT INTO controle_n_type VALUES ('N4B1', NULL);
INSERT INTO controle_n_type VALUES ('N4C', NULL);
INSERT INTO controle_n_type VALUES ('N4D', NULL);
INSERT INTO controle_n_type VALUES ('N4D1', NULL);
INSERT INTO controle_n_type VALUES ('N4E', NULL);
INSERT INTO controle_n_type VALUES ('N4F', NULL);
INSERT INTO controle_n_type VALUES ('N4F1', NULL);
INSERT INTO controle_n_type VALUES ('N5', NULL);
INSERT INTO controle_n_type VALUES ('N5U', NULL);
INSERT INTO controle_n_type VALUES ('N5UA', NULL);
INSERT INTO controle_n_type VALUES ('N5UB', NULL);
INSERT INTO controle_n_type VALUES ('N5UC', NULL);
INSERT INTO controle_n_type VALUES ('N5UD', NULL);
INSERT INTO controle_n_type VALUES ('N5BOA', NULL);
INSERT INTO controle_n_type VALUES ('N5BOB', NULL);
INSERT INTO controle_n_type VALUES ('N5BOC', NULL);
INSERT INTO controle_n_type VALUES ('N5BOD', NULL);
INSERT INTO controle_n_type VALUES ('N5BOE', NULL);
INSERT INTO controle_n_type VALUES ('N5BAA', NULL);
INSERT INTO controle_n_type VALUES ('N5BAB', NULL);
INSERT INTO controle_n_type VALUES ('N5BAC', NULL);
INSERT INTO controle_n_type VALUES ('N5BAD', NULL);
INSERT INTO controle_n_type VALUES ('N6', NULL);
INSERT INTO controle_n_type VALUES ('N6A', NULL);
INSERT INTO controle_n_type VALUES ('N6B', NULL);
INSERT INTO controle_n_type VALUES ('N6C', NULL);
INSERT INTO controle_n_type VALUES ('N6D', NULL);
INSERT INTO controle_n_type VALUES ('NO', NULL);
INSERT INTO controle_n_type VALUES ('NO2', NULL);
INSERT INTO controle_n_type VALUES ('NO3', NULL);
INSERT INTO controle_n_type VALUES ('NO4', NULL);
INSERT INTO controle_n_type VALUES ('NO5', NULL);
INSERT INTO controle_n_type VALUES ('N7', NULL);
INSERT INTO controle_n_type VALUES ('N7U', NULL);
INSERT INTO controle_n_type VALUES ('N7UA', NULL);
INSERT INTO controle_n_type VALUES ('N7UB', NULL);
INSERT INTO controle_n_type VALUES ('N7UC', NULL);
INSERT INTO controle_n_type VALUES ('N7UD', NULL);
INSERT INTO controle_n_type VALUES ('N7UE', NULL);
INSERT INTO controle_n_type VALUES ('N7UF', NULL);
INSERT INTO controle_n_type VALUES ('N7D', NULL);
INSERT INTO controle_n_type VALUES ('N7DA', NULL);
INSERT INTO controle_n_type VALUES ('N7DB', NULL);
INSERT INTO controle_n_type VALUES ('N7DC', NULL);
INSERT INTO controle_n_type VALUES ('N7DD', NULL);
INSERT INTO controle_n_type VALUES ('N7DE', NULL);
INSERT INTO controle_n_type VALUES ('N7DF', NULL);
INSERT INTO controle_n_type VALUES ('N7B', NULL);
INSERT INTO controle_n_type VALUES ('N7B1A', NULL);
INSERT INTO controle_n_type VALUES ('N7B1B', NULL);
INSERT INTO controle_n_type VALUES ('N7B1C', NULL);
INSERT INTO controle_n_type VALUES ('N7B1D', NULL);
INSERT INTO controle_n_type VALUES ('N7B1E', NULL);
INSERT INTO controle_n_type VALUES ('N7B1F', NULL);
INSERT INTO controle_n_type VALUES ('N7B1G', NULL);
INSERT INTO controle_n_type VALUES ('N7B2A', NULL);
INSERT INTO controle_n_type VALUES ('N7B2B', NULL);
INSERT INTO controle_n_type VALUES ('N7B2C', NULL);
INSERT INTO controle_n_type VALUES ('N7B2D', NULL);
INSERT INTO controle_n_type VALUES ('N7B2E', NULL);
INSERT INTO controle_n_type VALUES ('N7B2F', NULL);
INSERT INTO controle_n_type VALUES ('N7B2G', NULL);
INSERT INTO controle_n_type VALUES ('N7B3A', NULL);
INSERT INTO controle_n_type VALUES ('N7B3B', NULL);
INSERT INTO controle_n_type VALUES ('N7B3C', NULL);
INSERT INTO controle_n_type VALUES ('N7B3D', NULL);
INSERT INTO controle_n_type VALUES ('N7B3E', NULL);
INSERT INTO controle_n_type VALUES ('N7B3F', NULL);
INSERT INTO controle_n_type VALUES ('N7B3G', NULL);
INSERT INTO controle_n_type VALUES ('N7B4A', NULL);
INSERT INTO controle_n_type VALUES ('N7B4B', NULL);
INSERT INTO controle_n_type VALUES ('N7B4C', NULL);
INSERT INTO controle_n_type VALUES ('N7B4D', NULL);
INSERT INTO controle_n_type VALUES ('N7B4E', NULL);
INSERT INTO controle_n_type VALUES ('N7B4F', NULL);
INSERT INTO controle_n_type VALUES ('N7B4G', NULL);
INSERT INTO controle_n_type VALUES ('N7M', NULL);
INSERT INTO controle_n_type VALUES ('N7MA', NULL);
INSERT INTO controle_n_type VALUES ('N7MB', NULL);
INSERT INTO controle_n_type VALUES ('N7MC', NULL);
INSERT INTO controle_n_type VALUES ('NA', NULL);
INSERT INTO controle_n_type VALUES ('NA1', NULL);
INSERT INTO controle_n_type VALUES ('NA2', NULL);
INSERT INTO controle_n_type VALUES ('NA3', NULL);
INSERT INTO controle_n_type VALUES ('NA4', NULL);


--
-- Data for Name: controle_nature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_nature VALUES ('OSD', NULL);
INSERT INTO controle_nature VALUES ('ESQ', NULL);
INSERT INTO controle_nature VALUES ('COQ', NULL);
INSERT INTO controle_nature VALUES ('IND', NULL);
INSERT INTO controle_nature VALUES ('GAL', NULL);
INSERT INTO controle_nature VALUES ('OB', NULL);
INSERT INTO controle_nature VALUES ('CHA', NULL);
INSERT INTO controle_nature VALUES ('PIE', NULL);
INSERT INTO controle_nature VALUES ('DNT', NULL);
INSERT INTO controle_nature VALUES ('MDB', NULL);
INSERT INTO controle_nature VALUES ('GCA', NULL);
INSERT INTO controle_nature VALUES ('COP', NULL);
INSERT INTO controle_nature VALUES ('NID', NULL);
INSERT INTO controle_nature VALUES ('CAL', NULL);


--
-- Data for Name: controle_niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_o_chronologie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_chronologie VALUES ('1', NULL);
INSERT INTO controle_o_chronologie VALUES ('2', NULL);
INSERT INTO controle_o_chronologie VALUES ('3', NULL);
INSERT INTO controle_o_chronologie VALUES ('4', NULL);
INSERT INTO controle_o_chronologie VALUES ('5', NULL);
INSERT INTO controle_o_chronologie VALUES ('6', NULL);
INSERT INTO controle_o_chronologie VALUES ('7', NULL);
INSERT INTO controle_o_chronologie VALUES ('8', NULL);
INSERT INTO controle_o_chronologie VALUES ('9', NULL);
INSERT INTO controle_o_chronologie VALUES ('10', NULL);


--
-- Data for Name: controle_o_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_code VALUES ('RACLAT', NULL);
INSERT INTO controle_o_code VALUES ('RACANG', NULL);
INSERT INTO controle_o_code VALUES ('RACTRA', NULL);
INSERT INTO controle_o_code VALUES ('RACDLAT', NULL);
INSERT INTO controle_o_code VALUES ('RACDLATTRA', NULL);
INSERT INTO controle_o_code VALUES ('PTECT', NULL);
INSERT INTO controle_o_code VALUES ('PTLG', NULL);
INSERT INTO controle_o_code VALUES ('LIMPL', NULL);
INSERT INTO controle_o_code VALUES ('LIMEP', NULL);
INSERT INTO controle_o_code VALUES ('PROLIM', NULL);
INSERT INTO controle_o_code VALUES ('RACCONV', NULL);
INSERT INTO controle_o_code VALUES ('PTDEJD', NULL);
INSERT INTO controle_o_code VALUES ('PTDEJG', NULL);
INSERT INTO controle_o_code VALUES ('RACINCD', NULL);
INSERT INTO controle_o_code VALUES ('RACINCG', NULL);
INSERT INTO controle_o_code VALUES ('RACDEJD', NULL);
INSERT INTO controle_o_code VALUES ('RACDEJG', NULL);
INSERT INTO controle_o_code VALUES ('RACDEJLD', NULL);
INSERT INTO controle_o_code VALUES ('RACDEJLG', NULL);
INSERT INTO controle_o_code VALUES ('RACDB', NULL);
INSERT INTO controle_o_code VALUES ('RACTP', NULL);
INSERT INTO controle_o_code VALUES ('RACQU', NULL);
INSERT INTO controle_o_code VALUES ('RACDENLAT', NULL);
INSERT INTO controle_o_code VALUES ('RACDENANG', NULL);
INSERT INTO controle_o_code VALUES ('RACDENTRA', NULL);
INSERT INTO controle_o_code VALUES ('RACCAR', NULL);
INSERT INTO controle_o_code VALUES ('RACDDENLAT', NULL);
INSERT INTO controle_o_code VALUES ('RACDDENTRA', NULL);
INSERT INTO controle_o_code VALUES ('RACDDENLATTRA', NULL);
INSERT INTO controle_o_code VALUES ('PTQ', NULL);
INSERT INTO controle_o_code VALUES ('PTTYC', NULL);
INSERT INTO controle_o_code VALUES ('PTTYL', NULL);
INSERT INTO controle_o_code VALUES ('LIDPL', NULL);
INSERT INTO controle_o_code VALUES ('LIDEP', NULL);
INSERT INTO controle_o_code VALUES ('PRLID', NULL);
INSERT INTO controle_o_code VALUES ('RACCONVD', NULL);
INSERT INTO controle_o_code VALUES ('PTEDDEJD', NULL);
INSERT INTO controle_o_code VALUES ('PTEDDEJG', NULL);
INSERT INTO controle_o_code VALUES ('RACDINCD', NULL);
INSERT INTO controle_o_code VALUES ('RACDINCG', NULL);
INSERT INTO controle_o_code VALUES ('RACDDEJD', NULL);
INSERT INTO controle_o_code VALUES ('RACDDEJG', NULL);
INSERT INTO controle_o_code VALUES ('RACDDEJLD', NULL);
INSERT INTO controle_o_code VALUES ('RACDDEJLG', NULL);
INSERT INTO controle_o_code VALUES ('RACDDB', NULL);
INSERT INTO controle_o_code VALUES ('RACDTP', NULL);
INSERT INTO controle_o_code VALUES ('RACDQU', NULL);
INSERT INTO controle_o_code VALUES ('ENCRES', NULL);
INSERT INTO controle_o_code VALUES ('ENCRED', NULL);
INSERT INTO controle_o_code VALUES ('ENCREM', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCRTT', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCRTN', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCRTR', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCRTA', NULL);
INSERT INTO controle_o_code VALUES ('DENTRLAT', NULL);
INSERT INTO controle_o_code VALUES ('DENTRANG', NULL);
INSERT INTO controle_o_code VALUES ('DENTRTRA', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDLAT', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDANG', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDTRA', NULL);
INSERT INTO controle_o_code VALUES ('PTYRC', NULL);
INSERT INTO controle_o_code VALUES ('PTYRL', NULL);
INSERT INTO controle_o_code VALUES ('DENTRCONV', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDEJD', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDEJG', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDEJLD', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDEJLG', NULL);
INSERT INTO controle_o_code VALUES ('DENTRDB', NULL);
INSERT INTO controle_o_code VALUES ('DENTRTP', NULL);
INSERT INTO controle_o_code VALUES ('DENTRQU', NULL);
INSERT INTO controle_o_code VALUES ('ENCCS', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCCTT', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCCTN', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCCTR', NULL);
INSERT INTO controle_o_code VALUES ('BEC1ENCCTA', NULL);
INSERT INTO controle_o_code VALUES ('DENTCLAT', NULL);
INSERT INTO controle_o_code VALUES ('DENTCANG', NULL);
INSERT INTO controle_o_code VALUES ('DENTCTRA', NULL);
INSERT INTO controle_o_code VALUES ('ENCMD', NULL);
INSERT INTO controle_o_code VALUES ('ENCMM', NULL);
INSERT INTO controle_o_code VALUES ('BECENCM', NULL);
INSERT INTO controle_o_code VALUES ('DENTMLAT', NULL);
INSERT INTO controle_o_code VALUES ('DENTMANG', NULL);
INSERT INTO controle_o_code VALUES ('DENTMTRA', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDLAT', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDTRA', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDLATTRA', NULL);
INSERT INTO controle_o_code VALUES ('PTYMC', NULL);
INSERT INTO controle_o_code VALUES ('PTYML', NULL);
INSERT INTO controle_o_code VALUES ('DENTMCONV', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDEJD', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDEJG', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDEJLD', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDEJLG', NULL);
INSERT INTO controle_o_code VALUES ('DENTMDB', NULL);
INSERT INTO controle_o_code VALUES ('DENTMTP', NULL);
INSERT INTO controle_o_code VALUES ('DENTMQU', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLLN', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLLR', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLLA', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLEMN', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLEMR', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLEEN', NULL);
INSERT INTO controle_o_code VALUES ('GRFPLEER', NULL);
INSERT INTO controle_o_code VALUES ('GRFPCL', NULL);
INSERT INTO controle_o_code VALUES ('GRFPCEM', NULL);
INSERT INTO controle_o_code VALUES ('GRFPCEE', NULL);
INSERT INTO controle_o_code VALUES ('GRFPCEU', NULL);
INSERT INTO controle_o_code VALUES ('GRFPCEC', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLLN', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLLR', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLLA', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLEMN', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLEMR', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLEEN', NULL);
INSERT INTO controle_o_code VALUES ('GRFMLEER', NULL);
INSERT INTO controle_o_code VALUES ('GRFMCL', NULL);
INSERT INTO controle_o_code VALUES ('GRFMCEM', NULL);
INSERT INTO controle_o_code VALUES ('GRFMCEL', NULL);
INSERT INTO controle_o_code VALUES ('GRFMCC', NULL);
INSERT INTO controle_o_code VALUES ('GRMPSE', NULL);
INSERT INTO controle_o_code VALUES ('GRMP1ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMP1EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMP2ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMP2EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMP2EM', NULL);
INSERT INTO controle_o_code VALUES ('GRMESE', NULL);
INSERT INTO controle_o_code VALUES ('GRME1ER', NULL);
INSERT INTO controle_o_code VALUES ('GRME1EC', NULL);
INSERT INTO controle_o_code VALUES ('GRME2ER', NULL);
INSERT INTO controle_o_code VALUES ('GRME2EC', NULL);
INSERT INTO controle_o_code VALUES ('GRME2EM', NULL);
INSERT INTO controle_o_code VALUES ('GRMMPSE', NULL);
INSERT INTO controle_o_code VALUES ('GRMMP1ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMMP1EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMMP2ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMMP2EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMMP2EM', NULL);
INSERT INTO controle_o_code VALUES ('GRMMESE', NULL);
INSERT INTO controle_o_code VALUES ('GRMME1ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMME1EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMME2ER', NULL);
INSERT INTO controle_o_code VALUES ('GRMME2EC', NULL);
INSERT INTO controle_o_code VALUES ('GRMME2EM', NULL);
INSERT INTO controle_o_code VALUES ('GRCMSE', NULL);
INSERT INTO controle_o_code VALUES ('GRCM1ER', NULL);
INSERT INTO controle_o_code VALUES ('GRCM1EC', NULL);
INSERT INTO controle_o_code VALUES ('GRCM2ER', NULL);
INSERT INTO controle_o_code VALUES ('GRCM2EC', NULL);
INSERT INTO controle_o_code VALUES ('GRCM2EM', NULL);
INSERT INTO controle_o_code VALUES ('GRCCA', NULL);
INSERT INTO controle_o_code VALUES ('GRCCN', NULL);
INSERT INTO controle_o_code VALUES ('GRCEV', NULL);
INSERT INTO controle_o_code VALUES ('GRN', NULL);
INSERT INTO controle_o_code VALUES ('RBC', NULL);
INSERT INTO controle_o_code VALUES ('RBN', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLN1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLN2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLN3', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLN4', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT3', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT4', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT5', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT6', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLT7', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO3', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO4', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO5', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLO6', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLE1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSLE2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTN1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTN2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTE1', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTE2', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTE3', NULL);
INSERT INTO controle_o_code VALUES ('BUUSTN', NULL);
INSERT INTO controle_o_code VALUES ('BUUSC', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLN1', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLN2', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLN3', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLN4', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT1', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT2', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT3', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT4', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT5', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLT6', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLE1', NULL);
INSERT INTO controle_o_code VALUES ('BUUMLE2', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTN1', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTN2', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTE1', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTE2', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTE3', NULL);
INSERT INTO controle_o_code VALUES ('BUUMTN', NULL);
INSERT INTO controle_o_code VALUES ('BUBSA', NULL);
INSERT INTO controle_o_code VALUES ('BUBSDG', NULL);
INSERT INTO controle_o_code VALUES ('BUBSDD', NULL);
INSERT INTO controle_o_code VALUES ('BUBSADG', NULL);
INSERT INTO controle_o_code VALUES ('BUBSADD', NULL);
INSERT INTO controle_o_code VALUES ('BUBSAAG', NULL);
INSERT INTO controle_o_code VALUES ('BUBSAAD', NULL);
INSERT INTO controle_o_code VALUES ('BUBMA', NULL);
INSERT INTO controle_o_code VALUES ('BUBMDG', NULL);
INSERT INTO controle_o_code VALUES ('BUBMDD', NULL);
INSERT INTO controle_o_code VALUES ('BUBMADG', NULL);
INSERT INTO controle_o_code VALUES ('BUBMADD', NULL);
INSERT INTO controle_o_code VALUES ('BUBMAAG', NULL);
INSERT INTO controle_o_code VALUES ('BUBMAAD', NULL);
INSERT INTO controle_o_code VALUES ('PEU1', NULL);
INSERT INTO controle_o_code VALUES ('PEU2', NULL);
INSERT INTO controle_o_code VALUES ('PEU3', NULL);
INSERT INTO controle_o_code VALUES ('PEU4', NULL);
INSERT INTO controle_o_code VALUES ('PEU5', NULL);
INSERT INTO controle_o_code VALUES ('PEU6', NULL);
INSERT INTO controle_o_code VALUES ('PEB1', NULL);
INSERT INTO controle_o_code VALUES ('PEB2', NULL);
INSERT INTO controle_o_code VALUES ('PEB3', NULL);
INSERT INTO controle_o_code VALUES ('PEB4', NULL);
INSERT INTO controle_o_code VALUES ('PE1E1', NULL);
INSERT INTO controle_o_code VALUES ('PE1E2', NULL);
INSERT INTO controle_o_code VALUES ('PE1E3', NULL);
INSERT INTO controle_o_code VALUES ('PE1E4', NULL);
INSERT INTO controle_o_code VALUES ('PE1E5', NULL);
INSERT INTO controle_o_code VALUES ('PE1E6', NULL);
INSERT INTO controle_o_code VALUES ('PE1E7', NULL);
INSERT INTO controle_o_code VALUES ('PE1E8', NULL);
INSERT INTO controle_o_code VALUES ('PE2E1', NULL);
INSERT INTO controle_o_code VALUES ('PE2E2', NULL);
INSERT INTO controle_o_code VALUES ('PE2E3', NULL);
INSERT INTO controle_o_code VALUES ('PE2E4', NULL);
INSERT INTO controle_o_code VALUES ('PE2E5', NULL);
INSERT INTO controle_o_code VALUES ('PE2E6', NULL);
INSERT INTO controle_o_code VALUES ('PE2E7', NULL);
INSERT INTO controle_o_code VALUES ('PE2E8', NULL);
INSERT INTO controle_o_code VALUES ('PEZ1', NULL);
INSERT INTO controle_o_code VALUES ('PEZ2', NULL);
INSERT INTO controle_o_code VALUES ('PEZ3', NULL);
INSERT INTO controle_o_code VALUES ('MPEU', NULL);
INSERT INTO controle_o_code VALUES ('MPEB', NULL);
INSERT INTO controle_o_code VALUES ('MPE1E', NULL);
INSERT INTO controle_o_code VALUES ('MPE2E', NULL);
INSERT INTO controle_o_code VALUES ('PEDB', NULL);
INSERT INTO controle_o_code VALUES ('PETP', NULL);
INSERT INTO controle_o_code VALUES ('PEQU', NULL);
INSERT INTO controle_o_code VALUES ('PETR', NULL);
INSERT INTO controle_o_code VALUES ('TRP1', NULL);
INSERT INTO controle_o_code VALUES ('TRP2', NULL);
INSERT INTO controle_o_code VALUES ('TRP3', NULL);
INSERT INTO controle_o_code VALUES ('TRP4', NULL);
INSERT INTO controle_o_code VALUES ('TRP5', NULL);
INSERT INTO controle_o_code VALUES ('TRO1', NULL);
INSERT INTO controle_o_code VALUES ('TRO2', NULL);
INSERT INTO controle_o_code VALUES ('TRO3', NULL);
INSERT INTO controle_o_code VALUES ('TRO4', NULL);
INSERT INTO controle_o_code VALUES ('TRO5', NULL);
INSERT INTO controle_o_code VALUES ('TRO6', NULL);
INSERT INTO controle_o_code VALUES ('TRO7', NULL);
INSERT INTO controle_o_code VALUES ('TRO8', NULL);
INSERT INTO controle_o_code VALUES ('TRO9', NULL);
INSERT INTO controle_o_code VALUES ('TRO10', NULL);
INSERT INTO controle_o_code VALUES ('TRDB', NULL);
INSERT INTO controle_o_code VALUES ('RETTRP1', NULL);
INSERT INTO controle_o_code VALUES ('RETTRP2', NULL);
INSERT INTO controle_o_code VALUES ('RETTRP3', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO1', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO2', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO3', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO4', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO5', NULL);
INSERT INTO controle_o_code VALUES ('RETTRO6', NULL);
INSERT INTO controle_o_code VALUES ('RETTRDB', NULL);
INSERT INTO controle_o_code VALUES ('EVSD', NULL);
INSERT INTO controle_o_code VALUES ('EVSI', NULL);
INSERT INTO controle_o_code VALUES ('EVSM', NULL);
INSERT INTO controle_o_code VALUES ('EVPD', NULL);
INSERT INTO controle_o_code VALUES ('EVPI', NULL);
INSERT INTO controle_o_code VALUES ('EVPM', NULL);
INSERT INTO controle_o_code VALUES ('ECD', NULL);
INSERT INTO controle_o_code VALUES ('ECI', NULL);
INSERT INTO controle_o_code VALUES ('ECM', NULL);
INSERT INTO controle_o_code VALUES ('AMCUG', NULL);
INSERT INTO controle_o_code VALUES ('AMCUD', NULL);
INSERT INTO controle_o_code VALUES ('AMCB', NULL);
INSERT INTO controle_o_code VALUES ('AMEUG', NULL);
INSERT INTO controle_o_code VALUES ('AMEUD', NULL);
INSERT INTO controle_o_code VALUES ('AMB', NULL);
INSERT INTO controle_o_code VALUES ('ENCABR1', NULL);
INSERT INTO controle_o_code VALUES ('ENCABR2', NULL);
INSERT INTO controle_o_code VALUES ('ENCABR3', NULL);
INSERT INTO controle_o_code VALUES ('ENCABC1', NULL);
INSERT INTO controle_o_code VALUES ('ENCABC2', NULL);
INSERT INTO controle_o_code VALUES ('ENCABC3', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGR1', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGR2', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGR3', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGC1', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGC2', NULL);
INSERT INTO controle_o_code VALUES ('ENCAGC3', NULL);
INSERT INTO controle_o_code VALUES ('EPM', NULL);
INSERT INTO controle_o_code VALUES ('EPE', NULL);
INSERT INTO controle_o_code VALUES ('EPSAM', NULL);
INSERT INTO controle_o_code VALUES ('EPAM', NULL);
INSERT INTO controle_o_code VALUES ('EPAE', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVBA', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVBP', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVGA', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVGP', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVPA', NULL);
INSERT INTO controle_o_code VALUES ('ENCEVPP', NULL);
INSERT INTO controle_o_code VALUES ('PTBIF', NULL);


--
-- Data for Name: controle_o_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_destination VALUES ('A', NULL);
INSERT INTO controle_o_destination VALUES ('B', NULL);
INSERT INTO controle_o_destination VALUES ('P', NULL);
INSERT INTO controle_o_destination VALUES ('AF', NULL);
INSERT INTO controle_o_destination VALUES ('BF', NULL);
INSERT INTO controle_o_destination VALUES ('PF', NULL);
INSERT INTO controle_o_destination VALUES ('FL', NULL);
INSERT INTO controle_o_destination VALUES ('BT', NULL);
INSERT INTO controle_o_destination VALUES ('BC', NULL);
INSERT INTO controle_o_destination VALUES ('BR', NULL);
INSERT INTO controle_o_destination VALUES ('BD', NULL);
INSERT INTO controle_o_destination VALUES ('BTA', NULL);
INSERT INTO controle_o_destination VALUES ('BTC', NULL);
INSERT INTO controle_o_destination VALUES ('BTP', NULL);
INSERT INTO controle_o_destination VALUES ('BTE', NULL);
INSERT INTO controle_o_destination VALUES ('BTDC', NULL);
INSERT INTO controle_o_destination VALUES ('BTDN', NULL);
INSERT INTO controle_o_destination VALUES ('BTT', NULL);
INSERT INTO controle_o_destination VALUES ('BTPI', NULL);
INSERT INTO controle_o_destination VALUES ('BTPC', NULL);
INSERT INTO controle_o_destination VALUES ('BTPM', NULL);
INSERT INTO controle_o_destination VALUES ('BTPT', NULL);
INSERT INTO controle_o_destination VALUES ('BTPR', NULL);
INSERT INTO controle_o_destination VALUES ('M', NULL);
INSERT INTO controle_o_destination VALUES ('BTCBTP', NULL);
INSERT INTO controle_o_destination VALUES ('BTPBTA', NULL);
INSERT INTO controle_o_destination VALUES ('BA', NULL);
INSERT INTO controle_o_destination VALUES ('BTABTP', NULL);
INSERT INTO controle_o_destination VALUES ('BTABTC', NULL);


--
-- Data for Name: controle_o_etat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_etat VALUES ('1', NULL);
INSERT INTO controle_o_etat VALUES ('2A', NULL);
INSERT INTO controle_o_etat VALUES ('2B', NULL);
INSERT INTO controle_o_etat VALUES ('2C', NULL);
INSERT INTO controle_o_etat VALUES ('2D', NULL);
INSERT INTO controle_o_etat VALUES ('2E', NULL);
INSERT INTO controle_o_etat VALUES ('2F', NULL);
INSERT INTO controle_o_etat VALUES ('3', NULL);


--
-- Data for Name: controle_o_forme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_forme VALUES ('REC', NULL);
INSERT INTO controle_o_forme VALUES ('CONV', NULL);
INSERT INTO controle_o_forme VALUES ('CONC', NULL);
INSERT INTO controle_o_forme VALUES ('SCONV', NULL);
INSERT INTO controle_o_forme VALUES ('SCONC', NULL);
INSERT INTO controle_o_forme VALUES ('GCD', NULL);
INSERT INTO controle_o_forme VALUES ('GA1', NULL);
INSERT INTO controle_o_forme VALUES ('GA1D', NULL);
INSERT INTO controle_o_forme VALUES ('GA2', NULL);
INSERT INTO controle_o_forme VALUES ('GA2D', NULL);
INSERT INTO controle_o_forme VALUES ('GO', NULL);
INSERT INTO controle_o_forme VALUES ('GOD', NULL);
INSERT INTO controle_o_forme VALUES ('GV', NULL);
INSERT INTO controle_o_forme VALUES ('GVD', NULL);
INSERT INTO controle_o_forme VALUES ('BR', NULL);
INSERT INTO controle_o_forme VALUES ('BCV', NULL);
INSERT INTO controle_o_forme VALUES ('BGR', NULL);
INSERT INTO controle_o_forme VALUES ('BT', NULL);
INSERT INTO controle_o_forme VALUES ('BAR', NULL);
INSERT INTO controle_o_forme VALUES ('BDC', NULL);
INSERT INTO controle_o_forme VALUES ('BI', NULL);
INSERT INTO controle_o_forme VALUES ('GC', NULL);


--
-- Data for Name: controle_o_localisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_localisation VALUES ('IND', NULL);
INSERT INTO controle_o_localisation VALUES ('ANGGPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('LATGT', NULL);
INSERT INTO controle_o_localisation VALUES ('LATGPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('LATGMES', NULL);
INSERT INTO controle_o_localisation VALUES ('LATGDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('ANGGDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('TRDIST', NULL);
INSERT INTO controle_o_localisation VALUES ('TRDISG', NULL);
INSERT INTO controle_o_localisation VALUES ('TRDISMES', NULL);
INSERT INTO controle_o_localisation VALUES ('TRDISD', NULL);
INSERT INTO controle_o_localisation VALUES ('PTDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('ANGDDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('LATDT', NULL);
INSERT INTO controle_o_localisation VALUES ('LATDDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('LATDMES', NULL);
INSERT INTO controle_o_localisation VALUES ('LATDPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('ANGDPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('TRPROXT', NULL);
INSERT INTO controle_o_localisation VALUES ('TRPROXD', NULL);
INSERT INTO controle_o_localisation VALUES ('TRPROXMES', NULL);
INSERT INTO controle_o_localisation VALUES ('TRPROXG', NULL);
INSERT INTO controle_o_localisation VALUES ('PTPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('ARMEDT', NULL);
INSERT INTO controle_o_localisation VALUES ('ARMEDPROX', NULL);
INSERT INTO controle_o_localisation VALUES ('ARMEDMES', NULL);
INSERT INTO controle_o_localisation VALUES ('ARMEDDIS', NULL);
INSERT INTO controle_o_localisation VALUES ('PERP', NULL);


--
-- Data for Name: controle_o_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_ordre VALUES ('1', NULL);
INSERT INTO controle_o_ordre VALUES ('2', NULL);
INSERT INTO controle_o_ordre VALUES ('3', NULL);
INSERT INTO controle_o_ordre VALUES ('4', NULL);
INSERT INTO controle_o_ordre VALUES ('5', NULL);
INSERT INTO controle_o_ordre VALUES ('6', NULL);
INSERT INTO controle_o_ordre VALUES ('7', NULL);
INSERT INTO controle_o_ordre VALUES ('8', NULL);
INSERT INTO controle_o_ordre VALUES ('9', NULL);
INSERT INTO controle_o_ordre VALUES ('10', NULL);
INSERT INTO controle_o_ordre VALUES ('0', NULL);


--
-- Data for Name: controle_o_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_orientation VALUES ('P', NULL);
INSERT INTO controle_o_orientation VALUES ('NP', NULL);
INSERT INTO controle_o_orientation VALUES ('I', NULL);


--
-- Data for Name: controle_o_origine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_origine VALUES ('A', NULL);
INSERT INTO controle_o_origine VALUES ('B', NULL);
INSERT INTO controle_o_origine VALUES ('P', NULL);
INSERT INTO controle_o_origine VALUES ('AF', NULL);
INSERT INTO controle_o_origine VALUES ('BF', NULL);
INSERT INTO controle_o_origine VALUES ('PF', NULL);
INSERT INTO controle_o_origine VALUES ('FL', NULL);
INSERT INTO controle_o_origine VALUES ('BT', NULL);
INSERT INTO controle_o_origine VALUES ('BC', NULL);
INSERT INTO controle_o_origine VALUES ('BR', NULL);
INSERT INTO controle_o_origine VALUES ('BD', NULL);
INSERT INTO controle_o_origine VALUES ('BTA', NULL);
INSERT INTO controle_o_origine VALUES ('BTC', NULL);
INSERT INTO controle_o_origine VALUES ('BTP', NULL);
INSERT INTO controle_o_origine VALUES ('BTE', NULL);
INSERT INTO controle_o_origine VALUES ('BTDC', NULL);
INSERT INTO controle_o_origine VALUES ('BTDN', NULL);
INSERT INTO controle_o_origine VALUES ('BTT', NULL);
INSERT INTO controle_o_origine VALUES ('BTPI', NULL);
INSERT INTO controle_o_origine VALUES ('BTPC', NULL);
INSERT INTO controle_o_origine VALUES ('BTPM', NULL);
INSERT INTO controle_o_origine VALUES ('BTPT', NULL);
INSERT INTO controle_o_origine VALUES ('BTPR', NULL);
INSERT INTO controle_o_origine VALUES ('M', NULL);
INSERT INTO controle_o_origine VALUES ('BTPBTC', NULL);
INSERT INTO controle_o_origine VALUES ('BTABTP', NULL);
INSERT INTO controle_o_origine VALUES ('AB', NULL);
INSERT INTO controle_o_origine VALUES ('BTPBTA', NULL);
INSERT INTO controle_o_origine VALUES ('BTABTC', NULL);


--
-- Data for Name: controle_o_retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_retouche VALUES ('M', NULL);
INSERT INTO controle_o_retouche VALUES ('MD', NULL);
INSERT INTO controle_o_retouche VALUES ('E/2', NULL);
INSERT INTO controle_o_retouche VALUES ('E', NULL);
INSERT INTO controle_o_retouche VALUES ('ED', NULL);
INSERT INTO controle_o_retouche VALUES ('Q/2', NULL);
INSERT INTO controle_o_retouche VALUES ('Q/2D', NULL);
INSERT INTO controle_o_retouche VALUES ('Q', NULL);
INSERT INTO controle_o_retouche VALUES ('QD', NULL);
INSERT INTO controle_o_retouche VALUES ('SE', NULL);
INSERT INTO controle_o_retouche VALUES ('SED', NULL);
INSERT INTO controle_o_retouche VALUES ('SA', NULL);
INSERT INTO controle_o_retouche VALUES ('SAD', NULL);
INSERT INTO controle_o_retouche VALUES ('AM', NULL);
INSERT INTO controle_o_retouche VALUES ('AMD', NULL);
INSERT INTO controle_o_retouche VALUES ('AE', NULL);
INSERT INTO controle_o_retouche VALUES ('AED', NULL);
INSERT INTO controle_o_retouche VALUES ('DM', NULL);
INSERT INTO controle_o_retouche VALUES ('DE', NULL);
INSERT INTO controle_o_retouche VALUES ('DES', NULL);
INSERT INTO controle_o_retouche VALUES ('DSA', NULL);
INSERT INTO controle_o_retouche VALUES ('DAM', NULL);
INSERT INTO controle_o_retouche VALUES ('DAE', NULL);
INSERT INTO controle_o_retouche VALUES ('DEV', NULL);
INSERT INTO controle_o_retouche VALUES ('DEVS', NULL);
INSERT INTO controle_o_retouche VALUES ('DQ2', NULL);
INSERT INTO controle_o_retouche VALUES ('P', NULL);
INSERT INTO controle_o_retouche VALUES ('PD', NULL);
INSERT INTO controle_o_retouche VALUES ('EV', NULL);
INSERT INTO controle_o_retouche VALUES ('EVD', NULL);
INSERT INTO controle_o_retouche VALUES ('EVS', NULL);
INSERT INTO controle_o_retouche VALUES ('EVSD', NULL);
INSERT INTO controle_o_retouche VALUES ('LSP', NULL);
INSERT INTO controle_o_retouche VALUES ('LP', NULL);
INSERT INTO controle_o_retouche VALUES ('LE', NULL);
INSERT INTO controle_o_retouche VALUES ('PM', NULL);
INSERT INTO controle_o_retouche VALUES ('DE/2', NULL);
INSERT INTO controle_o_retouche VALUES ('ED/2', NULL);


--
-- Data for Name: controle_o_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_sens VALUES ('DIR', NULL);
INSERT INTO controle_o_sens VALUES ('INV', NULL);
INSERT INTO controle_o_sens VALUES ('MIX', NULL);
INSERT INTO controle_o_sens VALUES ('MIXAL', NULL);
INSERT INTO controle_o_sens VALUES ('PROFL', NULL);
INSERT INTO controle_o_sens VALUES ('PROFT', NULL);
INSERT INTO controle_o_sens VALUES ('PROFM', NULL);
INSERT INTO controle_o_sens VALUES ('MSG', NULL);
INSERT INTO controle_o_sens VALUES ('MSD', NULL);
INSERT INTO controle_o_sens VALUES ('MSX', NULL);
INSERT INTO controle_o_sens VALUES ('MIG', NULL);
INSERT INTO controle_o_sens VALUES ('MID', NULL);


--
-- Data for Name: controle_o_serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_o_serie VALUES ('1', NULL);
INSERT INTO controle_o_serie VALUES ('2', NULL);
INSERT INTO controle_o_serie VALUES ('3', NULL);
INSERT INTO controle_o_serie VALUES ('4', NULL);
INSERT INTO controle_o_serie VALUES ('5', NULL);


--
-- Data for Name: controle_orientation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_orientation VALUES ('NS', NULL);
INSERT INTO controle_orientation VALUES ('NESW', NULL);
INSERT INTO controle_orientation VALUES ('NWSE', NULL);
INSERT INTO controle_orientation VALUES ('EW', NULL);


--
-- Data for Name: controle_pendage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_pendage VALUES ('P', NULL);
INSERT INTO controle_pendage VALUES ('O', NULL);
INSERT INTO controle_pendage VALUES ('C', NULL);
INSERT INTO controle_pendage VALUES ('V', NULL);
INSERT INTO controle_pendage VALUES ('SC', NULL);
INSERT INTO controle_pendage VALUES ('SV', NULL);
INSERT INTO controle_pendage VALUES ('S', NULL);


--
-- Data for Name: controle_r_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_association VALUES ('1', NULL);
INSERT INTO controle_r_association VALUES ('1''', NULL);
INSERT INTO controle_r_association VALUES ('2', NULL);
INSERT INTO controle_r_association VALUES ('3', NULL);
INSERT INTO controle_r_association VALUES ('3''', NULL);
INSERT INTO controle_r_association VALUES ('4', NULL);
INSERT INTO controle_r_association VALUES ('4''', NULL);
INSERT INTO controle_r_association VALUES ('5', NULL);
INSERT INTO controle_r_association VALUES ('6', NULL);


--
-- Data for Name: controle_r_bord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_bord VALUES ('D', NULL);
INSERT INTO controle_r_bord VALUES ('C', NULL);
INSERT INTO controle_r_bord VALUES ('P', NULL);


--
-- Data for Name: controle_r_cas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_cas VALUES ('UBT', NULL);
INSERT INTO controle_r_cas VALUES ('I', NULL);
INSERT INTO controle_r_cas VALUES ('DEB', NULL);
INSERT INTO controle_r_cas VALUES ('BN', NULL);
INSERT INTO controle_r_cas VALUES ('UO', NULL);
INSERT INTO controle_r_cas VALUES ('U', NULL);
INSERT INTO controle_r_cas VALUES ('IBT', NULL);


--
-- Data for Name: controle_r_denticulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_denticulation VALUES ('ND', NULL);
INSERT INTO controle_r_denticulation VALUES ('DENT', NULL);
INSERT INTO controle_r_denticulation VALUES ('ENC', NULL);


--
-- Data for Name: controle_r_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_destination VALUES ('A', NULL);
INSERT INTO controle_r_destination VALUES ('P', NULL);
INSERT INTO controle_r_destination VALUES ('AF', NULL);
INSERT INTO controle_r_destination VALUES ('B', NULL);
INSERT INTO controle_r_destination VALUES ('PF', NULL);
INSERT INTO controle_r_destination VALUES ('FL', NULL);
INSERT INTO controle_r_destination VALUES ('BT', NULL);
INSERT INTO controle_r_destination VALUES ('BC', NULL);
INSERT INTO controle_r_destination VALUES ('BR', NULL);
INSERT INTO controle_r_destination VALUES ('BD', NULL);
INSERT INTO controle_r_destination VALUES ('BTA', NULL);
INSERT INTO controle_r_destination VALUES ('BTC', NULL);
INSERT INTO controle_r_destination VALUES ('BTP', NULL);
INSERT INTO controle_r_destination VALUES ('BTE', NULL);
INSERT INTO controle_r_destination VALUES ('BTDC', NULL);
INSERT INTO controle_r_destination VALUES ('BTDN', NULL);
INSERT INTO controle_r_destination VALUES ('BTT', NULL);
INSERT INTO controle_r_destination VALUES ('BTPI', NULL);
INSERT INTO controle_r_destination VALUES ('BTPC', NULL);
INSERT INTO controle_r_destination VALUES ('BTPM', NULL);
INSERT INTO controle_r_destination VALUES ('BTPT', NULL);
INSERT INTO controle_r_destination VALUES ('BTPR', NULL);
INSERT INTO controle_r_destination VALUES ('M', NULL);
INSERT INTO controle_r_destination VALUES ('BTABTDF', NULL);
INSERT INTO controle_r_destination VALUES ('BTABTDC', NULL);
INSERT INTO controle_r_destination VALUES ('BBT', NULL);
INSERT INTO controle_r_destination VALUES ('BTPBTDC', NULL);
INSERT INTO controle_r_destination VALUES ('BTABTP', NULL);
INSERT INTO controle_r_destination VALUES ('BTPBTA', NULL);
INSERT INTO controle_r_destination VALUES ('BTABTC', NULL);
INSERT INTO controle_r_destination VALUES ('BTCBTA', NULL);
INSERT INTO controle_r_destination VALUES ('BTCBTP', NULL);
INSERT INTO controle_r_destination VALUES ('BTDFBTDC', NULL);
INSERT INTO controle_r_destination VALUES ('BTPBTC', NULL);
INSERT INTO controle_r_destination VALUES ('BTDCBTDF', NULL);
INSERT INTO controle_r_destination VALUES ('BTDF', NULL);
INSERT INTO controle_r_destination VALUES ('BTABTDN', NULL);
INSERT INTO controle_r_destination VALUES ('BF', NULL);


--
-- Data for Name: controle_r_dimension; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_dimension VALUES ('MR', NULL);
INSERT INTO controle_r_dimension VALUES ('RC', NULL);
INSERT INTO controle_r_dimension VALUES ('RM', NULL);
INSERT INTO controle_r_dimension VALUES ('RL', NULL);
INSERT INTO controle_r_dimension VALUES ('RLL', NULL);


--
-- Data for Name: controle_r_ecrasement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_ecrasement VALUES ('EBT', NULL);
INSERT INTO controle_r_ecrasement VALUES ('ERI', NULL);
INSERT INTO controle_r_ecrasement VALUES ('ERC', NULL);
INSERT INTO controle_r_ecrasement VALUES ('ED', NULL);
INSERT INTO controle_r_ecrasement VALUES ('EBN', NULL);


--
-- Data for Name: controle_r_extremite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_extremite VALUES ('A', NULL);
INSERT INTO controle_r_extremite VALUES ('C', NULL);
INSERT INTO controle_r_extremite VALUES ('CA', NULL);
INSERT INTO controle_r_extremite VALUES ('R', NULL);


--
-- Data for Name: controle_r_frequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_frequence VALUES ('U', NULL);
INSERT INTO controle_r_frequence VALUES ('QQI', NULL);
INSERT INTO controle_r_frequence VALUES ('1', NULL);
INSERT INTO controle_r_frequence VALUES ('QQ', NULL);
INSERT INTO controle_r_frequence VALUES ('NB', NULL);
INSERT INTO controle_r_frequence VALUES ('2', NULL);
INSERT INTO controle_r_frequence VALUES ('3', NULL);
INSERT INTO controle_r_frequence VALUES ('4', NULL);
INSERT INTO controle_r_frequence VALUES ('5', NULL);


--
-- Data for Name: controle_r_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_lustrage VALUES ('L', NULL);
INSERT INTO controle_r_lustrage VALUES ('NL', NULL);


--
-- Data for Name: controle_r_obliquite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_obliquite VALUES ('NA', NULL);
INSERT INTO controle_r_obliquite VALUES ('ABR', NULL);
INSERT INTO controle_r_obliquite VALUES ('O', NULL);
INSERT INTO controle_r_obliquite VALUES ('SA', NULL);


--
-- Data for Name: controle_r_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_r_origine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_origine VALUES ('A', NULL);
INSERT INTO controle_r_origine VALUES ('B', NULL);
INSERT INTO controle_r_origine VALUES ('P', NULL);
INSERT INTO controle_r_origine VALUES ('AF', NULL);
INSERT INTO controle_r_origine VALUES ('BF', NULL);
INSERT INTO controle_r_origine VALUES ('PF', NULL);
INSERT INTO controle_r_origine VALUES ('FL', NULL);
INSERT INTO controle_r_origine VALUES ('BT', NULL);
INSERT INTO controle_r_origine VALUES ('BC', NULL);
INSERT INTO controle_r_origine VALUES ('BR', NULL);
INSERT INTO controle_r_origine VALUES ('BD', NULL);
INSERT INTO controle_r_origine VALUES ('BTA', NULL);
INSERT INTO controle_r_origine VALUES ('BTC', NULL);
INSERT INTO controle_r_origine VALUES ('BTP', NULL);
INSERT INTO controle_r_origine VALUES ('BTE', NULL);
INSERT INTO controle_r_origine VALUES ('BTDF', NULL);
INSERT INTO controle_r_origine VALUES ('BTDC', NULL);
INSERT INTO controle_r_origine VALUES ('BTDN', NULL);
INSERT INTO controle_r_origine VALUES ('BTT', NULL);
INSERT INTO controle_r_origine VALUES ('BTPC', NULL);
INSERT INTO controle_r_origine VALUES ('BTPM', NULL);
INSERT INTO controle_r_origine VALUES ('BTPT', NULL);
INSERT INTO controle_r_origine VALUES ('BTPR', NULL);
INSERT INTO controle_r_origine VALUES ('M', NULL);
INSERT INTO controle_r_origine VALUES ('I', NULL);
INSERT INTO controle_r_origine VALUES ('BTDFBTA', NULL);
INSERT INTO controle_r_origine VALUES ('BTDCBTA', NULL);
INSERT INTO controle_r_origine VALUES (' BTB', NULL);
INSERT INTO controle_r_origine VALUES ('BTDCBTP', NULL);
INSERT INTO controle_r_origine VALUES ('BTB', NULL);
INSERT INTO controle_r_origine VALUES ('BTPBTA', NULL);
INSERT INTO controle_r_origine VALUES ('BTABTP', NULL);
INSERT INTO controle_r_origine VALUES ('BTABTC', NULL);
INSERT INTO controle_r_origine VALUES ('BTCTBA', NULL);
INSERT INTO controle_r_origine VALUES ('BTPBTC', NULL);
INSERT INTO controle_r_origine VALUES ('BTDCBTDF', NULL);
INSERT INTO controle_r_origine VALUES ('BTCBTP', NULL);
INSERT INTO controle_r_origine VALUES ('BTDNBTA', NULL);


--
-- Data for Name: controle_r_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_sens VALUES ('DIR', NULL);
INSERT INTO controle_r_sens VALUES ('INV', NULL);
INSERT INTO controle_r_sens VALUES ('MIX', NULL);
INSERT INTO controle_r_sens VALUES ('MIXAL', NULL);
INSERT INTO controle_r_sens VALUES ('PROFL', NULL);
INSERT INTO controle_r_sens VALUES ('PROFT', NULL);
INSERT INTO controle_r_sens VALUES ('PROFM', NULL);
INSERT INTO controle_r_sens VALUES ('MSG', NULL);
INSERT INTO controle_r_sens VALUES ('MSD', NULL);
INSERT INTO controle_r_sens VALUES ('MSX', NULL);
INSERT INTO controle_r_sens VALUES ('MIG', NULL);
INSERT INTO controle_r_sens VALUES ('MID', NULL);


--
-- Data for Name: controle_r_strie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_r_superposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_superposition VALUES ('I', NULL);
INSERT INTO controle_r_superposition VALUES ('C', NULL);
INSERT INTO controle_r_superposition VALUES ('CHIRR', NULL);
INSERT INTO controle_r_superposition VALUES ('CHREG', NULL);
INSERT INTO controle_r_superposition VALUES ('SIRR', NULL);
INSERT INTO controle_r_superposition VALUES ('SREG', NULL);
INSERT INTO controle_r_superposition VALUES ('CH', NULL);


--
-- Data for Name: controle_r_tranchant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_tranchant VALUES ('IND', NULL);
INSERT INTO controle_r_tranchant VALUES ('ARMEDT', NULL);
INSERT INTO controle_r_tranchant VALUES ('ARMEDPROX', NULL);
INSERT INTO controle_r_tranchant VALUES ('ARMEDMES', NULL);
INSERT INTO controle_r_tranchant VALUES ('ARMEDDIS', NULL);
INSERT INTO controle_r_tranchant VALUES ('PERIP', NULL);
INSERT INTO controle_r_tranchant VALUES ('FAA', NULL);
INSERT INTO controle_r_tranchant VALUES ('FAB', NULL);


--
-- Data for Name: controle_r_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_type VALUES ('M', NULL);
INSERT INTO controle_r_type VALUES ('E', NULL);
INSERT INTO controle_r_type VALUES ('E/2', NULL);
INSERT INTO controle_r_type VALUES ('SUR', NULL);
INSERT INTO controle_r_type VALUES ('MI', NULL);
INSERT INTO controle_r_type VALUES ('PL', NULL);
INSERT INTO controle_r_type VALUES ('ENV', NULL);
INSERT INTO controle_r_type VALUES ('BUR S1', NULL);
INSERT INTO controle_r_type VALUES ('BUR S2', NULL);
INSERT INTO controle_r_type VALUES ('BUR S3', NULL);
INSERT INTO controle_r_type VALUES ('BUR M1', NULL);
INSERT INTO controle_r_type VALUES ('BUR M2', NULL);
INSERT INTO controle_r_type VALUES ('BUR M3', NULL);
INSERT INTO controle_r_type VALUES ('PM', NULL);
INSERT INTO controle_r_type VALUES ('Q', NULL);


--
-- Data for Name: controle_r_utilisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_r_utilisation VALUES ('BP', NULL);
INSERT INTO controle_r_utilisation VALUES ('BA', NULL);
INSERT INTO controle_r_utilisation VALUES ('BB', NULL);
INSERT INTO controle_r_utilisation VALUES ('BCE(r_strie)', NULL);
INSERT INTO controle_r_utilisation VALUES ('SPL', NULL);
INSERT INTO controle_r_utilisation VALUES ('SPR', NULL);
INSERT INTO controle_r_utilisation VALUES ('SOB', NULL);
INSERT INTO controle_r_utilisation VALUES ('SEN', NULL);
INSERT INTO controle_r_utilisation VALUES ('SFPL', NULL);
INSERT INTO controle_r_utilisation VALUES ('SFEN', NULL);


--
-- Data for Name: controle_responsable_fouille; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_responsable_fouille VALUES ('DE LUMLEY', NULL);


--
-- Data for Name: controle_s_localisation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_localisation VALUES ('I', NULL);
INSERT INTO controle_s_localisation VALUES ('IND', NULL);
INSERT INTO controle_s_localisation VALUES ('ANGGPROX', NULL);
INSERT INTO controle_s_localisation VALUES ('LATGT', NULL);
INSERT INTO controle_s_localisation VALUES ('LATGPROX', NULL);
INSERT INTO controle_s_localisation VALUES ('LATGMES', NULL);
INSERT INTO controle_s_localisation VALUES ('LATGDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('ANGGDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('TRDIST', NULL);
INSERT INTO controle_s_localisation VALUES ('TRDISG', NULL);
INSERT INTO controle_s_localisation VALUES ('TRDISMES', NULL);
INSERT INTO controle_s_localisation VALUES ('TRDISD', NULL);
INSERT INTO controle_s_localisation VALUES ('PTDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('ANGDDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('LATDT', NULL);
INSERT INTO controle_s_localisation VALUES ('LATDDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('LATDMES', NULL);
INSERT INTO controle_s_localisation VALUES ('LATDPROX', NULL);
INSERT INTO controle_s_localisation VALUES ('ANGDPROX', NULL);
INSERT INTO controle_s_localisation VALUES ('TRPROXT', NULL);
INSERT INTO controle_s_localisation VALUES ('TRPROXD', NULL);
INSERT INTO controle_s_localisation VALUES ('TRPROXMES', NULL);
INSERT INTO controle_s_localisation VALUES ('TRPROXG', NULL);
INSERT INTO controle_s_localisation VALUES ('PTMAX', NULL);
INSERT INTO controle_s_localisation VALUES ('ARMEDT', NULL);
INSERT INTO controle_s_localisation VALUES ('ARMEDPROX', NULL);
INSERT INTO controle_s_localisation VALUES ('ARMEDMES', NULL);
INSERT INTO controle_s_localisation VALUES ('ARMEDDIS', NULL);
INSERT INTO controle_s_localisation VALUES ('PERIP', NULL);
INSERT INTO controle_s_localisation VALUES ('FIND', NULL);
INSERT INTO controle_s_localisation VALUES ('FA', NULL);
INSERT INTO controle_s_localisation VALUES ('FAA', NULL);
INSERT INTO controle_s_localisation VALUES ('FAPT', NULL);
INSERT INTO controle_s_localisation VALUES ('FAPG', NULL);
INSERT INTO controle_s_localisation VALUES ('FAPM', NULL);
INSERT INTO controle_s_localisation VALUES ('FAPD', NULL);
INSERT INTO controle_s_localisation VALUES ('FAMT', NULL);
INSERT INTO controle_s_localisation VALUES ('FAMG', NULL);
INSERT INTO controle_s_localisation VALUES ('FAMM', NULL);
INSERT INTO controle_s_localisation VALUES ('FAMD', NULL);
INSERT INTO controle_s_localisation VALUES ('FADT', NULL);
INSERT INTO controle_s_localisation VALUES ('FADG', NULL);
INSERT INTO controle_s_localisation VALUES ('FADM', NULL);
INSERT INTO controle_s_localisation VALUES ('ADD', NULL);
INSERT INTO controle_s_localisation VALUES ('FB', NULL);
INSERT INTO controle_s_localisation VALUES ('FBB', NULL);
INSERT INTO controle_s_localisation VALUES ('FBPT', NULL);
INSERT INTO controle_s_localisation VALUES ('FBPG', NULL);
INSERT INTO controle_s_localisation VALUES ('FBPM', NULL);
INSERT INTO controle_s_localisation VALUES ('FBMT', NULL);
INSERT INTO controle_s_localisation VALUES ('FBMG', NULL);
INSERT INTO controle_s_localisation VALUES ('FBMM', NULL);
INSERT INTO controle_s_localisation VALUES ('FBMD', NULL);
INSERT INTO controle_s_localisation VALUES ('FBDT', NULL);
INSERT INTO controle_s_localisation VALUES ('FBDG', NULL);
INSERT INTO controle_s_localisation VALUES ('FBDM', NULL);
INSERT INTO controle_s_localisation VALUES ('FBDD', NULL);
INSERT INTO controle_s_localisation VALUES ('FADD', NULL);


--
-- Data for Name: controle_s_lustrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_lustrage VALUES ('LL', NULL);
INSERT INTO controle_s_lustrage VALUES ('LE', NULL);


--
-- Data for Name: controle_s_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_s_polissage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_polissage VALUES ('PA', NULL);
INSERT INTO controle_s_polissage VALUES ('PP', NULL);
INSERT INTO controle_s_polissage VALUES ('PI', NULL);


--
-- Data for Name: controle_s_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_relation VALUES ('G', NULL);
INSERT INTO controle_s_relation VALUES ('F', NULL);
INSERT INTO controle_s_relation VALUES ('CF', NULL);
INSERT INTO controle_s_relation VALUES ('AF', NULL);
INSERT INTO controle_s_relation VALUES ('PL', NULL);
INSERT INTO controle_s_relation VALUES ('O', NULL);
INSERT INTO controle_s_relation VALUES ('CO', NULL);
INSERT INTO controle_s_relation VALUES ('AO', NULL);
INSERT INTO controle_s_relation VALUES ('AT', NULL);


--
-- Data for Name: controle_s_situation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_situation VALUES ('I', NULL);
INSERT INTO controle_s_situation VALUES ('P', NULL);
INSERT INTO controle_s_situation VALUES ('B', NULL);
INSERT INTO controle_s_situation VALUES ('F', NULL);


--
-- Data for Name: controle_s_sous_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_sous_type VALUES ('FPC', NULL);
INSERT INTO controle_s_sous_type VALUES ('FPFC', NULL);
INSERT INTO controle_s_sous_type VALUES ('FE', NULL);
INSERT INTO controle_s_sous_type VALUES ('FPE', NULL);
INSERT INTO controle_s_sous_type VALUES ('FS', NULL);
INSERT INTO controle_s_sous_type VALUES ('FEF', NULL);
INSERT INTO controle_s_sous_type VALUES ('FEA', NULL);
INSERT INTO controle_s_sous_type VALUES ('FC', NULL);
INSERT INTO controle_s_sous_type VALUES ('FAS', NULL);
INSERT INTO controle_s_sous_type VALUES ('FB', NULL);
INSERT INTO controle_s_sous_type VALUES ('FF', NULL);
INSERT INTO controle_s_sous_type VALUES ('FACC', NULL);
INSERT INTO controle_s_sous_type VALUES ('FRF', NULL);
INSERT INTO controle_s_sous_type VALUES ('FRA', NULL);
INSERT INTO controle_s_sous_type VALUES ('UE', NULL);
INSERT INTO controle_s_sous_type VALUES ('UL', NULL);
INSERT INTO controle_s_sous_type VALUES ('UP', NULL);


--
-- Data for Name: controle_s_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_s_type VALUES ('SI', NULL);
INSERT INTO controle_s_type VALUES ('SIST', NULL);
INSERT INTO controle_s_type VALUES ('SL', NULL);
INSERT INTO controle_s_type VALUES ('SLST', NULL);
INSERT INTO controle_s_type VALUES ('SP', NULL);
INSERT INTO controle_s_type VALUES ('SPST', NULL);
INSERT INTO controle_s_type VALUES ('ST', NULL);
INSERT INTO controle_s_type VALUES ('SIN', NULL);
INSERT INTO controle_s_type VALUES ('SD', NULL);
INSERT INTO controle_s_type VALUES ('SINST', NULL);


--
-- Data for Name: controle_sol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_sol VALUES ('08', NULL);
INSERT INTO controle_sol VALUES ('14', NULL);
INSERT INTO controle_sol VALUES ('15', NULL);
INSERT INTO controle_sol VALUES ('17', NULL);
INSERT INTO controle_sol VALUES ('03', NULL);
INSERT INTO controle_sol VALUES ('05', NULL);
INSERT INTO controle_sol VALUES ('06', NULL);
INSERT INTO controle_sol VALUES ('07', NULL);
INSERT INTO controle_sol VALUES ('09', NULL);
INSERT INTO controle_sol VALUES ('10', NULL);
INSERT INTO controle_sol VALUES ('11', NULL);
INSERT INTO controle_sol VALUES ('12', NULL);
INSERT INTO controle_sol VALUES ('13', NULL);
INSERT INTO controle_sol VALUES ('16', NULL);
INSERT INTO controle_sol VALUES ('04', NULL);
INSERT INTO controle_sol VALUES ('22', NULL);
INSERT INTO controle_sol VALUES ('24', NULL);
INSERT INTO controle_sol VALUES ('20', NULL);
INSERT INTO controle_sol VALUES ('21', NULL);
INSERT INTO controle_sol VALUES ('19', NULL);
INSERT INTO controle_sol VALUES ('18', NULL);
INSERT INTO controle_sol VALUES ('25', NULL);
INSERT INTO controle_sol VALUES ('7', NULL);
INSERT INTO controle_sol VALUES ('8', NULL);
INSERT INTO controle_sol VALUES ('9', NULL);
INSERT INTO controle_sol VALUES ('23', NULL);
INSERT INTO controle_sol VALUES ('UA25', NULL);
INSERT INTO controle_sol VALUES ('01', NULL);
INSERT INTO controle_sol VALUES ('1', NULL);
INSERT INTO controle_sol VALUES ('26', NULL);
INSERT INTO controle_sol VALUES ('02', NULL);
INSERT INTO controle_sol VALUES ('M2', NULL);
INSERT INTO controle_sol VALUES ('27', NULL);
INSERT INTO controle_sol VALUES ('28', NULL);
INSERT INTO controle_sol VALUES ('A', NULL);
INSERT INTO controle_sol VALUES ('B', NULL);
INSERT INTO controle_sol VALUES ('C', NULL);
INSERT INTO controle_sol VALUES ('D', NULL);
INSERT INTO controle_sol VALUES ('E', NULL);
INSERT INTO controle_sol VALUES ('F', NULL);
INSERT INTO controle_sol VALUES ('G', NULL);
INSERT INTO controle_sol VALUES ('H', NULL);
INSERT INTO controle_sol VALUES ('I', NULL);
INSERT INTO controle_sol VALUES ('J', NULL);
INSERT INTO controle_sol VALUES ('K', NULL);
INSERT INTO controle_sol VALUES ('29', NULL);
INSERT INTO controle_sol VALUES ('30', NULL);
INSERT INTO controle_sol VALUES ('20-21', NULL);
INSERT INTO controle_sol VALUES ('21-22', NULL);
INSERT INTO controle_sol VALUES ('22-23', NULL);
INSERT INTO controle_sol VALUES ('23-24', NULL);
INSERT INTO controle_sol VALUES ('24-25', NULL);
INSERT INTO controle_sol VALUES ('25-26', NULL);
INSERT INTO controle_sol VALUES ('19-20', NULL);


--
-- Data for Name: controle_souscarre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_t_agent VALUES ('DM', NULL);
INSERT INTO controle_t_agent VALUES ('ENT', NULL);
INSERT INTO controle_t_agent VALUES ('EX', NULL);
INSERT INTO controle_t_agent VALUES ('ES', NULL);
INSERT INTO controle_t_agent VALUES ('DI', NULL);
INSERT INTO controle_t_agent VALUES ('DP', NULL);
INSERT INTO controle_t_agent VALUES ('EP', NULL);
INSERT INTO controle_t_agent VALUES ('DD', NULL);
INSERT INTO controle_t_agent VALUES ('ED', NULL);
INSERT INTO controle_t_agent VALUES ('DT', NULL);
INSERT INTO controle_t_agent VALUES ('EQ', NULL);
INSERT INTO controle_t_agent VALUES ('FEDS4', NULL);


--
-- Data for Name: controle_t_allure; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_dessin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_direction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_dstrie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_t_ensemble VALUES ('ST', NULL);
INSERT INTO controle_t_ensemble VALUES ('RA', NULL);
INSERT INTO controle_t_ensemble VALUES ('CU', NULL);
INSERT INTO controle_t_ensemble VALUES ('RE', NULL);
INSERT INTO controle_t_ensemble VALUES ('VE', NULL);
INSERT INTO controle_t_ensemble VALUES ('EN', NULL);
INSERT INTO controle_t_ensemble VALUES ('PO', NULL);
INSERT INTO controle_t_ensemble VALUES ('PE', NULL);
INSERT INTO controle_t_ensemble VALUES ('RO', NULL);
INSERT INTO controle_t_ensemble VALUES ('TI', NULL);
INSERT INTO controle_t_ensemble VALUES ('RL', NULL);


--
-- Data for Name: controle_t_largeur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_locmusc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_nature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_t_nature VALUES ('ATBC', NULL);
INSERT INTO controle_t_nature VALUES ('A-RO', NULL);
INSERT INTO controle_t_nature VALUES ('ATBE', NULL);
INSERT INTO controle_t_nature VALUES ('ATBD', NULL);
INSERT INTO controle_t_nature VALUES ('ATBA', NULL);
INSERT INTO controle_t_nature VALUES ('ARBA', NULL);
INSERT INTO controle_t_nature VALUES ('ANDC', NULL);
INSERT INTO controle_t_nature VALUES ('IN', NULL);
INSERT INTO controle_t_nature VALUES ('ANDR', NULL);
INSERT INTO controle_t_nature VALUES ('ATBI', NULL);
INSERT INTO controle_t_nature VALUES ('NAV', NULL);
INSERT INTO controle_t_nature VALUES ('NAI', NULL);
INSERT INTO controle_t_nature VALUES ('ANI', NULL);
INSERT INTO controle_t_nature VALUES ('ATB', NULL);
INSERT INTO controle_t_nature VALUES ('ANGC', NULL);
INSERT INTO controle_t_nature VALUES ('ATBP', NULL);
INSERT INTO controle_t_nature VALUES ('ATBR', NULL);
INSERT INTO controle_t_nature VALUES ('ST', NULL);
INSERT INTO controle_t_nature VALUES ('ATUT', NULL);


--
-- Data for Name: controle_t_phenomene; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_profondeur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_replique; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_section; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_sens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_t_trace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ud_fragmentation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ud_lateralite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ud_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_ud_usure; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: controle_vers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controle_vers VALUES ('N', NULL);
INSERT INTO controle_vers VALUES ('S', NULL);
INSERT INTO controle_vers VALUES ('SW', NULL);
INSERT INTO controle_vers VALUES ('E', NULL);
INSERT INTO controle_vers VALUES ('SE', NULL);
INSERT INTO controle_vers VALUES ('NE', NULL);
INSERT INTO controle_vers VALUES ('NW', NULL);
INSERT INTO controle_vers VALUES ('W', NULL);
INSERT INTO controle_vers VALUES ('EW', NULL);


--
-- Data for Name: controle_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: coprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: eclat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: enlevement_biface; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: enlevement_galet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: enlevement_nucleus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: faune; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: fracture_faune; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: fracture_industrie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: galet_amenage; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: hachereau; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: industrie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: microfaune; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nucleus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: outil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: photocoprolithe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: photofaune; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: photoindustrie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: phototrace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: remonte_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO remonte_famille VALUES ('CERCOPITHECIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('PONGIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('HOMINIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ERINACEIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('TALPIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('MOLOSSIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('RHINOLOPHIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('SPALACIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('DIPODIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CASTORIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CAPROMYIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('HYSTRICIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('HYDROCHOERIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('LEPORIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('LAGOMYIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('AILURIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('HYAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ODOBAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('SUIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('HIPPOPOTAMIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CAMELIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('GIRAFFIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ANTILOCAPRIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('EQUIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('TAPIRIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('GOMPHOTERIIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ELEPHANTIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('PHOCAENIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('MONODONLIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('PHYSETERIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('ZIPHIIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('BALAONOPTERIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('BALAENIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_famille VALUES ('PODICIPEDIDAE', 'PODICIPEDIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('DIOMEDEIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('HYDROBATIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('SULIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PELECANIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PHALACROCORACIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('THRESKIORNITHIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CICONIIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PHOENICOPTERIDAE', 'PHOENICOPTERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PANDIODIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TETRAONIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TURNICIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('GRUIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('OTITIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PTEROCLIDIDAE', 'PTEROCLIDIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('COLUMBIDAE', 'COLUMBIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CUCULIDAE', 'CUCULIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TYTONIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CAPRIMULGIDAE', 'CAPRIMULGIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('APODIDAE', 'APODIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ALCEDINIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CORACIIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('MEROPIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('UPUPIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('HAEMATOPODIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PHALAROPIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('STERCORIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('RECURVIROSTRIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('BURHINIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('GLAREOLIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('STERNIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('HIRUNDINIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('MOTACILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('ORIOLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('LANIIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('STURNIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('BOMBYCILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CINCLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TROGLODYTIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PRUNELLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PARIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('AEGITHALIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TIMALIIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('REMIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('SITTIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TICHODROMADIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('CERTHIIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('PASSERIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('EMBERIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('TESTUDINIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('EMYDIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('DERMOCHELYDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('CHELONIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('DISCOGLOSSIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('AMPHISBAENIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('GECKONIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('AGAMIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('ANGUIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('SCINCIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('CHAMELEONTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('TYPHLOPIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('BOIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('PLETHODONTIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('PROTEIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('CERITHIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TURRITELLIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('RISSOIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TRIVIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('MURCIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('NASSARIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('COSTELLARIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TURRIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('POMATIASIDAE+C61', 'NEOTAENIOGLOSSA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('BUFONIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('PELODYTIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('PELOBATIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('HYLIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('RANIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_famille VALUES ('PATELLIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TURBINIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('CLAUSILIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('SUBULINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('SUCCINEIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('DISCIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('FISSURELLIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('LIMACIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('CHONDRINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('ENIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('LITTORINIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('TESTACELLIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('ZONITIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('PUPILLIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('COLUMBELLIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('MITRIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_famille VALUES ('FALCONIDAE', 'FALCONIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('GAVIIDAE', 'GAVIIFORMA', 'AVES');
INSERT INTO remonte_famille VALUES ('COLUBRIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_famille VALUES ('VIPERIDAE', 'SQUAMATA', 'REPTILIA');


--
-- Data for Name: remonte_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO remonte_genre VALUES ('MACACA', 'CERCOPITHECIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PONGO', 'PONGIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GORILLA', 'PONGIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PAN', 'PONGIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HOMO', 'HOMINIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('AUSTRALOPITHECUS', 'HOMINIDAE', 'PRIMATA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EUROPAEUS', 'ERINACEIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALGIRUS', 'ERINACEIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DAVIDI', 'ERINACEIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HEMIECHINUS', 'ERINACEIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GALEMYS', 'TALPIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TALPA', 'TALPIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DESMANA', 'TALPIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SOREX', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('NEOMYS', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SUNCUS', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CROCIDURA', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOSOREX', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DEPRANOSOREX', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PETENYIA', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DEINSDORFIA', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BLARINELLA', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BERENENDIA', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EPISORICULUS', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SORICULUS', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BLARINOIDES', 'SORICIDAE', 'INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TADARIDA', 'MOLOSSIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SAUROMYS', 'MOLOSSIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RHINOLOPHUS', 'RHINOLOPHIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOTIS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('VESPERTILIO', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EPTESICUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('NYCTALUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PIPISTRELLUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BARBASTELLA', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PLECOTUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MINIOPTERUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LASIURUS', 'VESPERTILIONIDAE', 'CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MICROTUS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TERRICOLA', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALLOPHAIOMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DYNAROMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ARVICOLA', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ONDRATA', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CLETHRIONOMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LEMMUS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOPUS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DICROSTONYX', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ELLOBIUS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LAGURUS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MIMOMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PLIOMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('UNGAROMYS', 'ARVICOLIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SPALAX', 'SPALACIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PROSIPHNEUS', 'SPALACIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOSPALAX', 'SPALACIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SICISTA', 'DIPODIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALLACTAGA', 'DIPODIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CRICETUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('VILLANYIA', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MESOCRICETUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALLOCRICETUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PEROMYSCUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CRICETULUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MERIONES', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CRICETINUS', 'CRICETIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CASTOR', 'CASTORIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TROGONTHERIUM', 'CASTORIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOCASTOR', 'CAPROMYIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYSTRIX', 'HYSTRICIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GLIRULUS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ELIOMYS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOMIMUS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DRYOMYS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MUSCARDINUS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GLIS', 'GLIRIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SCIURUS', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PLIOLAGUS ', 'LEPORIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PTEROMYS', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TAMIAS', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CITELLUS', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MARMOTA', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CYNONYS', 'SCIURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RHAGAMYS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ACOMYS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MICROMYS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('APODEMUS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RATTUS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LEMNISCONYS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYDROCHOERUS', 'HYDROCHOERIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ORYCTOLAGUS', 'LEPORIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LEPUS', 'LEPORIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYPOLAGUS', 'LEPORIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OCHOTONOIDES', 'LAGOMYIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PROLAGOMYS', 'LAGOMYIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OCHOTONA', 'LAGOMYIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PROLAGUS', 'LAGOMYIDAE', 'LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MUSTELA', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MARTES', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GULO', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MELES', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LUTRA', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GALICTIS', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MEPHITIS', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BARANOGALE', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('VORMELA', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MEGANTEREON', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PANONICTIS', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MELLIVORA', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ENHYDRA', 'MUSTELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CANIS', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CUON', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('FENNECUS', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALOPEX', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('VULPES', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('NYCTEREUTES', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LYCAON', 'CANIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('AILURUS', 'AILURIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('URSUS', 'URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HELARCTOS', 'URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TREMARCTOS', 'URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MELUSUS', 'URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PLIONARCTOS', 'URSIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ACINONYX', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('FELIS', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CARACAL', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PUMA', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LYNX', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PANTHERA', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HOMOTHERIUM', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MACHAIRODUS', 'FELIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GENETTA', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HERPESTES', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('VIVERRA', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MUNGO', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('FOSSA', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SURICATA', 'VIVERRIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CROCUTA', 'HYAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYAENA', 'HYAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PROTELES', 'HYAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EURYBOAS', 'HYAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ODOBAENUS', 'ODOBAENIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PHOCA', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PUSA', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PAGOPHILUS', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HALICHOERUS', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ERIGNATHUS', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CYSTOPHORA', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MONACHUS', 'PHOCIDAE', 'CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PHACOCHOERUS', 'SUIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SUS', 'SUIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HIPPOPOTAMUS', 'HIPPOPOTAMIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CAMELUS', 'CAMELIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LAMA', 'CAMELIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GIRAFFA', 'GIRAFFIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OKAPIA', 'GIRAFFIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SIVATHERIUM', 'GIRAFFIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CERVUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CROIZETOCEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EUCLADOCEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DAMA', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALCES', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RANGIFER', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MEGALOCEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PRAEMEGACEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ARVERNOCEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CAPREOLUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MUNTIACUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ELAPHURUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('AXIS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYELOPHUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SIKA', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RUCERVUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PRJEVALSKIUM', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PUDU', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OZOTOCEROS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MAZAMA', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ODOCOILEUS', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYDROPOTES', 'CERVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ANTILOCAPRA', 'ANTILOCAPRIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LEPTOBOS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BOS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BISON', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BUBALUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SYNCERUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SOERGILIA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OVIBOS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PRAEOVIBOS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GAZELLOSPIRA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ALCELAPHUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ANTIDORCAS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ADDAX', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BOSELAPHUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GAZELLA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CONNOCHAETES', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DAMALISCUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HIPPOTRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('KOBUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ORYX', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SYLVICAPRA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TAUROTRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TRAGELAPHUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('SAIGA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MYOTRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RUPICAPRA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GALLOGORAL', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PROCAMPTOCERAS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('OVIS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CAPRA', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MEGALOVIS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('AMNOTRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HEMITRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PLIOTRAGUS', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HIPPARION', 'EQUIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('EQUUS', 'EQUIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TAPIRUS', 'TAPIRIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DICERORHINUS', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ELASMOTHERIUM', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DICEROS', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('RHINOCEROS', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('CERAROTHERIUM', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('STEPHANORHINUS', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ANANCUS', 'GOMPHOTERIIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ELEPHAS', 'ELEPHANTIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('LOXODONTA', 'ELEPHANTIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MAMMUTHUS', 'ELEPHANTIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DELPHINUS', 'DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('TURSIOPS', 'DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GLOBICEPHALA', 'DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GRAMPUS', 'DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ORCINUS', 'DELPHINIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PHOCAENA', 'PHOCAENIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('DELPHINAPTERUS', 'MONODONLIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MONODON', 'MONODONLIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PHYSETER', 'PHYSETERIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('HYPEROODON', 'ZIPHIIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('ZYPHIUS', 'ZIPHIIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BALAENOPTERA', 'BALAONOPTERIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('MEGAPTERA', 'BALAONOPTERIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('BALAENA', 'BALAENIDAE', 'CETACEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GAVIA', 'GAVIIDAE', 'GAVIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PODICEPS', 'PODICIPEDIDAE', 'PODICIPEDIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TACHYBAPTUS', 'PODICIPEDIDAE', 'PODICIPEDIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PODILYMBUS', 'PODICIPEDIDAE', 'PODICIPEDIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('DIOMEDEA', 'DIOMEDEIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OCEANODROMA', 'HYDROBATIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OCEANITES', 'HYDROBATIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HYDROBATES', 'HYDROBATIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PELAGODROMA', 'HYDROBATIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BULWERIA', 'PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PTERODROMA', 'PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FULMARUS', 'PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CALONECTRIS', 'PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PUFFINUS', 'PROCELLARIIDAE', 'PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SULA ', 'SULIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PELECANUS', 'PELECANIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHALACROCORAX', 'PHALACROCORACIDAE', 'PELECANIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BOTAURUS', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('IXOBRYCHUS', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ARDEOLA', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NYCTICORAX', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BULBUCUS', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('EGRETTA', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ARDEA', 'ARDEIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PLATALEA', 'THRESKIORNITHIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PLEGADIS', 'THRESKIORNITHIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('THRESKIORNIS', 'THRESKIORNITHIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GERONTICUS', 'THRESKIORNITHIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CICONIA', 'CICONIIDAE', 'CICONIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHOENICOPTRUS', 'PHOENICOPTERIDAE', 'PHOENICOPTERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CYGNUS', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BRANTA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ANSER', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ANAS', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MARMARONETTA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALOPOCHEN', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AIX', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TADORNA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NETTA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AYTHYA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BUCEPHALA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HISTRIONICUS', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CLANGULA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MELANITTA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SOMATERIA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('POLYCTICTA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MERGUS', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OXYURA', 'ANATIDAE', 'ANSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NEOPHRON', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GYPS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AEGYPIUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GYPAETUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HALIAEETUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AQUILA', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HIERAAETUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CIRCAETUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BUTEO', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PERNIS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ACCIPITER', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MILVUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ELANUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CIRCUS', 'ACCIPITRIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PANDION', 'PANDIODIDAE', 'ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LAGOPUS', 'TETRAONIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TETRAOGALLUS', 'TETRAONIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TETRAO', 'TETRAONIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BONASA', 'TETRAONIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALECTORIS', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PERDIX', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FRANCOLINUS', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHASIANUS', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHRYSOLOPUS', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('COTURNIX', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TURNIX', 'TURNICIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GRUS', 'GRUIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ANTHROPOIDES', 'GRUIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OTIS', 'OTITIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TETRAX', 'OTITIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHLAMYDOTIS', 'OTITIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('RALLUS', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CREX', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PORZANA', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PORPHYRIO', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PORPHYRULLA', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GALLINULA', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FULICA', 'RALLIDAE', 'GRUIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SYRRHAPTES', 'PTEROCLIDIDAE', 'PTEROCLIDIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PTEROCLES', 'PTEROCLIDIDAE', 'PTEROCLIDIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('COLUMBA', 'COLUMBIDAE', 'COLUMBIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('STREPTOPELIA', 'COLUMBIDAE', 'COLUMBIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CUCULUS', 'CUCULIDAE', 'CUCULIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CLAMATOR', 'CUCULIDAE', 'CUCULIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('COCCYZUS', 'CUCULIDAE', 'CUCULIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TYTO', 'TYTONIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OTUS', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GLAUCIDIUM', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ATHENE', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AEGOLIUS', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BUBO', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NYCTEA', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('STRIX', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CAPRIMULGUS', 'CAPRIMULGIDAE', 'CAPRIMULGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHORDEILES', 'CAPRIMULGIDAE', 'CAPRIMULGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('APUS', 'APODIDAE', 'APODIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALCEDO', 'ALCEDINIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CERYLE', 'ALCEDINIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CORACIA', 'CORACIIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MEROPS', 'MEROPIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('UPUPA', 'UPUPIDAE', 'CORACIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PICUS', 'PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PICOIDES', 'PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('DRYOCOPUS', 'PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('JYNX', 'PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HAEMATOPUS', 'HAEMATOPODIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PLUVIALIS', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('EUDROMIAS', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('VANELLUS', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HOPLOPTERUS', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHETTUSIA', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ARENARIA', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHARADRIUS', 'CHARADRIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CALIDRIS', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LIMICOLA', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LIMNODROMUS', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MICROPALAMA', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SCOLOPAX', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GALLINAGO', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LYMNOCRYPTES', 'SCOLOPACIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHALAROPUS', 'PHALAROPIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('STERCORARIUS', 'STERCORIIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PAGOPHILA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('RHODOSTHETIA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LARUS', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('RISSA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NUMENIUS', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LIMOSA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ACTITIS', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TRINGA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('XENUS', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHILOMACHUS', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TRYNGITES', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BARTRAMIA', 'LARIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('RECURVIROSTRA', 'RECURVIROSTRIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HIMANTOPUS', 'RECURVIROSTRIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BURHINUS', 'BURHINIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CURSORIUS', 'GLAREOLIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GLAEROLA', 'GLAREOLIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GELOCHELIDON', 'STERNIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHLIDONIAS', 'STERNIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('STERNA', 'STERNIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALCA', 'ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('URIA', 'ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALLE', 'ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CEPHUS', 'ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FRATERCULA', 'ALCIDAE', 'CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CHERSOPHILUS', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CALANDRELLA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MELANOCRYPHA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GALERIDA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ALAUDA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LULLULA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('EREMOPHILA', 'ALAUDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('RIPARIA', 'HIRUNDINIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PTYONOPROGNE', 'HIRUNDINIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('DELICHON', 'HIRUNDINIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HIRUNDO', 'HIRUNDINIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ANTHUS', 'MOTACILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MOTACILLA', 'MOTACILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ORIOLUS', 'ORIOLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LANIUS', 'LANIIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('STURNUS', 'STURNIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BOMBYCILLA', 'BOMBYCILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PERISOREUS', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CYANOPICA', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PICA', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('NUCIFRAGA', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PYRRHOCORAX', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CORVUS', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CINCLUS', 'CINCLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TROGLODYTES', 'TROGLODYTIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PRUNELLA', 'PRUNELLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CETTIA', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LOCUSTELLA', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ACROCEPHALUS', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CISTICOLA', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HIPPOLAIS', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SYLVIA', 'SYLVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CERCOTRICHAS', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PHYLLOSCOPUS', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('REGULUS', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CATHARUS', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TURDUS', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ZOOTHERA', 'TURDIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PARUS', 'PARIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('AEGITHALOS', 'AEGITHALIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('REMIZ', 'REMIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SITTA', 'SITTIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TICHODROMA', 'TICHODROMADIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CERTHIA', 'CERTHIIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PASSER', 'PASSERIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PETRONIA', 'PASSERIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FRINGILLA', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PYRRHULA', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('COCCOTHRAUSTES', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SERINUS', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CARDUELIS', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BUCANETES', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PINICOLA', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CARPODACUS', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LOXIA', 'FRINGILLIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MILARIA', 'EMBERIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CALCARIUS', 'EMBERIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('PLECTROPHENAX', 'EMBERIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('EMBERIZA', 'EMBERIZIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MUSICAPA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FICEDULA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('OENANTHE', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('SAXICOLA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MONTICOLA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TARSIGER', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('LUSCINIA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('IRANIA', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('TESTUDO', 'TESTUDINIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ANGUIS', 'ANGUIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('OPHISAURUS', 'ANGUIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('EMYS', 'EMYDIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('MAUREMYS', 'EMYDIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('DERMOCHELYS', 'DERMOCHELYDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CARETTA', 'CHELONIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('LEPIDOCHELYS', 'CHELONIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CHELONIA', 'CHELONIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ERETHMOCHELYS', 'CHELONIDAE', 'CHELONIA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ALGYROIDES', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('OPHISOPS', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('PSAMMODROMUS', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('EREMIAS', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ACANTHODACTYLUS', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('LACERTA', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('PODARCIS', 'LACERTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('BLANUS', 'AMPHISBAENIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('TARENTOLA', 'GECKONIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('HEMIDACTYLUS', 'GECKONIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CYRTODACTYLUS', 'GECKONIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('PHYLLODACTYLUS', 'GECKONIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('AGAMA', 'AGAMIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ABLEPHARUS', 'SCINCIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('OPHIOMORUS', 'SCINCIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CHALCYDES', 'SCINCIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CHAMELEO', 'CHAMELEONTIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('TYPHLOPS', 'TYPHLOPIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ERYX', 'BOIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('VIPERA', 'VIPERIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('MALPOLON', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ELAPHE', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('CORONELLA', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('TELESCOPUS', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('MACROPROTODON', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('NATRIX', 'COLUBRIDAE', 'SERPENTES', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('SALAMANDRA', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('BOS/BISON', 'BOVIDAE', 'ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('FISSURELLA', 'FISSURELLIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('SALAMANDRINA', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('CHIOGLOSSA', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('PLEURODELES', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('EUPROCTUS', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('CERITHIUM', 'CERITHIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('TURRITELLA', 'TURRITELLIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('TRITURUS', 'SALAMANDRIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('MUREX', 'MURCIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MURICOPSIS', 'MURCIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('OCENEBRA', 'MURCIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('OCINEBRINA', 'MURCIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MITRELLA', 'COLUMBELLIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MANGELIA', 'TURRIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('HYDROMANTES', 'PLETHODONTIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('PROTEUS', 'PROTEIDAE', 'URODELA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('PATELLA', 'PATELLIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('BOLMA', 'TURBINIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('HOMALOPOMA', 'TURBINIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CLANCULUS', 'TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CALLIOSTOMA', 'TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('GIBBULA', 'TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MONODONTA', 'TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('JUJUBINUS', 'TROCHIDAE', 'ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('GRANARIA', 'CHONDRINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('SOLATOPUPA', 'CHONDRINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('BITTIUM', 'CERITHIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('SUCCINEA', 'SUCCINEIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('LITTORINA', 'LITTORINIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MELARAPHE', 'LITTORINIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('RISSOA', 'RISSOIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('ALVANIA', 'RISSOIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('TRIVIA', 'TRIVIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('DISCUS', 'DISCIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('VITREA', 'ZONITIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('AEGOPINELLA', 'ZONITIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('XEROTRICHA', 'HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('NASSARIUS', 'NASSARIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('COLUMBELLA', 'COLUMBELLIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CERNUELLA', 'HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('VEXILLUM', 'COSTELLARIIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MITRA', 'MITRIDAE', 'APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CANTAREUS', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('ARGNA', 'PUPILLIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CHONDRINA', 'CHONDRINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('JAMINIA', 'ENIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CLAUSILIA', 'CLAUSILIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('RUMINA', 'SUBULINIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('TESTACELLA', 'TESTACELLIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('OXYCHILUS', 'ZONITIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('RETINELLA', 'ZONITIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MONACHA', 'HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CARDITA', 'CARDITIDAE', 'BIVALVIA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('COELODONTA', 'RHINOCEROTIDAE', 'PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('GARRULUS', 'CORVIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MONTIFRINGILLA', 'PASSERIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('ASIO', 'STRIGIDAE', 'STRIGIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('CANDIDULA', 'HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('DENDROCOPOS', 'PICIDAE', 'PICIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('HELICODONTA', 'HYGROMIIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('CEPAEA', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('HELIX', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('MACULARIA', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('THEBA', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('EOBANIA', 'HELICIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('LIMAX', 'LIMACIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('PUPILLA', 'PUPILLIDAE', 'STYLOMMATOPHORA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('ABIDA', 'CHONDRINIDAE', 'PULMONATA', 'MOLLUSCA');
INSERT INTO remonte_genre VALUES ('BUFO', 'BUFONIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('COLUBER', 'COLUBRIDAE', 'SQUAMATA', 'REPTILIA');
INSERT INTO remonte_genre VALUES ('ERITHACUS', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('FALCO', 'FALCONIDAE', 'FALCONIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('GALLUS', 'PHASIANIDAE', 'GALLIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('MUS', 'MURIDAE', 'RODENTIA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PALAEOLOXODON', 'ELEPHANTIDAE', 'PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_genre VALUES ('PHOENICURUS', 'MUSCICAPIDAE', 'PASSERIFORMA', 'AVES');
INSERT INTO remonte_genre VALUES ('BOMBINA', 'DISCOGLOSSIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('ALYTES', 'DISCOGLOSSIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('DISCOGLOSSUS', 'DISCOGLOSSIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('PELOBATES', 'PELOBATIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('PELODYTES', 'PELOBATIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('HYLA', 'HYLIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('RANA', 'RANIDAE', 'ANURA', 'AMPHIBIA');
INSERT INTO remonte_genre VALUES ('POMATIAS', 'POMATIASIDAE', 'NEOTAENIOGLOSSA', 'MOLLUSCA');


--
-- Data for Name: remonte_ordre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO remonte_ordre VALUES ('PRIMATA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('INSECTIVORA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('CHIROPTERA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('RODENTIA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('LAGOMORPHA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('CARNIVORA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('ARTIODACTYLA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('PERISSODACTYLA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('PROBOSCIDEA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('CETACEA', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('PODICIPEDIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PROCELLARIIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PELECANIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('CICONIIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PHOENICOPTERIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('ANSERIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('ACCIPITRIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('FALCONIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('GALLIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('GRUIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PTEROCLIDIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('COLUMBIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('CUCULIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('STRIGIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('CAPRIMULGIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('APODIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('CORACIIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PICIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('CHARADRIIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('PASSERIFORMA', 'AVES');
INSERT INTO remonte_ordre VALUES ('IND', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('HERB', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('PH', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('GH', 'MAMMALIA');
INSERT INTO remonte_ordre VALUES ('ARCHAEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('APOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('ANURA', 'AMPHIBIA');
INSERT INTO remonte_ordre VALUES ('SQUAMATA', 'REPTILIA');
INSERT INTO remonte_ordre VALUES ('URODELA', 'AMPHIBIA');
INSERT INTO remonte_ordre VALUES ('TESTUDINES', 'REPTILIA');
INSERT INTO remonte_ordre VALUES ('PULMONATA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('MYTILOIDA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('MESOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('ARCOIDA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('BIVALVIA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('NEOGASTROPODA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('POLYPLACOPHORA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('PTEROIDA', 'MOLLUSCA');
INSERT INTO remonte_ordre VALUES ('GAVIIFORMA', 'AVES');


--
-- Data for Name: requete; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: retouche; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: stigmate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: trace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usure_dent; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
GRANT ALL ON TABLE biface TO databasename;
GRANT ALL ON TABLE biface TO superdatabasename;
GRANT SELECT ON TABLE biface TO visiteurdatabasename;
GRANT SELECT ON TABLE biface TO PUBLIC;


--
-- Name: bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE bord FROM PUBLIC;
REVOKE ALL ON TABLE bord FROM postgres;
GRANT ALL ON TABLE bord TO postgres;
GRANT ALL ON TABLE bord TO databasename;
GRANT ALL ON TABLE bord TO superdatabasename;
GRANT SELECT ON TABLE bord TO visiteurdatabasename;


--
-- Name: carnet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE carnet FROM PUBLIC;
REVOKE ALL ON TABLE carnet FROM postgres;
GRANT ALL ON TABLE carnet TO postgres;
GRANT ALL ON TABLE carnet TO databasename;
GRANT ALL ON TABLE carnet TO superdatabasename;
GRANT SELECT ON TABLE carnet TO visiteurdatabasename;


--
-- Name: controle_b_amenagement_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amenagement_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amenagement_bord FROM postgres;
GRANT ALL ON TABLE controle_b_amenagement_bord TO postgres;
GRANT SELECT ON TABLE controle_b_amenagement_bord TO PUBLIC;
GRANT SELECT ON TABLE controle_b_amenagement_bord TO databasename;
GRANT ALL ON TABLE controle_b_amenagement_bord TO superdatabasename;


--
-- Name: controle_b_amenagement_distal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amenagement_distal FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amenagement_distal FROM postgres;
GRANT ALL ON TABLE controle_b_amenagement_distal TO postgres;
GRANT SELECT ON TABLE controle_b_amenagement_distal TO databasename;
GRANT ALL ON TABLE controle_b_amenagement_distal TO superdatabasename;


--
-- Name: controle_b_amincissement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_amincissement FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_amincissement FROM postgres;
GRANT ALL ON TABLE controle_b_amincissement TO postgres;
GRANT SELECT ON TABLE controle_b_amincissement TO databasename;
GRANT ALL ON TABLE controle_b_amincissement TO superdatabasename;


--
-- Name: controle_b_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_arete FROM postgres;
GRANT ALL ON TABLE controle_b_arete TO postgres;
GRANT SELECT ON TABLE controle_b_arete TO databasename;
GRANT ALL ON TABLE controle_b_arete TO superdatabasename;


--
-- Name: controle_b_base; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_base FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_base FROM postgres;
GRANT ALL ON TABLE controle_b_base TO postgres;
GRANT SELECT ON TABLE controle_b_base TO databasename;
GRANT ALL ON TABLE controle_b_base TO superdatabasename;


--
-- Name: controle_b_bifaciale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bifaciale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bifaciale FROM postgres;
GRANT ALL ON TABLE controle_b_bifaciale TO postgres;
GRANT SELECT ON TABLE controle_b_bifaciale TO databasename;
GRANT ALL ON TABLE controle_b_bifaciale TO superdatabasename;


--
-- Name: controle_b_bilaterale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bilaterale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bilaterale FROM postgres;
GRANT ALL ON TABLE controle_b_bilaterale TO postgres;
GRANT SELECT ON TABLE controle_b_bilaterale TO databasename;
GRANT ALL ON TABLE controle_b_bilaterale TO superdatabasename;


--
-- Name: controle_b_biseau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_biseau FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_biseau FROM postgres;
GRANT ALL ON TABLE controle_b_biseau TO postgres;
GRANT SELECT ON TABLE controle_b_biseau TO databasename;
GRANT ALL ON TABLE controle_b_biseau TO superdatabasename;


--
-- Name: controle_b_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_bord FROM postgres;
GRANT ALL ON TABLE controle_b_bord TO postgres;
GRANT SELECT ON TABLE controle_b_bord TO databasename;
GRANT ALL ON TABLE controle_b_bord TO superdatabasename;


--
-- Name: controle_b_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_code FROM postgres;
GRANT ALL ON TABLE controle_b_code TO postgres;
GRANT SELECT ON TABLE controle_b_code TO databasename;
GRANT ALL ON TABLE controle_b_code TO superdatabasename;


--
-- Name: controle_b_dat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat FROM postgres;
GRANT ALL ON TABLE controle_b_dat TO postgres;
GRANT SELECT ON TABLE controle_b_dat TO databasename;
GRANT ALL ON TABLE controle_b_dat TO superdatabasename;


--
-- Name: controle_b_dat1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat1 FROM postgres;
GRANT ALL ON TABLE controle_b_dat1 TO postgres;
GRANT SELECT ON TABLE controle_b_dat1 TO databasename;
GRANT ALL ON TABLE controle_b_dat1 TO superdatabasename;


--
-- Name: controle_b_dat2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_dat2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_dat2 FROM postgres;
GRANT ALL ON TABLE controle_b_dat2 TO postgres;
GRANT SELECT ON TABLE controle_b_dat2 TO databasename;
GRANT ALL ON TABLE controle_b_dat2 TO superdatabasename;


--
-- Name: controle_b_distale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_distale FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_distale FROM postgres;
GRANT ALL ON TABLE controle_b_distale TO postgres;
GRANT SELECT ON TABLE controle_b_distale TO databasename;
GRANT ALL ON TABLE controle_b_distale TO superdatabasename;


--
-- Name: controle_b_enlevement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_enlevement FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_enlevement FROM postgres;
GRANT ALL ON TABLE controle_b_enlevement TO postgres;
GRANT SELECT ON TABLE controle_b_enlevement TO databasename;
GRANT ALL ON TABLE controle_b_enlevement TO superdatabasename;


--
-- Name: controle_b_extension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_extension FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_extension FROM postgres;
GRANT ALL ON TABLE controle_b_extension TO postgres;
GRANT SELECT ON TABLE controle_b_extension TO databasename;
GRANT ALL ON TABLE controle_b_extension TO superdatabasename;


--
-- Name: controle_b_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_extremite FROM postgres;
GRANT ALL ON TABLE controle_b_extremite TO postgres;
GRANT SELECT ON TABLE controle_b_extremite TO databasename;
GRANT ALL ON TABLE controle_b_extremite TO superdatabasename;


--
-- Name: controle_b_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_facture FROM postgres;
GRANT ALL ON TABLE controle_b_facture TO postgres;
GRANT SELECT ON TABLE controle_b_facture TO databasename;
GRANT ALL ON TABLE controle_b_facture TO superdatabasename;


--
-- Name: controle_b_meplat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_meplat FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_meplat FROM postgres;
GRANT ALL ON TABLE controle_b_meplat TO postgres;
GRANT SELECT ON TABLE controle_b_meplat TO databasename;
GRANT ALL ON TABLE controle_b_meplat TO superdatabasename;


--
-- Name: controle_b_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_retouche FROM postgres;
GRANT ALL ON TABLE controle_b_retouche TO postgres;
GRANT SELECT ON TABLE controle_b_retouche TO databasename;
GRANT ALL ON TABLE controle_b_retouche TO superdatabasename;


--
-- Name: controle_b_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_support FROM postgres;
GRANT ALL ON TABLE controle_b_support TO postgres;
GRANT ALL ON TABLE controle_b_support TO databasename;
GRANT ALL ON TABLE controle_b_support TO superdatabasename;


--
-- Name: controle_b_surface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_surface FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_surface FROM postgres;
GRANT ALL ON TABLE controle_b_surface TO postgres;
GRANT SELECT ON TABLE controle_b_surface TO databasename;
GRANT ALL ON TABLE controle_b_surface TO superdatabasename;


--
-- Name: controle_b_symetrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_symetrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_symetrie FROM postgres;
GRANT ALL ON TABLE controle_b_symetrie TO postgres;
GRANT SELECT ON TABLE controle_b_symetrie TO databasename;
GRANT ALL ON TABLE controle_b_symetrie TO superdatabasename;


--
-- Name: controle_b_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_b_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_b_type FROM postgres;
GRANT ALL ON TABLE controle_b_type TO postgres;
GRANT SELECT ON TABLE controle_b_type TO databasename;
GRANT ALL ON TABLE controle_b_type TO superdatabasename;


--
-- Name: controle_bis; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_bis FROM PUBLIC;
REVOKE ALL ON TABLE controle_bis FROM postgres;
GRANT ALL ON TABLE controle_bis TO postgres;
GRANT SELECT ON TABLE controle_bis TO databasename;
GRANT ALL ON TABLE controle_bis TO superdatabasename;


--
-- Name: controle_c_alteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_alteration FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_alteration FROM postgres;
GRANT ALL ON TABLE controle_c_alteration TO postgres;
GRANT ALL ON TABLE controle_c_alteration TO superdatabasename;
GRANT SELECT ON TABLE controle_c_alteration TO databasename;


--
-- Name: controle_c_altnat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_altnat FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_altnat FROM postgres;
GRANT ALL ON TABLE controle_c_altnat TO postgres;
GRANT ALL ON TABLE controle_c_altnat TO superdatabasename;
GRANT SELECT ON TABLE controle_c_altnat TO databasename;


--
-- Name: controle_c_autre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_autre FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_autre FROM postgres;
GRANT ALL ON TABLE controle_c_autre TO postgres;
GRANT ALL ON TABLE controle_c_autre TO superdatabasename;


--
-- Name: controle_c_consistance; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_consistance FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_consistance FROM postgres;
GRANT ALL ON TABLE controle_c_consistance TO postgres;
GRANT ALL ON TABLE controle_c_consistance TO superdatabasename;
GRANT SELECT ON TABLE controle_c_consistance TO databasename;


--
-- Name: controle_c_couleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_couleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_couleur FROM postgres;
GRANT ALL ON TABLE controle_c_couleur TO postgres;
GRANT ALL ON TABLE controle_c_couleur TO superdatabasename;
GRANT SELECT ON TABLE controle_c_couleur TO databasename;


--
-- Name: controle_c_element; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_element FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_element FROM postgres;
GRANT ALL ON TABLE controle_c_element TO postgres;
GRANT ALL ON TABLE controle_c_element TO superdatabasename;


--
-- Name: controle_c_ext1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_ext1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_ext1 FROM postgres;
GRANT ALL ON TABLE controle_c_ext1 TO postgres;
GRANT ALL ON TABLE controle_c_ext1 TO superdatabasename;
GRANT SELECT ON TABLE controle_c_ext1 TO databasename;


--
-- Name: controle_c_ext2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_ext2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_ext2 FROM postgres;
GRANT ALL ON TABLE controle_c_ext2 TO postgres;
GRANT ALL ON TABLE controle_c_ext2 TO superdatabasename;
GRANT SELECT ON TABLE controle_c_ext2 TO databasename;


--
-- Name: controle_c_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_extremite FROM postgres;
GRANT ALL ON TABLE controle_c_extremite TO postgres;
GRANT ALL ON TABLE controle_c_extremite TO superdatabasename;


--
-- Name: controle_c_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_famille FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_famille FROM postgres;
GRANT ALL ON TABLE controle_c_famille TO postgres;
GRANT ALL ON TABLE controle_c_famille TO superdatabasename;


--
-- Name: controle_c_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_forme FROM postgres;
GRANT ALL ON TABLE controle_c_forme TO postgres;
GRANT ALL ON TABLE controle_c_forme TO databasename;
GRANT ALL ON TABLE controle_c_forme TO superdatabasename;


--
-- Name: controle_c_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_genre FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_genre FROM postgres;
GRANT ALL ON TABLE controle_c_genre TO postgres;
GRANT ALL ON TABLE controle_c_genre TO superdatabasename;


--
-- Name: controle_c_granulometrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_granulometrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_granulometrie FROM postgres;
GRANT ALL ON TABLE controle_c_granulometrie TO postgres;
GRANT ALL ON TABLE controle_c_granulometrie TO superdatabasename;
GRANT SELECT ON TABLE controle_c_granulometrie TO databasename;


--
-- Name: controle_c_incl1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl1 FROM postgres;
GRANT ALL ON TABLE controle_c_incl1 TO postgres;
GRANT ALL ON TABLE controle_c_incl1 TO superdatabasename;
GRANT SELECT ON TABLE controle_c_incl1 TO databasename;


--
-- Name: controle_c_incl2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl2 FROM postgres;
GRANT ALL ON TABLE controle_c_incl2 TO postgres;
GRANT ALL ON TABLE controle_c_incl2 TO superdatabasename;


--
-- Name: controle_c_incl3; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_incl3 FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_incl3 FROM postgres;
GRANT ALL ON TABLE controle_c_incl3 TO postgres;
GRANT ALL ON TABLE controle_c_incl3 TO superdatabasename;
GRANT SELECT ON TABLE controle_c_incl3 TO databasename;


--
-- Name: controle_c_inclusion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_inclusion FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_inclusion FROM postgres;
GRANT ALL ON TABLE controle_c_inclusion TO postgres;
GRANT ALL ON TABLE controle_c_inclusion TO superdatabasename;


--
-- Name: controle_c_lame; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_lame FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_lame FROM postgres;
GRANT ALL ON TABLE controle_c_lame TO postgres;
GRANT ALL ON TABLE controle_c_lame TO superdatabasename;
GRANT SELECT ON TABLE controle_c_lame TO databasename;


--
-- Name: controle_c_liant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_liant FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_liant FROM postgres;
GRANT ALL ON TABLE controle_c_liant TO postgres;
GRANT ALL ON TABLE controle_c_liant TO superdatabasename;


--
-- Name: controle_c_macroreste; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_macroreste FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_macroreste FROM postgres;
GRANT ALL ON TABLE controle_c_macroreste TO postgres;
GRANT ALL ON TABLE controle_c_macroreste TO superdatabasename;
GRANT SELECT ON TABLE controle_c_macroreste TO databasename;


--
-- Name: controle_c_mif; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_mif FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_mif FROM postgres;
GRANT ALL ON TABLE controle_c_mif TO postgres;
GRANT ALL ON TABLE controle_c_mif TO superdatabasename;
GRANT SELECT ON TABLE controle_c_mif TO databasename;


--
-- Name: controle_c_motcou; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motcou FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motcou FROM postgres;
GRANT ALL ON TABLE controle_c_motcou TO postgres;
GRANT ALL ON TABLE controle_c_motcou TO superdatabasename;
GRANT SELECT ON TABLE controle_c_motcou TO databasename;


--
-- Name: controle_c_motif; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motif FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motif FROM postgres;
GRANT ALL ON TABLE controle_c_motif TO postgres;
GRANT ALL ON TABLE controle_c_motif TO superdatabasename;
GRANT SELECT ON TABLE controle_c_motif TO databasename;


--
-- Name: controle_c_motnat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_motnat FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_motnat FROM postgres;
GRANT ALL ON TABLE controle_c_motnat TO postgres;
GRANT ALL ON TABLE controle_c_motnat TO superdatabasename;
GRANT SELECT ON TABLE controle_c_motnat TO databasename;


--
-- Name: controle_c_palyno; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_palyno FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_palyno FROM postgres;
GRANT ALL ON TABLE controle_c_palyno TO postgres;
GRANT ALL ON TABLE controle_c_palyno TO superdatabasename;
GRANT SELECT ON TABLE controle_c_palyno TO databasename;


--
-- Name: controle_c_parasito; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_parasito FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_parasito FROM postgres;
GRANT ALL ON TABLE controle_c_parasito TO postgres;
GRANT ALL ON TABLE controle_c_parasito TO superdatabasename;


--
-- Name: controle_c_retrecissement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_retrecissement FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_retrecissement FROM postgres;
GRANT ALL ON TABLE controle_c_retrecissement TO postgres;
GRANT ALL ON TABLE controle_c_retrecissement TO superdatabasename;


--
-- Name: controle_c_sediment; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_sediment FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_sediment FROM postgres;
GRANT ALL ON TABLE controle_c_sediment TO postgres;
GRANT ALL ON TABLE controle_c_sediment TO superdatabasename;
GRANT SELECT ON TABLE controle_c_sediment TO databasename;


--
-- Name: controle_c_vol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_vol FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_vol FROM postgres;
GRANT ALL ON TABLE controle_c_vol TO postgres;
GRANT ALL ON TABLE controle_c_vol TO superdatabasename;
GRANT SELECT ON TABLE controle_c_vol TO databasename;


--
-- Name: controle_c_volext; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_c_volext FROM PUBLIC;
REVOKE ALL ON TABLE controle_c_volext FROM postgres;
GRANT ALL ON TABLE controle_c_volext TO postgres;
GRANT ALL ON TABLE controle_c_volext TO superdatabasename;
GRANT SELECT ON TABLE controle_c_volext TO databasename;


--
-- Name: controle_carre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_carre FROM PUBLIC;
REVOKE ALL ON TABLE controle_carre FROM postgres;
GRANT ALL ON TABLE controle_carre TO postgres;
GRANT SELECT ON TABLE controle_carre TO databasename;
GRANT ALL ON TABLE controle_carre TO superdatabasename;


--
-- Name: controle_d_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_d_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_d_serie FROM postgres;
GRANT ALL ON TABLE controle_d_serie TO postgres;
GRANT SELECT ON TABLE controle_d_serie TO databasename;
GRANT ALL ON TABLE controle_d_serie TO superdatabasename;


--
-- Name: controle_d_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_d_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_d_type FROM postgres;
GRANT ALL ON TABLE controle_d_type TO postgres;
GRANT SELECT ON TABLE controle_d_type TO databasename;
GRANT ALL ON TABLE controle_d_type TO superdatabasename;


--
-- Name: controle_e_bulbe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_bulbe FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_bulbe FROM postgres;
GRANT ALL ON TABLE controle_e_bulbe TO postgres;
GRANT SELECT ON TABLE controle_e_bulbe TO databasename;
GRANT ALL ON TABLE controle_e_bulbe TO superdatabasename;


--
-- Name: controle_e_carene; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_carene FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_carene FROM postgres;
GRANT ALL ON TABLE controle_e_carene TO postgres;
GRANT SELECT ON TABLE controle_e_carene TO databasename;
GRANT ALL ON TABLE controle_e_carene TO superdatabasename;


--
-- Name: controle_e_charniere; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_charniere FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_charniere FROM postgres;
GRANT ALL ON TABLE controle_e_charniere TO postgres;
GRANT SELECT ON TABLE controle_e_charniere TO databasename;
GRANT ALL ON TABLE controle_e_charniere TO superdatabasename;


--
-- Name: controle_e_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_code FROM postgres;
GRANT ALL ON TABLE controle_e_code TO postgres;
GRANT SELECT ON TABLE controle_e_code TO databasename;
GRANT ALL ON TABLE controle_e_code TO superdatabasename;


--
-- Name: controle_e_cone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_cone FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_cone FROM postgres;
GRANT ALL ON TABLE controle_e_cone TO postgres;
GRANT SELECT ON TABLE controle_e_cone TO databasename;
GRANT ALL ON TABLE controle_e_cone TO superdatabasename;


--
-- Name: controle_e_contour; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_contour FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_contour FROM postgres;
GRANT ALL ON TABLE controle_e_contour TO postgres;
GRANT SELECT ON TABLE controle_e_contour TO databasename;
GRANT ALL ON TABLE controle_e_contour TO superdatabasename;


--
-- Name: controle_e_debitage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_debitage FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_debitage FROM postgres;
GRANT ALL ON TABLE controle_e_debitage TO postgres;
GRANT SELECT ON TABLE controle_e_debitage TO databasename;
GRANT ALL ON TABLE controle_e_debitage TO superdatabasename;


--
-- Name: controle_e_enlevement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_enlevement FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_enlevement FROM postgres;
GRANT ALL ON TABLE controle_e_enlevement TO postgres;
GRANT SELECT ON TABLE controle_e_enlevement TO databasename;
GRANT ALL ON TABLE controle_e_enlevement TO superdatabasename;


--
-- Name: controle_e_epi; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_epi FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_epi FROM postgres;
GRANT ALL ON TABLE controle_e_epi TO postgres;
GRANT SELECT ON TABLE controle_e_epi TO databasename;
GRANT ALL ON TABLE controle_e_epi TO superdatabasename;


--
-- Name: controle_e_onde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_onde FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_onde FROM postgres;
GRANT ALL ON TABLE controle_e_onde TO postgres;
GRANT SELECT ON TABLE controle_e_onde TO databasename;
GRANT ALL ON TABLE controle_e_onde TO superdatabasename;


--
-- Name: controle_e_parasite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_parasite FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_parasite FROM postgres;
GRANT ALL ON TABLE controle_e_parasite TO postgres;
GRANT SELECT ON TABLE controle_e_parasite TO databasename;
GRANT ALL ON TABLE controle_e_parasite TO superdatabasename;


--
-- Name: controle_e_secondaire; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_secondaire FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_secondaire FROM postgres;
GRANT ALL ON TABLE controle_e_secondaire TO postgres;
GRANT SELECT ON TABLE controle_e_secondaire TO databasename;
GRANT ALL ON TABLE controle_e_secondaire TO superdatabasename;


--
-- Name: controle_e_section_long; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_section_long FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_section_long FROM postgres;
GRANT ALL ON TABLE controle_e_section_long TO postgres;
GRANT SELECT ON TABLE controle_e_section_long TO databasename;
GRANT ALL ON TABLE controle_e_section_long TO superdatabasename;


--
-- Name: controle_e_section_trans; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_section_trans FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_section_trans FROM postgres;
GRANT ALL ON TABLE controle_e_section_trans TO postgres;
GRANT SELECT ON TABLE controle_e_section_trans TO databasename;
GRANT ALL ON TABLE controle_e_section_trans TO superdatabasename;


--
-- Name: controle_e_strie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_strie FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_strie FROM postgres;
GRANT ALL ON TABLE controle_e_strie TO postgres;
GRANT SELECT ON TABLE controle_e_strie TO databasename;
GRANT ALL ON TABLE controle_e_strie TO superdatabasename;


--
-- Name: controle_e_talon; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_talon FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_talon FROM postgres;
GRANT ALL ON TABLE controle_e_talon TO postgres;
GRANT SELECT ON TABLE controle_e_talon TO databasename;
GRANT ALL ON TABLE controle_e_talon TO superdatabasename;


--
-- Name: controle_e_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_e_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_e_type FROM postgres;
GRANT ALL ON TABLE controle_e_type TO postgres;
GRANT SELECT ON TABLE controle_e_type TO databasename;
GRANT ALL ON TABLE controle_e_type TO superdatabasename;


--
-- Name: controle_eg_element; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_element FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_element FROM postgres;
GRANT ALL ON TABLE controle_eg_element TO postgres;
GRANT SELECT ON TABLE controle_eg_element TO databasename;
GRANT ALL ON TABLE controle_eg_element TO superdatabasename;


--
-- Name: controle_eg_epaisseur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_epaisseur FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_epaisseur FROM postgres;
GRANT ALL ON TABLE controle_eg_epaisseur TO postgres;
GRANT SELECT ON TABLE controle_eg_epaisseur TO databasename;
GRANT ALL ON TABLE controle_eg_epaisseur TO superdatabasename;


--
-- Name: controle_eg_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_extremite FROM postgres;
GRANT ALL ON TABLE controle_eg_extremite TO postgres;
GRANT SELECT ON TABLE controle_eg_extremite TO databasename;
GRANT ALL ON TABLE controle_eg_extremite TO superdatabasename;


--
-- Name: controle_eg_longueur_generale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_longueur_generale FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_longueur_generale FROM postgres;
GRANT ALL ON TABLE controle_eg_longueur_generale TO postgres;
GRANT SELECT ON TABLE controle_eg_longueur_generale TO databasename;
GRANT ALL ON TABLE controle_eg_longueur_generale TO superdatabasename;


--
-- Name: controle_eg_proeminence; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_proeminence FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_proeminence FROM postgres;
GRANT ALL ON TABLE controle_eg_proeminence TO postgres;
GRANT SELECT ON TABLE controle_eg_proeminence TO databasename;
GRANT ALL ON TABLE controle_eg_proeminence TO superdatabasename;


--
-- Name: controle_eg_profil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_profil FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_profil FROM postgres;
GRANT ALL ON TABLE controle_eg_profil TO postgres;
GRANT SELECT ON TABLE controle_eg_profil TO databasename;
GRANT ALL ON TABLE controle_eg_profil TO superdatabasename;


--
-- Name: controle_eg_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_profondeur FROM postgres;
GRANT ALL ON TABLE controle_eg_profondeur TO postgres;
GRANT SELECT ON TABLE controle_eg_profondeur TO databasename;
GRANT ALL ON TABLE controle_eg_profondeur TO superdatabasename;


--
-- Name: controle_eg_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_sens FROM postgres;
GRANT ALL ON TABLE controle_eg_sens TO postgres;
GRANT SELECT ON TABLE controle_eg_sens TO databasename;
GRANT ALL ON TABLE controle_eg_sens TO superdatabasename;


--
-- Name: controle_eg_situation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_situation FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_situation FROM postgres;
GRANT ALL ON TABLE controle_eg_situation TO postgres;
GRANT SELECT ON TABLE controle_eg_situation TO databasename;
GRANT ALL ON TABLE controle_eg_situation TO superdatabasename;


--
-- Name: controle_eg_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_eg_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_eg_support FROM postgres;
GRANT ALL ON TABLE controle_eg_support TO postgres;
GRANT SELECT ON TABLE controle_eg_support TO databasename;
GRANT ALL ON TABLE controle_eg_support TO superdatabasename;


--
-- Name: controle_en_direction; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_direction FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_direction FROM postgres;
GRANT ALL ON TABLE controle_en_direction TO postgres;
GRANT SELECT ON TABLE controle_en_direction TO databasename;
GRANT ALL ON TABLE controle_en_direction TO superdatabasename;


--
-- Name: controle_en_dptimpact; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_dptimpact FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_dptimpact FROM postgres;
GRANT ALL ON TABLE controle_en_dptimpact TO postgres;
GRANT SELECT ON TABLE controle_en_dptimpact TO databasename;
GRANT ALL ON TABLE controle_en_dptimpact TO superdatabasename;


--
-- Name: controle_en_frappe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_frappe FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_frappe FROM postgres;
GRANT ALL ON TABLE controle_en_frappe TO postgres;
GRANT SELECT ON TABLE controle_en_frappe TO databasename;
GRANT ALL ON TABLE controle_en_frappe TO superdatabasename;


--
-- Name: controle_en_inclinaison; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_inclinaison FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_inclinaison FROM postgres;
GRANT ALL ON TABLE controle_en_inclinaison TO postgres;
GRANT SELECT ON TABLE controle_en_inclinaison TO databasename;
GRANT ALL ON TABLE controle_en_inclinaison TO superdatabasename;


--
-- Name: controle_en_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_obliquite FROM postgres;
GRANT ALL ON TABLE controle_en_obliquite TO postgres;
GRANT SELECT ON TABLE controle_en_obliquite TO databasename;
GRANT ALL ON TABLE controle_en_obliquite TO superdatabasename;


--
-- Name: controle_en_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_en_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_en_profondeur FROM postgres;
GRANT ALL ON TABLE controle_en_profondeur TO postgres;
GRANT SELECT ON TABLE controle_en_profondeur TO databasename;
GRANT ALL ON TABLE controle_en_profondeur TO superdatabasename;


--
-- Name: controle_ensemble; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ensemble FROM PUBLIC;
REVOKE ALL ON TABLE controle_ensemble FROM postgres;
GRANT ALL ON TABLE controle_ensemble TO postgres;
GRANT SELECT ON TABLE controle_ensemble TO databasename;
GRANT ALL ON TABLE controle_ensemble TO superdatabasename;


--
-- Name: controle_f_affespece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_affespece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_affespece FROM postgres;
GRANT ALL ON TABLE controle_f_affespece TO postgres;
GRANT ALL ON TABLE controle_f_affespece TO databasename;
GRANT ALL ON TABLE controle_f_affespece TO superdatabasename;


--
-- Name: controle_f_affgenre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_affgenre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_affgenre FROM postgres;
GRANT ALL ON TABLE controle_f_affgenre TO postgres;
GRANT ALL ON TABLE controle_f_affgenre TO databasename;
GRANT ALL ON TABLE controle_f_affgenre TO superdatabasename;


--
-- Name: controle_f_agecl; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agecl FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agecl FROM postgres;
GRANT ALL ON TABLE controle_f_agecl TO postgres;
GRANT SELECT ON TABLE controle_f_agecl TO databasename;
GRANT ALL ON TABLE controle_f_agecl TO superdatabasename;


--
-- Name: controle_f_agent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agent FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agent FROM postgres;
GRANT ALL ON TABLE controle_f_agent TO postgres;
GRANT SELECT ON TABLE controle_f_agent TO databasename;
GRANT ALL ON TABLE controle_f_agent TO superdatabasename;


--
-- Name: controle_f_agest; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_agest FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_agest FROM postgres;
GRANT ALL ON TABLE controle_f_agest TO postgres;
GRANT SELECT ON TABLE controle_f_agest TO databasename;
GRANT ALL ON TABLE controle_f_agest TO superdatabasename;


--
-- Name: controle_f_association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_association FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_association FROM postgres;
GRANT ALL ON TABLE controle_f_association TO postgres;
GRANT SELECT ON TABLE controle_f_association TO databasename;
GRANT ALL ON TABLE controle_f_association TO superdatabasename;


--
-- Name: controle_f_calcouleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_calcouleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_calcouleur FROM postgres;
GRANT ALL ON TABLE controle_f_calcouleur TO postgres;
GRANT SELECT ON TABLE controle_f_calcouleur TO databasename;
GRANT ALL ON TABLE controle_f_calcouleur TO superdatabasename;


--
-- Name: controle_f_caltype; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_caltype FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_caltype FROM postgres;
GRANT ALL ON TABLE controle_f_caltype TO postgres;
GRANT SELECT ON TABLE controle_f_caltype TO databasename;
GRANT ALL ON TABLE controle_f_caltype TO superdatabasename;


--
-- Name: controle_f_classe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_classe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_classe FROM postgres;
GRANT ALL ON TABLE controle_f_classe TO postgres;
GRANT SELECT ON TABLE controle_f_classe TO databasename;
GRANT ALL ON TABLE controle_f_classe TO superdatabasename;


--
-- Name: controle_f_complement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_complement FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_complement FROM postgres;
GRANT ALL ON TABLE controle_f_complement TO postgres;
GRANT ALL ON TABLE controle_f_complement TO databasename;
GRANT ALL ON TABLE controle_f_complement TO superdatabasename;


--
-- Name: controle_f_composite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_composite FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_composite FROM postgres;
GRANT ALL ON TABLE controle_f_composite TO postgres;
GRANT SELECT ON TABLE controle_f_composite TO databasename;
GRANT ALL ON TABLE controle_f_composite TO superdatabasename;


--
-- Name: controle_f_concretion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_concretion FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_concretion FROM postgres;
GRANT ALL ON TABLE controle_f_concretion TO postgres;
GRANT SELECT ON TABLE controle_f_concretion TO databasename;
GRANT ALL ON TABLE controle_f_concretion TO superdatabasename;


--
-- Name: controle_f_conservation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_conservation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_conservation FROM postgres;
GRANT ALL ON TABLE controle_f_conservation TO postgres;
GRANT SELECT ON TABLE controle_f_conservation TO databasename;
GRANT ALL ON TABLE controle_f_conservation TO superdatabasename;


--
-- Name: controle_f_coprolithe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_coprolithe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_coprolithe FROM postgres;
GRANT ALL ON TABLE controle_f_coprolithe TO postgres;
GRANT SELECT ON TABLE controle_f_coprolithe TO databasename;
GRANT ALL ON TABLE controle_f_coprolithe TO superdatabasename;


--
-- Name: controle_f_coraspect; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_coraspect FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_coraspect FROM postgres;
GRANT ALL ON TABLE controle_f_coraspect TO postgres;
GRANT SELECT ON TABLE controle_f_coraspect TO databasename;
GRANT ALL ON TABLE controle_f_coraspect TO superdatabasename;


--
-- Name: controle_f_corfissure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_corfissure FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_corfissure FROM postgres;
GRANT ALL ON TABLE controle_f_corfissure TO postgres;
GRANT SELECT ON TABLE controle_f_corfissure TO databasename;
GRANT ALL ON TABLE controle_f_corfissure TO superdatabasename;


--
-- Name: controle_f_couleur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_couleur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_couleur FROM postgres;
GRANT ALL ON TABLE controle_f_couleur TO postgres;
GRANT SELECT ON TABLE controle_f_couleur TO databasename;
GRANT ALL ON TABLE controle_f_couleur TO superdatabasename;


--
-- Name: controle_f_datation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_datation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_datation FROM postgres;
GRANT ALL ON TABLE controle_f_datation TO postgres;
GRANT SELECT ON TABLE controle_f_datation TO databasename;
GRANT ALL ON TABLE controle_f_datation TO superdatabasename;


--
-- Name: controle_f_description; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_description FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_description FROM postgres;
GRANT ALL ON TABLE controle_f_description TO postgres;
GRANT SELECT ON TABLE controle_f_description TO databasename;
GRANT ALL ON TABLE controle_f_description TO superdatabasename;


--
-- Name: controle_f_dessin; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_dessin FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_dessin FROM postgres;
GRANT ALL ON TABLE controle_f_dessin TO postgres;
GRANT SELECT ON TABLE controle_f_dessin TO databasename;
GRANT ALL ON TABLE controle_f_dessin TO superdatabasename;


--
-- Name: controle_f_eclat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_eclat FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_eclat FROM postgres;
GRANT ALL ON TABLE controle_f_eclat TO postgres;
GRANT SELECT ON TABLE controle_f_eclat TO databasename;
GRANT ALL ON TABLE controle_f_eclat TO superdatabasename;


--
-- Name: controle_f_espece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_espece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_espece FROM postgres;
GRANT ALL ON TABLE controle_f_espece TO postgres;
GRANT SELECT ON TABLE controle_f_espece TO databasename;
GRANT ALL ON TABLE controle_f_espece TO superdatabasename;


--
-- Name: controle_f_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_famille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_famille FROM postgres;
GRANT ALL ON TABLE controle_f_famille TO postgres;
GRANT SELECT ON TABLE controle_f_famille TO databasename;
GRANT ALL ON TABLE controle_f_famille TO superdatabasename;


--
-- Name: controle_f_fossilisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fossilisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fossilisation FROM postgres;
GRANT ALL ON TABLE controle_f_fossilisation TO postgres;
GRANT SELECT ON TABLE controle_f_fossilisation TO databasename;
GRANT ALL ON TABLE controle_f_fossilisation TO superdatabasename;


--
-- Name: controle_f_fragde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fragde FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fragde FROM postgres;
GRANT ALL ON TABLE controle_f_fragde TO postgres;
GRANT SELECT ON TABLE controle_f_fragde TO databasename;
GRANT ALL ON TABLE controle_f_fragde TO superdatabasename;


--
-- Name: controle_f_fragge; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_fragge FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_fragge FROM postgres;
GRANT ALL ON TABLE controle_f_fragge TO postgres;
GRANT SELECT ON TABLE controle_f_fragge TO databasename;
GRANT ALL ON TABLE controle_f_fragge TO superdatabasename;


--
-- Name: controle_f_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_genre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_genre FROM postgres;
GRANT ALL ON TABLE controle_f_genre TO postgres;
GRANT SELECT ON TABLE controle_f_genre TO databasename;
GRANT ALL ON TABLE controle_f_genre TO superdatabasename;


--
-- Name: controle_f_icirconference; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_icirconference FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_icirconference FROM postgres;
GRANT ALL ON TABLE controle_f_icirconference TO postgres;
GRANT SELECT ON TABLE controle_f_icirconference TO databasename;
GRANT ALL ON TABLE controle_f_icirconference TO superdatabasename;


--
-- Name: controle_f_ilongueur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ilongueur FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ilongueur FROM postgres;
GRANT ALL ON TABLE controle_f_ilongueur TO postgres;
GRANT SELECT ON TABLE controle_f_ilongueur TO databasename;
GRANT ALL ON TABLE controle_f_ilongueur TO superdatabasename;


--
-- Name: controle_f_lateralite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_lateralite FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_lateralite FROM postgres;
GRANT ALL ON TABLE controle_f_lateralite TO postgres;
GRANT SELECT ON TABLE controle_f_lateralite TO databasename;
GRANT ALL ON TABLE controle_f_lateralite TO superdatabasename;


--
-- Name: controle_f_mode; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_mode FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_mode FROM postgres;
GRANT ALL ON TABLE controle_f_mode TO postgres;
GRANT SELECT ON TABLE controle_f_mode TO databasename;
GRANT ALL ON TABLE controle_f_mode TO superdatabasename;


--
-- Name: controle_f_moulage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_moulage FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_moulage FROM postgres;
GRANT ALL ON TABLE controle_f_moulage TO postgres;
GRANT SELECT ON TABLE controle_f_moulage TO databasename;
GRANT ALL ON TABLE controle_f_moulage TO superdatabasename;


--
-- Name: controle_f_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ordre FROM postgres;
GRANT ALL ON TABLE controle_f_ordre TO postgres;
GRANT SELECT ON TABLE controle_f_ordre TO databasename;
GRANT ALL ON TABLE controle_f_ordre TO superdatabasename;


--
-- Name: controle_f_oxyde; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_oxyde FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_oxyde FROM postgres;
GRANT ALL ON TABLE controle_f_oxyde TO postgres;
GRANT SELECT ON TABLE controle_f_oxyde TO databasename;
GRANT ALL ON TABLE controle_f_oxyde TO superdatabasename;


--
-- Name: controle_f_pathologie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_pathologie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_pathologie FROM postgres;
GRANT ALL ON TABLE controle_f_pathologie TO postgres;
GRANT SELECT ON TABLE controle_f_pathologie TO databasename;
GRANT ALL ON TABLE controle_f_pathologie TO superdatabasename;


--
-- Name: controle_f_pelote; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_pelote FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_pelote FROM postgres;
GRANT ALL ON TABLE controle_f_pelote TO postgres;
GRANT SELECT ON TABLE controle_f_pelote TO databasename;
GRANT ALL ON TABLE controle_f_pelote TO superdatabasename;


--
-- Name: controle_f_percussion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_percussion FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_percussion FROM postgres;
GRANT ALL ON TABLE controle_f_percussion TO postgres;
GRANT SELECT ON TABLE controle_f_percussion TO databasename;
GRANT ALL ON TABLE controle_f_percussion TO superdatabasename;


--
-- Name: controle_f_photo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_photo FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_photo FROM postgres;
GRANT ALL ON TABLE controle_f_photo TO postgres;
GRANT SELECT ON TABLE controle_f_photo TO databasename;
GRANT ALL ON TABLE controle_f_photo TO superdatabasename;


--
-- Name: controle_f_reference; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_reference FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_reference FROM postgres;
GRANT ALL ON TABLE controle_f_reference TO postgres;
GRANT ALL ON TABLE controle_f_reference TO databasename;
GRANT ALL ON TABLE controle_f_reference TO superdatabasename;


--
-- Name: controle_f_responsable; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_responsable FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_responsable FROM postgres;
GRANT ALL ON TABLE controle_f_responsable TO postgres;
GRANT SELECT ON TABLE controle_f_responsable TO databasename;
GRANT ALL ON TABLE controle_f_responsable TO superdatabasename;


--
-- Name: controle_f_restauration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_restauration FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_restauration FROM postgres;
GRANT ALL ON TABLE controle_f_restauration TO postgres;
GRANT SELECT ON TABLE controle_f_restauration TO databasename;
GRANT ALL ON TABLE controle_f_restauration TO superdatabasename;


--
-- Name: controle_f_saisie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_saisie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_saisie FROM postgres;
GRANT ALL ON TABLE controle_f_saisie TO postgres;
GRANT SELECT ON TABLE controle_f_saisie TO databasename;
GRANT ALL ON TABLE controle_f_saisie TO superdatabasename;


--
-- Name: controle_f_sauvefrag; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_sauvefrag FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_sauvefrag FROM postgres;
GRANT ALL ON TABLE controle_f_sauvefrag TO postgres;
GRANT SELECT ON TABLE controle_f_sauvefrag TO databasename;
GRANT ALL ON TABLE controle_f_sauvefrag TO superdatabasename;


--
-- Name: controle_f_sexe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_sexe FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_sexe FROM postgres;
GRANT ALL ON TABLE controle_f_sexe TO postgres;
GRANT SELECT ON TABLE controle_f_sexe TO databasename;
GRANT ALL ON TABLE controle_f_sexe TO superdatabasename;


--
-- Name: controle_f_ssespece; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ssespece FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ssespece FROM postgres;
GRANT ALL ON TABLE controle_f_ssespece TO postgres;
GRANT SELECT ON TABLE controle_f_ssespece TO databasename;
GRANT ALL ON TABLE controle_f_ssespece TO superdatabasename;


--
-- Name: controle_f_ssfamille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_ssfamille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_ssfamille FROM postgres;
GRANT ALL ON TABLE controle_f_ssfamille TO postgres;
GRANT SELECT ON TABLE controle_f_ssfamille TO databasename;
GRANT ALL ON TABLE controle_f_ssfamille TO superdatabasename;


--
-- Name: controle_f_stdent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_stdent FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_stdent FROM postgres;
GRANT ALL ON TABLE controle_f_stdent TO postgres;
GRANT SELECT ON TABLE controle_f_stdent TO databasename;
GRANT ALL ON TABLE controle_f_stdent TO superdatabasename;


--
-- Name: controle_f_stserie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_stserie FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_stserie FROM postgres;
GRANT ALL ON TABLE controle_f_stserie TO postgres;
GRANT SELECT ON TABLE controle_f_stserie TO databasename;
GRANT ALL ON TABLE controle_f_stserie TO superdatabasename;


--
-- Name: controle_f_taille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_taille FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_taille FROM postgres;
GRANT ALL ON TABLE controle_f_taille TO postgres;
GRANT SELECT ON TABLE controle_f_taille TO databasename;
GRANT ALL ON TABLE controle_f_taille TO superdatabasename;


--
-- Name: controle_f_tissu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_tissu FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_tissu FROM postgres;
GRANT ALL ON TABLE controle_f_tissu TO postgres;
GRANT SELECT ON TABLE controle_f_tissu TO databasename;
GRANT ALL ON TABLE controle_f_tissu TO superdatabasename;


--
-- Name: controle_f_traitement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_traitement FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_traitement FROM postgres;
GRANT ALL ON TABLE controle_f_traitement TO postgres;
GRANT SELECT ON TABLE controle_f_traitement TO databasename;
GRANT ALL ON TABLE controle_f_traitement TO superdatabasename;


--
-- Name: controle_f_tranchant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_tranchant FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_tranchant FROM postgres;
GRANT ALL ON TABLE controle_f_tranchant TO postgres;
GRANT SELECT ON TABLE controle_f_tranchant TO databasename;
GRANT ALL ON TABLE controle_f_tranchant TO superdatabasename;


--
-- Name: controle_f_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_type FROM postgres;
GRANT ALL ON TABLE controle_f_type TO postgres;
GRANT SELECT ON TABLE controle_f_type TO databasename;
GRANT ALL ON TABLE controle_f_type TO superdatabasename;


--
-- Name: controle_f_typedos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typedos FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typedos FROM postgres;
GRANT ALL ON TABLE controle_f_typedos TO postgres;
GRANT SELECT ON TABLE controle_f_typedos TO databasename;
GRANT ALL ON TABLE controle_f_typedos TO superdatabasename;


--
-- Name: controle_f_typos1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos1 FROM postgres;
GRANT ALL ON TABLE controle_f_typos1 TO postgres;
GRANT SELECT ON TABLE controle_f_typos1 TO databasename;
GRANT ALL ON TABLE controle_f_typos1 TO superdatabasename;


--
-- Name: controle_f_typos2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos2 FROM postgres;
GRANT ALL ON TABLE controle_f_typos2 TO postgres;
GRANT SELECT ON TABLE controle_f_typos2 TO databasename;
GRANT ALL ON TABLE controle_f_typos2 TO superdatabasename;


--
-- Name: controle_f_typos3; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos3 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos3 FROM postgres;
GRANT ALL ON TABLE controle_f_typos3 TO postgres;
GRANT SELECT ON TABLE controle_f_typos3 TO databasename;
GRANT ALL ON TABLE controle_f_typos3 TO superdatabasename;


--
-- Name: controle_f_typos4; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos4 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos4 FROM postgres;
GRANT ALL ON TABLE controle_f_typos4 TO postgres;
GRANT SELECT ON TABLE controle_f_typos4 TO databasename;
GRANT ALL ON TABLE controle_f_typos4 TO superdatabasename;


--
-- Name: controle_f_typos5; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos5 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos5 FROM postgres;
GRANT ALL ON TABLE controle_f_typos5 TO postgres;
GRANT SELECT ON TABLE controle_f_typos5 TO databasename;
GRANT ALL ON TABLE controle_f_typos5 TO superdatabasename;


--
-- Name: controle_f_typos6; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_f_typos6 FROM PUBLIC;
REVOKE ALL ON TABLE controle_f_typos6 FROM postgres;
GRANT ALL ON TABLE controle_f_typos6 TO postgres;
GRANT ALL ON TABLE controle_f_typos6 TO databasename;
GRANT ALL ON TABLE controle_f_typos6 TO superdatabasename;


--
-- Name: controle_ff_angle1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_angle1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_angle1 FROM postgres;
GRANT ALL ON TABLE controle_ff_angle1 TO postgres;
GRANT SELECT ON TABLE controle_ff_angle1 TO databasename;
GRANT ALL ON TABLE controle_ff_angle1 TO superdatabasename;


--
-- Name: controle_ff_angle2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_angle2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_angle2 FROM postgres;
GRANT ALL ON TABLE controle_ff_angle2 TO postgres;
GRANT SELECT ON TABLE controle_ff_angle2 TO databasename;
GRANT ALL ON TABLE controle_ff_angle2 TO superdatabasename;


--
-- Name: controle_ff_aspect1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_aspect1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_aspect1 FROM postgres;
GRANT ALL ON TABLE controle_ff_aspect1 TO postgres;
GRANT SELECT ON TABLE controle_ff_aspect1 TO databasename;
GRANT ALL ON TABLE controle_ff_aspect1 TO superdatabasename;


--
-- Name: controle_ff_aspect2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_aspect2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_aspect2 FROM postgres;
GRANT ALL ON TABLE controle_ff_aspect2 TO postgres;
GRANT SELECT ON TABLE controle_ff_aspect2 TO databasename;
GRANT ALL ON TABLE controle_ff_aspect2 TO superdatabasename;


--
-- Name: controle_ff_localisation1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_localisation1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_localisation1 FROM postgres;
GRANT ALL ON TABLE controle_ff_localisation1 TO postgres;
GRANT SELECT ON TABLE controle_ff_localisation1 TO databasename;
GRANT ALL ON TABLE controle_ff_localisation1 TO superdatabasename;


--
-- Name: controle_ff_localisation2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_localisation2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_localisation2 FROM postgres;
GRANT ALL ON TABLE controle_ff_localisation2 TO postgres;
GRANT SELECT ON TABLE controle_ff_localisation2 TO databasename;
GRANT ALL ON TABLE controle_ff_localisation2 TO superdatabasename;


--
-- Name: controle_ff_morphologie1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_morphologie1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_morphologie1 FROM postgres;
GRANT ALL ON TABLE controle_ff_morphologie1 TO postgres;
GRANT SELECT ON TABLE controle_ff_morphologie1 TO databasename;
GRANT ALL ON TABLE controle_ff_morphologie1 TO superdatabasename;


--
-- Name: controle_ff_morphologie2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_morphologie2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_morphologie2 FROM postgres;
GRANT ALL ON TABLE controle_ff_morphologie2 TO postgres;
GRANT SELECT ON TABLE controle_ff_morphologie2 TO databasename;
GRANT ALL ON TABLE controle_ff_morphologie2 TO superdatabasename;


--
-- Name: controle_ff_non1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_non1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_non1 FROM postgres;
GRANT ALL ON TABLE controle_ff_non1 TO postgres;
GRANT SELECT ON TABLE controle_ff_non1 TO databasename;
GRANT ALL ON TABLE controle_ff_non1 TO superdatabasename;


--
-- Name: controle_ff_non2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_non2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_non2 FROM postgres;
GRANT ALL ON TABLE controle_ff_non2 TO postgres;
GRANT SELECT ON TABLE controle_ff_non2 TO databasename;
GRANT ALL ON TABLE controle_ff_non2 TO superdatabasename;


--
-- Name: controle_ff_profil1; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_profil1 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_profil1 FROM postgres;
GRANT ALL ON TABLE controle_ff_profil1 TO postgres;
GRANT SELECT ON TABLE controle_ff_profil1 TO databasename;
GRANT ALL ON TABLE controle_ff_profil1 TO superdatabasename;


--
-- Name: controle_ff_profil2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ff_profil2 FROM PUBLIC;
REVOKE ALL ON TABLE controle_ff_profil2 FROM postgres;
GRANT ALL ON TABLE controle_ff_profil2 TO postgres;
GRANT SELECT ON TABLE controle_ff_profil2 TO databasename;
GRANT ALL ON TABLE controle_ff_profil2 TO superdatabasename;


--
-- Name: controle_fi_mode; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_mode FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_mode FROM postgres;
GRANT ALL ON TABLE controle_fi_mode TO postgres;
GRANT SELECT ON TABLE controle_fi_mode TO databasename;
GRANT ALL ON TABLE controle_fi_mode TO superdatabasename;


--
-- Name: controle_fi_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_ordre FROM postgres;
GRANT ALL ON TABLE controle_fi_ordre TO postgres;
GRANT SELECT ON TABLE controle_fi_ordre TO databasename;
GRANT ALL ON TABLE controle_fi_ordre TO superdatabasename;


--
-- Name: controle_fi_percussion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_percussion FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_percussion FROM postgres;
GRANT ALL ON TABLE controle_fi_percussion TO postgres;
GRANT SELECT ON TABLE controle_fi_percussion TO databasename;
GRANT ALL ON TABLE controle_fi_percussion TO superdatabasename;


--
-- Name: controle_fi_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_fi_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_fi_type FROM postgres;
GRANT ALL ON TABLE controle_fi_type TO postgres;
GRANT SELECT ON TABLE controle_fi_type TO databasename;
GRANT ALL ON TABLE controle_fi_type TO superdatabasename;


--
-- Name: controle_ga_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_arete FROM postgres;
GRANT ALL ON TABLE controle_ga_arete TO postgres;
GRANT SELECT ON TABLE controle_ga_arete TO databasename;
GRANT ALL ON TABLE controle_ga_arete TO superdatabasename;


--
-- Name: controle_ga_chf; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_chf FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_chf FROM postgres;
GRANT ALL ON TABLE controle_ga_chf TO postgres;
GRANT SELECT ON TABLE controle_ga_chf TO databasename;
GRANT ALL ON TABLE controle_ga_chf TO superdatabasename;


--
-- Name: controle_ga_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_facture FROM postgres;
GRANT ALL ON TABLE controle_ga_facture TO postgres;
GRANT SELECT ON TABLE controle_ga_facture TO databasename;
GRANT ALL ON TABLE controle_ga_facture TO superdatabasename;


--
-- Name: controle_ga_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_forme FROM postgres;
GRANT ALL ON TABLE controle_ga_forme TO postgres;
GRANT SELECT ON TABLE controle_ga_forme TO databasename;
GRANT ALL ON TABLE controle_ga_forme TO superdatabasename;


--
-- Name: controle_ga_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_obliquite FROM postgres;
GRANT ALL ON TABLE controle_ga_obliquite TO postgres;
GRANT SELECT ON TABLE controle_ga_obliquite TO databasename;
GRANT ALL ON TABLE controle_ga_obliquite TO superdatabasename;


--
-- Name: controle_ga_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_orientation FROM postgres;
GRANT ALL ON TABLE controle_ga_orientation TO postgres;
GRANT SELECT ON TABLE controle_ga_orientation TO databasename;
GRANT ALL ON TABLE controle_ga_orientation TO superdatabasename;


--
-- Name: controle_ga_qualite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_qualite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_qualite FROM postgres;
GRANT ALL ON TABLE controle_ga_qualite TO postgres;
GRANT SELECT ON TABLE controle_ga_qualite TO databasename;
GRANT ALL ON TABLE controle_ga_qualite TO superdatabasename;


--
-- Name: controle_ga_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_retouche FROM postgres;
GRANT ALL ON TABLE controle_ga_retouche TO postgres;
GRANT SELECT ON TABLE controle_ga_retouche TO databasename;
GRANT ALL ON TABLE controle_ga_retouche TO superdatabasename;


--
-- Name: controle_ga_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ga_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_ga_type FROM postgres;
GRANT ALL ON TABLE controle_ga_type TO postgres;
GRANT SELECT ON TABLE controle_ga_type TO databasename;
GRANT ALL ON TABLE controle_ga_type TO superdatabasename;


--
-- Name: controle_h_amenagement_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_amenagement_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_amenagement_bord FROM postgres;
GRANT ALL ON TABLE controle_h_amenagement_bord TO postgres;
GRANT SELECT ON TABLE controle_h_amenagement_bord TO databasename;
GRANT ALL ON TABLE controle_h_amenagement_bord TO superdatabasename;


--
-- Name: controle_h_amenagement_distal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_amenagement_distal FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_amenagement_distal FROM postgres;
GRANT ALL ON TABLE controle_h_amenagement_distal TO postgres;
GRANT SELECT ON TABLE controle_h_amenagement_distal TO databasename;
GRANT ALL ON TABLE controle_h_amenagement_distal TO superdatabasename;


--
-- Name: controle_h_arete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_arete FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_arete FROM postgres;
GRANT ALL ON TABLE controle_h_arete TO postgres;
GRANT SELECT ON TABLE controle_h_arete TO databasename;
GRANT ALL ON TABLE controle_h_arete TO superdatabasename;


--
-- Name: controle_h_base; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_base FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_base FROM postgres;
GRANT ALL ON TABLE controle_h_base TO postgres;
GRANT SELECT ON TABLE controle_h_base TO databasename;
GRANT ALL ON TABLE controle_h_base TO superdatabasename;


--
-- Name: controle_h_bilaterale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_bilaterale FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_bilaterale FROM postgres;
GRANT ALL ON TABLE controle_h_bilaterale TO postgres;
GRANT SELECT ON TABLE controle_h_bilaterale TO databasename;
GRANT ALL ON TABLE controle_h_bilaterale TO superdatabasename;


--
-- Name: controle_h_biseau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_biseau FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_biseau FROM postgres;
GRANT ALL ON TABLE controle_h_biseau TO postgres;
GRANT SELECT ON TABLE controle_h_biseau TO databasename;
GRANT ALL ON TABLE controle_h_biseau TO superdatabasename;


--
-- Name: controle_h_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_bord FROM postgres;
GRANT ALL ON TABLE controle_h_bord TO postgres;
GRANT SELECT ON TABLE controle_h_bord TO databasename;
GRANT ALL ON TABLE controle_h_bord TO superdatabasename;


--
-- Name: controle_h_distale; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_distale FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_distale FROM postgres;
GRANT ALL ON TABLE controle_h_distale TO postgres;
GRANT SELECT ON TABLE controle_h_distale TO databasename;
GRANT ALL ON TABLE controle_h_distale TO superdatabasename;


--
-- Name: controle_h_extension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_extension FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_extension FROM postgres;
GRANT ALL ON TABLE controle_h_extension TO postgres;
GRANT SELECT ON TABLE controle_h_extension TO databasename;
GRANT ALL ON TABLE controle_h_extension TO superdatabasename;


--
-- Name: controle_h_facture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_facture FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_facture FROM postgres;
GRANT ALL ON TABLE controle_h_facture TO postgres;
GRANT SELECT ON TABLE controle_h_facture TO databasename;
GRANT ALL ON TABLE controle_h_facture TO superdatabasename;


--
-- Name: controle_h_meplat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_meplat FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_meplat FROM postgres;
GRANT ALL ON TABLE controle_h_meplat TO postgres;
GRANT SELECT ON TABLE controle_h_meplat TO databasename;
GRANT ALL ON TABLE controle_h_meplat TO superdatabasename;


--
-- Name: controle_h_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_retouche FROM postgres;
GRANT ALL ON TABLE controle_h_retouche TO postgres;
GRANT SELECT ON TABLE controle_h_retouche TO databasename;
GRANT ALL ON TABLE controle_h_retouche TO superdatabasename;


--
-- Name: controle_h_surface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_surface FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_surface FROM postgres;
GRANT ALL ON TABLE controle_h_surface TO postgres;
GRANT SELECT ON TABLE controle_h_surface TO databasename;
GRANT ALL ON TABLE controle_h_surface TO superdatabasename;


--
-- Name: controle_h_symetrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_h_symetrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_h_symetrie FROM postgres;
GRANT ALL ON TABLE controle_h_symetrie TO postgres;
GRANT SELECT ON TABLE controle_h_symetrie TO databasename;
GRANT ALL ON TABLE controle_h_symetrie TO superdatabasename;


--
-- Name: controle_i_action; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_action FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_action FROM postgres;
GRANT ALL ON TABLE controle_i_action TO postgres;
GRANT SELECT ON TABLE controle_i_action TO databasename;
GRANT ALL ON TABLE controle_i_action TO superdatabasename;


--
-- Name: controle_i_alteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_alteration FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_alteration FROM postgres;
GRANT ALL ON TABLE controle_i_alteration TO postgres;
GRANT SELECT ON TABLE controle_i_alteration TO databasename;
GRANT ALL ON TABLE controle_i_alteration TO superdatabasename;


--
-- Name: controle_i_desilicification; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_desilicification FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_desilicification FROM postgres;
GRANT ALL ON TABLE controle_i_desilicification TO postgres;
GRANT SELECT ON TABLE controle_i_desilicification TO databasename;
GRANT ALL ON TABLE controle_i_desilicification TO superdatabasename;


--
-- Name: controle_i_dpatine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_dpatine FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_dpatine FROM postgres;
GRANT ALL ON TABLE controle_i_dpatine TO postgres;
GRANT SELECT ON TABLE controle_i_dpatine TO databasename;
GRANT ALL ON TABLE controle_i_dpatine TO superdatabasename;


--
-- Name: controle_i_encroutement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_encroutement FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_encroutement FROM postgres;
GRANT ALL ON TABLE controle_i_encroutement TO postgres;
GRANT SELECT ON TABLE controle_i_encroutement TO databasename;
GRANT ALL ON TABLE controle_i_encroutement TO superdatabasename;


--
-- Name: controle_i_eolisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_eolisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_eolisation FROM postgres;
GRANT ALL ON TABLE controle_i_eolisation TO postgres;
GRANT SELECT ON TABLE controle_i_eolisation TO databasename;
GRANT ALL ON TABLE controle_i_eolisation TO superdatabasename;


--
-- Name: controle_i_forme_galet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_forme_galet FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_forme_galet FROM postgres;
GRANT ALL ON TABLE controle_i_forme_galet TO postgres;
GRANT SELECT ON TABLE controle_i_forme_galet TO databasename;
GRANT ALL ON TABLE controle_i_forme_galet TO superdatabasename;


--
-- Name: controle_i_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_lustrage FROM postgres;
GRANT ALL ON TABLE controle_i_lustrage TO postgres;
GRANT SELECT ON TABLE controle_i_lustrage TO databasename;
GRANT ALL ON TABLE controle_i_lustrage TO superdatabasename;


--
-- Name: controle_i_matiere; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_matiere FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_matiere FROM postgres;
GRANT ALL ON TABLE controle_i_matiere TO postgres;
GRANT SELECT ON TABLE controle_i_matiere TO databasename;
GRANT ALL ON TABLE controle_i_matiere TO superdatabasename;


--
-- Name: controle_i_objet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_objet FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_objet FROM postgres;
GRANT ALL ON TABLE controle_i_objet TO postgres;
GRANT SELECT ON TABLE controle_i_objet TO databasename;
GRANT ALL ON TABLE controle_i_objet TO superdatabasename;


--
-- Name: controle_i_patine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_patine FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_patine FROM postgres;
GRANT ALL ON TABLE controle_i_patine TO postgres;
GRANT SELECT ON TABLE controle_i_patine TO databasename;
GRANT ALL ON TABLE controle_i_patine TO superdatabasename;


--
-- Name: controle_i_pmycellium; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_pmycellium FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_pmycellium FROM postgres;
GRANT ALL ON TABLE controle_i_pmycellium TO postgres;
GRANT SELECT ON TABLE controle_i_pmycellium TO databasename;
GRANT ALL ON TABLE controle_i_pmycellium TO superdatabasename;


--
-- Name: controle_i_responsable; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_responsable FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_responsable FROM postgres;
GRANT ALL ON TABLE controle_i_responsable TO postgres;
GRANT SELECT ON TABLE controle_i_responsable TO databasename;
GRANT ALL ON TABLE controle_i_responsable TO superdatabasename;


--
-- Name: controle_i_roulage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_roulage FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_roulage FROM postgres;
GRANT ALL ON TABLE controle_i_roulage TO postgres;
GRANT SELECT ON TABLE controle_i_roulage TO databasename;
GRANT ALL ON TABLE controle_i_roulage TO superdatabasename;


--
-- Name: controle_i_support; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_support FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_support FROM postgres;
GRANT ALL ON TABLE controle_i_support TO postgres;
GRANT SELECT ON TABLE controle_i_support TO databasename;
GRANT ALL ON TABLE controle_i_support TO superdatabasename;


--
-- Name: controle_i_support_originel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_i_support_originel FROM PUBLIC;
REVOKE ALL ON TABLE controle_i_support_originel FROM postgres;
GRANT ALL ON TABLE controle_i_support_originel TO postgres;
GRANT SELECT ON TABLE controle_i_support_originel TO databasename;
GRANT ALL ON TABLE controle_i_support_originel TO superdatabasename;


--
-- Name: controle_localite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_localite FROM PUBLIC;
REVOKE ALL ON TABLE controle_localite FROM postgres;
GRANT ALL ON TABLE controle_localite TO postgres;
GRANT SELECT ON TABLE controle_localite TO databasename;
GRANT ALL ON TABLE controle_localite TO superdatabasename;


--
-- Name: controle_locus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_locus FROM PUBLIC;
REVOKE ALL ON TABLE controle_locus FROM postgres;
GRANT ALL ON TABLE controle_locus TO postgres;
GRANT SELECT ON TABLE controle_locus TO databasename;
GRANT ALL ON TABLE controle_locus TO superdatabasename;


--
-- Name: controle_mf_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_mf_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_mf_serie FROM postgres;
GRANT ALL ON TABLE controle_mf_serie TO postgres;
GRANT SELECT ON TABLE controle_mf_serie TO databasename;
GRANT ALL ON TABLE controle_mf_serie TO superdatabasename;


--
-- Name: controle_mf_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_mf_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_mf_type FROM postgres;
GRANT ALL ON TABLE controle_mf_type TO postgres;
GRANT SELECT ON TABLE controle_mf_type TO databasename;
GRANT ALL ON TABLE controle_mf_type TO superdatabasename;


--
-- Name: controle_n_cortotal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_cortotal FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_cortotal FROM postgres;
GRANT ALL ON TABLE controle_n_cortotal TO postgres;
GRANT SELECT ON TABLE controle_n_cortotal TO databasename;
GRANT ALL ON TABLE controle_n_cortotal TO superdatabasename;


--
-- Name: controle_n_epuisement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_epuisement FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_epuisement FROM postgres;
GRANT ALL ON TABLE controle_n_epuisement TO postgres;
GRANT ALL ON TABLE controle_n_epuisement TO databasename;
GRANT ALL ON TABLE controle_n_epuisement TO superdatabasename;
GRANT SELECT ON TABLE controle_n_epuisement TO visiteurdatabasename;


--
-- Name: controle_n_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_forme FROM postgres;
GRANT ALL ON TABLE controle_n_forme TO postgres;
GRANT SELECT ON TABLE controle_n_forme TO databasename;
GRANT ALL ON TABLE controle_n_forme TO superdatabasename;


--
-- Name: controle_n_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_orientation FROM postgres;
GRANT ALL ON TABLE controle_n_orientation TO postgres;
GRANT SELECT ON TABLE controle_n_orientation TO databasename;
GRANT ALL ON TABLE controle_n_orientation TO superdatabasename;


--
-- Name: controle_n_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_n_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_n_type FROM postgres;
GRANT ALL ON TABLE controle_n_type TO postgres;
GRANT SELECT ON TABLE controle_n_type TO databasename;
GRANT ALL ON TABLE controle_n_type TO superdatabasename;


--
-- Name: controle_nature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_nature FROM PUBLIC;
REVOKE ALL ON TABLE controle_nature FROM postgres;
GRANT ALL ON TABLE controle_nature TO postgres;
GRANT SELECT ON TABLE controle_nature TO databasename;
GRANT ALL ON TABLE controle_nature TO superdatabasename;


--
-- Name: controle_niveau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_niveau FROM PUBLIC;
REVOKE ALL ON TABLE controle_niveau FROM postgres;
GRANT ALL ON TABLE controle_niveau TO postgres;
GRANT SELECT ON TABLE controle_niveau TO databasename;
GRANT ALL ON TABLE controle_niveau TO superdatabasename;


--
-- Name: controle_o_chronologie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_chronologie FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_chronologie FROM postgres;
GRANT ALL ON TABLE controle_o_chronologie TO postgres;
GRANT SELECT ON TABLE controle_o_chronologie TO databasename;
GRANT ALL ON TABLE controle_o_chronologie TO superdatabasename;


--
-- Name: controle_o_code; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_code FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_code FROM postgres;
GRANT ALL ON TABLE controle_o_code TO postgres;
GRANT SELECT ON TABLE controle_o_code TO databasename;
GRANT ALL ON TABLE controle_o_code TO superdatabasename;


--
-- Name: controle_o_destination; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_destination FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_destination FROM postgres;
GRANT ALL ON TABLE controle_o_destination TO postgres;
GRANT SELECT ON TABLE controle_o_destination TO databasename;
GRANT ALL ON TABLE controle_o_destination TO superdatabasename;


--
-- Name: controle_o_etat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_etat FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_etat FROM postgres;
GRANT ALL ON TABLE controle_o_etat TO postgres;
GRANT SELECT ON TABLE controle_o_etat TO databasename;
GRANT ALL ON TABLE controle_o_etat TO superdatabasename;


--
-- Name: controle_o_forme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_forme FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_forme FROM postgres;
GRANT ALL ON TABLE controle_o_forme TO postgres;
GRANT SELECT ON TABLE controle_o_forme TO databasename;
GRANT ALL ON TABLE controle_o_forme TO superdatabasename;


--
-- Name: controle_o_localisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_localisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_localisation FROM postgres;
GRANT ALL ON TABLE controle_o_localisation TO postgres;
GRANT SELECT ON TABLE controle_o_localisation TO databasename;
GRANT ALL ON TABLE controle_o_localisation TO superdatabasename;


--
-- Name: controle_o_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_ordre FROM postgres;
GRANT ALL ON TABLE controle_o_ordre TO postgres;
GRANT SELECT ON TABLE controle_o_ordre TO databasename;
GRANT ALL ON TABLE controle_o_ordre TO superdatabasename;


--
-- Name: controle_o_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_orientation FROM postgres;
GRANT ALL ON TABLE controle_o_orientation TO postgres;
GRANT SELECT ON TABLE controle_o_orientation TO databasename;
GRANT ALL ON TABLE controle_o_orientation TO superdatabasename;


--
-- Name: controle_o_origine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_origine FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_origine FROM postgres;
GRANT ALL ON TABLE controle_o_origine TO postgres;
GRANT SELECT ON TABLE controle_o_origine TO databasename;
GRANT ALL ON TABLE controle_o_origine TO superdatabasename;


--
-- Name: controle_o_retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_retouche FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_retouche FROM postgres;
GRANT ALL ON TABLE controle_o_retouche TO postgres;
GRANT SELECT ON TABLE controle_o_retouche TO databasename;
GRANT ALL ON TABLE controle_o_retouche TO superdatabasename;


--
-- Name: controle_o_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_sens FROM postgres;
GRANT ALL ON TABLE controle_o_sens TO postgres;
GRANT SELECT ON TABLE controle_o_sens TO databasename;
GRANT ALL ON TABLE controle_o_sens TO superdatabasename;


--
-- Name: controle_o_serie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_o_serie FROM PUBLIC;
REVOKE ALL ON TABLE controle_o_serie FROM postgres;
GRANT ALL ON TABLE controle_o_serie TO postgres;
GRANT SELECT ON TABLE controle_o_serie TO databasename;
GRANT ALL ON TABLE controle_o_serie TO superdatabasename;


--
-- Name: controle_orientation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_orientation FROM PUBLIC;
REVOKE ALL ON TABLE controle_orientation FROM postgres;
GRANT ALL ON TABLE controle_orientation TO postgres;
GRANT SELECT ON TABLE controle_orientation TO databasename;
GRANT ALL ON TABLE controle_orientation TO superdatabasename;


--
-- Name: controle_pendage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_pendage FROM PUBLIC;
REVOKE ALL ON TABLE controle_pendage FROM postgres;
GRANT ALL ON TABLE controle_pendage TO postgres;
GRANT SELECT ON TABLE controle_pendage TO databasename;
GRANT ALL ON TABLE controle_pendage TO superdatabasename;


--
-- Name: controle_r_association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_association FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_association FROM postgres;
GRANT ALL ON TABLE controle_r_association TO postgres;
GRANT SELECT ON TABLE controle_r_association TO databasename;
GRANT ALL ON TABLE controle_r_association TO superdatabasename;


--
-- Name: controle_r_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_bord FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_bord FROM postgres;
GRANT ALL ON TABLE controle_r_bord TO postgres;
GRANT SELECT ON TABLE controle_r_bord TO databasename;
GRANT ALL ON TABLE controle_r_bord TO superdatabasename;


--
-- Name: controle_r_cas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_cas FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_cas FROM postgres;
GRANT ALL ON TABLE controle_r_cas TO postgres;
GRANT SELECT ON TABLE controle_r_cas TO databasename;
GRANT ALL ON TABLE controle_r_cas TO superdatabasename;


--
-- Name: controle_r_denticulation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_denticulation FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_denticulation FROM postgres;
GRANT ALL ON TABLE controle_r_denticulation TO postgres;
GRANT SELECT ON TABLE controle_r_denticulation TO databasename;
GRANT ALL ON TABLE controle_r_denticulation TO superdatabasename;


--
-- Name: controle_r_destination; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_destination FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_destination FROM postgres;
GRANT ALL ON TABLE controle_r_destination TO postgres;
GRANT SELECT ON TABLE controle_r_destination TO databasename;
GRANT ALL ON TABLE controle_r_destination TO superdatabasename;


--
-- Name: controle_r_dimension; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_dimension FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_dimension FROM postgres;
GRANT ALL ON TABLE controle_r_dimension TO postgres;
GRANT SELECT ON TABLE controle_r_dimension TO databasename;
GRANT ALL ON TABLE controle_r_dimension TO superdatabasename;


--
-- Name: controle_r_ecrasement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_ecrasement FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_ecrasement FROM postgres;
GRANT ALL ON TABLE controle_r_ecrasement TO postgres;
GRANT SELECT ON TABLE controle_r_ecrasement TO databasename;
GRANT ALL ON TABLE controle_r_ecrasement TO superdatabasename;


--
-- Name: controle_r_extremite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_extremite FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_extremite FROM postgres;
GRANT ALL ON TABLE controle_r_extremite TO postgres;
GRANT SELECT ON TABLE controle_r_extremite TO databasename;
GRANT ALL ON TABLE controle_r_extremite TO superdatabasename;


--
-- Name: controle_r_frequence; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_frequence FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_frequence FROM postgres;
GRANT ALL ON TABLE controle_r_frequence TO postgres;
GRANT SELECT ON TABLE controle_r_frequence TO databasename;
GRANT ALL ON TABLE controle_r_frequence TO superdatabasename;


--
-- Name: controle_r_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_lustrage FROM postgres;
GRANT ALL ON TABLE controle_r_lustrage TO postgres;
GRANT SELECT ON TABLE controle_r_lustrage TO databasename;
GRANT ALL ON TABLE controle_r_lustrage TO superdatabasename;


--
-- Name: controle_r_obliquite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_obliquite FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_obliquite FROM postgres;
GRANT ALL ON TABLE controle_r_obliquite TO postgres;
GRANT SELECT ON TABLE controle_r_obliquite TO databasename;
GRANT ALL ON TABLE controle_r_obliquite TO superdatabasename;


--
-- Name: controle_r_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_ordre FROM postgres;
GRANT ALL ON TABLE controle_r_ordre TO postgres;
GRANT SELECT ON TABLE controle_r_ordre TO databasename;
GRANT ALL ON TABLE controle_r_ordre TO superdatabasename;


--
-- Name: controle_r_origine; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_origine FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_origine FROM postgres;
GRANT ALL ON TABLE controle_r_origine TO postgres;
GRANT SELECT ON TABLE controle_r_origine TO databasename;
GRANT ALL ON TABLE controle_r_origine TO superdatabasename;


--
-- Name: controle_r_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_sens FROM postgres;
GRANT ALL ON TABLE controle_r_sens TO postgres;
GRANT SELECT ON TABLE controle_r_sens TO databasename;
GRANT ALL ON TABLE controle_r_sens TO superdatabasename;


--
-- Name: controle_r_strie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_strie FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_strie FROM postgres;
GRANT ALL ON TABLE controle_r_strie TO postgres;
GRANT SELECT ON TABLE controle_r_strie TO databasename;
GRANT ALL ON TABLE controle_r_strie TO superdatabasename;


--
-- Name: controle_r_superposition; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_superposition FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_superposition FROM postgres;
GRANT ALL ON TABLE controle_r_superposition TO postgres;
GRANT SELECT ON TABLE controle_r_superposition TO databasename;
GRANT ALL ON TABLE controle_r_superposition TO superdatabasename;


--
-- Name: controle_r_tranchant; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_tranchant FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_tranchant FROM postgres;
GRANT ALL ON TABLE controle_r_tranchant TO postgres;
GRANT SELECT ON TABLE controle_r_tranchant TO databasename;
GRANT ALL ON TABLE controle_r_tranchant TO superdatabasename;


--
-- Name: controle_r_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_type FROM postgres;
GRANT ALL ON TABLE controle_r_type TO postgres;
GRANT SELECT ON TABLE controle_r_type TO databasename;
GRANT ALL ON TABLE controle_r_type TO superdatabasename;


--
-- Name: controle_r_utilisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_r_utilisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_r_utilisation FROM postgres;
GRANT ALL ON TABLE controle_r_utilisation TO postgres;
GRANT SELECT ON TABLE controle_r_utilisation TO databasename;
GRANT ALL ON TABLE controle_r_utilisation TO superdatabasename;


--
-- Name: controle_responsable_fouille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_responsable_fouille FROM PUBLIC;
REVOKE ALL ON TABLE controle_responsable_fouille FROM postgres;
GRANT ALL ON TABLE controle_responsable_fouille TO postgres;
GRANT SELECT ON TABLE controle_responsable_fouille TO databasename;
GRANT ALL ON TABLE controle_responsable_fouille TO superdatabasename;
GRANT ALL ON TABLE controle_responsable_fouille TO superchoukoutien;
GRANT SELECT ON TABLE controle_responsable_fouille TO choukoutien;
GRANT SELECT ON TABLE controle_responsable_fouille TO visiteurchoukoutien;


--
-- Name: controle_s_localisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_localisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_localisation FROM postgres;
GRANT ALL ON TABLE controle_s_localisation TO postgres;
GRANT SELECT ON TABLE controle_s_localisation TO databasename;
GRANT ALL ON TABLE controle_s_localisation TO superdatabasename;


--
-- Name: controle_s_lustrage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_lustrage FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_lustrage FROM postgres;
GRANT ALL ON TABLE controle_s_lustrage TO postgres;
GRANT SELECT ON TABLE controle_s_lustrage TO databasename;
GRANT ALL ON TABLE controle_s_lustrage TO superdatabasename;


--
-- Name: controle_s_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_ordre FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_ordre FROM postgres;
GRANT ALL ON TABLE controle_s_ordre TO postgres;
GRANT SELECT ON TABLE controle_s_ordre TO databasename;
GRANT ALL ON TABLE controle_s_ordre TO superdatabasename;


--
-- Name: controle_s_polissage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_polissage FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_polissage FROM postgres;
GRANT ALL ON TABLE controle_s_polissage TO postgres;
GRANT SELECT ON TABLE controle_s_polissage TO databasename;
GRANT ALL ON TABLE controle_s_polissage TO superdatabasename;


--
-- Name: controle_s_relation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_relation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_relation FROM postgres;
GRANT ALL ON TABLE controle_s_relation TO postgres;
GRANT SELECT ON TABLE controle_s_relation TO databasename;
GRANT ALL ON TABLE controle_s_relation TO superdatabasename;


--
-- Name: controle_s_situation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_situation FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_situation FROM postgres;
GRANT ALL ON TABLE controle_s_situation TO postgres;
GRANT SELECT ON TABLE controle_s_situation TO databasename;
GRANT ALL ON TABLE controle_s_situation TO superdatabasename;


--
-- Name: controle_s_sous_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_sous_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_sous_type FROM postgres;
GRANT ALL ON TABLE controle_s_sous_type TO postgres;
GRANT SELECT ON TABLE controle_s_sous_type TO databasename;
GRANT ALL ON TABLE controle_s_sous_type TO superdatabasename;


--
-- Name: controle_s_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_s_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_s_type FROM postgres;
GRANT ALL ON TABLE controle_s_type TO postgres;
GRANT SELECT ON TABLE controle_s_type TO databasename;
GRANT ALL ON TABLE controle_s_type TO superdatabasename;


--
-- Name: controle_sol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_sol FROM PUBLIC;
REVOKE ALL ON TABLE controle_sol FROM postgres;
GRANT ALL ON TABLE controle_sol TO postgres;
GRANT SELECT ON TABLE controle_sol TO databasename;
GRANT ALL ON TABLE controle_sol TO superdatabasename;


--
-- Name: controle_souscarre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_souscarre FROM PUBLIC;
REVOKE ALL ON TABLE controle_souscarre FROM postgres;
GRANT ALL ON TABLE controle_souscarre TO postgres;
GRANT SELECT ON TABLE controle_souscarre TO databasename;
GRANT ALL ON TABLE controle_souscarre TO superdatabasename;


--
-- Name: controle_t_agent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_agent FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_agent FROM postgres;
GRANT ALL ON TABLE controle_t_agent TO postgres;
GRANT SELECT ON TABLE controle_t_agent TO databasename;
GRANT ALL ON TABLE controle_t_agent TO superdatabasename;


--
-- Name: controle_t_allure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_allure FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_allure FROM postgres;
GRANT ALL ON TABLE controle_t_allure TO postgres;
GRANT SELECT ON TABLE controle_t_allure TO databasename;
GRANT ALL ON TABLE controle_t_allure TO superdatabasename;


--
-- Name: controle_t_classe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_classe FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_classe FROM postgres;
GRANT ALL ON TABLE controle_t_classe TO postgres;
GRANT SELECT ON TABLE controle_t_classe TO databasename;
GRANT ALL ON TABLE controle_t_classe TO superdatabasename;


--
-- Name: controle_t_dessin; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_dessin FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_dessin FROM postgres;
GRANT ALL ON TABLE controle_t_dessin TO postgres;
GRANT SELECT ON TABLE controle_t_dessin TO databasename;
GRANT ALL ON TABLE controle_t_dessin TO superdatabasename;


--
-- Name: controle_t_direction; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_direction FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_direction FROM postgres;
GRANT ALL ON TABLE controle_t_direction TO postgres;
GRANT SELECT ON TABLE controle_t_direction TO databasename;
GRANT ALL ON TABLE controle_t_direction TO superdatabasename;


--
-- Name: controle_t_dstrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_dstrie FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_dstrie FROM postgres;
GRANT ALL ON TABLE controle_t_dstrie TO postgres;
GRANT SELECT ON TABLE controle_t_dstrie TO databasename;
GRANT ALL ON TABLE controle_t_dstrie TO superdatabasename;


--
-- Name: controle_t_ensemble; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_ensemble FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_ensemble FROM postgres;
GRANT ALL ON TABLE controle_t_ensemble TO postgres;
GRANT SELECT ON TABLE controle_t_ensemble TO databasename;
GRANT ALL ON TABLE controle_t_ensemble TO superdatabasename;


--
-- Name: controle_t_largeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_largeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_largeur FROM postgres;
GRANT ALL ON TABLE controle_t_largeur TO postgres;
GRANT SELECT ON TABLE controle_t_largeur TO databasename;
GRANT ALL ON TABLE controle_t_largeur TO superdatabasename;


--
-- Name: controle_t_locmusc; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_locmusc FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_locmusc FROM postgres;
GRANT ALL ON TABLE controle_t_locmusc TO postgres;
GRANT SELECT ON TABLE controle_t_locmusc TO databasename;
GRANT ALL ON TABLE controle_t_locmusc TO superdatabasename;


--
-- Name: controle_t_nature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_nature FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_nature FROM postgres;
GRANT ALL ON TABLE controle_t_nature TO postgres;
GRANT SELECT ON TABLE controle_t_nature TO databasename;
GRANT ALL ON TABLE controle_t_nature TO superdatabasename;


--
-- Name: controle_t_phenomene; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_phenomene FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_phenomene FROM postgres;
GRANT ALL ON TABLE controle_t_phenomene TO postgres;
GRANT SELECT ON TABLE controle_t_phenomene TO databasename;
GRANT ALL ON TABLE controle_t_phenomene TO superdatabasename;


--
-- Name: controle_t_photo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_photo FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_photo FROM postgres;
GRANT ALL ON TABLE controle_t_photo TO postgres;
GRANT SELECT ON TABLE controle_t_photo TO databasename;
GRANT ALL ON TABLE controle_t_photo TO superdatabasename;


--
-- Name: controle_t_profondeur; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_profondeur FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_profondeur FROM postgres;
GRANT ALL ON TABLE controle_t_profondeur TO postgres;
GRANT SELECT ON TABLE controle_t_profondeur TO databasename;
GRANT ALL ON TABLE controle_t_profondeur TO superdatabasename;


--
-- Name: controle_t_replique; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_replique FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_replique FROM postgres;
GRANT ALL ON TABLE controle_t_replique TO postgres;
GRANT SELECT ON TABLE controle_t_replique TO databasename;
GRANT ALL ON TABLE controle_t_replique TO superdatabasename;


--
-- Name: controle_t_section; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_section FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_section FROM postgres;
GRANT ALL ON TABLE controle_t_section TO postgres;
GRANT SELECT ON TABLE controle_t_section TO databasename;
GRANT ALL ON TABLE controle_t_section TO superdatabasename;


--
-- Name: controle_t_sens; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_sens FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_sens FROM postgres;
GRANT ALL ON TABLE controle_t_sens TO postgres;
GRANT SELECT ON TABLE controle_t_sens TO databasename;
GRANT ALL ON TABLE controle_t_sens TO superdatabasename;


--
-- Name: controle_t_trace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_t_trace FROM PUBLIC;
REVOKE ALL ON TABLE controle_t_trace FROM postgres;
GRANT ALL ON TABLE controle_t_trace TO postgres;
GRANT SELECT ON TABLE controle_t_trace TO databasename;
GRANT ALL ON TABLE controle_t_trace TO superdatabasename;


--
-- Name: controle_ud_fragmentation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_fragmentation FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_fragmentation FROM postgres;
GRANT ALL ON TABLE controle_ud_fragmentation TO postgres;
GRANT ALL ON TABLE controle_ud_fragmentation TO databasename;
GRANT ALL ON TABLE controle_ud_fragmentation TO superdatabasename;


--
-- Name: controle_ud_lateralite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_lateralite FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_lateralite FROM postgres;
GRANT ALL ON TABLE controle_ud_lateralite TO postgres;
GRANT ALL ON TABLE controle_ud_lateralite TO databasename;
GRANT ALL ON TABLE controle_ud_lateralite TO superdatabasename;


--
-- Name: controle_ud_type; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_type FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_type FROM postgres;
GRANT ALL ON TABLE controle_ud_type TO postgres;
GRANT ALL ON TABLE controle_ud_type TO databasename;
GRANT ALL ON TABLE controle_ud_type TO superdatabasename;


--
-- Name: controle_ud_usure; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_ud_usure FROM PUBLIC;
REVOKE ALL ON TABLE controle_ud_usure FROM postgres;
GRANT ALL ON TABLE controle_ud_usure TO postgres;
GRANT ALL ON TABLE controle_ud_usure TO databasename;
GRANT ALL ON TABLE controle_ud_usure TO superdatabasename;


--
-- Name: controle_vers; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_vers FROM PUBLIC;
REVOKE ALL ON TABLE controle_vers FROM postgres;
GRANT ALL ON TABLE controle_vers TO postgres;
GRANT SELECT ON TABLE controle_vers TO databasename;
GRANT ALL ON TABLE controle_vers TO superdatabasename;


--
-- Name: controle_zone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_zone FROM PUBLIC;
REVOKE ALL ON TABLE controle_zone FROM postgres;
GRANT ALL ON TABLE controle_zone TO postgres;
GRANT SELECT ON TABLE controle_zone TO databasename;
GRANT ALL ON TABLE controle_zone TO superdatabasename;


--
-- Name: dent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE dent FROM PUBLIC;
REVOKE ALL ON TABLE dent FROM postgres;
GRANT ALL ON TABLE dent TO postgres;
GRANT ALL ON TABLE dent TO databasename;
GRANT ALL ON TABLE dent TO superdatabasename;


--
-- Name: eclat; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE eclat FROM PUBLIC;
REVOKE ALL ON TABLE eclat FROM postgres;
GRANT ALL ON TABLE eclat TO postgres;
GRANT ALL ON TABLE eclat TO databasename;
GRANT ALL ON TABLE eclat TO superdatabasename;


--
-- Name: enlevement_biface; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_biface FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_biface FROM postgres;
GRANT ALL ON TABLE enlevement_biface TO postgres;
GRANT SELECT ON TABLE enlevement_biface TO PUBLIC;
GRANT ALL ON TABLE enlevement_biface TO databasename;
GRANT ALL ON TABLE enlevement_biface TO superdatabasename;


--
-- Name: enlevement_galet; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_galet FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_galet FROM postgres;
GRANT ALL ON TABLE enlevement_galet TO postgres;
GRANT ALL ON TABLE enlevement_galet TO databasename;
GRANT ALL ON TABLE enlevement_galet TO superdatabasename;
GRANT SELECT ON TABLE enlevement_galet TO visiteurdatabasename;


--
-- Name: enlevement_nucleus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE enlevement_nucleus FROM PUBLIC;
REVOKE ALL ON TABLE enlevement_nucleus FROM postgres;
GRANT ALL ON TABLE enlevement_nucleus TO postgres;
GRANT ALL ON TABLE enlevement_nucleus TO databasename;
GRANT ALL ON TABLE enlevement_nucleus TO superdatabasename;
GRANT SELECT ON TABLE enlevement_nucleus TO visiteurdatabasename;


--
-- Name: faune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE faune FROM PUBLIC;
REVOKE ALL ON TABLE faune FROM postgres;
GRANT ALL ON TABLE faune TO postgres;
GRANT ALL ON TABLE faune TO databasename;
GRANT ALL ON TABLE faune TO superdatabasename;
GRANT SELECT ON TABLE faune TO visiteurdatabasename;


--
-- Name: fracture_faune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fracture_faune FROM PUBLIC;
REVOKE ALL ON TABLE fracture_faune FROM postgres;
GRANT ALL ON TABLE fracture_faune TO postgres;
GRANT ALL ON TABLE fracture_faune TO databasename;
GRANT ALL ON TABLE fracture_faune TO superdatabasename;


--
-- Name: fracture_industrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fracture_industrie FROM PUBLIC;
REVOKE ALL ON TABLE fracture_industrie FROM postgres;
GRANT ALL ON TABLE fracture_industrie TO postgres;
GRANT ALL ON TABLE fracture_industrie TO databasename;
GRANT ALL ON TABLE fracture_industrie TO superdatabasename;


--
-- Name: galet_amenage; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE galet_amenage FROM PUBLIC;
REVOKE ALL ON TABLE galet_amenage FROM postgres;
GRANT ALL ON TABLE galet_amenage TO postgres;
GRANT ALL ON TABLE galet_amenage TO databasename;
GRANT ALL ON TABLE galet_amenage TO superdatabasename;


--
-- Name: hachereau; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hachereau FROM PUBLIC;
REVOKE ALL ON TABLE hachereau FROM postgres;
GRANT ALL ON TABLE hachereau TO postgres;
GRANT ALL ON TABLE hachereau TO databasename;
GRANT ALL ON TABLE hachereau TO superdatabasename;


--
-- Name: industrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE industrie FROM PUBLIC;
REVOKE ALL ON TABLE industrie FROM postgres;
GRANT ALL ON TABLE industrie TO postgres;
GRANT ALL ON TABLE industrie TO databasename;
GRANT ALL ON TABLE industrie TO superdatabasename;


--
-- Name: microfaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE microfaune FROM PUBLIC;
REVOKE ALL ON TABLE microfaune FROM postgres;
GRANT ALL ON TABLE microfaune TO postgres;
GRANT ALL ON TABLE microfaune TO databasename;
GRANT ALL ON TABLE microfaune TO superdatabasename;


--
-- Name: nucleus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE nucleus FROM PUBLIC;
REVOKE ALL ON TABLE nucleus FROM postgres;
GRANT ALL ON TABLE nucleus TO postgres;
GRANT ALL ON TABLE nucleus TO databasename;
GRANT ALL ON TABLE nucleus TO superdatabasename;


--
-- Name: os; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE os FROM PUBLIC;
REVOKE ALL ON TABLE os FROM postgres;
GRANT ALL ON TABLE os TO postgres;
GRANT ALL ON TABLE os TO databasename;
GRANT ALL ON TABLE os TO superdatabasename;


--
-- Name: outil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE outil FROM PUBLIC;
REVOKE ALL ON TABLE outil FROM postgres;
GRANT ALL ON TABLE outil TO postgres;
GRANT ALL ON TABLE outil TO databasename;
GRANT ALL ON TABLE outil TO superdatabasename;


--
-- Name: photocoprolithe; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photocoprolithe FROM PUBLIC;
REVOKE ALL ON TABLE photocoprolithe FROM postgres;
GRANT ALL ON TABLE photocoprolithe TO postgres;
GRANT ALL ON TABLE photocoprolithe TO databasename;
GRANT ALL ON TABLE photocoprolithe TO superdatabasename;


--
-- Name: photofaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photofaune FROM PUBLIC;
REVOKE ALL ON TABLE photofaune FROM postgres;
GRANT ALL ON TABLE photofaune TO postgres;
GRANT ALL ON TABLE photofaune TO databasename;
GRANT ALL ON TABLE photofaune TO superdatabasename;


--
-- Name: photoindustrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photoindustrie FROM PUBLIC;
REVOKE ALL ON TABLE photoindustrie FROM postgres;
GRANT ALL ON TABLE photoindustrie TO postgres;
GRANT ALL ON TABLE photoindustrie TO databasename;
GRANT ALL ON TABLE photoindustrie TO superdatabasename;


--
-- Name: phototrace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE phototrace FROM PUBLIC;
REVOKE ALL ON TABLE phototrace FROM postgres;
GRANT ALL ON TABLE phototrace TO postgres;
GRANT ALL ON TABLE phototrace TO databasename;
GRANT ALL ON TABLE phototrace TO superdatabasename;


--
-- Name: remonte_famille; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_famille FROM PUBLIC;
REVOKE ALL ON TABLE remonte_famille FROM postgres;
GRANT ALL ON TABLE remonte_famille TO postgres;
GRANT ALL ON TABLE remonte_famille TO databasename;
GRANT ALL ON TABLE remonte_famille TO superdatabasename;


--
-- Name: remonte_genre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_genre FROM PUBLIC;
REVOKE ALL ON TABLE remonte_genre FROM postgres;
GRANT ALL ON TABLE remonte_genre TO postgres;
GRANT ALL ON TABLE remonte_genre TO databasename;
GRANT ALL ON TABLE remonte_genre TO superdatabasename;


--
-- Name: remonte_ordre; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE remonte_ordre FROM PUBLIC;
REVOKE ALL ON TABLE remonte_ordre FROM postgres;
GRANT ALL ON TABLE remonte_ordre TO postgres;
GRANT ALL ON TABLE remonte_ordre TO databasename;
GRANT ALL ON TABLE remonte_ordre TO superdatabasename;


--
-- Name: requete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE requete FROM PUBLIC;
REVOKE ALL ON TABLE requete FROM postgres;
GRANT ALL ON TABLE requete TO postgres;
GRANT ALL ON TABLE requete TO databasename;
GRANT ALL ON TABLE requete TO superdatabasename;


--
-- Name: retouche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE retouche FROM PUBLIC;
REVOKE ALL ON TABLE retouche FROM postgres;
GRANT ALL ON TABLE retouche TO postgres;
GRANT ALL ON TABLE retouche TO databasename;
GRANT ALL ON TABLE retouche TO superdatabasename;


--
-- Name: seq_bord; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_bord FROM PUBLIC;
REVOKE ALL ON TABLE seq_bord FROM postgres;
GRANT ALL ON TABLE seq_bord TO postgres;
GRANT ALL ON TABLE seq_bord TO databasename;
GRANT ALL ON TABLE seq_bord TO superdatabasename;


--
-- Name: seq_photofaune; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_photofaune FROM PUBLIC;
REVOKE ALL ON TABLE seq_photofaune FROM postgres;
GRANT ALL ON TABLE seq_photofaune TO postgres;
GRANT ALL ON TABLE seq_photofaune TO databasename;
GRANT ALL ON TABLE seq_photofaune TO superdatabasename;


--
-- Name: seq_photoindustrie; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_photoindustrie FROM PUBLIC;
REVOKE ALL ON TABLE seq_photoindustrie FROM postgres;
GRANT ALL ON TABLE seq_photoindustrie TO postgres;
GRANT ALL ON TABLE seq_photoindustrie TO databasename;
GRANT ALL ON TABLE seq_photoindustrie TO superdatabasename;


--
-- Name: seq_phototrace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_phototrace FROM PUBLIC;
REVOKE ALL ON TABLE seq_phototrace FROM postgres;
GRANT ALL ON TABLE seq_phototrace TO postgres;
GRANT ALL ON TABLE seq_phototrace TO databasename;
GRANT ALL ON TABLE seq_phototrace TO superdatabasename;


--
-- Name: stigmate; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE stigmate FROM PUBLIC;
REVOKE ALL ON TABLE stigmate FROM postgres;
GRANT ALL ON TABLE stigmate TO postgres;
GRANT ALL ON TABLE stigmate TO databasename;
GRANT ALL ON TABLE stigmate TO superdatabasename;


--
-- Name: trace; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE trace FROM PUBLIC;
REVOKE ALL ON TABLE trace FROM postgres;
GRANT ALL ON TABLE trace TO postgres;
GRANT ALL ON TABLE trace TO databasename;
GRANT ALL ON TABLE trace TO superdatabasename;


--
-- Name: usure_dent; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usure_dent FROM PUBLIC;
REVOKE ALL ON TABLE usure_dent FROM postgres;
GRANT ALL ON TABLE usure_dent TO postgres;
GRANT ALL ON TABLE usure_dent TO databasename;
GRANT ALL ON TABLE usure_dent TO superdatabasename;
GRANT SELECT ON TABLE usure_dent TO visiteurdatabasename;


--
-- PostgreSQL database dump complete
--

