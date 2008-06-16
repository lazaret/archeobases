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
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adresse (
    identifiant integer NOT NULL,
    ordre integer NOT NULL,
    type_adresse text,
    adresse_1 text,
    adresse_2 text,
    adresse_3 text,
    adresse_4 text,
    ville text,
    pays text,
    email text,
    fax text,
    telephone_1 text,
    telephone_2 text,
    code text,
    modif_adresse date
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- Name: controle_association; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_association (
    association text NOT NULL,
    description text
);


ALTER TABLE public.controle_association OWNER TO postgres;

--
-- Name: controle_civilite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_civilite (
    civilite text NOT NULL,
    description text
);


ALTER TABLE public.controle_civilite OWNER TO postgres;

--
-- Name: controle_cotisation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_cotisation (
    cotisation text NOT NULL,
    description text
);


ALTER TABLE public.controle_cotisation OWNER TO postgres;

--
-- Name: controle_type_adresse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_type_adresse (
    type_adresse text NOT NULL,
    description text
);


ALTER TABLE public.controle_type_adresse OWNER TO postgres;

--
-- Name: controle_type_entree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_type_entree (
    type_entree text NOT NULL,
    description text
);


ALTER TABLE public.controle_type_entree OWNER TO postgres;

--
-- Name: controle_type_personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controle_type_personne (
    type_personne text NOT NULL,
    description text
);


ALTER TABLE public.controle_type_personne OWNER TO postgres;

--
-- Name: entree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entree (
    identifiant integer NOT NULL,
    type_entree text
);


ALTER TABLE public.entree OWNER TO postgres;

--
-- Name: fiche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fiche (
    identifiant integer NOT NULL,
    type_entree text,
    civilite text,
    titre text,
    nom text,
    prenom text,
    nationalite text,
    date_naissance date,
    fonction text,
    specialite text,
    commentaire text,
    association text,
    numero_adherent integer,
    chantier text,
    type_personne text,
    structure text,
    cotisation text,
    modif_fiche date
);


ALTER TABLE public.fiche OWNER TO postgres;

--
-- Name: photofiche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photofiche (
    idphoto integer DEFAULT nextval(('seq_photofiche'::text)::regclass) NOT NULL,
    identifiant integer NOT NULL,
    legende text
);


ALTER TABLE public.photofiche OWNER TO postgres;

--
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requete (
    nomrequete text NOT NULL,
    coderequete text
);


ALTER TABLE public.requete OWNER TO postgres;

--
-- Name: seq_photofiche; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_photofiche
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photofiche OWNER TO postgres;

--
-- Name: adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (identifiant, ordre);


--
-- Name: controle_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_association
    ADD CONSTRAINT controle_association_pkey PRIMARY KEY (association);


--
-- Name: controle_civilite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_civilite
    ADD CONSTRAINT controle_civilite_pkey PRIMARY KEY (civilite);


--
-- Name: controle_cotisation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_cotisation
    ADD CONSTRAINT controle_cotisation_pkey PRIMARY KEY (cotisation);


--
-- Name: controle_type_adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_type_adresse
    ADD CONSTRAINT controle_type_adresse_pkey PRIMARY KEY (type_adresse);


--
-- Name: controle_type_entree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_type_entree
    ADD CONSTRAINT controle_type_entree_pkey PRIMARY KEY (type_entree);


--
-- Name: controle_type_personne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controle_type_personne
    ADD CONSTRAINT controle_type_personne_pkey PRIMARY KEY (type_personne);


--
-- Name: entree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entree
    ADD CONSTRAINT entree_pkey PRIMARY KEY (identifiant);


--
-- Name: fiche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fiche
    ADD CONSTRAINT fiche_pkey PRIMARY KEY (identifiant);


--
-- Name: photofiche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photofiche
    ADD CONSTRAINT photofiche_pkey PRIMARY KEY (idphoto);


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
-- Name: adresse; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE adresse FROM PUBLIC;
REVOKE ALL ON TABLE adresse FROM postgres;
GRANT ALL ON TABLE adresse TO postgres;
GRANT ALL ON TABLE adresse TO superannuaire;
GRANT ALL ON TABLE adresse TO annuaire;
GRANT SELECT ON TABLE adresse TO visiteurannuaire;


--
-- Name: controle_association; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_association FROM PUBLIC;
REVOKE ALL ON TABLE controle_association FROM postgres;
GRANT ALL ON TABLE controle_association TO postgres;
GRANT ALL ON TABLE controle_association TO superannuaire;
GRANT SELECT ON TABLE controle_association TO annuaire;
GRANT SELECT ON TABLE controle_association TO visiteurannuaire;


--
-- Name: controle_civilite; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_civilite FROM PUBLIC;
REVOKE ALL ON TABLE controle_civilite FROM postgres;
GRANT ALL ON TABLE controle_civilite TO postgres;
GRANT ALL ON TABLE controle_civilite TO superannuaire;
GRANT SELECT ON TABLE controle_civilite TO annuaire;
GRANT SELECT ON TABLE controle_civilite TO visiteurannuaire;


--
-- Name: controle_cotisation; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_cotisation FROM PUBLIC;
REVOKE ALL ON TABLE controle_cotisation FROM postgres;
GRANT ALL ON TABLE controle_cotisation TO postgres;
GRANT ALL ON TABLE controle_cotisation TO superannuaire;
GRANT SELECT ON TABLE controle_cotisation TO annuaire;
GRANT SELECT ON TABLE controle_cotisation TO visiteurannuaire;


--
-- Name: controle_type_adresse; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_type_adresse FROM PUBLIC;
REVOKE ALL ON TABLE controle_type_adresse FROM postgres;
GRANT ALL ON TABLE controle_type_adresse TO postgres;
GRANT ALL ON TABLE controle_type_adresse TO superannuaire;
GRANT SELECT ON TABLE controle_type_adresse TO annuaire;
GRANT SELECT ON TABLE controle_type_adresse TO visiteurannuaire;


--
-- Name: controle_type_entree; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_type_entree FROM PUBLIC;
REVOKE ALL ON TABLE controle_type_entree FROM postgres;
GRANT ALL ON TABLE controle_type_entree TO postgres;
GRANT ALL ON TABLE controle_type_entree TO superannuaire;
GRANT SELECT ON TABLE controle_type_entree TO annuaire;
GRANT SELECT ON TABLE controle_type_entree TO visiteurannuaire;


--
-- Name: controle_type_personne; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE controle_type_personne FROM PUBLIC;
REVOKE ALL ON TABLE controle_type_personne FROM postgres;
GRANT ALL ON TABLE controle_type_personne TO postgres;
GRANT ALL ON TABLE controle_type_personne TO superannuaire;
GRANT ALL ON TABLE controle_type_personne TO annuaire;
GRANT SELECT ON TABLE controle_type_personne TO visiteurannuaire;


--
-- Name: entree; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE entree FROM PUBLIC;
REVOKE ALL ON TABLE entree FROM postgres;
GRANT ALL ON TABLE entree TO postgres;
GRANT ALL ON TABLE entree TO superannuaire;
GRANT ALL ON TABLE entree TO annuaire;
GRANT SELECT ON TABLE entree TO visiteurannuaire;


--
-- Name: fiche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fiche FROM PUBLIC;
REVOKE ALL ON TABLE fiche FROM postgres;
GRANT ALL ON TABLE fiche TO postgres;
GRANT ALL ON TABLE fiche TO superannuaire;
GRANT ALL ON TABLE fiche TO annuaire;
GRANT SELECT ON TABLE fiche TO visiteurannuaire;


--
-- Name: photofiche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE photofiche FROM PUBLIC;
REVOKE ALL ON TABLE photofiche FROM postgres;
GRANT ALL ON TABLE photofiche TO postgres;
GRANT ALL ON TABLE photofiche TO superannuaire;
GRANT ALL ON TABLE photofiche TO annuaire;
GRANT SELECT ON TABLE photofiche TO visiteurannuaire;


--
-- Name: requete; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE requete FROM PUBLIC;
REVOKE ALL ON TABLE requete FROM postgres;
GRANT ALL ON TABLE requete TO postgres;
GRANT ALL ON TABLE requete TO superannuaire;
GRANT ALL ON TABLE requete TO annuaire;


--
-- Name: seq_photofiche; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE seq_photofiche FROM PUBLIC;
REVOKE ALL ON TABLE seq_photofiche FROM postgres;
GRANT ALL ON TABLE seq_photofiche TO postgres;
GRANT ALL ON TABLE seq_photofiche TO superannuaire;
GRANT ALL ON TABLE seq_photofiche TO annuaire;
GRANT SELECT ON TABLE seq_photofiche TO visiteurannuaire;


--
-- PostgreSQL database dump complete
--

