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
-- Name: acces; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE acces (
    idacces integer DEFAULT nextval(('seq_acces'::text)::regclass) NOT NULL,
    acces text
);


ALTER TABLE public.acces OWNER TO superbego;

--
-- Name: association; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE association (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    face text NOT NULL,
    association integer NOT NULL,
    "type" text,
    disposition text
);


ALTER TABLE public.association OWNER TO superbego;

--
-- Name: col; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE col (
    idcol integer DEFAULT nextval(('seq_col'::text)::regclass) NOT NULL,
    col text
);


ALTER TABLE public.col OWNER TO superbego;

--
-- Name: eboulis; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE eboulis (
    ideboulis integer DEFAULT nextval(('seq_eboulis'::text)::regclass) NOT NULL,
    eboulis text
);


ALTER TABLE public.eboulis OWNER TO superbego;

--
-- Name: face; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE face (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    face text NOT NULL,
    "type" text,
    forme text,
    longueur integer,
    largeur integer,
    couleur text,
    aspect text,
    decrochement boolean DEFAULT false,
    fissure boolean DEFAULT false,
    microflore boolean DEFAULT false,
    nodule boolean DEFAULT false,
    trou boolean DEFAULT false,
    erosion text,
    desquamation text,
    direction text,
    contour text,
    inclinaison integer,
    orientation text
);


ALTER TABLE public.face OWNER TO superbego;

--
-- Name: figassoc; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE figassoc (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    face text NOT NULL,
    association integer NOT NULL,
    figure text NOT NULL,
    "type" text,
    ordre integer NOT NULL
);


ALTER TABLE public.figassoc OWNER TO superbego;

--
-- Name: figure; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE figure (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    face text NOT NULL,
    figure text NOT NULL,
    carre text,
    identite text,
    signe text,
    style text,
    longueur integer,
    largeur integer,
    sens text,
    cardinale text,
    geographique text,
    qualite text,
    contour text,
    debord text,
    profil text,
    strie text,
    alignement text,
    surface text,
    bavure text,
    perif text,
    raclage text,
    forme text,
    profondeur text,
    taille text,
    disposition text,
    description text,
    conti text
);


ALTER TABLE public.figure OWNER TO superbego;

--
-- Name: glacier; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE glacier (
    idglacier integer DEFAULT nextval(('seq_glacier'::text)::regclass) NOT NULL,
    glacier text
);


ALTER TABLE public.glacier OWNER TO superbego;

--
-- Name: historique; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE historique (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    face text NOT NULL,
    historique text NOT NULL,
    motif text,
    date date,
    "type" text,
    origine text,
    realisation text,
    longueur integer,
    largeur integer,
    qualite text,
    style text,
    superposition text,
    description text
);


ALTER TABLE public.historique OWNER TO superbego;

--
-- Name: lac; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE lac (
    idlac integer DEFAULT nextval(('seq_lac'::text)::regclass) NOT NULL,
    lac text
);


ALTER TABLE public.lac OWNER TO superbego;

--
-- Name: moraine; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE moraine (
    idmoraine integer DEFAULT nextval(('seq_moraine'::text)::regclass) NOT NULL,
    moraine text
);


ALTER TABLE public.moraine OWNER TO superbego;

--
-- Name: photoassociation; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photoassociation (
    idphoto integer DEFAULT nextval(('seq_photoassociation'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    roche text,
    face text,
    association integer,
    legende text
);


ALTER TABLE public.photoassociation OWNER TO superbego;

--
-- Name: photoface; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photoface (
    idphoto integer DEFAULT nextval(('seq_photoface'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    roche text,
    face text,
    legende text
);


ALTER TABLE public.photoface OWNER TO superbego;

--
-- Name: photofigure; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photofigure (
    idphoto integer DEFAULT nextval(('seq_photofigure'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    roche text,
    face text,
    figure text,
    legende text
);


ALTER TABLE public.photofigure OWNER TO superbego;

--
-- Name: photogroupe; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photogroupe (
    idphoto integer DEFAULT nextval(('seq_photogroupe'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    legende text
);


ALTER TABLE public.photogroupe OWNER TO superbego;

--
-- Name: photohistorique; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photohistorique (
    idphoto integer DEFAULT nextval(('seq_photohistorique'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    roche text,
    face text,
    historique text,
    legende text
);


ALTER TABLE public.photohistorique OWNER TO superbego;

--
-- Name: photoroche; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photoroche (
    idphoto integer DEFAULT nextval(('seq_photoroche'::text)::regclass) NOT NULL,
    "zone" integer,
    groupe integer,
    roche text,
    legende text
);


ALTER TABLE public.photoroche OWNER TO superbego;

--
-- Name: photosecteur; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photosecteur (
    idphoto integer DEFAULT nextval(('seq_photosecteur'::text)::regclass) NOT NULL,
    secteur text,
    legende text
);


ALTER TABLE public.photosecteur OWNER TO superbego;

--
-- Name: photozone; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE photozone (
    idphoto integer DEFAULT nextval(('seq_photozone'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL,
    legende text
);


ALTER TABLE public.photozone OWNER TO superbego;

--
-- Name: requete; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE requete (
    nomrequete text NOT NULL,
    coderequete text
);


ALTER TABLE public.requete OWNER TO superbego;

--
-- Name: roche; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE roche (
    "zone" integer NOT NULL,
    groupe integer NOT NULL,
    roche text NOT NULL,
    x numeric(10,2),
    y numeric(10,2),
    z numeric(10,2),
    nature text,
    "type" text,
    longueur integer,
    largeur integer,
    epaisseur integer,
    orientation text,
    contexte text,
    remarquable boolean DEFAULT false,
    publication boolean DEFAULT false,
    nom text
);


ALTER TABLE public.roche OWNER TO superbego;

--
-- Name: sentier; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE sentier (
    idsentier integer DEFAULT nextval(('seq_sentier'::text)::regclass) NOT NULL,
    sentier text
);


ALTER TABLE public.sentier OWNER TO superbego;

--
-- Name: seq_acces; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_acces
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_acces OWNER TO superbego;

--
-- Name: seq_col; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_col
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_col OWNER TO superbego;

--
-- Name: seq_eboulis; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_eboulis
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_eboulis OWNER TO superbego;

--
-- Name: seq_glacier; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_glacier
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_glacier OWNER TO superbego;

--
-- Name: seq_lac; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_lac
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_lac OWNER TO superbego;

--
-- Name: seq_moraine; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_moraine
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_moraine OWNER TO superbego;

--
-- Name: seq_photoassociation; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photoassociation
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photoassociation OWNER TO superbego;

--
-- Name: seq_photoface; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photoface
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photoface OWNER TO superbego;

--
-- Name: seq_photofigure; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photofigure
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photofigure OWNER TO superbego;

--
-- Name: seq_photogroupe; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photogroupe
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photogroupe OWNER TO superbego;

--
-- Name: seq_photohistorique; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photohistorique
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photohistorique OWNER TO superbego;

--
-- Name: seq_photoroche; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photoroche
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photoroche OWNER TO superbego;

--
-- Name: seq_photosecteur; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photosecteur
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photosecteur OWNER TO superbego;

--
-- Name: seq_photozone; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_photozone
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_photozone OWNER TO superbego;

--
-- Name: seq_sentier; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_sentier
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_sentier OWNER TO superbego;

--
-- Name: seq_sommet; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_sommet
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_sommet OWNER TO superbego;

--
-- Name: seq_torrent; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_torrent
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_torrent OWNER TO superbego;

--
-- Name: seq_tourbiere; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_tourbiere
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_tourbiere OWNER TO superbego;

--
-- Name: seq_vegetation; Type: SEQUENCE; Schema: public; Owner: superbego
--

CREATE SEQUENCE seq_vegetation
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_vegetation OWNER TO superbego;

--
-- Name: sommet; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE sommet (
    idsommet integer DEFAULT nextval(('seq_sommet'::text)::regclass) NOT NULL,
    sommet text
);


ALTER TABLE public.sommet OWNER TO superbego;

--
-- Name: torrent; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE torrent (
    idtorrent integer DEFAULT nextval(('seq_torrent'::text)::regclass) NOT NULL,
    torrent text
);


ALTER TABLE public.torrent OWNER TO superbego;

--
-- Name: tourbiere; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE tourbiere (
    idtourbiere integer DEFAULT nextval(('seq_tourbiere'::text)::regclass) NOT NULL,
    tourbiere text
);


ALTER TABLE public.tourbiere OWNER TO superbego;

--
-- Name: vegetation; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE vegetation (
    idvegetation integer DEFAULT nextval(('seq_vegetation'::text)::regclass) NOT NULL,
    vegetation text
);


ALTER TABLE public.vegetation OWNER TO superbego;

--
-- Name: zone; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE "zone" (
    secteur text,
    "zone" integer NOT NULL,
    groupes integer,
    acces text,
    sentier text,
    sommet text,
    col text,
    lac text,
    torrent text,
    tourbiere text,
    eboulis text,
    moraine text,
    glacier text,
    vegetation text
);


ALTER TABLE public."zone" OWNER TO superbego;

--
-- Name: zone_acces; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_acces (
    idacces integer DEFAULT nextval(('seq_acces'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_acces OWNER TO superbego;

--
-- Name: zone_col; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_col (
    idcol integer DEFAULT nextval(('seq_col'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_col OWNER TO superbego;

--
-- Name: zone_eboulis; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_eboulis (
    ideboulis integer DEFAULT nextval(('seq_eboulis'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_eboulis OWNER TO superbego;

--
-- Name: zone_glacier; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_glacier (
    idglacier integer DEFAULT nextval(('seq_glacier'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_glacier OWNER TO superbego;

--
-- Name: zone_lac; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_lac (
    idlac integer DEFAULT nextval(('seq_lac'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_lac OWNER TO superbego;

--
-- Name: zone_moraine; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_moraine (
    idmoraine integer DEFAULT nextval(('seq_moraine'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_moraine OWNER TO superbego;

--
-- Name: zone_sentier; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_sentier (
    idsentier integer DEFAULT nextval(('seq_acces'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_sentier OWNER TO superbego;

--
-- Name: zone_sommet; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_sommet (
    idsommet integer DEFAULT nextval(('seq_sommet'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_sommet OWNER TO superbego;

--
-- Name: zone_torrent; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_torrent (
    idtorrent integer DEFAULT nextval(('seq_torrent'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_torrent OWNER TO superbego;

--
-- Name: zone_tourbiere; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_tourbiere (
    idtourbiere integer DEFAULT nextval(('seq_tourbiere'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_tourbiere OWNER TO superbego;

--
-- Name: zone_vegetation; Type: TABLE; Schema: public; Owner: superbego; Tablespace: 
--

CREATE TABLE zone_vegetation (
    idvegetation integer DEFAULT nextval(('seq_vegetation'::text)::regclass) NOT NULL,
    "zone" integer NOT NULL
);


ALTER TABLE public.zone_vegetation OWNER TO superbego;

--
-- Name: acces_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY acces
    ADD CONSTRAINT acces_pkey PRIMARY KEY (idacces);


--
-- Name: association_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY association
    ADD CONSTRAINT association_pkey PRIMARY KEY ("zone", groupe, roche, face, association);


--
-- Name: col_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY col
    ADD CONSTRAINT col_pkey PRIMARY KEY (idcol);


--
-- Name: eboulis_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY eboulis
    ADD CONSTRAINT eboulis_pkey PRIMARY KEY (ideboulis);


--
-- Name: face_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY face
    ADD CONSTRAINT face_pkey PRIMARY KEY ("zone", groupe, roche, face);


--
-- Name: figassoc_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY figassoc
    ADD CONSTRAINT figassoc_pkey PRIMARY KEY ("zone", groupe, roche, face, association);


--
-- Name: figure_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY figure
    ADD CONSTRAINT figure_pkey PRIMARY KEY ("zone", groupe, roche, face, figure);


--
-- Name: glacier_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY glacier
    ADD CONSTRAINT glacier_pkey PRIMARY KEY (idglacier);


--
-- Name: historique_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY historique
    ADD CONSTRAINT historique_pkey PRIMARY KEY ("zone", groupe, roche, face, historique);


--
-- Name: lac_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY lac
    ADD CONSTRAINT lac_pkey PRIMARY KEY (idlac);


--
-- Name: moraine_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY moraine
    ADD CONSTRAINT moraine_pkey PRIMARY KEY (idmoraine);


--
-- Name: photoassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photoassociation
    ADD CONSTRAINT photoassociation_pkey PRIMARY KEY (idphoto);


--
-- Name: photoface_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photoface
    ADD CONSTRAINT photoface_pkey PRIMARY KEY (idphoto);


--
-- Name: photofigure_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photofigure
    ADD CONSTRAINT photofigure_pkey PRIMARY KEY (idphoto);


--
-- Name: photogroupe_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photogroupe
    ADD CONSTRAINT photogroupe_pkey PRIMARY KEY (idphoto);


--
-- Name: photohistorique_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photohistorique
    ADD CONSTRAINT photohistorique_pkey PRIMARY KEY (idphoto);


--
-- Name: photoroche_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photoroche
    ADD CONSTRAINT photoroche_pkey PRIMARY KEY (idphoto);


--
-- Name: photosecteur_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photosecteur
    ADD CONSTRAINT photosecteur_pkey PRIMARY KEY (idphoto);


--
-- Name: photozone_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY photozone
    ADD CONSTRAINT photozone_pkey PRIMARY KEY ("zone");


--
-- Name: requete_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT requete_pkey PRIMARY KEY (nomrequete);


--
-- Name: roche_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY roche
    ADD CONSTRAINT roche_pkey PRIMARY KEY ("zone", groupe, roche);


--
-- Name: sentier_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY sentier
    ADD CONSTRAINT sentier_pkey PRIMARY KEY (idsentier);


--
-- Name: sommet_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY sommet
    ADD CONSTRAINT sommet_pkey PRIMARY KEY (idsommet);


--
-- Name: torrent_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY torrent
    ADD CONSTRAINT torrent_pkey PRIMARY KEY (idtorrent);


--
-- Name: tourbiere_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY tourbiere
    ADD CONSTRAINT tourbiere_pkey PRIMARY KEY (idtourbiere);


--
-- Name: vegetation_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT vegetation_pkey PRIMARY KEY (idvegetation);


--
-- Name: zone_acces_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_acces
    ADD CONSTRAINT zone_acces_pkey PRIMARY KEY ("zone", idacces);


--
-- Name: zone_col_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_col
    ADD CONSTRAINT zone_col_pkey PRIMARY KEY ("zone", idcol);


--
-- Name: zone_eboulis_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_eboulis
    ADD CONSTRAINT zone_eboulis_pkey PRIMARY KEY ("zone", ideboulis);


--
-- Name: zone_glacier_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_glacier
    ADD CONSTRAINT zone_glacier_pkey PRIMARY KEY ("zone", idglacier);


--
-- Name: zone_lac_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_lac
    ADD CONSTRAINT zone_lac_pkey PRIMARY KEY ("zone", idlac);


--
-- Name: zone_moraine_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_moraine
    ADD CONSTRAINT zone_moraine_pkey PRIMARY KEY ("zone", idmoraine);


--
-- Name: zone_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY "zone"
    ADD CONSTRAINT zone_pkey PRIMARY KEY ("zone");


--
-- Name: zone_sentier_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_sentier
    ADD CONSTRAINT zone_sentier_pkey PRIMARY KEY ("zone", idsentier);


--
-- Name: zone_sommet_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_sommet
    ADD CONSTRAINT zone_sommet_pkey PRIMARY KEY ("zone", idsommet);


--
-- Name: zone_torrent_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_torrent
    ADD CONSTRAINT zone_torrent_pkey PRIMARY KEY ("zone", idtorrent);


--
-- Name: zone_tourbiere_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_tourbiere
    ADD CONSTRAINT zone_tourbiere_pkey PRIMARY KEY ("zone", idtourbiere);


--
-- Name: zone_vegetation_pkey; Type: CONSTRAINT; Schema: public; Owner: superbego; Tablespace: 
--

ALTER TABLE ONLY zone_vegetation
    ADD CONSTRAINT zone_vegetation_pkey PRIMARY KEY ("zone", idvegetation);


--
-- Name: RI_ConstraintTrigger_215152; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON roche
    FROM "zone"
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'roche', 'zone', 'UNSPECIFIED', 'zone', 'zone');


--
-- Name: RI_ConstraintTrigger_215153; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON "zone"
    FROM roche
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'roche', 'zone', 'UNSPECIFIED', 'zone', 'zone');


--
-- Name: RI_ConstraintTrigger_215154; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON "zone"
    FROM roche
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'roche', 'zone', 'UNSPECIFIED', 'zone', 'zone');


--
-- Name: RI_ConstraintTrigger_215155; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON face
    FROM roche
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'face', 'roche', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche');


--
-- Name: RI_ConstraintTrigger_215156; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON roche
    FROM face
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'face', 'roche', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche');


--
-- Name: RI_ConstraintTrigger_215157; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON roche
    FROM face
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'face', 'roche', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche');


--
-- Name: RI_ConstraintTrigger_215158; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON figure
    FROM face
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'figure', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215159; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON face
    FROM figure
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'figure', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215160; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON face
    FROM figure
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'figure', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215161; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON historique
    FROM face
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'historique', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215162; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON face
    FROM historique
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'historique', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215163; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON face
    FROM historique
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'historique', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215164; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON association
    FROM face
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'association', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215165; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON face
    FROM association
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'association', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215166; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON face
    FROM association
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'association', 'face', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face');


--
-- Name: RI_ConstraintTrigger_215167; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON figassoc
    FROM association
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins"('<unnamed>', 'figassoc', 'association', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face', 'association', 'association');


--
-- Name: RI_ConstraintTrigger_215168; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON association
    FROM figassoc
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_del"('<unnamed>', 'figassoc', 'association', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face', 'association', 'association');


--
-- Name: RI_ConstraintTrigger_215169; Type: TRIGGER; Schema: public; Owner: superbego
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON association
    FROM figassoc
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_noaction_upd"('<unnamed>', 'figassoc', 'association', 'UNSPECIFIED', 'zone', 'zone', 'groupe', 'groupe', 'roche', 'roche', 'face', 'face', 'association', 'association');


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: acces; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE acces FROM PUBLIC;
REVOKE ALL ON TABLE acces FROM superbego;
GRANT ALL ON TABLE acces TO superbego;
GRANT ALL ON TABLE acces TO bego;
GRANT SELECT ON TABLE acces TO user_query;


--
-- Name: association; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE association FROM PUBLIC;
REVOKE ALL ON TABLE association FROM superbego;
GRANT ALL ON TABLE association TO superbego;
GRANT ALL ON TABLE association TO bego;
GRANT SELECT ON TABLE association TO user_query;


--
-- Name: col; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE col FROM PUBLIC;
REVOKE ALL ON TABLE col FROM superbego;
GRANT ALL ON TABLE col TO superbego;
GRANT ALL ON TABLE col TO bego;
GRANT SELECT ON TABLE col TO user_query;


--
-- Name: eboulis; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE eboulis FROM PUBLIC;
REVOKE ALL ON TABLE eboulis FROM superbego;
GRANT ALL ON TABLE eboulis TO superbego;
GRANT ALL ON TABLE eboulis TO bego;
GRANT SELECT ON TABLE eboulis TO user_query;


--
-- Name: face; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE face FROM PUBLIC;
REVOKE ALL ON TABLE face FROM superbego;
GRANT ALL ON TABLE face TO superbego;
GRANT ALL ON TABLE face TO bego;
GRANT SELECT ON TABLE face TO user_query;


--
-- Name: figassoc; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE figassoc FROM PUBLIC;
REVOKE ALL ON TABLE figassoc FROM superbego;
GRANT ALL ON TABLE figassoc TO superbego;
GRANT ALL ON TABLE figassoc TO bego;
GRANT SELECT ON TABLE figassoc TO user_query;


--
-- Name: figure; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE figure FROM PUBLIC;
REVOKE ALL ON TABLE figure FROM superbego;
GRANT ALL ON TABLE figure TO superbego;
GRANT ALL ON TABLE figure TO bego;
GRANT SELECT ON TABLE figure TO user_query;


--
-- Name: glacier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE glacier FROM PUBLIC;
REVOKE ALL ON TABLE glacier FROM superbego;
GRANT ALL ON TABLE glacier TO superbego;
GRANT ALL ON TABLE glacier TO bego;
GRANT SELECT ON TABLE glacier TO user_query;


--
-- Name: historique; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE historique FROM PUBLIC;
REVOKE ALL ON TABLE historique FROM superbego;
GRANT ALL ON TABLE historique TO superbego;
GRANT ALL ON TABLE historique TO bego;
GRANT SELECT ON TABLE historique TO user_query;


--
-- Name: lac; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE lac FROM PUBLIC;
REVOKE ALL ON TABLE lac FROM superbego;
GRANT ALL ON TABLE lac TO superbego;
GRANT ALL ON TABLE lac TO bego;
GRANT SELECT ON TABLE lac TO user_query;


--
-- Name: moraine; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE moraine FROM PUBLIC;
REVOKE ALL ON TABLE moraine FROM superbego;
GRANT ALL ON TABLE moraine TO superbego;
GRANT ALL ON TABLE moraine TO bego;
GRANT SELECT ON TABLE moraine TO user_query;


--
-- Name: photoassociation; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photoassociation FROM PUBLIC;
REVOKE ALL ON TABLE photoassociation FROM superbego;
GRANT ALL ON TABLE photoassociation TO superbego;
GRANT ALL ON TABLE photoassociation TO bego;
GRANT SELECT ON TABLE photoassociation TO user_query;


--
-- Name: photoface; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photoface FROM PUBLIC;
REVOKE ALL ON TABLE photoface FROM superbego;
GRANT ALL ON TABLE photoface TO superbego;
GRANT ALL ON TABLE photoface TO bego;
GRANT SELECT ON TABLE photoface TO user_query;


--
-- Name: photofigure; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photofigure FROM PUBLIC;
REVOKE ALL ON TABLE photofigure FROM superbego;
GRANT ALL ON TABLE photofigure TO superbego;
GRANT ALL ON TABLE photofigure TO bego;
GRANT SELECT ON TABLE photofigure TO user_query;


--
-- Name: photogroupe; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photogroupe FROM PUBLIC;
REVOKE ALL ON TABLE photogroupe FROM superbego;
GRANT ALL ON TABLE photogroupe TO superbego;
GRANT ALL ON TABLE photogroupe TO bego;
GRANT SELECT ON TABLE photogroupe TO user_query;


--
-- Name: photohistorique; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photohistorique FROM PUBLIC;
REVOKE ALL ON TABLE photohistorique FROM superbego;
GRANT ALL ON TABLE photohistorique TO superbego;
GRANT ALL ON TABLE photohistorique TO bego;
GRANT SELECT ON TABLE photohistorique TO user_query;


--
-- Name: photoroche; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photoroche FROM PUBLIC;
REVOKE ALL ON TABLE photoroche FROM superbego;
GRANT ALL ON TABLE photoroche TO superbego;
GRANT ALL ON TABLE photoroche TO bego;
GRANT SELECT ON TABLE photoroche TO user_query;


--
-- Name: photosecteur; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photosecteur FROM PUBLIC;
REVOKE ALL ON TABLE photosecteur FROM superbego;
GRANT ALL ON TABLE photosecteur TO superbego;
GRANT ALL ON TABLE photosecteur TO bego;
GRANT SELECT ON TABLE photosecteur TO user_query;


--
-- Name: photozone; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE photozone FROM PUBLIC;
REVOKE ALL ON TABLE photozone FROM superbego;
GRANT ALL ON TABLE photozone TO superbego;
GRANT ALL ON TABLE photozone TO bego;
GRANT SELECT ON TABLE photozone TO user_query;


--
-- Name: requete; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE requete FROM PUBLIC;
REVOKE ALL ON TABLE requete FROM superbego;
GRANT ALL ON TABLE requete TO superbego;
GRANT ALL ON TABLE requete TO bego;


--
-- Name: roche; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE roche FROM PUBLIC;
REVOKE ALL ON TABLE roche FROM superbego;
GRANT ALL ON TABLE roche TO superbego;
GRANT ALL ON TABLE roche TO bego;
GRANT SELECT ON TABLE roche TO user_query;


--
-- Name: sentier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE sentier FROM PUBLIC;
REVOKE ALL ON TABLE sentier FROM superbego;
GRANT ALL ON TABLE sentier TO superbego;
GRANT ALL ON TABLE sentier TO bego;
GRANT SELECT ON TABLE sentier TO user_query;


--
-- Name: seq_acces; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_acces FROM PUBLIC;
REVOKE ALL ON TABLE seq_acces FROM superbego;
GRANT ALL ON TABLE seq_acces TO superbego;
GRANT ALL ON TABLE seq_acces TO bego;


--
-- Name: seq_col; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_col FROM PUBLIC;
REVOKE ALL ON TABLE seq_col FROM superbego;
GRANT ALL ON TABLE seq_col TO superbego;
GRANT ALL ON TABLE seq_col TO bego;


--
-- Name: seq_eboulis; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_eboulis FROM PUBLIC;
REVOKE ALL ON TABLE seq_eboulis FROM superbego;
GRANT ALL ON TABLE seq_eboulis TO superbego;
GRANT ALL ON TABLE seq_eboulis TO bego;


--
-- Name: seq_glacier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_glacier FROM PUBLIC;
REVOKE ALL ON TABLE seq_glacier FROM superbego;
GRANT ALL ON TABLE seq_glacier TO superbego;
GRANT ALL ON TABLE seq_glacier TO bego;


--
-- Name: seq_lac; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_lac FROM PUBLIC;
REVOKE ALL ON TABLE seq_lac FROM superbego;
GRANT ALL ON TABLE seq_lac TO superbego;
GRANT ALL ON TABLE seq_lac TO bego;


--
-- Name: seq_moraine; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_moraine FROM PUBLIC;
REVOKE ALL ON TABLE seq_moraine FROM superbego;
GRANT ALL ON TABLE seq_moraine TO superbego;
GRANT ALL ON TABLE seq_moraine TO bego;


--
-- Name: seq_photoassociation; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photoassociation FROM PUBLIC;
REVOKE ALL ON TABLE seq_photoassociation FROM superbego;
GRANT ALL ON TABLE seq_photoassociation TO superbego;
GRANT ALL ON TABLE seq_photoassociation TO bego;


--
-- Name: seq_photoface; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photoface FROM PUBLIC;
REVOKE ALL ON TABLE seq_photoface FROM superbego;
GRANT ALL ON TABLE seq_photoface TO superbego;
GRANT ALL ON TABLE seq_photoface TO bego;


--
-- Name: seq_photofigure; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photofigure FROM PUBLIC;
REVOKE ALL ON TABLE seq_photofigure FROM superbego;
GRANT ALL ON TABLE seq_photofigure TO superbego;
GRANT ALL ON TABLE seq_photofigure TO bego;


--
-- Name: seq_photogroupe; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photogroupe FROM PUBLIC;
REVOKE ALL ON TABLE seq_photogroupe FROM superbego;
GRANT ALL ON TABLE seq_photogroupe TO superbego;
GRANT ALL ON TABLE seq_photogroupe TO bego;


--
-- Name: seq_photohistorique; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photohistorique FROM PUBLIC;
REVOKE ALL ON TABLE seq_photohistorique FROM superbego;
GRANT ALL ON TABLE seq_photohistorique TO superbego;
GRANT ALL ON TABLE seq_photohistorique TO bego;


--
-- Name: seq_photoroche; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photoroche FROM PUBLIC;
REVOKE ALL ON TABLE seq_photoroche FROM superbego;
GRANT ALL ON TABLE seq_photoroche TO superbego;
GRANT ALL ON TABLE seq_photoroche TO bego;


--
-- Name: seq_photosecteur; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photosecteur FROM PUBLIC;
REVOKE ALL ON TABLE seq_photosecteur FROM superbego;
GRANT ALL ON TABLE seq_photosecteur TO superbego;
GRANT ALL ON TABLE seq_photosecteur TO bego;


--
-- Name: seq_photozone; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_photozone FROM PUBLIC;
REVOKE ALL ON TABLE seq_photozone FROM superbego;
GRANT ALL ON TABLE seq_photozone TO superbego;
GRANT ALL ON TABLE seq_photozone TO bego;


--
-- Name: seq_sentier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_sentier FROM PUBLIC;
REVOKE ALL ON TABLE seq_sentier FROM superbego;
GRANT ALL ON TABLE seq_sentier TO superbego;
GRANT ALL ON TABLE seq_sentier TO bego;


--
-- Name: seq_sommet; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_sommet FROM PUBLIC;
REVOKE ALL ON TABLE seq_sommet FROM superbego;
GRANT ALL ON TABLE seq_sommet TO superbego;
GRANT ALL ON TABLE seq_sommet TO bego;


--
-- Name: seq_torrent; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_torrent FROM PUBLIC;
REVOKE ALL ON TABLE seq_torrent FROM superbego;
GRANT ALL ON TABLE seq_torrent TO superbego;
GRANT ALL ON TABLE seq_torrent TO bego;


--
-- Name: seq_tourbiere; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_tourbiere FROM PUBLIC;
REVOKE ALL ON TABLE seq_tourbiere FROM superbego;
GRANT ALL ON TABLE seq_tourbiere TO superbego;
GRANT ALL ON TABLE seq_tourbiere TO bego;


--
-- Name: seq_vegetation; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE seq_vegetation FROM PUBLIC;
REVOKE ALL ON TABLE seq_vegetation FROM superbego;
GRANT ALL ON TABLE seq_vegetation TO superbego;
GRANT ALL ON TABLE seq_vegetation TO bego;


--
-- Name: sommet; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE sommet FROM PUBLIC;
REVOKE ALL ON TABLE sommet FROM superbego;
GRANT ALL ON TABLE sommet TO superbego;
GRANT ALL ON TABLE sommet TO bego;
GRANT SELECT ON TABLE sommet TO user_query;


--
-- Name: torrent; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE torrent FROM PUBLIC;
REVOKE ALL ON TABLE torrent FROM superbego;
GRANT ALL ON TABLE torrent TO superbego;
GRANT ALL ON TABLE torrent TO bego;
GRANT SELECT ON TABLE torrent TO user_query;


--
-- Name: tourbiere; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE tourbiere FROM PUBLIC;
REVOKE ALL ON TABLE tourbiere FROM superbego;
GRANT ALL ON TABLE tourbiere TO superbego;
GRANT ALL ON TABLE tourbiere TO bego;
GRANT SELECT ON TABLE tourbiere TO user_query;


--
-- Name: vegetation; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE vegetation FROM PUBLIC;
REVOKE ALL ON TABLE vegetation FROM superbego;
GRANT ALL ON TABLE vegetation TO superbego;
GRANT ALL ON TABLE vegetation TO bego;
GRANT SELECT ON TABLE vegetation TO user_query;


--
-- Name: zone; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE "zone" FROM PUBLIC;
REVOKE ALL ON TABLE "zone" FROM superbego;
GRANT ALL ON TABLE "zone" TO superbego;
GRANT ALL ON TABLE "zone" TO bego;
GRANT SELECT ON TABLE "zone" TO user_query;


--
-- Name: zone_acces; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_acces FROM PUBLIC;
REVOKE ALL ON TABLE zone_acces FROM superbego;
GRANT ALL ON TABLE zone_acces TO superbego;
GRANT ALL ON TABLE zone_acces TO bego;
GRANT SELECT ON TABLE zone_acces TO user_query;


--
-- Name: zone_col; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_col FROM PUBLIC;
REVOKE ALL ON TABLE zone_col FROM superbego;
GRANT ALL ON TABLE zone_col TO superbego;
GRANT ALL ON TABLE zone_col TO bego;
GRANT SELECT ON TABLE zone_col TO user_query;


--
-- Name: zone_eboulis; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_eboulis FROM PUBLIC;
REVOKE ALL ON TABLE zone_eboulis FROM superbego;
GRANT ALL ON TABLE zone_eboulis TO superbego;
GRANT ALL ON TABLE zone_eboulis TO bego;
GRANT SELECT ON TABLE zone_eboulis TO user_query;


--
-- Name: zone_glacier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_glacier FROM PUBLIC;
REVOKE ALL ON TABLE zone_glacier FROM superbego;
GRANT ALL ON TABLE zone_glacier TO superbego;
GRANT ALL ON TABLE zone_glacier TO bego;
GRANT SELECT ON TABLE zone_glacier TO user_query;


--
-- Name: zone_lac; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_lac FROM PUBLIC;
REVOKE ALL ON TABLE zone_lac FROM superbego;
GRANT ALL ON TABLE zone_lac TO superbego;
GRANT ALL ON TABLE zone_lac TO bego;
GRANT SELECT ON TABLE zone_lac TO user_query;


--
-- Name: zone_moraine; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_moraine FROM PUBLIC;
REVOKE ALL ON TABLE zone_moraine FROM superbego;
GRANT ALL ON TABLE zone_moraine TO superbego;
GRANT ALL ON TABLE zone_moraine TO bego;
GRANT SELECT ON TABLE zone_moraine TO user_query;


--
-- Name: zone_sentier; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_sentier FROM PUBLIC;
REVOKE ALL ON TABLE zone_sentier FROM superbego;
GRANT ALL ON TABLE zone_sentier TO superbego;
GRANT ALL ON TABLE zone_sentier TO bego;
GRANT SELECT ON TABLE zone_sentier TO user_query;


--
-- Name: zone_sommet; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_sommet FROM PUBLIC;
REVOKE ALL ON TABLE zone_sommet FROM superbego;
GRANT ALL ON TABLE zone_sommet TO superbego;
GRANT ALL ON TABLE zone_sommet TO bego;
GRANT SELECT ON TABLE zone_sommet TO user_query;


--
-- Name: zone_torrent; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_torrent FROM PUBLIC;
REVOKE ALL ON TABLE zone_torrent FROM superbego;
GRANT ALL ON TABLE zone_torrent TO superbego;
GRANT ALL ON TABLE zone_torrent TO bego;
GRANT SELECT ON TABLE zone_torrent TO user_query;


--
-- Name: zone_tourbiere; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_tourbiere FROM PUBLIC;
REVOKE ALL ON TABLE zone_tourbiere FROM superbego;
GRANT ALL ON TABLE zone_tourbiere TO superbego;
GRANT ALL ON TABLE zone_tourbiere TO bego;
GRANT SELECT ON TABLE zone_tourbiere TO user_query;


--
-- Name: zone_vegetation; Type: ACL; Schema: public; Owner: superbego
--

REVOKE ALL ON TABLE zone_vegetation FROM PUBLIC;
REVOKE ALL ON TABLE zone_vegetation FROM superbego;
GRANT ALL ON TABLE zone_vegetation TO superbego;
GRANT ALL ON TABLE zone_vegetation TO bego;
GRANT SELECT ON TABLE zone_vegetation TO user_query;


--
-- PostgreSQL database dump complete
--

