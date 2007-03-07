--
-- Selected TOC Entries:
--
\connect - postgres

--
-- TOC Entry ID 637 (OID 77256)
--
-- Name: "plpgsql_call_handler" () Type: FUNCTION Owner: postgres
--

CREATE FUNCTION "plpgsql_call_handler" () RETURNS opaque AS '/usr/lib/postgresql/lib/plpgsql.so', 'plpgsql_call_handler' LANGUAGE 'C';

--
-- TOC Entry ID 638 (OID 77257)
--
-- Name: plpgsql Type: PROCEDURAL LANGUAGE Owner: 
--

CREATE TRUSTED PROCEDURAL LANGUAGE 'plpgsql' HANDLER "plpgsql_call_handler" LANCOMPILER 'PL/pgSQL';

--
-- TOC Entry ID 6 (OID 7520322)
--
-- Name: requete Type: TABLE Owner: postgres
--

CREATE TABLE "requete" (
	"nomrequete" text NOT NULL,
	"coderequete" text,
	Constraint "requete_pkey" Primary Key ("nomrequete")
);

--
-- TOC Entry ID 7 (OID 7520328)
--
-- Name: controle_zone Type: TABLE Owner: postgres
--

CREATE TABLE "controle_zone" (
	"zone" text NOT NULL,
	"description" text,
	Constraint "controle_zone_pkey" Primary Key ("zone")
);

--
-- TOC Entry ID 8 (OID 7520328)
--
-- Name: controle_zone Type: ACL Owner: 
--

REVOKE ALL on "controle_zone" from PUBLIC;
GRANT ALL on "controle_zone" to "postgres";
GRANT ALL on "controle_zone" to "superkadagona";
GRANT SELECT on "controle_zone" to "kadagona";
GRANT ALL on "controle_zone" to "superchoukoutien";
GRANT SELECT on "controle_zone" to "choukoutien";
GRANT SELECT on "controle_zone" to "visiteurchoukoutien";

--
-- TOC Entry ID 9 (OID 7520334)
--
-- Name: controle_bis Type: TABLE Owner: postgres
--

CREATE TABLE "controle_bis" (
	"bis" text NOT NULL,
	"description" text,
	Constraint "controle_bis_pkey" Primary Key ("bis")
);

--
-- TOC Entry ID 10 (OID 7520334)
--
-- Name: controle_bis Type: ACL Owner: 
--

REVOKE ALL on "controle_bis" from PUBLIC;
GRANT SELECT on "controle_bis" to PUBLIC;
GRANT ALL on "controle_bis" to "postgres";
GRANT ALL on "controle_bis" to "superkadagona";
GRANT SELECT on "controle_bis" to "kadagona";
GRANT ALL on "controle_bis" to "superchoukoutien";
GRANT SELECT on "controle_bis" to "choukoutien";
GRANT SELECT on "controle_bis" to "visiteurchoukoutien";

--
-- TOC Entry ID 11 (OID 7520340)
--
-- Name: controle_locus Type: TABLE Owner: postgres
--

CREATE TABLE "controle_locus" (
	"locus" text NOT NULL,
	"description" text,
	Constraint "controle_locus_pkey" Primary Key ("locus")
);

--
-- TOC Entry ID 12 (OID 7520340)
--
-- Name: controle_locus Type: ACL Owner: 
--

REVOKE ALL on "controle_locus" from PUBLIC;
GRANT SELECT on "controle_locus" to PUBLIC;
GRANT ALL on "controle_locus" to "postgres";
GRANT ALL on "controle_locus" to "superkadagona";
GRANT SELECT on "controle_locus" to "kadagona";
GRANT ALL on "controle_locus" to "superchoukoutien";
GRANT SELECT on "controle_locus" to "choukoutien";
GRANT SELECT on "controle_locus" to "visiteurchoukoutien";

--
-- TOC Entry ID 13 (OID 7520346)
--
-- Name: controle_localite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_localite" (
	"localite" text NOT NULL,
	"description" text,
	Constraint "controle_localite_pkey" Primary Key ("localite")
);

--
-- TOC Entry ID 14 (OID 7520346)
--
-- Name: controle_localite Type: ACL Owner: 
--

REVOKE ALL on "controle_localite" from PUBLIC;
GRANT SELECT on "controle_localite" to PUBLIC;
GRANT ALL on "controle_localite" to "postgres";
GRANT ALL on "controle_localite" to "superkadagona";
GRANT SELECT on "controle_localite" to "kadagona";
GRANT ALL on "controle_localite" to "superchoukoutien";
GRANT SELECT on "controle_localite" to "choukoutien";
GRANT SELECT on "controle_localite" to "visiteurchoukoutien";

--
-- TOC Entry ID 15 (OID 7520352)
--
-- Name: controle_carre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_carre" (
	"carre" text NOT NULL,
	"description" text,
	Constraint "controle_carre_pkey" Primary Key ("carre")
);

--
-- TOC Entry ID 16 (OID 7520352)
--
-- Name: controle_carre Type: ACL Owner: 
--

REVOKE ALL on "controle_carre" from PUBLIC;
GRANT SELECT on "controle_carre" to PUBLIC;
GRANT ALL on "controle_carre" to "postgres";
GRANT ALL on "controle_carre" to "superkadagona";
GRANT SELECT on "controle_carre" to "kadagona";
GRANT ALL on "controle_carre" to "superchoukoutien";
GRANT SELECT on "controle_carre" to "choukoutien";
GRANT SELECT on "controle_carre" to "visiteurchoukoutien";

--
-- TOC Entry ID 17 (OID 7520358)
--
-- Name: controle_souscarre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_souscarre" (
	"souscarre" text NOT NULL,
	"description" text,
	Constraint "controle_souscarre_pkey" Primary Key ("souscarre")
);

--
-- TOC Entry ID 18 (OID 7520358)
--
-- Name: controle_souscarre Type: ACL Owner: 
--

REVOKE ALL on "controle_souscarre" from PUBLIC;
GRANT SELECT on "controle_souscarre" to PUBLIC;
GRANT ALL on "controle_souscarre" to "postgres";
GRANT ALL on "controle_souscarre" to "superkadagona";
GRANT SELECT on "controle_souscarre" to "kadagona";
GRANT ALL on "controle_souscarre" to "superchoukoutien";
GRANT SELECT on "controle_souscarre" to "choukoutien";
GRANT SELECT on "controle_souscarre" to "visiteurchoukoutien";

--
-- TOC Entry ID 19 (OID 7520364)
--
-- Name: controle_ensemble Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ensemble" (
	"ensemble" text NOT NULL,
	"description" text,
	Constraint "controle_ensemble_pkey" Primary Key ("ensemble")
);

--
-- TOC Entry ID 20 (OID 7520364)
--
-- Name: controle_ensemble Type: ACL Owner: 
--

REVOKE ALL on "controle_ensemble" from PUBLIC;
GRANT SELECT on "controle_ensemble" to PUBLIC;
GRANT ALL on "controle_ensemble" to "postgres";
GRANT ALL on "controle_ensemble" to "superkadagona";
GRANT SELECT on "controle_ensemble" to "kadagona";
GRANT ALL on "controle_ensemble" to "superchoukoutien";
GRANT SELECT on "controle_ensemble" to "choukoutien";
GRANT SELECT on "controle_ensemble" to "visiteurchoukoutien";

--
-- TOC Entry ID 21 (OID 7520370)
--
-- Name: controle_niveau Type: TABLE Owner: postgres
--

CREATE TABLE "controle_niveau" (
	"niveau" text NOT NULL,
	"description" text,
	Constraint "controle_niveau_pkey" Primary Key ("niveau")
);

--
-- TOC Entry ID 22 (OID 7520370)
--
-- Name: controle_niveau Type: ACL Owner: 
--

REVOKE ALL on "controle_niveau" from PUBLIC;
GRANT SELECT on "controle_niveau" to PUBLIC;
GRANT ALL on "controle_niveau" to "postgres";
GRANT ALL on "controle_niveau" to "superkadagona";
GRANT SELECT on "controle_niveau" to "kadagona";
GRANT ALL on "controle_niveau" to "superchoukoutien";
GRANT SELECT on "controle_niveau" to "choukoutien";
GRANT SELECT on "controle_niveau" to "visiteurchoukoutien";

--
-- TOC Entry ID 23 (OID 7520376)
--
-- Name: controle_sol Type: TABLE Owner: postgres
--

CREATE TABLE "controle_sol" (
	"sol" text NOT NULL,
	"description" text,
	Constraint "controle_sol_pkey" Primary Key ("sol")
);

--
-- TOC Entry ID 24 (OID 7520376)
--
-- Name: controle_sol Type: ACL Owner: 
--

REVOKE ALL on "controle_sol" from PUBLIC;
GRANT SELECT on "controle_sol" to PUBLIC;
GRANT ALL on "controle_sol" to "postgres";
GRANT ALL on "controle_sol" to "superkadagona";
GRANT SELECT on "controle_sol" to "kadagona";
GRANT ALL on "controle_sol" to "superchoukoutien";
GRANT SELECT on "controle_sol" to "choukoutien";
GRANT SELECT on "controle_sol" to "visiteurchoukoutien";

--
-- TOC Entry ID 25 (OID 7520382)
--
-- Name: controle_nature Type: TABLE Owner: postgres
--

CREATE TABLE "controle_nature" (
	"nature" text NOT NULL,
	"description" text,
	Constraint "controle_nature_pkey" Primary Key ("nature")
);

--
-- TOC Entry ID 26 (OID 7520382)
--
-- Name: controle_nature Type: ACL Owner: 
--

REVOKE ALL on "controle_nature" from PUBLIC;
GRANT SELECT on "controle_nature" to PUBLIC;
GRANT ALL on "controle_nature" to "postgres";
GRANT ALL on "controle_nature" to "superkadagona";
GRANT SELECT on "controle_nature" to "kadagona";
GRANT ALL on "controle_nature" to "superchoukoutien";
GRANT SELECT on "controle_nature" to "choukoutien";
GRANT SELECT on "controle_nature" to "visiteurchoukoutien";

--
-- TOC Entry ID 27 (OID 7520388)
--
-- Name: controle_orientation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_orientation" (
	"orientation" text NOT NULL,
	"description" text,
	Constraint "controle_orientation_pkey" Primary Key ("orientation")
);

--
-- TOC Entry ID 28 (OID 7520388)
--
-- Name: controle_orientation Type: ACL Owner: 
--

REVOKE ALL on "controle_orientation" from PUBLIC;
GRANT SELECT on "controle_orientation" to PUBLIC;
GRANT ALL on "controle_orientation" to "postgres";
GRANT ALL on "controle_orientation" to "superkadagona";
GRANT SELECT on "controle_orientation" to "kadagona";
GRANT ALL on "controle_orientation" to "superchoukoutien";
GRANT SELECT on "controle_orientation" to "choukoutien";
GRANT SELECT on "controle_orientation" to "visiteurchoukoutien";

--
-- TOC Entry ID 29 (OID 7520394)
--
-- Name: controle_pendage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_pendage" (
	"pendage" text NOT NULL,
	"description" text,
	Constraint "controle_pendage_pkey" Primary Key ("pendage")
);

--
-- TOC Entry ID 30 (OID 7520394)
--
-- Name: controle_pendage Type: ACL Owner: 
--

REVOKE ALL on "controle_pendage" from PUBLIC;
GRANT SELECT on "controle_pendage" to PUBLIC;
GRANT ALL on "controle_pendage" to "postgres";
GRANT ALL on "controle_pendage" to "superkadagona";
GRANT SELECT on "controle_pendage" to "kadagona";
GRANT ALL on "controle_pendage" to "superchoukoutien";
GRANT SELECT on "controle_pendage" to "choukoutien";
GRANT SELECT on "controle_pendage" to "visiteurchoukoutien";

--
-- TOC Entry ID 31 (OID 7520400)
--
-- Name: controle_vers Type: TABLE Owner: postgres
--

CREATE TABLE "controle_vers" (
	"vers" text NOT NULL,
	"description" text,
	Constraint "controle_vers_pkey" Primary Key ("vers")
);

--
-- TOC Entry ID 32 (OID 7520400)
--
-- Name: controle_vers Type: ACL Owner: 
--

REVOKE ALL on "controle_vers" from PUBLIC;
GRANT SELECT on "controle_vers" to PUBLIC;
GRANT ALL on "controle_vers" to "postgres";
GRANT ALL on "controle_vers" to "superkadagona";
GRANT SELECT on "controle_vers" to "kadagona";
GRANT ALL on "controle_vers" to "superchoukoutien";
GRANT SELECT on "controle_vers" to "choukoutien";
GRANT SELECT on "controle_vers" to "visiteurchoukoutien";

--
-- TOC Entry ID 33 (OID 7520406)
--
-- Name: carnet Type: TABLE Owner: postgres
--

CREATE TABLE "carnet" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"locus" text,
	"localite" text,
	"carre" text,
	"souscarre" text,
	"ensemble" text,
	"niveau" text,
	"sol" text,
	"couche" text,
	"foyer" text,
	"nature" text,
	"nofouille" integer,
	"nomusee" integer,
	"nosopi" integer,
	"x" integer,
	"y" integer,
	"zrelatif" real,
	"zreference" real,
	"zabsolu" real,
	"orientation" text,
	"pendage" text,
	"vers" text,
	"longueur" integer,
	"largeur" integer,
	"epaisseur" integer,
	"trouve" date,
	"saisie" date DEFAULT date('now'::text),
	"latitude" text,
	"longitude" text,
	"responsable_fouille" text,
	Constraint "carnet_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 34 (OID 7520406)
--
-- Name: carnet Type: ACL Owner: 
--

REVOKE ALL on "carnet" from PUBLIC;
GRANT SELECT on "carnet" to PUBLIC;
GRANT ALL on "carnet" to "postgres";
GRANT ALL on "carnet" to "superkadagona";
GRANT SELECT on "carnet" to "visiteurkadagona";
GRANT ALL on "carnet" to "kadagona";
GRANT ALL on "carnet" to "superchoukoutien";
GRANT ALL on "carnet" to "choukoutien";
GRANT SELECT on "carnet" to "visiteurchoukoutien";

--
-- TOC Entry ID 35 (OID 7520412)
--
-- Name: faune Type: TABLE Owner: postgres
--

CREATE TABLE "faune" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"f_longueur" integer,
	"f_largeur" integer,
	"f_epaisseur" integer,
	"f_poids" integer,
	"f_ancien_oss" text,
	"f_classe" text,
	"f_ordre" text,
	"f_famille" text,
	"f_ssfamille" text,
	"f_genre" text,
	"f_espece" text,
	"f_ssespece" text,
	"f_typos1" text,
	"f_typos2" text,
	"f_typos3" text,
	"f_typos4" text,
	"f_typos5" text,
	"f_typos6" text,
	"f_lateralite" text,
	"f_sexe" text,
	"f_agecl" text,
	"f_agest" text,
	"f_epins" text,
	"f_stserie" text,
	"f_stdent" text,
	"f_taille" text,
	"f_association" integer,
	"f_pathologie" text,
	"f_description" text,
	"f_fragge" text,
	"f_fragde" text,
	"f_sauvefrag" text,
	"f_couleur" text,
	"f_caltype" text,
	"f_calcouleur" text,
	"f_concretion" text,
	"f_oxyde" text,
	"f_coraspect" text,
	"f_corfissure" text,
	"f_trace" text,
	"f_fossilisation" text,
	"f_tissu" text,
	"f_typedos" text,
	"f_ilongueur" text,
	"f_icirconference" text,
	"f_eclat" text,
	"f_agent" text,
	"f_photo" text,
	"f_dessin" text,
	"f_traitement" text,
	"f_datation" text,
	"f_moulage" text,
	"f_conservation" text,
	"f_restauration" text,
	"f_coprolithe" text,
	"f_pelote" text,
	"f_saisie" date DEFAULT date('now'::text),
	"f_reference" text,
	"f_complement" text,
	"responsable" text,
	"controle_f_ancien_oss" text,
	"f_responsable" text,
	"f_affgenre" text,
	"f_affespece" text,
	Constraint "faune_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 36 (OID 7520412)
--
-- Name: faune Type: ACL Owner: 
--

REVOKE ALL on "faune" from PUBLIC;
GRANT SELECT on "faune" to PUBLIC;
GRANT ALL on "faune" to "postgres";
GRANT ALL on "faune" to "superkadagona";
GRANT SELECT on "faune" to "visiteurkadagona";
GRANT ALL on "faune" to "kadagona";
GRANT ALL on "faune" to "superchoukoutien";
GRANT ALL on "faune" to "choukoutien";
GRANT SELECT on "faune" to "visiteurchoukoutien";

--
-- TOC Entry ID 37 (OID 7520418)
--
-- Name: remonte_genre Type: TABLE Owner: postgres
--

CREATE TABLE "remonte_genre" (
	"genre" text NOT NULL,
	"famille" text,
	"ordre" text,
	"classe" text,
	Constraint "remonte_genre_pkey" Primary Key ("genre")
);

--
-- TOC Entry ID 38 (OID 7520418)
--
-- Name: remonte_genre Type: ACL Owner: 
--

REVOKE ALL on "remonte_genre" from PUBLIC;
GRANT SELECT on "remonte_genre" to PUBLIC;
GRANT ALL on "remonte_genre" to "postgres";
GRANT ALL on "remonte_genre" to "superkadagona";
GRANT SELECT on "remonte_genre" to "visiteurkadagona";
GRANT ALL on "remonte_genre" to "kadagona";
GRANT ALL on "remonte_genre" to "superchoukoutien";
GRANT ALL on "remonte_genre" to "choukoutien";
GRANT SELECT on "remonte_genre" to "visiteurchoukoutien";

--
-- TOC Entry ID 39 (OID 7520424)
--
-- Name: remonte_famille Type: TABLE Owner: postgres
--

CREATE TABLE "remonte_famille" (
	"famille" text NOT NULL,
	"ordre" text,
	"classe" text,
	Constraint "remonte_famille_pkey" Primary Key ("famille")
);

--
-- TOC Entry ID 40 (OID 7520424)
--
-- Name: remonte_famille Type: ACL Owner: 
--

REVOKE ALL on "remonte_famille" from PUBLIC;
GRANT SELECT on "remonte_famille" to PUBLIC;
GRANT ALL on "remonte_famille" to "postgres";
GRANT ALL on "remonte_famille" to "superkadagona";
GRANT SELECT on "remonte_famille" to "visiteurkadagona";
GRANT ALL on "remonte_famille" to "kadagona";
GRANT ALL on "remonte_famille" to "superchoukoutien";
GRANT ALL on "remonte_famille" to "choukoutien";
GRANT SELECT on "remonte_famille" to "visiteurchoukoutien";

--
-- TOC Entry ID 41 (OID 7520430)
--
-- Name: remonte_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "remonte_ordre" (
	"ordre" text NOT NULL,
	"classe" text,
	Constraint "remonte_ordre_pkey" Primary Key ("ordre")
);

--
-- TOC Entry ID 42 (OID 7520430)
--
-- Name: remonte_ordre Type: ACL Owner: 
--

REVOKE ALL on "remonte_ordre" from PUBLIC;
GRANT SELECT on "remonte_ordre" to PUBLIC;
GRANT ALL on "remonte_ordre" to "postgres";
GRANT ALL on "remonte_ordre" to "superkadagona";
GRANT SELECT on "remonte_ordre" to "visiteurkadagona";
GRANT ALL on "remonte_ordre" to "kadagona";
GRANT ALL on "remonte_ordre" to "superchoukoutien";
GRANT ALL on "remonte_ordre" to "choukoutien";
GRANT SELECT on "remonte_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 43 (OID 7520436)
--
-- Name: controle_f_classe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_classe" (
	"f_classe" text NOT NULL,
	"description" text,
	Constraint "controle_f_classe_pkey" Primary Key ("f_classe")
);

--
-- TOC Entry ID 44 (OID 7520436)
--
-- Name: controle_f_classe Type: ACL Owner: 
--

REVOKE ALL on "controle_f_classe" from PUBLIC;
GRANT SELECT on "controle_f_classe" to PUBLIC;
GRANT ALL on "controle_f_classe" to "postgres";
GRANT ALL on "controle_f_classe" to "superkadagona";
GRANT SELECT on "controle_f_classe" to "kadagona";
GRANT ALL on "controle_f_classe" to "superchoukoutien";
GRANT SELECT on "controle_f_classe" to "choukoutien";
GRANT SELECT on "controle_f_classe" to "visiteurchoukoutien";

--
-- TOC Entry ID 45 (OID 7520442)
--
-- Name: controle_f_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_ordre" (
	"f_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_f_ordre_pkey" Primary Key ("f_ordre")
);

--
-- TOC Entry ID 46 (OID 7520442)
--
-- Name: controle_f_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_f_ordre" from PUBLIC;
GRANT SELECT on "controle_f_ordre" to PUBLIC;
GRANT ALL on "controle_f_ordre" to "postgres";
GRANT ALL on "controle_f_ordre" to "superkadagona";
GRANT SELECT on "controle_f_ordre" to "kadagona";
GRANT ALL on "controle_f_ordre" to "superchoukoutien";
GRANT SELECT on "controle_f_ordre" to "choukoutien";
GRANT SELECT on "controle_f_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 47 (OID 7520448)
--
-- Name: controle_f_famille Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_famille" (
	"f_famille" text NOT NULL,
	"description" text,
	Constraint "controle_f_famille_pkey" Primary Key ("f_famille")
);

--
-- TOC Entry ID 48 (OID 7520448)
--
-- Name: controle_f_famille Type: ACL Owner: 
--

REVOKE ALL on "controle_f_famille" from PUBLIC;
GRANT SELECT on "controle_f_famille" to PUBLIC;
GRANT ALL on "controle_f_famille" to "postgres";
GRANT ALL on "controle_f_famille" to "superkadagona";
GRANT SELECT on "controle_f_famille" to "kadagona";
GRANT ALL on "controle_f_famille" to "superchoukoutien";
GRANT SELECT on "controle_f_famille" to "choukoutien";
GRANT SELECT on "controle_f_famille" to "visiteurchoukoutien";

--
-- TOC Entry ID 49 (OID 7520454)
--
-- Name: controle_f_ssfamille Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_ssfamille" (
	"f_ssfamille" text NOT NULL,
	"description" text,
	Constraint "controle_f_ssfamille_pkey" Primary Key ("f_ssfamille")
);

--
-- TOC Entry ID 50 (OID 7520454)
--
-- Name: controle_f_ssfamille Type: ACL Owner: 
--

REVOKE ALL on "controle_f_ssfamille" from PUBLIC;
GRANT SELECT on "controle_f_ssfamille" to PUBLIC;
GRANT ALL on "controle_f_ssfamille" to "postgres";
GRANT ALL on "controle_f_ssfamille" to "superkadagona";
GRANT SELECT on "controle_f_ssfamille" to "kadagona";
GRANT ALL on "controle_f_ssfamille" to "superchoukoutien";
GRANT SELECT on "controle_f_ssfamille" to "choukoutien";
GRANT SELECT on "controle_f_ssfamille" to "visiteurchoukoutien";

--
-- TOC Entry ID 51 (OID 7520460)
--
-- Name: controle_f_genre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_genre" (
	"f_genre" text NOT NULL,
	"description" text,
	Constraint "controle_f_genre_pkey" Primary Key ("f_genre")
);

--
-- TOC Entry ID 52 (OID 7520460)
--
-- Name: controle_f_genre Type: ACL Owner: 
--

REVOKE ALL on "controle_f_genre" from PUBLIC;
GRANT SELECT on "controle_f_genre" to PUBLIC;
GRANT ALL on "controle_f_genre" to "postgres";
GRANT ALL on "controle_f_genre" to "superkadagona";
GRANT SELECT on "controle_f_genre" to "kadagona";
GRANT ALL on "controle_f_genre" to "superchoukoutien";
GRANT SELECT on "controle_f_genre" to "choukoutien";
GRANT SELECT on "controle_f_genre" to "visiteurchoukoutien";

--
-- TOC Entry ID 53 (OID 7520466)
--
-- Name: controle_f_espece Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_espece" (
	"f_espece" text NOT NULL,
	"description" text,
	Constraint "controle_f_espece_pkey" Primary Key ("f_espece")
);

--
-- TOC Entry ID 54 (OID 7520466)
--
-- Name: controle_f_espece Type: ACL Owner: 
--

REVOKE ALL on "controle_f_espece" from PUBLIC;
GRANT SELECT on "controle_f_espece" to PUBLIC;
GRANT ALL on "controle_f_espece" to "postgres";
GRANT ALL on "controle_f_espece" to "superkadagona";
GRANT SELECT on "controle_f_espece" to "kadagona";
GRANT ALL on "controle_f_espece" to "superchoukoutien";
GRANT SELECT on "controle_f_espece" to "choukoutien";
GRANT SELECT on "controle_f_espece" to "visiteurchoukoutien";

--
-- TOC Entry ID 55 (OID 7520472)
--
-- Name: controle_f_ssespece Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_ssespece" (
	"f_ssespece" text NOT NULL,
	"description" text,
	Constraint "controle_f_ssespece_pkey" Primary Key ("f_ssespece")
);

--
-- TOC Entry ID 56 (OID 7520472)
--
-- Name: controle_f_ssespece Type: ACL Owner: 
--

REVOKE ALL on "controle_f_ssespece" from PUBLIC;
GRANT SELECT on "controle_f_ssespece" to PUBLIC;
GRANT ALL on "controle_f_ssespece" to "postgres";
GRANT ALL on "controle_f_ssespece" to "superkadagona";
GRANT SELECT on "controle_f_ssespece" to "kadagona";
GRANT ALL on "controle_f_ssespece" to "superchoukoutien";
GRANT SELECT on "controle_f_ssespece" to "choukoutien";
GRANT SELECT on "controle_f_ssespece" to "visiteurchoukoutien";

--
-- TOC Entry ID 57 (OID 7520478)
--
-- Name: controle_f_typos1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos1" (
	"f_typos1" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos1_pkey" Primary Key ("f_typos1")
);

--
-- TOC Entry ID 58 (OID 7520478)
--
-- Name: controle_f_typos1 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos1" from PUBLIC;
GRANT SELECT on "controle_f_typos1" to PUBLIC;
GRANT ALL on "controle_f_typos1" to "postgres";
GRANT ALL on "controle_f_typos1" to "superkadagona";
GRANT SELECT on "controle_f_typos1" to "kadagona";
GRANT ALL on "controle_f_typos1" to "superchoukoutien";
GRANT SELECT on "controle_f_typos1" to "choukoutien";
GRANT SELECT on "controle_f_typos1" to "visiteurchoukoutien";

--
-- TOC Entry ID 59 (OID 7520484)
--
-- Name: controle_f_typos2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos2" (
	"f_typos2" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos2_pkey" Primary Key ("f_typos2")
);

--
-- TOC Entry ID 60 (OID 7520484)
--
-- Name: controle_f_typos2 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos2" from PUBLIC;
GRANT SELECT on "controle_f_typos2" to PUBLIC;
GRANT ALL on "controle_f_typos2" to "postgres";
GRANT ALL on "controle_f_typos2" to "superkadagona";
GRANT SELECT on "controle_f_typos2" to "kadagona";
GRANT ALL on "controle_f_typos2" to "superchoukoutien";
GRANT SELECT on "controle_f_typos2" to "choukoutien";
GRANT SELECT on "controle_f_typos2" to "visiteurchoukoutien";

--
-- TOC Entry ID 61 (OID 7520490)
--
-- Name: controle_f_typos3 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos3" (
	"f_typos3" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos3_pkey" Primary Key ("f_typos3")
);

--
-- TOC Entry ID 62 (OID 7520490)
--
-- Name: controle_f_typos3 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos3" from PUBLIC;
GRANT SELECT on "controle_f_typos3" to PUBLIC;
GRANT ALL on "controle_f_typos3" to "postgres";
GRANT ALL on "controle_f_typos3" to "superkadagona";
GRANT SELECT on "controle_f_typos3" to "kadagona";
GRANT ALL on "controle_f_typos3" to "superchoukoutien";
GRANT SELECT on "controle_f_typos3" to "choukoutien";
GRANT SELECT on "controle_f_typos3" to "visiteurchoukoutien";

--
-- TOC Entry ID 63 (OID 7520496)
--
-- Name: controle_f_typos4 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos4" (
	"f_typos4" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos4_pkey" Primary Key ("f_typos4")
);

--
-- TOC Entry ID 64 (OID 7520496)
--
-- Name: controle_f_typos4 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos4" from PUBLIC;
GRANT SELECT on "controle_f_typos4" to PUBLIC;
GRANT ALL on "controle_f_typos4" to "postgres";
GRANT ALL on "controle_f_typos4" to "superkadagona";
GRANT SELECT on "controle_f_typos4" to "kadagona";
GRANT ALL on "controle_f_typos4" to "superchoukoutien";
GRANT SELECT on "controle_f_typos4" to "choukoutien";
GRANT SELECT on "controle_f_typos4" to "visiteurchoukoutien";

--
-- TOC Entry ID 65 (OID 7520502)
--
-- Name: controle_f_typos5 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos5" (
	"f_typos5" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos5_pkey" Primary Key ("f_typos5")
);

--
-- TOC Entry ID 66 (OID 7520502)
--
-- Name: controle_f_typos5 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos5" from PUBLIC;
GRANT SELECT on "controle_f_typos5" to PUBLIC;
GRANT ALL on "controle_f_typos5" to "postgres";
GRANT ALL on "controle_f_typos5" to "superkadagona";
GRANT SELECT on "controle_f_typos5" to "kadagona";
GRANT ALL on "controle_f_typos5" to "superchoukoutien";
GRANT SELECT on "controle_f_typos5" to "choukoutien";
GRANT SELECT on "controle_f_typos5" to "visiteurchoukoutien";

--
-- TOC Entry ID 67 (OID 7520508)
--
-- Name: controle_f_typos6 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typos6" (
	"f_typos6" text NOT NULL,
	"description" text,
	Constraint "controle_f_typos6_pkey" Primary Key ("f_typos6")
);

--
-- TOC Entry ID 68 (OID 7520508)
--
-- Name: controle_f_typos6 Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typos6" from PUBLIC;
GRANT SELECT on "controle_f_typos6" to PUBLIC;
GRANT ALL on "controle_f_typos6" to "postgres";
GRANT ALL on "controle_f_typos6" to "superkadagona";
GRANT SELECT on "controle_f_typos6" to "kadagona";
GRANT ALL on "controle_f_typos6" to "superchoukoutien";
GRANT SELECT on "controle_f_typos6" to "choukoutien";
GRANT SELECT on "controle_f_typos6" to "visiteurchoukoutien";

--
-- TOC Entry ID 69 (OID 7520514)
--
-- Name: controle_f_lateralite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_lateralite" (
	"f_lateralite" text NOT NULL,
	"description" text,
	Constraint "controle_f_lateralite_pkey" Primary Key ("f_lateralite")
);

--
-- TOC Entry ID 70 (OID 7520514)
--
-- Name: controle_f_lateralite Type: ACL Owner: 
--

REVOKE ALL on "controle_f_lateralite" from PUBLIC;
GRANT SELECT on "controle_f_lateralite" to PUBLIC;
GRANT ALL on "controle_f_lateralite" to "postgres";
GRANT ALL on "controle_f_lateralite" to "superkadagona";
GRANT SELECT on "controle_f_lateralite" to "kadagona";
GRANT ALL on "controle_f_lateralite" to "superchoukoutien";
GRANT SELECT on "controle_f_lateralite" to "choukoutien";
GRANT SELECT on "controle_f_lateralite" to "visiteurchoukoutien";

--
-- TOC Entry ID 71 (OID 7520520)
--
-- Name: controle_f_sexe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_sexe" (
	"f_sexe" text NOT NULL,
	"description" text,
	Constraint "controle_f_sexe_pkey" Primary Key ("f_sexe")
);

--
-- TOC Entry ID 72 (OID 7520520)
--
-- Name: controle_f_sexe Type: ACL Owner: 
--

REVOKE ALL on "controle_f_sexe" from PUBLIC;
GRANT SELECT on "controle_f_sexe" to PUBLIC;
GRANT ALL on "controle_f_sexe" to "postgres";
GRANT ALL on "controle_f_sexe" to "superkadagona";
GRANT SELECT on "controle_f_sexe" to "kadagona";
GRANT ALL on "controle_f_sexe" to "superchoukoutien";
GRANT SELECT on "controle_f_sexe" to "choukoutien";
GRANT SELECT on "controle_f_sexe" to "visiteurchoukoutien";

--
-- TOC Entry ID 73 (OID 7520526)
--
-- Name: controle_f_agecl Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_agecl" (
	"f_agecl" text NOT NULL,
	"description" text,
	Constraint "controle_f_agecl_pkey" Primary Key ("f_agecl")
);

--
-- TOC Entry ID 74 (OID 7520526)
--
-- Name: controle_f_agecl Type: ACL Owner: 
--

REVOKE ALL on "controle_f_agecl" from PUBLIC;
GRANT SELECT on "controle_f_agecl" to PUBLIC;
GRANT ALL on "controle_f_agecl" to "postgres";
GRANT ALL on "controle_f_agecl" to "superkadagona";
GRANT SELECT on "controle_f_agecl" to "kadagona";
GRANT ALL on "controle_f_agecl" to "superchoukoutien";
GRANT SELECT on "controle_f_agecl" to "choukoutien";
GRANT SELECT on "controle_f_agecl" to "visiteurchoukoutien";

--
-- TOC Entry ID 75 (OID 7520532)
--
-- Name: controle_f_agest Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_agest" (
	"f_agest" text NOT NULL,
	"description" text,
	Constraint "controle_f_agest_pkey" Primary Key ("f_agest")
);

--
-- TOC Entry ID 76 (OID 7520532)
--
-- Name: controle_f_agest Type: ACL Owner: 
--

REVOKE ALL on "controle_f_agest" from PUBLIC;
GRANT SELECT on "controle_f_agest" to PUBLIC;
GRANT ALL on "controle_f_agest" to "postgres";
GRANT ALL on "controle_f_agest" to "superkadagona";
GRANT SELECT on "controle_f_agest" to "kadagona";
GRANT ALL on "controle_f_agest" to "superchoukoutien";
GRANT SELECT on "controle_f_agest" to "choukoutien";
GRANT SELECT on "controle_f_agest" to "visiteurchoukoutien";

--
-- TOC Entry ID 77 (OID 7520538)
--
-- Name: controle_f_stserie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_stserie" (
	"f_stserie" text NOT NULL,
	"description" text,
	Constraint "controle_f_stserie_pkey" Primary Key ("f_stserie")
);

--
-- TOC Entry ID 78 (OID 7520538)
--
-- Name: controle_f_stserie Type: ACL Owner: 
--

REVOKE ALL on "controle_f_stserie" from PUBLIC;
GRANT SELECT on "controle_f_stserie" to PUBLIC;
GRANT ALL on "controle_f_stserie" to "postgres";
GRANT ALL on "controle_f_stserie" to "superkadagona";
GRANT SELECT on "controle_f_stserie" to "kadagona";
GRANT ALL on "controle_f_stserie" to "superchoukoutien";
GRANT SELECT on "controle_f_stserie" to "choukoutien";
GRANT SELECT on "controle_f_stserie" to "visiteurchoukoutien";

--
-- TOC Entry ID 79 (OID 7520544)
--
-- Name: controle_f_stdent Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_stdent" (
	"f_stdent" text NOT NULL,
	"description" text,
	Constraint "controle_f_stdent_pkey" Primary Key ("f_stdent")
);

--
-- TOC Entry ID 80 (OID 7520544)
--
-- Name: controle_f_stdent Type: ACL Owner: 
--

REVOKE ALL on "controle_f_stdent" from PUBLIC;
GRANT SELECT on "controle_f_stdent" to PUBLIC;
GRANT ALL on "controle_f_stdent" to "postgres";
GRANT ALL on "controle_f_stdent" to "superkadagona";
GRANT SELECT on "controle_f_stdent" to "kadagona";
GRANT ALL on "controle_f_stdent" to "superchoukoutien";
GRANT SELECT on "controle_f_stdent" to "choukoutien";
GRANT SELECT on "controle_f_stdent" to "visiteurchoukoutien";

--
-- TOC Entry ID 81 (OID 7520550)
--
-- Name: controle_f_taille Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_taille" (
	"f_taille" text NOT NULL,
	"description" text,
	Constraint "controle_f_taille_pkey" Primary Key ("f_taille")
);

--
-- TOC Entry ID 82 (OID 7520550)
--
-- Name: controle_f_taille Type: ACL Owner: 
--

REVOKE ALL on "controle_f_taille" from PUBLIC;
GRANT SELECT on "controle_f_taille" to PUBLIC;
GRANT ALL on "controle_f_taille" to "postgres";
GRANT ALL on "controle_f_taille" to "superkadagona";
GRANT SELECT on "controle_f_taille" to "kadagona";
GRANT ALL on "controle_f_taille" to "superchoukoutien";
GRANT SELECT on "controle_f_taille" to "choukoutien";
GRANT SELECT on "controle_f_taille" to "visiteurchoukoutien";

--
-- TOC Entry ID 83 (OID 7520556)
--
-- Name: controle_f_association Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_association" (
	"f_association" text NOT NULL,
	"description" text,
	Constraint "controle_f_association_pkey" Primary Key ("f_association")
);

--
-- TOC Entry ID 84 (OID 7520556)
--
-- Name: controle_f_association Type: ACL Owner: 
--

REVOKE ALL on "controle_f_association" from PUBLIC;
GRANT SELECT on "controle_f_association" to PUBLIC;
GRANT ALL on "controle_f_association" to "postgres";
GRANT ALL on "controle_f_association" to "superkadagona";
GRANT SELECT on "controle_f_association" to "kadagona";
GRANT ALL on "controle_f_association" to "superchoukoutien";
GRANT SELECT on "controle_f_association" to "choukoutien";
GRANT SELECT on "controle_f_association" to "visiteurchoukoutien";

--
-- TOC Entry ID 85 (OID 7520562)
--
-- Name: controle_f_pathologie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_pathologie" (
	"f_pathologie" text NOT NULL,
	"description" text,
	Constraint "controle_f_pathologie_pkey" Primary Key ("f_pathologie")
);

--
-- TOC Entry ID 86 (OID 7520562)
--
-- Name: controle_f_pathologie Type: ACL Owner: 
--

REVOKE ALL on "controle_f_pathologie" from PUBLIC;
GRANT SELECT on "controle_f_pathologie" to PUBLIC;
GRANT ALL on "controle_f_pathologie" to "postgres";
GRANT ALL on "controle_f_pathologie" to "superkadagona";
GRANT SELECT on "controle_f_pathologie" to "kadagona";
GRANT ALL on "controle_f_pathologie" to "superchoukoutien";
GRANT SELECT on "controle_f_pathologie" to "choukoutien";
GRANT SELECT on "controle_f_pathologie" to "visiteurchoukoutien";

--
-- TOC Entry ID 87 (OID 7520568)
--
-- Name: controle_f_description Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_description" (
	"f_description" text NOT NULL,
	"description" text,
	Constraint "controle_f_description_pkey" Primary Key ("f_description")
);

--
-- TOC Entry ID 88 (OID 7520568)
--
-- Name: controle_f_description Type: ACL Owner: 
--

REVOKE ALL on "controle_f_description" from PUBLIC;
GRANT SELECT on "controle_f_description" to PUBLIC;
GRANT ALL on "controle_f_description" to "postgres";
GRANT ALL on "controle_f_description" to "superkadagona";
GRANT SELECT on "controle_f_description" to "kadagona";
GRANT ALL on "controle_f_description" to "superchoukoutien";
GRANT SELECT on "controle_f_description" to "choukoutien";
GRANT SELECT on "controle_f_description" to "visiteurchoukoutien";

--
-- TOC Entry ID 89 (OID 7520574)
--
-- Name: controle_f_fragge Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_fragge" (
	"f_fragge" text NOT NULL,
	"description" text,
	Constraint "controle_f_fragge_pkey" Primary Key ("f_fragge")
);

--
-- TOC Entry ID 90 (OID 7520574)
--
-- Name: controle_f_fragge Type: ACL Owner: 
--

REVOKE ALL on "controle_f_fragge" from PUBLIC;
GRANT SELECT on "controle_f_fragge" to PUBLIC;
GRANT ALL on "controle_f_fragge" to "postgres";
GRANT ALL on "controle_f_fragge" to "superkadagona";
GRANT SELECT on "controle_f_fragge" to "kadagona";
GRANT ALL on "controle_f_fragge" to "superchoukoutien";
GRANT SELECT on "controle_f_fragge" to "choukoutien";
GRANT SELECT on "controle_f_fragge" to "visiteurchoukoutien";

--
-- TOC Entry ID 91 (OID 7520580)
--
-- Name: controle_f_fragde Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_fragde" (
	"f_fragde" text NOT NULL,
	"description" text,
	Constraint "controle_f_fragde_pkey" Primary Key ("f_fragde")
);

--
-- TOC Entry ID 92 (OID 7520580)
--
-- Name: controle_f_fragde Type: ACL Owner: 
--

REVOKE ALL on "controle_f_fragde" from PUBLIC;
GRANT SELECT on "controle_f_fragde" to PUBLIC;
GRANT ALL on "controle_f_fragde" to "postgres";
GRANT ALL on "controle_f_fragde" to "superkadagona";
GRANT SELECT on "controle_f_fragde" to "kadagona";
GRANT ALL on "controle_f_fragde" to "superchoukoutien";
GRANT SELECT on "controle_f_fragde" to "choukoutien";
GRANT SELECT on "controle_f_fragde" to "visiteurchoukoutien";

--
-- TOC Entry ID 93 (OID 7520586)
--
-- Name: controle_f_sauvefrag Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_sauvefrag" (
	"f_sauvefrag" text NOT NULL,
	"description" text,
	Constraint "controle_f_sauvefrag_pkey" Primary Key ("f_sauvefrag")
);

--
-- TOC Entry ID 94 (OID 7520586)
--
-- Name: controle_f_sauvefrag Type: ACL Owner: 
--

REVOKE ALL on "controle_f_sauvefrag" from PUBLIC;
GRANT SELECT on "controle_f_sauvefrag" to PUBLIC;
GRANT ALL on "controle_f_sauvefrag" to "postgres";
GRANT ALL on "controle_f_sauvefrag" to "superkadagona";
GRANT SELECT on "controle_f_sauvefrag" to "kadagona";
GRANT ALL on "controle_f_sauvefrag" to "superchoukoutien";
GRANT SELECT on "controle_f_sauvefrag" to "choukoutien";
GRANT SELECT on "controle_f_sauvefrag" to "visiteurchoukoutien";

--
-- TOC Entry ID 95 (OID 7520592)
--
-- Name: controle_f_couleur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_couleur" (
	"f_couleur" text NOT NULL,
	"description" text,
	Constraint "controle_f_couleur_pkey" Primary Key ("f_couleur")
);

--
-- TOC Entry ID 96 (OID 7520592)
--
-- Name: controle_f_couleur Type: ACL Owner: 
--

REVOKE ALL on "controle_f_couleur" from PUBLIC;
GRANT SELECT on "controle_f_couleur" to PUBLIC;
GRANT ALL on "controle_f_couleur" to "postgres";
GRANT ALL on "controle_f_couleur" to "superkadagona";
GRANT SELECT on "controle_f_couleur" to "kadagona";
GRANT ALL on "controle_f_couleur" to "superchoukoutien";
GRANT SELECT on "controle_f_couleur" to "choukoutien";
GRANT SELECT on "controle_f_couleur" to "visiteurchoukoutien";

--
-- TOC Entry ID 97 (OID 7520598)
--
-- Name: controle_f_caltype Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_caltype" (
	"f_caltype" text NOT NULL,
	"description" text,
	Constraint "controle_f_caltype_pkey" Primary Key ("f_caltype")
);

--
-- TOC Entry ID 98 (OID 7520598)
--
-- Name: controle_f_caltype Type: ACL Owner: 
--

REVOKE ALL on "controle_f_caltype" from PUBLIC;
GRANT SELECT on "controle_f_caltype" to PUBLIC;
GRANT ALL on "controle_f_caltype" to "postgres";
GRANT ALL on "controle_f_caltype" to "superkadagona";
GRANT SELECT on "controle_f_caltype" to "kadagona";
GRANT ALL on "controle_f_caltype" to "superchoukoutien";
GRANT SELECT on "controle_f_caltype" to "choukoutien";
GRANT SELECT on "controle_f_caltype" to "visiteurchoukoutien";

--
-- TOC Entry ID 99 (OID 7520604)
--
-- Name: controle_f_calcouleur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_calcouleur" (
	"f_calcouleur" text NOT NULL,
	"description" text,
	Constraint "controle_f_calcouleur_pkey" Primary Key ("f_calcouleur")
);

--
-- TOC Entry ID 100 (OID 7520604)
--
-- Name: controle_f_calcouleur Type: ACL Owner: 
--

REVOKE ALL on "controle_f_calcouleur" from PUBLIC;
GRANT SELECT on "controle_f_calcouleur" to PUBLIC;
GRANT ALL on "controle_f_calcouleur" to "postgres";
GRANT ALL on "controle_f_calcouleur" to "superkadagona";
GRANT SELECT on "controle_f_calcouleur" to "kadagona";
GRANT ALL on "controle_f_calcouleur" to "superchoukoutien";
GRANT SELECT on "controle_f_calcouleur" to "choukoutien";
GRANT SELECT on "controle_f_calcouleur" to "visiteurchoukoutien";

--
-- TOC Entry ID 101 (OID 7520610)
--
-- Name: controle_f_concretion Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_concretion" (
	"f_concretion" text NOT NULL,
	"description" text,
	Constraint "controle_f_concretion_pkey" Primary Key ("f_concretion")
);

--
-- TOC Entry ID 102 (OID 7520610)
--
-- Name: controle_f_concretion Type: ACL Owner: 
--

REVOKE ALL on "controle_f_concretion" from PUBLIC;
GRANT SELECT on "controle_f_concretion" to PUBLIC;
GRANT ALL on "controle_f_concretion" to "postgres";
GRANT ALL on "controle_f_concretion" to "superkadagona";
GRANT SELECT on "controle_f_concretion" to "kadagona";
GRANT ALL on "controle_f_concretion" to "superchoukoutien";
GRANT SELECT on "controle_f_concretion" to "choukoutien";
GRANT SELECT on "controle_f_concretion" to "visiteurchoukoutien";

--
-- TOC Entry ID 103 (OID 7520616)
--
-- Name: controle_f_oxyde Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_oxyde" (
	"f_oxyde" text NOT NULL,
	"description" text,
	Constraint "controle_f_oxyde_pkey" Primary Key ("f_oxyde")
);

--
-- TOC Entry ID 104 (OID 7520616)
--
-- Name: controle_f_oxyde Type: ACL Owner: 
--

REVOKE ALL on "controle_f_oxyde" from PUBLIC;
GRANT SELECT on "controle_f_oxyde" to PUBLIC;
GRANT ALL on "controle_f_oxyde" to "postgres";
GRANT ALL on "controle_f_oxyde" to "superkadagona";
GRANT SELECT on "controle_f_oxyde" to "kadagona";
GRANT ALL on "controle_f_oxyde" to "superchoukoutien";
GRANT SELECT on "controle_f_oxyde" to "choukoutien";
GRANT SELECT on "controle_f_oxyde" to "visiteurchoukoutien";

--
-- TOC Entry ID 105 (OID 7520622)
--
-- Name: controle_f_coraspect Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_coraspect" (
	"f_coraspect" text NOT NULL,
	"description" text,
	Constraint "controle_f_coraspect_pkey" Primary Key ("f_coraspect")
);

--
-- TOC Entry ID 106 (OID 7520622)
--
-- Name: controle_f_coraspect Type: ACL Owner: 
--

REVOKE ALL on "controle_f_coraspect" from PUBLIC;
GRANT SELECT on "controle_f_coraspect" to PUBLIC;
GRANT ALL on "controle_f_coraspect" to "postgres";
GRANT ALL on "controle_f_coraspect" to "superkadagona";
GRANT SELECT on "controle_f_coraspect" to "kadagona";
GRANT ALL on "controle_f_coraspect" to "superchoukoutien";
GRANT SELECT on "controle_f_coraspect" to "choukoutien";
GRANT SELECT on "controle_f_coraspect" to "visiteurchoukoutien";

--
-- TOC Entry ID 107 (OID 7520628)
--
-- Name: controle_f_corfissure Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_corfissure" (
	"f_corfissure" text NOT NULL,
	"description" text,
	Constraint "controle_f_corfissure_pkey" Primary Key ("f_corfissure")
);

--
-- TOC Entry ID 108 (OID 7520628)
--
-- Name: controle_f_corfissure Type: ACL Owner: 
--

REVOKE ALL on "controle_f_corfissure" from PUBLIC;
GRANT SELECT on "controle_f_corfissure" to PUBLIC;
GRANT ALL on "controle_f_corfissure" to "postgres";
GRANT ALL on "controle_f_corfissure" to "superkadagona";
GRANT SELECT on "controle_f_corfissure" to "kadagona";
GRANT ALL on "controle_f_corfissure" to "superchoukoutien";
GRANT SELECT on "controle_f_corfissure" to "choukoutien";
GRANT SELECT on "controle_f_corfissure" to "visiteurchoukoutien";

--
-- TOC Entry ID 109 (OID 7520634)
--
-- Name: controle_f_fossilisation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_fossilisation" (
	"f_fossilisation" text NOT NULL,
	"description" text,
	Constraint "controle_f_fossilisation_pkey" Primary Key ("f_fossilisation")
);

--
-- TOC Entry ID 110 (OID 7520634)
--
-- Name: controle_f_fossilisation Type: ACL Owner: 
--

REVOKE ALL on "controle_f_fossilisation" from PUBLIC;
GRANT SELECT on "controle_f_fossilisation" to PUBLIC;
GRANT ALL on "controle_f_fossilisation" to "postgres";
GRANT ALL on "controle_f_fossilisation" to "superkadagona";
GRANT SELECT on "controle_f_fossilisation" to "kadagona";
GRANT ALL on "controle_f_fossilisation" to "superchoukoutien";
GRANT SELECT on "controle_f_fossilisation" to "choukoutien";
GRANT SELECT on "controle_f_fossilisation" to "visiteurchoukoutien";

--
-- TOC Entry ID 111 (OID 7520640)
--
-- Name: controle_f_tissu Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_tissu" (
	"f_tissu" text NOT NULL,
	"description" text,
	Constraint "controle_f_tissu_pkey" Primary Key ("f_tissu")
);

--
-- TOC Entry ID 112 (OID 7520640)
--
-- Name: controle_f_tissu Type: ACL Owner: 
--

REVOKE ALL on "controle_f_tissu" from PUBLIC;
GRANT SELECT on "controle_f_tissu" to PUBLIC;
GRANT ALL on "controle_f_tissu" to "postgres";
GRANT ALL on "controle_f_tissu" to "superkadagona";
GRANT SELECT on "controle_f_tissu" to "kadagona";
GRANT ALL on "controle_f_tissu" to "superchoukoutien";
GRANT SELECT on "controle_f_tissu" to "choukoutien";
GRANT SELECT on "controle_f_tissu" to "visiteurchoukoutien";

--
-- TOC Entry ID 113 (OID 7520646)
--
-- Name: controle_f_typedos Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_typedos" (
	"f_typedos" text NOT NULL,
	"description" text,
	Constraint "controle_f_typedos_pkey" Primary Key ("f_typedos")
);

--
-- TOC Entry ID 114 (OID 7520646)
--
-- Name: controle_f_typedos Type: ACL Owner: 
--

REVOKE ALL on "controle_f_typedos" from PUBLIC;
GRANT SELECT on "controle_f_typedos" to PUBLIC;
GRANT ALL on "controle_f_typedos" to "postgres";
GRANT ALL on "controle_f_typedos" to "superkadagona";
GRANT SELECT on "controle_f_typedos" to "kadagona";
GRANT ALL on "controle_f_typedos" to "superchoukoutien";
GRANT SELECT on "controle_f_typedos" to "choukoutien";
GRANT SELECT on "controle_f_typedos" to "visiteurchoukoutien";

--
-- TOC Entry ID 115 (OID 7520652)
--
-- Name: controle_f_ilongueur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_ilongueur" (
	"f_ilongueur" text NOT NULL,
	"description" text,
	Constraint "controle_f_ilongueur_pkey" Primary Key ("f_ilongueur")
);

--
-- TOC Entry ID 116 (OID 7520652)
--
-- Name: controle_f_ilongueur Type: ACL Owner: 
--

REVOKE ALL on "controle_f_ilongueur" from PUBLIC;
GRANT SELECT on "controle_f_ilongueur" to PUBLIC;
GRANT ALL on "controle_f_ilongueur" to "postgres";
GRANT ALL on "controle_f_ilongueur" to "superkadagona";
GRANT SELECT on "controle_f_ilongueur" to "kadagona";
GRANT ALL on "controle_f_ilongueur" to "superchoukoutien";
GRANT SELECT on "controle_f_ilongueur" to "choukoutien";
GRANT SELECT on "controle_f_ilongueur" to "visiteurchoukoutien";

--
-- TOC Entry ID 117 (OID 7520658)
--
-- Name: controle_f_icirconference Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_icirconference" (
	"f_icirconference" text NOT NULL,
	"description" text,
	Constraint "controle_f_icirconference_pkey" Primary Key ("f_icirconference")
);

--
-- TOC Entry ID 118 (OID 7520658)
--
-- Name: controle_f_icirconference Type: ACL Owner: 
--

REVOKE ALL on "controle_f_icirconference" from PUBLIC;
GRANT SELECT on "controle_f_icirconference" to PUBLIC;
GRANT ALL on "controle_f_icirconference" to "postgres";
GRANT ALL on "controle_f_icirconference" to "superkadagona";
GRANT SELECT on "controle_f_icirconference" to "kadagona";
GRANT ALL on "controle_f_icirconference" to "superchoukoutien";
GRANT SELECT on "controle_f_icirconference" to "choukoutien";
GRANT SELECT on "controle_f_icirconference" to "visiteurchoukoutien";

--
-- TOC Entry ID 119 (OID 7520664)
--
-- Name: controle_f_eclat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_eclat" (
	"f_eclat" text NOT NULL,
	"description" text,
	Constraint "controle_f_eclat_pkey" Primary Key ("f_eclat")
);

--
-- TOC Entry ID 120 (OID 7520664)
--
-- Name: controle_f_eclat Type: ACL Owner: 
--

REVOKE ALL on "controle_f_eclat" from PUBLIC;
GRANT SELECT on "controle_f_eclat" to PUBLIC;
GRANT ALL on "controle_f_eclat" to "postgres";
GRANT ALL on "controle_f_eclat" to "superkadagona";
GRANT SELECT on "controle_f_eclat" to "kadagona";
GRANT ALL on "controle_f_eclat" to "superchoukoutien";
GRANT SELECT on "controle_f_eclat" to "choukoutien";
GRANT SELECT on "controle_f_eclat" to "visiteurchoukoutien";

--
-- TOC Entry ID 121 (OID 7520670)
--
-- Name: controle_f_agent Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_agent" (
	"f_agent" text NOT NULL,
	"description" text,
	Constraint "controle_f_agent_pkey" Primary Key ("f_agent")
);

--
-- TOC Entry ID 122 (OID 7520670)
--
-- Name: controle_f_agent Type: ACL Owner: 
--

REVOKE ALL on "controle_f_agent" from PUBLIC;
GRANT SELECT on "controle_f_agent" to PUBLIC;
GRANT ALL on "controle_f_agent" to "postgres";
GRANT ALL on "controle_f_agent" to "superkadagona";
GRANT SELECT on "controle_f_agent" to "kadagona";
GRANT ALL on "controle_f_agent" to "superchoukoutien";
GRANT SELECT on "controle_f_agent" to "choukoutien";
GRANT SELECT on "controle_f_agent" to "visiteurchoukoutien";

--
-- TOC Entry ID 123 (OID 7520676)
--
-- Name: controle_f_photo Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_photo" (
	"f_photo" text NOT NULL,
	"description" text,
	Constraint "controle_f_photo_pkey" Primary Key ("f_photo")
);

--
-- TOC Entry ID 124 (OID 7520676)
--
-- Name: controle_f_photo Type: ACL Owner: 
--

REVOKE ALL on "controle_f_photo" from PUBLIC;
GRANT SELECT on "controle_f_photo" to PUBLIC;
GRANT ALL on "controle_f_photo" to "postgres";
GRANT ALL on "controle_f_photo" to "superkadagona";
GRANT SELECT on "controle_f_photo" to "kadagona";
GRANT ALL on "controle_f_photo" to "superchoukoutien";
GRANT SELECT on "controle_f_photo" to "choukoutien";
GRANT SELECT on "controle_f_photo" to "visiteurchoukoutien";

--
-- TOC Entry ID 125 (OID 7520682)
--
-- Name: controle_f_dessin Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_dessin" (
	"f_dessin" text NOT NULL,
	"description" text,
	Constraint "controle_f_dessin_pkey" Primary Key ("f_dessin")
);

--
-- TOC Entry ID 126 (OID 7520682)
--
-- Name: controle_f_dessin Type: ACL Owner: 
--

REVOKE ALL on "controle_f_dessin" from PUBLIC;
GRANT SELECT on "controle_f_dessin" to PUBLIC;
GRANT ALL on "controle_f_dessin" to "postgres";
GRANT ALL on "controle_f_dessin" to "superkadagona";
GRANT SELECT on "controle_f_dessin" to "kadagona";
GRANT ALL on "controle_f_dessin" to "superchoukoutien";
GRANT SELECT on "controle_f_dessin" to "choukoutien";
GRANT SELECT on "controle_f_dessin" to "visiteurchoukoutien";

--
-- TOC Entry ID 127 (OID 7520688)
--
-- Name: controle_f_traitement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_traitement" (
	"f_traitement" text NOT NULL,
	"description" text,
	Constraint "controle_f_traitement_pkey" Primary Key ("f_traitement")
);

--
-- TOC Entry ID 128 (OID 7520688)
--
-- Name: controle_f_traitement Type: ACL Owner: 
--

REVOKE ALL on "controle_f_traitement" from PUBLIC;
GRANT SELECT on "controle_f_traitement" to PUBLIC;
GRANT ALL on "controle_f_traitement" to "postgres";
GRANT ALL on "controle_f_traitement" to "superkadagona";
GRANT SELECT on "controle_f_traitement" to "kadagona";
GRANT ALL on "controle_f_traitement" to "superchoukoutien";
GRANT SELECT on "controle_f_traitement" to "choukoutien";
GRANT SELECT on "controle_f_traitement" to "visiteurchoukoutien";

--
-- TOC Entry ID 129 (OID 7520694)
--
-- Name: controle_f_datation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_datation" (
	"f_datation" text NOT NULL,
	"description" text,
	Constraint "controle_f_datation_pkey" Primary Key ("f_datation")
);

--
-- TOC Entry ID 130 (OID 7520694)
--
-- Name: controle_f_datation Type: ACL Owner: 
--

REVOKE ALL on "controle_f_datation" from PUBLIC;
GRANT SELECT on "controle_f_datation" to PUBLIC;
GRANT ALL on "controle_f_datation" to "postgres";
GRANT ALL on "controle_f_datation" to "superkadagona";
GRANT SELECT on "controle_f_datation" to "kadagona";
GRANT ALL on "controle_f_datation" to "superchoukoutien";
GRANT SELECT on "controle_f_datation" to "choukoutien";
GRANT SELECT on "controle_f_datation" to "visiteurchoukoutien";

--
-- TOC Entry ID 131 (OID 7520700)
--
-- Name: controle_f_moulage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_moulage" (
	"f_moulage" text NOT NULL,
	"description" text,
	Constraint "controle_f_moulage_pkey" Primary Key ("f_moulage")
);

--
-- TOC Entry ID 132 (OID 7520700)
--
-- Name: controle_f_moulage Type: ACL Owner: 
--

REVOKE ALL on "controle_f_moulage" from PUBLIC;
GRANT SELECT on "controle_f_moulage" to PUBLIC;
GRANT ALL on "controle_f_moulage" to "postgres";
GRANT ALL on "controle_f_moulage" to "superkadagona";
GRANT SELECT on "controle_f_moulage" to "kadagona";
GRANT ALL on "controle_f_moulage" to "superchoukoutien";
GRANT SELECT on "controle_f_moulage" to "choukoutien";
GRANT SELECT on "controle_f_moulage" to "visiteurchoukoutien";

--
-- TOC Entry ID 133 (OID 7520706)
--
-- Name: controle_f_conservation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_conservation" (
	"f_conservation" text NOT NULL,
	"description" text,
	Constraint "controle_f_conservation_pkey" Primary Key ("f_conservation")
);

--
-- TOC Entry ID 134 (OID 7520706)
--
-- Name: controle_f_conservation Type: ACL Owner: 
--

REVOKE ALL on "controle_f_conservation" from PUBLIC;
GRANT SELECT on "controle_f_conservation" to PUBLIC;
GRANT ALL on "controle_f_conservation" to "postgres";
GRANT ALL on "controle_f_conservation" to "superkadagona";
GRANT SELECT on "controle_f_conservation" to "kadagona";
GRANT ALL on "controle_f_conservation" to "superchoukoutien";
GRANT SELECT on "controle_f_conservation" to "choukoutien";
GRANT SELECT on "controle_f_conservation" to "visiteurchoukoutien";

--
-- TOC Entry ID 135 (OID 7520712)
--
-- Name: controle_f_restauration Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_restauration" (
	"f_restauration" text NOT NULL,
	"description" text,
	Constraint "controle_f_restauration_pkey" Primary Key ("f_restauration")
);

--
-- TOC Entry ID 136 (OID 7520712)
--
-- Name: controle_f_restauration Type: ACL Owner: 
--

REVOKE ALL on "controle_f_restauration" from PUBLIC;
GRANT SELECT on "controle_f_restauration" to PUBLIC;
GRANT ALL on "controle_f_restauration" to "postgres";
GRANT ALL on "controle_f_restauration" to "superkadagona";
GRANT SELECT on "controle_f_restauration" to "kadagona";
GRANT ALL on "controle_f_restauration" to "superchoukoutien";
GRANT SELECT on "controle_f_restauration" to "choukoutien";
GRANT SELECT on "controle_f_restauration" to "visiteurchoukoutien";

--
-- TOC Entry ID 137 (OID 7520718)
--
-- Name: controle_f_saisie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_saisie" (
	"f_saisie" text NOT NULL,
	"description" text,
	Constraint "controle_f_saisie_pkey" Primary Key ("f_saisie")
);

--
-- TOC Entry ID 138 (OID 7520718)
--
-- Name: controle_f_saisie Type: ACL Owner: 
--

REVOKE ALL on "controle_f_saisie" from PUBLIC;
GRANT SELECT on "controle_f_saisie" to PUBLIC;
GRANT ALL on "controle_f_saisie" to "postgres";
GRANT ALL on "controle_f_saisie" to "superkadagona";
GRANT SELECT on "controle_f_saisie" to "kadagona";
GRANT ALL on "controle_f_saisie" to "superchoukoutien";
GRANT SELECT on "controle_f_saisie" to "choukoutien";
GRANT SELECT on "controle_f_saisie" to "visiteurchoukoutien";

--
-- TOC Entry ID 139 (OID 7520724)
--
-- Name: controle_f_coprolithe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_coprolithe" (
	"f_coprolithe" text NOT NULL,
	"description" text,
	Constraint "controle_f_coprolithe_pkey" Primary Key ("f_coprolithe")
);

--
-- TOC Entry ID 140 (OID 7520724)
--
-- Name: controle_f_coprolithe Type: ACL Owner: 
--

REVOKE ALL on "controle_f_coprolithe" from PUBLIC;
GRANT SELECT on "controle_f_coprolithe" to PUBLIC;
GRANT ALL on "controle_f_coprolithe" to "postgres";
GRANT ALL on "controle_f_coprolithe" to "superkadagona";
GRANT SELECT on "controle_f_coprolithe" to "kadagona";
GRANT ALL on "controle_f_coprolithe" to "superchoukoutien";
GRANT SELECT on "controle_f_coprolithe" to "choukoutien";
GRANT SELECT on "controle_f_coprolithe" to "visiteurchoukoutien";

--
-- TOC Entry ID 141 (OID 7520730)
--
-- Name: controle_f_pelote Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_pelote" (
	"f_pelote" text NOT NULL,
	"description" text,
	Constraint "controle_f_pelote_pkey" Primary Key ("f_pelote")
);

--
-- TOC Entry ID 142 (OID 7520730)
--
-- Name: controle_f_pelote Type: ACL Owner: 
--

REVOKE ALL on "controle_f_pelote" from PUBLIC;
GRANT SELECT on "controle_f_pelote" to PUBLIC;
GRANT ALL on "controle_f_pelote" to "postgres";
GRANT ALL on "controle_f_pelote" to "superkadagona";
GRANT SELECT on "controle_f_pelote" to "kadagona";
GRANT ALL on "controle_f_pelote" to "superchoukoutien";
GRANT SELECT on "controle_f_pelote" to "choukoutien";
GRANT SELECT on "controle_f_pelote" to "visiteurchoukoutien";

--
-- TOC Entry ID 143 (OID 7520736)
--
-- Name: controle_f_complement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_complement" (
	"f_complement" text NOT NULL,
	"description" text,
	Constraint "controle_f_complement_pkey" Primary Key ("f_complement")
);

--
-- TOC Entry ID 144 (OID 7520736)
--
-- Name: controle_f_complement Type: ACL Owner: 
--

REVOKE ALL on "controle_f_complement" from PUBLIC;
GRANT SELECT on "controle_f_complement" to PUBLIC;
GRANT ALL on "controle_f_complement" to "postgres";
GRANT ALL on "controle_f_complement" to "superkadagona";
GRANT SELECT on "controle_f_complement" to "kadagona";
GRANT ALL on "controle_f_complement" to "superchoukoutien";
GRANT SELECT on "controle_f_complement" to "choukoutien";
GRANT SELECT on "controle_f_complement" to "visiteurchoukoutien";

--
-- TOC Entry ID 145 (OID 7520742)
--
-- Name: controle_f_responsable Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_responsable" (
	"f_responsable" text NOT NULL,
	"description" text,
	Constraint "controle_f_responsable_pkey" Primary Key ("f_responsable")
);

--
-- TOC Entry ID 146 (OID 7520742)
--
-- Name: controle_f_responsable Type: ACL Owner: 
--

REVOKE ALL on "controle_f_responsable" from PUBLIC;
GRANT SELECT on "controle_f_responsable" to PUBLIC;
GRANT ALL on "controle_f_responsable" to "postgres";
GRANT ALL on "controle_f_responsable" to "superkadagona";
GRANT SELECT on "controle_f_responsable" to "kadagona";
GRANT ALL on "controle_f_responsable" to "superchoukoutien";
GRANT SELECT on "controle_f_responsable" to "choukoutien";
GRANT SELECT on "controle_f_responsable" to "visiteurchoukoutien";

--
-- TOC Entry ID 147 (OID 7520748)
--
-- Name: controle_f_ancien_oss Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_ancien_oss" (
	"f_ancien_oss" text NOT NULL,
	"description" text
);

--
-- TOC Entry ID 148 (OID 7520748)
--
-- Name: controle_f_ancien_oss Type: ACL Owner: 
--

REVOKE ALL on "controle_f_ancien_oss" from PUBLIC;
GRANT SELECT on "controle_f_ancien_oss" to PUBLIC;
GRANT ALL on "controle_f_ancien_oss" to "postgres";
GRANT ALL on "controle_f_ancien_oss" to "superkadagona";
GRANT SELECT on "controle_f_ancien_oss" to "kadagona";
GRANT ALL on "controle_f_ancien_oss" to "superchoukoutien";
GRANT SELECT on "controle_f_ancien_oss" to "choukoutien";
GRANT SELECT on "controle_f_ancien_oss" to "visiteurchoukoutien";

--
-- TOC Entry ID 149 (OID 7520753)
--
-- Name: controle_f_reference Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_reference" (
	"f_reference" text NOT NULL,
	"description" text,
	Constraint "controle_f_reference_pkey" Primary Key ("f_reference")
);

--
-- TOC Entry ID 150 (OID 7520753)
--
-- Name: controle_f_reference Type: ACL Owner: 
--

REVOKE ALL on "controle_f_reference" from PUBLIC;
GRANT SELECT on "controle_f_reference" to PUBLIC;
GRANT ALL on "controle_f_reference" to "postgres";
GRANT ALL on "controle_f_reference" to "superkadagona";
GRANT SELECT on "controle_f_reference" to "kadagona";
GRANT ALL on "controle_f_reference" to "superchoukoutien";
GRANT SELECT on "controle_f_reference" to "choukoutien";
GRANT SELECT on "controle_f_reference" to "visiteurchoukoutien";

--
-- TOC Entry ID 151 (OID 7520759)
--
-- Name: controle_f_affgenre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_affgenre" (
	"f_affgenre" text NOT NULL,
	"description" text,
	Constraint "controle_f_affgenre_pkey" Primary Key ("f_affgenre")
);

--
-- TOC Entry ID 152 (OID 7520759)
--
-- Name: controle_f_affgenre Type: ACL Owner: 
--

REVOKE ALL on "controle_f_affgenre" from PUBLIC;
GRANT SELECT on "controle_f_affgenre" to PUBLIC;
GRANT ALL on "controle_f_affgenre" to "postgres";
GRANT ALL on "controle_f_affgenre" to "superkadagona";
GRANT SELECT on "controle_f_affgenre" to "kadagona";
GRANT ALL on "controle_f_affgenre" to "superchoukoutien";
GRANT SELECT on "controle_f_affgenre" to "choukoutien";
GRANT SELECT on "controle_f_affgenre" to "visiteurchoukoutien";

--
-- TOC Entry ID 153 (OID 7520765)
--
-- Name: controle_f_affespece Type: TABLE Owner: postgres
--

CREATE TABLE "controle_f_affespece" (
	"f_affespece" text NOT NULL,
	"description" text,
	Constraint "controle_f_affespece_pkey" Primary Key ("f_affespece")
);

--
-- TOC Entry ID 154 (OID 7520765)
--
-- Name: controle_f_affespece Type: ACL Owner: 
--

REVOKE ALL on "controle_f_affespece" from PUBLIC;
GRANT SELECT on "controle_f_affespece" to PUBLIC;
GRANT ALL on "controle_f_affespece" to "postgres";
GRANT ALL on "controle_f_affespece" to "superkadagona";
GRANT SELECT on "controle_f_affespece" to "kadagona";
GRANT ALL on "controle_f_affespece" to "superchoukoutien";
GRANT SELECT on "controle_f_affespece" to "choukoutien";
GRANT SELECT on "controle_f_affespece" to "visiteurchoukoutien";

--
-- TOC Entry ID 155 (OID 7520783)
--
-- Name: controle_ud_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ud_type" (
	"ud_type" text NOT NULL,
	"description" text,
	Constraint "controle_ud_type_pkey" Primary Key ("ud_type")
);

--
-- TOC Entry ID 156 (OID 7520783)
--
-- Name: controle_ud_type Type: ACL Owner: 
--

REVOKE ALL on "controle_ud_type" from PUBLIC;
GRANT SELECT on "controle_ud_type" to PUBLIC;
GRANT ALL on "controle_ud_type" to "postgres";
GRANT ALL on "controle_ud_type" to "superkadagona";
GRANT SELECT on "controle_ud_type" to "kadagona";
GRANT ALL on "controle_ud_type" to "superchoukoutien";
GRANT SELECT on "controle_ud_type" to "choukoutien";
GRANT SELECT on "controle_ud_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 157 (OID 7520789)
--
-- Name: controle_ud_lateralite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ud_lateralite" (
	"ud_lateralite" text NOT NULL,
	"description" text,
	Constraint "controle_ud_lateralite_pkey" Primary Key ("ud_lateralite")
);

--
-- TOC Entry ID 158 (OID 7520789)
--
-- Name: controle_ud_lateralite Type: ACL Owner: 
--

REVOKE ALL on "controle_ud_lateralite" from PUBLIC;
GRANT SELECT on "controle_ud_lateralite" to PUBLIC;
GRANT ALL on "controle_ud_lateralite" to "postgres";
GRANT ALL on "controle_ud_lateralite" to "superkadagona";
GRANT SELECT on "controle_ud_lateralite" to "kadagona";
GRANT ALL on "controle_ud_lateralite" to "superchoukoutien";
GRANT SELECT on "controle_ud_lateralite" to "choukoutien";
GRANT SELECT on "controle_ud_lateralite" to "visiteurchoukoutien";

--
-- TOC Entry ID 159 (OID 7520795)
--
-- Name: controle_ud_usure Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ud_usure" (
	"ud_usure" text NOT NULL,
	"description" text,
	Constraint "controle_ud_usure_pkey" Primary Key ("ud_usure")
);

--
-- TOC Entry ID 160 (OID 7520795)
--
-- Name: controle_ud_usure Type: ACL Owner: 
--

REVOKE ALL on "controle_ud_usure" from PUBLIC;
GRANT SELECT on "controle_ud_usure" to PUBLIC;
GRANT ALL on "controle_ud_usure" to "postgres";
GRANT ALL on "controle_ud_usure" to "superkadagona";
GRANT SELECT on "controle_ud_usure" to "kadagona";
GRANT ALL on "controle_ud_usure" to "superchoukoutien";
GRANT SELECT on "controle_ud_usure" to "choukoutien";
GRANT SELECT on "controle_ud_usure" to "visiteurchoukoutien";

--
-- TOC Entry ID 161 (OID 7520801)
--
-- Name: controle_ud_fragmentation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ud_fragmentation" (
	"ud_fragmentation" text NOT NULL,
	"description" text,
	Constraint "controle_ud_fragmentation_pkey" Primary Key ("ud_fragmentation")
);

--
-- TOC Entry ID 162 (OID 7520801)
--
-- Name: controle_ud_fragmentation Type: ACL Owner: 
--

REVOKE ALL on "controle_ud_fragmentation" from PUBLIC;
GRANT SELECT on "controle_ud_fragmentation" to PUBLIC;
GRANT ALL on "controle_ud_fragmentation" to "postgres";
GRANT ALL on "controle_ud_fragmentation" to "superkadagona";
GRANT SELECT on "controle_ud_fragmentation" to "kadagona";
GRANT ALL on "controle_ud_fragmentation" to "superchoukoutien";
GRANT SELECT on "controle_ud_fragmentation" to "choukoutien";
GRANT SELECT on "controle_ud_fragmentation" to "visiteurchoukoutien";

--
-- TOC Entry ID 163 (OID 7520807)
--
-- Name: fracture_faune Type: TABLE Owner: postgres
--

CREATE TABLE "fracture_faune" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"ff_localisation1" text,
	"ff_non1" text,
	"ff_angle1" text,
	"ff_aspect1" text,
	"ff_profil1" text,
	"ff_morphologie1" text,
	"ff_localisation2" text,
	"ff_non2" text,
	"ff_angle2" text,
	"ff_aspect2" text,
	"ff_profil2" text,
	"ff_morphologie2" text,
	Constraint "fracture_faune_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 164 (OID 7520807)
--
-- Name: fracture_faune Type: ACL Owner: 
--

REVOKE ALL on "fracture_faune" from PUBLIC;
GRANT SELECT on "fracture_faune" to PUBLIC;
GRANT ALL on "fracture_faune" to "postgres";
GRANT ALL on "fracture_faune" to "superkadagona";
GRANT SELECT on "fracture_faune" to "visiteurkadagona";
GRANT ALL on "fracture_faune" to "kadagona";
GRANT ALL on "fracture_faune" to "superchoukoutien";
GRANT ALL on "fracture_faune" to "choukoutien";
GRANT SELECT on "fracture_faune" to "visiteurchoukoutien";

--
-- TOC Entry ID 165 (OID 7520813)
--
-- Name: controle_ff_localisation1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_localisation1" (
	"ff_localisation1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_localisation1_pkey" Primary Key ("ff_localisation1")
);

--
-- TOC Entry ID 166 (OID 7520813)
--
-- Name: controle_ff_localisation1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_localisation1" from PUBLIC;
GRANT SELECT on "controle_ff_localisation1" to PUBLIC;
GRANT ALL on "controle_ff_localisation1" to "postgres";
GRANT ALL on "controle_ff_localisation1" to "superkadagona";
GRANT SELECT on "controle_ff_localisation1" to "kadagona";
GRANT ALL on "controle_ff_localisation1" to "superchoukoutien";
GRANT SELECT on "controle_ff_localisation1" to "choukoutien";
GRANT SELECT on "controle_ff_localisation1" to "visiteurchoukoutien";

--
-- TOC Entry ID 167 (OID 7520819)
--
-- Name: controle_ff_non1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_non1" (
	"ff_non1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_non1_pkey" Primary Key ("ff_non1")
);

--
-- TOC Entry ID 168 (OID 7520819)
--
-- Name: controle_ff_non1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_non1" from PUBLIC;
GRANT SELECT on "controle_ff_non1" to PUBLIC;
GRANT ALL on "controle_ff_non1" to "postgres";
GRANT ALL on "controle_ff_non1" to "superkadagona";
GRANT SELECT on "controle_ff_non1" to "kadagona";
GRANT ALL on "controle_ff_non1" to "superchoukoutien";
GRANT SELECT on "controle_ff_non1" to "choukoutien";
GRANT SELECT on "controle_ff_non1" to "visiteurchoukoutien";

--
-- TOC Entry ID 169 (OID 7520825)
--
-- Name: controle_ff_angle1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_angle1" (
	"ff_angle1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_angle1_pkey" Primary Key ("ff_angle1")
);

--
-- TOC Entry ID 170 (OID 7520825)
--
-- Name: controle_ff_angle1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_angle1" from PUBLIC;
GRANT SELECT on "controle_ff_angle1" to PUBLIC;
GRANT ALL on "controle_ff_angle1" to "postgres";
GRANT ALL on "controle_ff_angle1" to "superkadagona";
GRANT SELECT on "controle_ff_angle1" to "kadagona";
GRANT ALL on "controle_ff_angle1" to "superchoukoutien";
GRANT SELECT on "controle_ff_angle1" to "choukoutien";
GRANT SELECT on "controle_ff_angle1" to "visiteurchoukoutien";

--
-- TOC Entry ID 171 (OID 7520831)
--
-- Name: controle_ff_aspect1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_aspect1" (
	"ff_aspect1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_aspect1_pkey" Primary Key ("ff_aspect1")
);

--
-- TOC Entry ID 172 (OID 7520831)
--
-- Name: controle_ff_aspect1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_aspect1" from PUBLIC;
GRANT SELECT on "controle_ff_aspect1" to PUBLIC;
GRANT ALL on "controle_ff_aspect1" to "postgres";
GRANT ALL on "controle_ff_aspect1" to "superkadagona";
GRANT SELECT on "controle_ff_aspect1" to "kadagona";
GRANT ALL on "controle_ff_aspect1" to "superchoukoutien";
GRANT SELECT on "controle_ff_aspect1" to "choukoutien";
GRANT SELECT on "controle_ff_aspect1" to "visiteurchoukoutien";

--
-- TOC Entry ID 173 (OID 7520837)
--
-- Name: controle_ff_profil1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_profil1" (
	"ff_profil1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_profil1_pkey" Primary Key ("ff_profil1")
);

--
-- TOC Entry ID 174 (OID 7520837)
--
-- Name: controle_ff_profil1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_profil1" from PUBLIC;
GRANT SELECT on "controle_ff_profil1" to PUBLIC;
GRANT ALL on "controle_ff_profil1" to "postgres";
GRANT ALL on "controle_ff_profil1" to "superkadagona";
GRANT SELECT on "controle_ff_profil1" to "kadagona";
GRANT ALL on "controle_ff_profil1" to "superchoukoutien";
GRANT SELECT on "controle_ff_profil1" to "choukoutien";
GRANT SELECT on "controle_ff_profil1" to "visiteurchoukoutien";

--
-- TOC Entry ID 175 (OID 7520843)
--
-- Name: controle_ff_morphologie1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_morphologie1" (
	"ff_morphologie1" text NOT NULL,
	"description" text,
	Constraint "controle_ff_morphologie1_pkey" Primary Key ("ff_morphologie1")
);

--
-- TOC Entry ID 176 (OID 7520843)
--
-- Name: controle_ff_morphologie1 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_morphologie1" from PUBLIC;
GRANT SELECT on "controle_ff_morphologie1" to PUBLIC;
GRANT ALL on "controle_ff_morphologie1" to "postgres";
GRANT ALL on "controle_ff_morphologie1" to "superkadagona";
GRANT SELECT on "controle_ff_morphologie1" to "kadagona";
GRANT ALL on "controle_ff_morphologie1" to "superchoukoutien";
GRANT SELECT on "controle_ff_morphologie1" to "choukoutien";
GRANT SELECT on "controle_ff_morphologie1" to "visiteurchoukoutien";

--
-- TOC Entry ID 177 (OID 7520849)
--
-- Name: controle_ff_localisation2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_localisation2" (
	"ff_localisation2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_localisation2_pkey" Primary Key ("ff_localisation2")
);

--
-- TOC Entry ID 178 (OID 7520849)
--
-- Name: controle_ff_localisation2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_localisation2" from PUBLIC;
GRANT SELECT on "controle_ff_localisation2" to PUBLIC;
GRANT ALL on "controle_ff_localisation2" to "postgres";
GRANT ALL on "controle_ff_localisation2" to "superkadagona";
GRANT SELECT on "controle_ff_localisation2" to "kadagona";
GRANT ALL on "controle_ff_localisation2" to "superchoukoutien";
GRANT SELECT on "controle_ff_localisation2" to "choukoutien";
GRANT SELECT on "controle_ff_localisation2" to "visiteurchoukoutien";

--
-- TOC Entry ID 179 (OID 7520855)
--
-- Name: controle_ff_non2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_non2" (
	"ff_non2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_non2_pkey" Primary Key ("ff_non2")
);

--
-- TOC Entry ID 180 (OID 7520855)
--
-- Name: controle_ff_non2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_non2" from PUBLIC;
GRANT SELECT on "controle_ff_non2" to PUBLIC;
GRANT ALL on "controle_ff_non2" to "postgres";
GRANT ALL on "controle_ff_non2" to "superkadagona";
GRANT SELECT on "controle_ff_non2" to "kadagona";
GRANT ALL on "controle_ff_non2" to "superchoukoutien";
GRANT SELECT on "controle_ff_non2" to "choukoutien";
GRANT SELECT on "controle_ff_non2" to "visiteurchoukoutien";

--
-- TOC Entry ID 181 (OID 7520861)
--
-- Name: controle_ff_angle2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_angle2" (
	"ff_angle2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_angle2_pkey" Primary Key ("ff_angle2")
);

--
-- TOC Entry ID 182 (OID 7520861)
--
-- Name: controle_ff_angle2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_angle2" from PUBLIC;
GRANT SELECT on "controle_ff_angle2" to PUBLIC;
GRANT ALL on "controle_ff_angle2" to "postgres";
GRANT ALL on "controle_ff_angle2" to "superkadagona";
GRANT SELECT on "controle_ff_angle2" to "kadagona";
GRANT ALL on "controle_ff_angle2" to "superchoukoutien";
GRANT SELECT on "controle_ff_angle2" to "choukoutien";
GRANT SELECT on "controle_ff_angle2" to "visiteurchoukoutien";

--
-- TOC Entry ID 183 (OID 7520867)
--
-- Name: controle_ff_aspect2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_aspect2" (
	"ff_aspect2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_aspect2_pkey" Primary Key ("ff_aspect2")
);

--
-- TOC Entry ID 184 (OID 7520867)
--
-- Name: controle_ff_aspect2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_aspect2" from PUBLIC;
GRANT SELECT on "controle_ff_aspect2" to PUBLIC;
GRANT ALL on "controle_ff_aspect2" to "postgres";
GRANT ALL on "controle_ff_aspect2" to "superkadagona";
GRANT SELECT on "controle_ff_aspect2" to "kadagona";
GRANT ALL on "controle_ff_aspect2" to "superchoukoutien";
GRANT SELECT on "controle_ff_aspect2" to "choukoutien";
GRANT SELECT on "controle_ff_aspect2" to "visiteurchoukoutien";

--
-- TOC Entry ID 185 (OID 7520873)
--
-- Name: controle_ff_profil2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_profil2" (
	"ff_profil2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_profil2_pkey" Primary Key ("ff_profil2")
);

--
-- TOC Entry ID 186 (OID 7520873)
--
-- Name: controle_ff_profil2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_profil2" from PUBLIC;
GRANT SELECT on "controle_ff_profil2" to PUBLIC;
GRANT ALL on "controle_ff_profil2" to "postgres";
GRANT ALL on "controle_ff_profil2" to "superkadagona";
GRANT SELECT on "controle_ff_profil2" to "kadagona";
GRANT ALL on "controle_ff_profil2" to "superchoukoutien";
GRANT SELECT on "controle_ff_profil2" to "choukoutien";
GRANT SELECT on "controle_ff_profil2" to "visiteurchoukoutien";

--
-- TOC Entry ID 187 (OID 7520879)
--
-- Name: controle_ff_morphologie2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ff_morphologie2" (
	"ff_morphologie2" text NOT NULL,
	"description" text,
	Constraint "controle_ff_morphologie2_pkey" Primary Key ("ff_morphologie2")
);

--
-- TOC Entry ID 188 (OID 7520879)
--
-- Name: controle_ff_morphologie2 Type: ACL Owner: 
--

REVOKE ALL on "controle_ff_morphologie2" from PUBLIC;
GRANT SELECT on "controle_ff_morphologie2" to PUBLIC;
GRANT ALL on "controle_ff_morphologie2" to "postgres";
GRANT ALL on "controle_ff_morphologie2" to "superkadagona";
GRANT SELECT on "controle_ff_morphologie2" to "kadagona";
GRANT ALL on "controle_ff_morphologie2" to "superchoukoutien";
GRANT SELECT on "controle_ff_morphologie2" to "choukoutien";
GRANT SELECT on "controle_ff_morphologie2" to "visiteurchoukoutien";

--
-- TOC Entry ID 2 (OID 7520885)
--
-- Name: seq_photofaune Type: SEQUENCE Owner: postgres
--

CREATE SEQUENCE "seq_photofaune" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

--
-- TOC Entry ID 189 (OID 7520887)
--
-- Name: photofaune Type: TABLE Owner: postgres
--

CREATE TABLE "photofaune" (
	"idphoto" integer DEFAULT nextval('seq_photofaune'::text) NOT NULL,
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"legende" text,
	Constraint "photofaune_pkey" Primary Key ("idphoto")
);

--
-- TOC Entry ID 190 (OID 7520887)
--
-- Name: photofaune Type: ACL Owner: 
--

REVOKE ALL on "photofaune" from PUBLIC;
GRANT SELECT on "photofaune" to PUBLIC;
GRANT ALL on "photofaune" to "postgres";
GRANT ALL on "photofaune" to "superkadagona";
GRANT SELECT on "photofaune" to "visiteurkadagona";
GRANT ALL on "photofaune" to "kadagona";
GRANT ALL on "photofaune" to "superchoukoutien";
GRANT ALL on "photofaune" to "choukoutien";
GRANT SELECT on "photofaune" to "visiteurchoukoutien";

--
-- TOC Entry ID 191 (OID 7520893)
--
-- Name: microfaune Type: TABLE Owner: postgres
--

CREATE TABLE "microfaune" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"mf_serie" text NOT NULL,
	"mf_type" text NOT NULL,
	"mf_m1" real,
	"mf_m2" real,
	"mf_m3" real,
	"mf_m4" real,
	"mf_m5" real,
	"mf_m6" real,
	"mf_m7" real,
	"mf_m8" real,
	"mf_m9" real,
	"mf_m10" real,
	"mf_m11" real,
	"mf_m12" real,
	"mf_m13" real,
	"mf_m14" real,
	"mf_m15" real,
	"mf_m16" real,
	"mf_m17" real,
	"mf_m18" real,
	"mf_m19" real,
	"mf_m20" real,
	"mf_m21" real,
	"mf_m22" real,
	"mf_m23" real,
	"mf_m24" real,
	"mf_m25" real,
	"mf_m26" real,
	"mf_m27" real,
	"mf_m28" real,
	"mf_m29" real,
	"mf_m30" real,
	Constraint "microfaune_pkey" Primary Key ("zone", "numero", "bis", "mf_serie", "mf_type")
);

--
-- TOC Entry ID 192 (OID 7520893)
--
-- Name: microfaune Type: ACL Owner: 
--

REVOKE ALL on "microfaune" from PUBLIC;
GRANT SELECT on "microfaune" to PUBLIC;
GRANT ALL on "microfaune" to "postgres";
GRANT ALL on "microfaune" to "superkadagona";
GRANT SELECT on "microfaune" to "visiteurkadagona";
GRANT ALL on "microfaune" to "kadagona";
GRANT ALL on "microfaune" to "superchoukoutien";
GRANT ALL on "microfaune" to "choukoutien";
GRANT SELECT on "microfaune" to "visiteurchoukoutien";

--
-- TOC Entry ID 193 (OID 7520899)
--
-- Name: controle_mf_serie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_mf_serie" (
	"mf_serie" text NOT NULL,
	"description" text,
	Constraint "controle_mf_serie_pkey" Primary Key ("mf_serie")
);

--
-- TOC Entry ID 194 (OID 7520899)
--
-- Name: controle_mf_serie Type: ACL Owner: 
--

REVOKE ALL on "controle_mf_serie" from PUBLIC;
GRANT SELECT on "controle_mf_serie" to PUBLIC;
GRANT ALL on "controle_mf_serie" to "postgres";
GRANT ALL on "controle_mf_serie" to "superkadagona";
GRANT SELECT on "controle_mf_serie" to "kadagona";
GRANT ALL on "controle_mf_serie" to "superchoukoutien";
GRANT SELECT on "controle_mf_serie" to "choukoutien";
GRANT SELECT on "controle_mf_serie" to "visiteurchoukoutien";

--
-- TOC Entry ID 195 (OID 7520905)
--
-- Name: controle_mf_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_mf_type" (
	"mf_type" text NOT NULL,
	"description" text,
	Constraint "controle_mf_type_pkey" Primary Key ("mf_type")
);

--
-- TOC Entry ID 196 (OID 7520905)
--
-- Name: controle_mf_type Type: ACL Owner: 
--

REVOKE ALL on "controle_mf_type" from PUBLIC;
GRANT SELECT on "controle_mf_type" to PUBLIC;
GRANT ALL on "controle_mf_type" to "postgres";
GRANT ALL on "controle_mf_type" to "superkadagona";
GRANT SELECT on "controle_mf_type" to "kadagona";
GRANT ALL on "controle_mf_type" to "superchoukoutien";
GRANT SELECT on "controle_mf_type" to "choukoutien";
GRANT SELECT on "controle_mf_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 197 (OID 7520911)
--
-- Name: dent Type: TABLE Owner: postgres
--

CREATE TABLE "dent" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"d_serie" text NOT NULL,
	"d_type" text NOT NULL,
	"d_m1" integer,
	"d_m2" integer,
	"d_m3" integer,
	"d_m4" integer,
	"d_m5" integer,
	"d_m6" integer,
	"d_m7" integer,
	"d_m8" integer,
	"d_m9" integer,
	"d_m10" integer,
	"d_m11" integer,
	"d_m12" integer,
	"d_m13" integer,
	"d_m14" integer,
	"d_m15" integer,
	"d_m16" integer,
	"d_m17" integer,
	"d_m18" integer,
	"d_m19" integer,
	"d_m20" integer,
	"d_m21" integer,
	"d_m22" integer,
	"d_m23" integer,
	"d_m24" integer,
	"d_m25" integer,
	"d_m26" integer,
	"d_m27" integer,
	"d_m28" integer,
	"d_m29" integer,
	"d_m30" integer,
	Constraint "dent_pkey" Primary Key ("zone", "numero", "bis", "d_serie", "d_type")
);

--
-- TOC Entry ID 198 (OID 7520911)
--
-- Name: dent Type: ACL Owner: 
--

REVOKE ALL on "dent" from PUBLIC;
GRANT SELECT on "dent" to PUBLIC;
GRANT ALL on "dent" to "postgres";
GRANT ALL on "dent" to "superkadagona";
GRANT SELECT on "dent" to "visiteurkadagona";
GRANT ALL on "dent" to "kadagona";
GRANT ALL on "dent" to "superchoukoutien";
GRANT ALL on "dent" to "choukoutien";
GRANT SELECT on "dent" to "visiteurchoukoutien";

--
-- TOC Entry ID 199 (OID 7520917)
--
-- Name: controle_d_serie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_d_serie" (
	"d_serie" text NOT NULL,
	"description" text,
	Constraint "controle_d_serie_pkey" Primary Key ("d_serie")
);

--
-- TOC Entry ID 200 (OID 7520917)
--
-- Name: controle_d_serie Type: ACL Owner: 
--

REVOKE ALL on "controle_d_serie" from PUBLIC;
GRANT SELECT on "controle_d_serie" to PUBLIC;
GRANT ALL on "controle_d_serie" to "postgres";
GRANT ALL on "controle_d_serie" to "superkadagona";
GRANT SELECT on "controle_d_serie" to "kadagona";
GRANT ALL on "controle_d_serie" to "superchoukoutien";
GRANT SELECT on "controle_d_serie" to "choukoutien";
GRANT SELECT on "controle_d_serie" to "visiteurchoukoutien";

--
-- TOC Entry ID 201 (OID 7520923)
--
-- Name: controle_d_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_d_type" (
	"d_type" text NOT NULL,
	"description" text,
	Constraint "controle_d_type_pkey" Primary Key ("d_type")
);

--
-- TOC Entry ID 202 (OID 7520923)
--
-- Name: controle_d_type Type: ACL Owner: 
--

REVOKE ALL on "controle_d_type" from PUBLIC;
GRANT SELECT on "controle_d_type" to PUBLIC;
GRANT ALL on "controle_d_type" to "postgres";
GRANT ALL on "controle_d_type" to "superkadagona";
GRANT SELECT on "controle_d_type" to "kadagona";
GRANT ALL on "controle_d_type" to "superchoukoutien";
GRANT SELECT on "controle_d_type" to "choukoutien";
GRANT SELECT on "controle_d_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 203 (OID 7520929)
--
-- Name: os Type: TABLE Owner: postgres
--

CREATE TABLE "os" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"o_serie" text NOT NULL,
	"o_type" text,
	"o_m1" integer,
	"o_m2" integer,
	"o_m3" integer,
	"o_m4" integer,
	"o_m5" integer,
	"o_m6" integer,
	"o_m7" integer,
	"o_m8" integer,
	"o_m9" integer,
	"o_m10" integer,
	"o_m11" integer,
	"o_m12" integer,
	"o_m13" integer,
	"o_m14" integer,
	"o_m15" integer,
	"o_m16" integer,
	"o_m17" integer,
	"o_m18" integer,
	"o_m19" integer,
	"o_m20" integer,
	"o_m21" integer,
	"o_m22" integer,
	"o_m23" integer,
	"o_m24" integer,
	"o_m25" integer,
	"o_m26" integer,
	"o_m27" integer,
	"o_m28" integer,
	"o_m29" integer,
	"o_m30" integer,
	"o_m31" integer,
	"o_m32" integer,
	"o_m33" integer,
	"o_m34" integer,
	"o_m35" integer,
	"o_m36" integer,
	"o_m37" integer,
	"o_m38" integer,
	"o_m39" integer,
	"o_m40" integer,
	"o_m41" integer,
	"o_m42" integer,
	"o_m43" integer,
	"o_m44" integer,
	"o_m45" integer,
	"o_m46" integer,
	"o_m47" integer,
	"o_m48" integer,
	"o_m49" integer,
	"o_m50" integer,
	Constraint "os_pkey" Primary Key ("zone", "numero", "bis", "o_serie")
);

--
-- TOC Entry ID 204 (OID 7520929)
--
-- Name: os Type: ACL Owner: 
--

REVOKE ALL on "os" from PUBLIC;
GRANT SELECT on "os" to PUBLIC;
GRANT ALL on "os" to "postgres";
GRANT ALL on "os" to "superkadagona";
GRANT SELECT on "os" to "visiteurkadagona";
GRANT ALL on "os" to "kadagona";
GRANT ALL on "os" to "superchoukoutien";
GRANT ALL on "os" to "choukoutien";
GRANT SELECT on "os" to "visiteurchoukoutien";

--
-- TOC Entry ID 205 (OID 7520935)
--
-- Name: controle_o_sserie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_sserie" (
	"o_sserie" text NOT NULL,
	"description" text,
	Constraint "controle_o_sserie_pkey" Primary Key ("o_sserie")
);

--
-- TOC Entry ID 206 (OID 7520935)
--
-- Name: controle_o_sserie Type: ACL Owner: 
--

REVOKE ALL on "controle_o_sserie" from PUBLIC;
GRANT SELECT on "controle_o_sserie" to PUBLIC;
GRANT ALL on "controle_o_sserie" to "postgres";
GRANT ALL on "controle_o_sserie" to "superkadagona";
GRANT SELECT on "controle_o_sserie" to "kadagona";
GRANT ALL on "controle_o_sserie" to "superchoukoutien";
GRANT SELECT on "controle_o_sserie" to "choukoutien";
GRANT SELECT on "controle_o_sserie" to "visiteurchoukoutien";

--
-- TOC Entry ID 207 (OID 7520941)
--
-- Name: trace Type: TABLE Owner: postgres
--

CREATE TABLE "trace" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"t_ensemble" text NOT NULL,
	"t_nature" text,
	"t_nombre" integer,
	"t_agent" text,
	"t_phenomene" text,
	"t_localisation" text,
	"t_position" text,
	"t_locmusc" text,
	"t_longueur" integer,
	"t_classe" text,
	"t_largeur" text,
	"t_profondeur" text,
	"t_section" text,
	"t_diametre" integer,
	"t_dstrie" text,
	"t_trace" text,
	"t_direction" text,
	"t_sens" text,
	"t_allure" text,
	"t_description" text,
	"t_dessin" text,
	"t_replique" text,
	"t_photo" text,
	Constraint "trace_pkey" Primary Key ("zone", "numero", "bis", "t_ensemble")
);

--
-- TOC Entry ID 208 (OID 7520941)
--
-- Name: trace Type: ACL Owner: 
--

REVOKE ALL on "trace" from PUBLIC;
GRANT SELECT on "trace" to PUBLIC;
GRANT ALL on "trace" to "postgres";
GRANT ALL on "trace" to "superkadagona";
GRANT SELECT on "trace" to "visiteurkadagona";
GRANT ALL on "trace" to "kadagona";
GRANT ALL on "trace" to "superchoukoutien";
GRANT ALL on "trace" to "choukoutien";
GRANT SELECT on "trace" to "visiteurchoukoutien";

--
-- TOC Entry ID 209 (OID 7520947)
--
-- Name: controle_t_ensemble Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_ensemble" (
	"t_ensemble" text NOT NULL,
	"description" text,
	Constraint "controle_t_ensemble_pkey" Primary Key ("t_ensemble")
);

--
-- TOC Entry ID 210 (OID 7520947)
--
-- Name: controle_t_ensemble Type: ACL Owner: 
--

REVOKE ALL on "controle_t_ensemble" from PUBLIC;
GRANT SELECT on "controle_t_ensemble" to PUBLIC;
GRANT ALL on "controle_t_ensemble" to "postgres";
GRANT ALL on "controle_t_ensemble" to "superkadagona";
GRANT SELECT on "controle_t_ensemble" to "kadagona";
GRANT ALL on "controle_t_ensemble" to "superchoukoutien";
GRANT SELECT on "controle_t_ensemble" to "choukoutien";
GRANT SELECT on "controle_t_ensemble" to "visiteurchoukoutien";

--
-- TOC Entry ID 211 (OID 7520953)
--
-- Name: controle_t_nature Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_nature" (
	"t_nature" text NOT NULL,
	"description" text,
	Constraint "controle_t_nature_pkey" Primary Key ("t_nature")
);

--
-- TOC Entry ID 212 (OID 7520953)
--
-- Name: controle_t_nature Type: ACL Owner: 
--

REVOKE ALL on "controle_t_nature" from PUBLIC;
GRANT SELECT on "controle_t_nature" to PUBLIC;
GRANT ALL on "controle_t_nature" to "postgres";
GRANT ALL on "controle_t_nature" to "superkadagona";
GRANT SELECT on "controle_t_nature" to "kadagona";
GRANT ALL on "controle_t_nature" to "superchoukoutien";
GRANT SELECT on "controle_t_nature" to "choukoutien";
GRANT SELECT on "controle_t_nature" to "visiteurchoukoutien";

--
-- TOC Entry ID 213 (OID 7520959)
--
-- Name: controle_t_agent Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_agent" (
	"t_agent" text NOT NULL,
	"description" text,
	Constraint "controle_t_agent_pkey" Primary Key ("t_agent")
);

--
-- TOC Entry ID 214 (OID 7520959)
--
-- Name: controle_t_agent Type: ACL Owner: 
--

REVOKE ALL on "controle_t_agent" from PUBLIC;
GRANT SELECT on "controle_t_agent" to PUBLIC;
GRANT ALL on "controle_t_agent" to "postgres";
GRANT ALL on "controle_t_agent" to "superkadagona";
GRANT SELECT on "controle_t_agent" to "kadagona";
GRANT ALL on "controle_t_agent" to "superchoukoutien";
GRANT SELECT on "controle_t_agent" to "choukoutien";
GRANT SELECT on "controle_t_agent" to "visiteurchoukoutien";

--
-- TOC Entry ID 215 (OID 7520965)
--
-- Name: controle_t_phenomene Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_phenomene" (
	"t_phenomene" text NOT NULL,
	"description" text,
	Constraint "controle_t_phenomene_pkey" Primary Key ("t_phenomene")
);

--
-- TOC Entry ID 216 (OID 7520965)
--
-- Name: controle_t_phenomene Type: ACL Owner: 
--

REVOKE ALL on "controle_t_phenomene" from PUBLIC;
GRANT SELECT on "controle_t_phenomene" to PUBLIC;
GRANT ALL on "controle_t_phenomene" to "postgres";
GRANT ALL on "controle_t_phenomene" to "superkadagona";
GRANT SELECT on "controle_t_phenomene" to "kadagona";
GRANT ALL on "controle_t_phenomene" to "superchoukoutien";
GRANT SELECT on "controle_t_phenomene" to "choukoutien";
GRANT SELECT on "controle_t_phenomene" to "visiteurchoukoutien";

--
-- TOC Entry ID 217 (OID 7520971)
--
-- Name: controle_t_locmusc Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_locmusc" (
	"t_locmusc" text NOT NULL,
	"description" text,
	Constraint "controle_t_locmusc_pkey" Primary Key ("t_locmusc")
);

--
-- TOC Entry ID 218 (OID 7520971)
--
-- Name: controle_t_locmusc Type: ACL Owner: 
--

REVOKE ALL on "controle_t_locmusc" from PUBLIC;
GRANT SELECT on "controle_t_locmusc" to PUBLIC;
GRANT ALL on "controle_t_locmusc" to "postgres";
GRANT ALL on "controle_t_locmusc" to "superkadagona";
GRANT SELECT on "controle_t_locmusc" to "kadagona";
GRANT ALL on "controle_t_locmusc" to "superchoukoutien";
GRANT SELECT on "controle_t_locmusc" to "choukoutien";
GRANT SELECT on "controle_t_locmusc" to "visiteurchoukoutien";

--
-- TOC Entry ID 219 (OID 7520977)
--
-- Name: controle_t_classe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_classe" (
	"t_classe" text NOT NULL,
	"description" text,
	Constraint "controle_t_classe_pkey" Primary Key ("t_classe")
);

--
-- TOC Entry ID 220 (OID 7520977)
--
-- Name: controle_t_classe Type: ACL Owner: 
--

REVOKE ALL on "controle_t_classe" from PUBLIC;
GRANT SELECT on "controle_t_classe" to PUBLIC;
GRANT ALL on "controle_t_classe" to "postgres";
GRANT ALL on "controle_t_classe" to "superkadagona";
GRANT SELECT on "controle_t_classe" to "kadagona";
GRANT ALL on "controle_t_classe" to "superchoukoutien";
GRANT SELECT on "controle_t_classe" to "choukoutien";
GRANT SELECT on "controle_t_classe" to "visiteurchoukoutien";

--
-- TOC Entry ID 221 (OID 7520983)
--
-- Name: controle_t_largeur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_largeur" (
	"t_largeur" text NOT NULL,
	"description" text,
	Constraint "controle_t_largeur_pkey" Primary Key ("t_largeur")
);

--
-- TOC Entry ID 222 (OID 7520983)
--
-- Name: controle_t_largeur Type: ACL Owner: 
--

REVOKE ALL on "controle_t_largeur" from PUBLIC;
GRANT SELECT on "controle_t_largeur" to PUBLIC;
GRANT ALL on "controle_t_largeur" to "postgres";
GRANT ALL on "controle_t_largeur" to "superkadagona";
GRANT SELECT on "controle_t_largeur" to "kadagona";
GRANT ALL on "controle_t_largeur" to "superchoukoutien";
GRANT SELECT on "controle_t_largeur" to "choukoutien";
GRANT SELECT on "controle_t_largeur" to "visiteurchoukoutien";

--
-- TOC Entry ID 223 (OID 7520989)
--
-- Name: controle_t_profondeur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_profondeur" (
	"t_profondeur" text NOT NULL,
	"description" text,
	Constraint "controle_t_profondeur_pkey" Primary Key ("t_profondeur")
);

--
-- TOC Entry ID 224 (OID 7520989)
--
-- Name: controle_t_profondeur Type: ACL Owner: 
--

REVOKE ALL on "controle_t_profondeur" from PUBLIC;
GRANT SELECT on "controle_t_profondeur" to PUBLIC;
GRANT ALL on "controle_t_profondeur" to "postgres";
GRANT ALL on "controle_t_profondeur" to "superkadagona";
GRANT SELECT on "controle_t_profondeur" to "kadagona";
GRANT ALL on "controle_t_profondeur" to "superchoukoutien";
GRANT SELECT on "controle_t_profondeur" to "choukoutien";
GRANT SELECT on "controle_t_profondeur" to "visiteurchoukoutien";

--
-- TOC Entry ID 225 (OID 7520995)
--
-- Name: controle_t_dstrie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_dstrie" (
	"t_dstrie" text NOT NULL,
	"description" text,
	Constraint "controle_t_dstrie_pkey" Primary Key ("t_dstrie")
);

--
-- TOC Entry ID 226 (OID 7520995)
--
-- Name: controle_t_dstrie Type: ACL Owner: 
--

REVOKE ALL on "controle_t_dstrie" from PUBLIC;
GRANT SELECT on "controle_t_dstrie" to PUBLIC;
GRANT ALL on "controle_t_dstrie" to "postgres";
GRANT ALL on "controle_t_dstrie" to "superkadagona";
GRANT SELECT on "controle_t_dstrie" to "kadagona";
GRANT ALL on "controle_t_dstrie" to "superchoukoutien";
GRANT SELECT on "controle_t_dstrie" to "choukoutien";
GRANT SELECT on "controle_t_dstrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 227 (OID 7521001)
--
-- Name: controle_t_trace Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_trace" (
	"t_trace" text NOT NULL,
	"description" text,
	Constraint "controle_t_trace_pkey" Primary Key ("t_trace")
);

--
-- TOC Entry ID 228 (OID 7521001)
--
-- Name: controle_t_trace Type: ACL Owner: 
--

REVOKE ALL on "controle_t_trace" from PUBLIC;
GRANT SELECT on "controle_t_trace" to PUBLIC;
GRANT ALL on "controle_t_trace" to "postgres";
GRANT ALL on "controle_t_trace" to "superkadagona";
GRANT SELECT on "controle_t_trace" to "kadagona";
GRANT ALL on "controle_t_trace" to "superchoukoutien";
GRANT SELECT on "controle_t_trace" to "choukoutien";
GRANT SELECT on "controle_t_trace" to "visiteurchoukoutien";

--
-- TOC Entry ID 229 (OID 7521007)
--
-- Name: controle_t_direction Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_direction" (
	"t_direction" text NOT NULL,
	"description" text,
	Constraint "controle_t_direction_pkey" Primary Key ("t_direction")
);

--
-- TOC Entry ID 230 (OID 7521007)
--
-- Name: controle_t_direction Type: ACL Owner: 
--

REVOKE ALL on "controle_t_direction" from PUBLIC;
GRANT SELECT on "controle_t_direction" to PUBLIC;
GRANT ALL on "controle_t_direction" to "postgres";
GRANT ALL on "controle_t_direction" to "superkadagona";
GRANT SELECT on "controle_t_direction" to "kadagona";
GRANT ALL on "controle_t_direction" to "superchoukoutien";
GRANT SELECT on "controle_t_direction" to "choukoutien";
GRANT SELECT on "controle_t_direction" to "visiteurchoukoutien";

--
-- TOC Entry ID 231 (OID 7521013)
--
-- Name: controle_t_sens Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_sens" (
	"t_sens" text NOT NULL,
	"description" text,
	Constraint "controle_t_sens_pkey" Primary Key ("t_sens")
);

--
-- TOC Entry ID 232 (OID 7521013)
--
-- Name: controle_t_sens Type: ACL Owner: 
--

REVOKE ALL on "controle_t_sens" from PUBLIC;
GRANT SELECT on "controle_t_sens" to PUBLIC;
GRANT ALL on "controle_t_sens" to "postgres";
GRANT ALL on "controle_t_sens" to "superkadagona";
GRANT SELECT on "controle_t_sens" to "kadagona";
GRANT ALL on "controle_t_sens" to "superchoukoutien";
GRANT SELECT on "controle_t_sens" to "choukoutien";
GRANT SELECT on "controle_t_sens" to "visiteurchoukoutien";

--
-- TOC Entry ID 233 (OID 7521019)
--
-- Name: controle_t_section Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_section" (
	"t_section" text NOT NULL,
	"description" text,
	Constraint "controle_t_section_pkey" Primary Key ("t_section")
);

--
-- TOC Entry ID 234 (OID 7521019)
--
-- Name: controle_t_section Type: ACL Owner: 
--

REVOKE ALL on "controle_t_section" from PUBLIC;
GRANT SELECT on "controle_t_section" to PUBLIC;
GRANT ALL on "controle_t_section" to "postgres";
GRANT ALL on "controle_t_section" to "superkadagona";
GRANT SELECT on "controle_t_section" to "kadagona";
GRANT ALL on "controle_t_section" to "superchoukoutien";
GRANT SELECT on "controle_t_section" to "choukoutien";
GRANT SELECT on "controle_t_section" to "visiteurchoukoutien";

--
-- TOC Entry ID 235 (OID 7521025)
--
-- Name: controle_t_allure Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_allure" (
	"t_allure" text NOT NULL,
	"description" text,
	Constraint "controle_t_allure_pkey" Primary Key ("t_allure")
);

--
-- TOC Entry ID 236 (OID 7521025)
--
-- Name: controle_t_allure Type: ACL Owner: 
--

REVOKE ALL on "controle_t_allure" from PUBLIC;
GRANT SELECT on "controle_t_allure" to PUBLIC;
GRANT ALL on "controle_t_allure" to "postgres";
GRANT ALL on "controle_t_allure" to "superkadagona";
GRANT SELECT on "controle_t_allure" to "kadagona";
GRANT ALL on "controle_t_allure" to "superchoukoutien";
GRANT SELECT on "controle_t_allure" to "choukoutien";
GRANT SELECT on "controle_t_allure" to "visiteurchoukoutien";

--
-- TOC Entry ID 237 (OID 7521031)
--
-- Name: controle_t_dessin Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_dessin" (
	"t_dessin" text NOT NULL,
	"description" text,
	Constraint "controle_t_dessin_pkey" Primary Key ("t_dessin")
);

--
-- TOC Entry ID 238 (OID 7521031)
--
-- Name: controle_t_dessin Type: ACL Owner: 
--

REVOKE ALL on "controle_t_dessin" from PUBLIC;
GRANT SELECT on "controle_t_dessin" to PUBLIC;
GRANT ALL on "controle_t_dessin" to "postgres";
GRANT ALL on "controle_t_dessin" to "superkadagona";
GRANT SELECT on "controle_t_dessin" to "kadagona";
GRANT ALL on "controle_t_dessin" to "superchoukoutien";
GRANT SELECT on "controle_t_dessin" to "choukoutien";
GRANT SELECT on "controle_t_dessin" to "visiteurchoukoutien";

--
-- TOC Entry ID 239 (OID 7521037)
--
-- Name: controle_t_replique Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_replique" (
	"t_replique" text NOT NULL,
	"description" text,
	Constraint "controle_t_replique_pkey" Primary Key ("t_replique")
);

--
-- TOC Entry ID 240 (OID 7521037)
--
-- Name: controle_t_replique Type: ACL Owner: 
--

REVOKE ALL on "controle_t_replique" from PUBLIC;
GRANT SELECT on "controle_t_replique" to PUBLIC;
GRANT ALL on "controle_t_replique" to "postgres";
GRANT ALL on "controle_t_replique" to "superkadagona";
GRANT SELECT on "controle_t_replique" to "kadagona";
GRANT ALL on "controle_t_replique" to "superchoukoutien";
GRANT SELECT on "controle_t_replique" to "choukoutien";
GRANT SELECT on "controle_t_replique" to "visiteurchoukoutien";

--
-- TOC Entry ID 241 (OID 7521043)
--
-- Name: controle_t_photo Type: TABLE Owner: postgres
--

CREATE TABLE "controle_t_photo" (
	"t_photo" text NOT NULL,
	"description" text,
	Constraint "controle_t_photo_pkey" Primary Key ("t_photo")
);

--
-- TOC Entry ID 242 (OID 7521043)
--
-- Name: controle_t_photo Type: ACL Owner: 
--

REVOKE ALL on "controle_t_photo" from PUBLIC;
GRANT SELECT on "controle_t_photo" to PUBLIC;
GRANT ALL on "controle_t_photo" to "postgres";
GRANT ALL on "controle_t_photo" to "superkadagona";
GRANT SELECT on "controle_t_photo" to "kadagona";
GRANT ALL on "controle_t_photo" to "superchoukoutien";
GRANT SELECT on "controle_t_photo" to "choukoutien";
GRANT SELECT on "controle_t_photo" to "visiteurchoukoutien";

--
-- TOC Entry ID 3 (OID 7521049)
--
-- Name: seq_phototrace Type: SEQUENCE Owner: postgres
--

CREATE SEQUENCE "seq_phototrace" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

--
-- TOC Entry ID 243 (OID 7521051)
--
-- Name: phototrace Type: TABLE Owner: postgres
--

CREATE TABLE "phototrace" (
	"idphoto" integer DEFAULT nextval('seq_phototrace'::text) NOT NULL,
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"t_ensemble" text NOT NULL,
	"legende" text,
	Constraint "phototrace_pkey" Primary Key ("idphoto")
);

--
-- TOC Entry ID 244 (OID 7521051)
--
-- Name: phototrace Type: ACL Owner: 
--

REVOKE ALL on "phototrace" from PUBLIC;
GRANT SELECT on "phototrace" to PUBLIC;
GRANT ALL on "phototrace" to "postgres";
GRANT ALL on "phototrace" to "superkadagona";
GRANT SELECT on "phototrace" to "visiteurkadagona";
GRANT ALL on "phototrace" to "kadagona";
GRANT ALL on "phototrace" to "superchoukoutien";
GRANT ALL on "phototrace" to "choukoutien";
GRANT SELECT on "phototrace" to "visiteurchoukoutien";

--
-- TOC Entry ID 245 (OID 7521057)
--
-- Name: coprolithe Type: TABLE Owner: postgres
--

CREATE TABLE "coprolithe" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"c_association" integer,
	"c_fragmentation" text,
	"c_sediment" text,
	"c_couleur" text,
	"c_motif" text,
	"c_motnat" text,
	"c_motcou" text,
	"c_forme" text,
	"c_vol" text,
	"c_volext" text,
	"c_retrecissement" text,
	"c_nombre" integer,
	"c_extremite" text,
	"c_ext1" text,
	"c_ext2" text,
	"c_alteration" text,
	"c_altnat" text,
	"c_inclusion" text,
	"c_incl1" text,
	"c_incl2" text,
	"c_incl3" text,
	"c_element" text,
	"c_granulometrie" text,
	"c_liant" text,
	"c_consistance" text,
	"c_ordre" text,
	"c_famille" text,
	"c_genre" text,
	"c_parasito" text,
	"c_palyno" text,
	"c_lame" text,
	"c_autre" text,
	"c_mif" text,
	"c_macroreste" text,
	"c_longueur" integer,
	"c_largeur" integer,
	"c_epaisseur" integer,
	"c_poids" integer,
	Constraint "coprolithe_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 246 (OID 7521057)
--
-- Name: coprolithe Type: ACL Owner: 
--

REVOKE ALL on "coprolithe" from PUBLIC;
GRANT SELECT on "coprolithe" to PUBLIC;
GRANT ALL on "coprolithe" to "postgres";
GRANT ALL on "coprolithe" to "superkadagona";
GRANT SELECT on "coprolithe" to "visiteurkadagona";
GRANT ALL on "coprolithe" to "kadagona";
GRANT ALL on "coprolithe" to "superchoukoutien";
GRANT ALL on "coprolithe" to "choukoutien";
GRANT SELECT on "coprolithe" to "visiteurchoukoutien";

--
-- TOC Entry ID 247 (OID 7521063)
--
-- Name: controle_c_sediment Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_sediment" (
	"c_sediment" text NOT NULL,
	"description" text,
	Constraint "controle_c_sediment_pkey" Primary Key ("c_sediment")
);

--
-- TOC Entry ID 248 (OID 7521063)
--
-- Name: controle_c_sediment Type: ACL Owner: 
--

REVOKE ALL on "controle_c_sediment" from PUBLIC;
GRANT SELECT on "controle_c_sediment" to PUBLIC;
GRANT ALL on "controle_c_sediment" to "postgres";
GRANT ALL on "controle_c_sediment" to "superkadagona";
GRANT SELECT on "controle_c_sediment" to "kadagona";
GRANT ALL on "controle_c_sediment" to "superchoukoutien";
GRANT SELECT on "controle_c_sediment" to "choukoutien";
GRANT SELECT on "controle_c_sediment" to "visiteurchoukoutien";

--
-- TOC Entry ID 249 (OID 7521069)
--
-- Name: controle_c_couleur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_couleur" (
	"c_couleur" text NOT NULL,
	"description" text,
	Constraint "controle_c_couleur_pkey" Primary Key ("c_couleur")
);

--
-- TOC Entry ID 250 (OID 7521069)
--
-- Name: controle_c_couleur Type: ACL Owner: 
--

REVOKE ALL on "controle_c_couleur" from PUBLIC;
GRANT SELECT on "controle_c_couleur" to PUBLIC;
GRANT ALL on "controle_c_couleur" to "postgres";
GRANT ALL on "controle_c_couleur" to "superkadagona";
GRANT SELECT on "controle_c_couleur" to "kadagona";
GRANT ALL on "controle_c_couleur" to "superchoukoutien";
GRANT SELECT on "controle_c_couleur" to "choukoutien";
GRANT SELECT on "controle_c_couleur" to "visiteurchoukoutien";

--
-- TOC Entry ID 251 (OID 7521075)
--
-- Name: controle_c_motif Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_motif" (
	"c_motif" text NOT NULL,
	"description" text,
	Constraint "controle_c_motif_pkey" Primary Key ("c_motif")
);

--
-- TOC Entry ID 252 (OID 7521075)
--
-- Name: controle_c_motif Type: ACL Owner: 
--

REVOKE ALL on "controle_c_motif" from PUBLIC;
GRANT SELECT on "controle_c_motif" to PUBLIC;
GRANT ALL on "controle_c_motif" to "postgres";
GRANT ALL on "controle_c_motif" to "superkadagona";
GRANT SELECT on "controle_c_motif" to "kadagona";
GRANT ALL on "controle_c_motif" to "superchoukoutien";
GRANT SELECT on "controle_c_motif" to "choukoutien";
GRANT SELECT on "controle_c_motif" to "visiteurchoukoutien";

--
-- TOC Entry ID 253 (OID 7521081)
--
-- Name: controle_c_motnat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_motnat" (
	"c_motnat" text NOT NULL,
	"description" text,
	Constraint "controle_c_motnat_pkey" Primary Key ("c_motnat")
);

--
-- TOC Entry ID 254 (OID 7521081)
--
-- Name: controle_c_motnat Type: ACL Owner: 
--

REVOKE ALL on "controle_c_motnat" from PUBLIC;
GRANT SELECT on "controle_c_motnat" to PUBLIC;
GRANT ALL on "controle_c_motnat" to "postgres";
GRANT ALL on "controle_c_motnat" to "superkadagona";
GRANT SELECT on "controle_c_motnat" to "kadagona";
GRANT ALL on "controle_c_motnat" to "superchoukoutien";
GRANT SELECT on "controle_c_motnat" to "choukoutien";
GRANT SELECT on "controle_c_motnat" to "visiteurchoukoutien";

--
-- TOC Entry ID 255 (OID 7521087)
--
-- Name: controle_c_motcou Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_motcou" (
	"c_motcou" text NOT NULL,
	"description" text,
	Constraint "controle_c_motcou_pkey" Primary Key ("c_motcou")
);

--
-- TOC Entry ID 256 (OID 7521087)
--
-- Name: controle_c_motcou Type: ACL Owner: 
--

REVOKE ALL on "controle_c_motcou" from PUBLIC;
GRANT SELECT on "controle_c_motcou" to PUBLIC;
GRANT ALL on "controle_c_motcou" to "postgres";
GRANT ALL on "controle_c_motcou" to "superkadagona";
GRANT SELECT on "controle_c_motcou" to "kadagona";
GRANT ALL on "controle_c_motcou" to "superchoukoutien";
GRANT SELECT on "controle_c_motcou" to "choukoutien";
GRANT SELECT on "controle_c_motcou" to "visiteurchoukoutien";

--
-- TOC Entry ID 257 (OID 7521093)
--
-- Name: controlec__forme Type: TABLE Owner: postgres
--

CREATE TABLE "controlec__forme" (
	"c_forme" text NOT NULL,
	"description" text,
	Constraint "controlec__forme_pkey" Primary Key ("c_forme")
);

--
-- TOC Entry ID 258 (OID 7521093)
--
-- Name: controlec__forme Type: ACL Owner: 
--

REVOKE ALL on "controlec__forme" from PUBLIC;
GRANT SELECT on "controlec__forme" to PUBLIC;
GRANT ALL on "controlec__forme" to "postgres";
GRANT ALL on "controlec__forme" to "superkadagona";
GRANT SELECT on "controlec__forme" to "kadagona";
GRANT ALL on "controlec__forme" to "superchoukoutien";
GRANT SELECT on "controlec__forme" to "choukoutien";
GRANT SELECT on "controlec__forme" to "visiteurchoukoutien";

--
-- TOC Entry ID 259 (OID 7521099)
--
-- Name: controle_c_vol Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_vol" (
	"c_vol" text NOT NULL,
	"description" text,
	Constraint "controle_c_vol_pkey" Primary Key ("c_vol")
);

--
-- TOC Entry ID 260 (OID 7521099)
--
-- Name: controle_c_vol Type: ACL Owner: 
--

REVOKE ALL on "controle_c_vol" from PUBLIC;
GRANT SELECT on "controle_c_vol" to PUBLIC;
GRANT ALL on "controle_c_vol" to "postgres";
GRANT ALL on "controle_c_vol" to "superkadagona";
GRANT SELECT on "controle_c_vol" to "kadagona";
GRANT ALL on "controle_c_vol" to "superchoukoutien";
GRANT SELECT on "controle_c_vol" to "choukoutien";
GRANT SELECT on "controle_c_vol" to "visiteurchoukoutien";

--
-- TOC Entry ID 261 (OID 7521105)
--
-- Name: controle_c_volext Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_volext" (
	"c_volext" text NOT NULL,
	"description" text,
	Constraint "controle_c_volext_pkey" Primary Key ("c_volext")
);

--
-- TOC Entry ID 262 (OID 7521105)
--
-- Name: controle_c_volext Type: ACL Owner: 
--

REVOKE ALL on "controle_c_volext" from PUBLIC;
GRANT SELECT on "controle_c_volext" to PUBLIC;
GRANT ALL on "controle_c_volext" to "postgres";
GRANT ALL on "controle_c_volext" to "superkadagona";
GRANT SELECT on "controle_c_volext" to "kadagona";
GRANT ALL on "controle_c_volext" to "superchoukoutien";
GRANT SELECT on "controle_c_volext" to "choukoutien";
GRANT SELECT on "controle_c_volext" to "visiteurchoukoutien";

--
-- TOC Entry ID 263 (OID 7521111)
--
-- Name: controle_c_retrecissement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_retrecissement" (
	"c_retrecissement" text NOT NULL,
	"description" text,
	Constraint "controle_c_retrecissement_pkey" Primary Key ("c_retrecissement")
);

--
-- TOC Entry ID 264 (OID 7521111)
--
-- Name: controle_c_retrecissement Type: ACL Owner: 
--

REVOKE ALL on "controle_c_retrecissement" from PUBLIC;
GRANT SELECT on "controle_c_retrecissement" to PUBLIC;
GRANT ALL on "controle_c_retrecissement" to "postgres";
GRANT ALL on "controle_c_retrecissement" to "superkadagona";
GRANT SELECT on "controle_c_retrecissement" to "kadagona";
GRANT ALL on "controle_c_retrecissement" to "superchoukoutien";
GRANT SELECT on "controle_c_retrecissement" to "choukoutien";
GRANT SELECT on "controle_c_retrecissement" to "visiteurchoukoutien";

--
-- TOC Entry ID 265 (OID 7521117)
--
-- Name: controle_c_extremite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_extremite" (
	"c_extremite" text NOT NULL,
	"description" text,
	Constraint "controle_c_extremite_pkey" Primary Key ("c_extremite")
);

--
-- TOC Entry ID 266 (OID 7521117)
--
-- Name: controle_c_extremite Type: ACL Owner: 
--

REVOKE ALL on "controle_c_extremite" from PUBLIC;
GRANT SELECT on "controle_c_extremite" to PUBLIC;
GRANT ALL on "controle_c_extremite" to "postgres";
GRANT ALL on "controle_c_extremite" to "superkadagona";
GRANT SELECT on "controle_c_extremite" to "kadagona";
GRANT ALL on "controle_c_extremite" to "superchoukoutien";
GRANT SELECT on "controle_c_extremite" to "choukoutien";
GRANT SELECT on "controle_c_extremite" to "visiteurchoukoutien";

--
-- TOC Entry ID 267 (OID 7521123)
--
-- Name: controle_c_ext1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_ext1" (
	"c_ext1" text NOT NULL,
	"description" text,
	Constraint "controle_c_ext1_pkey" Primary Key ("c_ext1")
);

--
-- TOC Entry ID 268 (OID 7521123)
--
-- Name: controle_c_ext1 Type: ACL Owner: 
--

REVOKE ALL on "controle_c_ext1" from PUBLIC;
GRANT SELECT on "controle_c_ext1" to PUBLIC;
GRANT ALL on "controle_c_ext1" to "postgres";
GRANT ALL on "controle_c_ext1" to "superkadagona";
GRANT SELECT on "controle_c_ext1" to "kadagona";
GRANT ALL on "controle_c_ext1" to "superchoukoutien";
GRANT SELECT on "controle_c_ext1" to "choukoutien";
GRANT SELECT on "controle_c_ext1" to "visiteurchoukoutien";

--
-- TOC Entry ID 269 (OID 7521129)
--
-- Name: controle_c_ext2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_ext2" (
	"c_ext2" text NOT NULL,
	"description" text,
	Constraint "controle_c_ext2_pkey" Primary Key ("c_ext2")
);

--
-- TOC Entry ID 270 (OID 7521129)
--
-- Name: controle_c_ext2 Type: ACL Owner: 
--

REVOKE ALL on "controle_c_ext2" from PUBLIC;
GRANT SELECT on "controle_c_ext2" to PUBLIC;
GRANT ALL on "controle_c_ext2" to "postgres";
GRANT ALL on "controle_c_ext2" to "superkadagona";
GRANT SELECT on "controle_c_ext2" to "kadagona";
GRANT ALL on "controle_c_ext2" to "superchoukoutien";
GRANT SELECT on "controle_c_ext2" to "choukoutien";
GRANT SELECT on "controle_c_ext2" to "visiteurchoukoutien";

--
-- TOC Entry ID 271 (OID 7521135)
--
-- Name: controle_c_alteration Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_alteration" (
	"c_alteration" text NOT NULL,
	"description" text,
	Constraint "controle_c_alteration_pkey" Primary Key ("c_alteration")
);

--
-- TOC Entry ID 272 (OID 7521135)
--
-- Name: controle_c_alteration Type: ACL Owner: 
--

REVOKE ALL on "controle_c_alteration" from PUBLIC;
GRANT SELECT on "controle_c_alteration" to PUBLIC;
GRANT ALL on "controle_c_alteration" to "postgres";
GRANT ALL on "controle_c_alteration" to "superkadagona";
GRANT SELECT on "controle_c_alteration" to "kadagona";
GRANT ALL on "controle_c_alteration" to "superchoukoutien";
GRANT SELECT on "controle_c_alteration" to "choukoutien";
GRANT SELECT on "controle_c_alteration" to "visiteurchoukoutien";

--
-- TOC Entry ID 273 (OID 7521141)
--
-- Name: controle_c_altnat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_altnat" (
	"c_altnat" text NOT NULL,
	"description" text,
	Constraint "controle_c_altnat_pkey" Primary Key ("c_altnat")
);

--
-- TOC Entry ID 274 (OID 7521141)
--
-- Name: controle_c_altnat Type: ACL Owner: 
--

REVOKE ALL on "controle_c_altnat" from PUBLIC;
GRANT SELECT on "controle_c_altnat" to PUBLIC;
GRANT ALL on "controle_c_altnat" to "postgres";
GRANT ALL on "controle_c_altnat" to "superkadagona";
GRANT SELECT on "controle_c_altnat" to "kadagona";
GRANT ALL on "controle_c_altnat" to "superchoukoutien";
GRANT SELECT on "controle_c_altnat" to "choukoutien";
GRANT SELECT on "controle_c_altnat" to "visiteurchoukoutien";

--
-- TOC Entry ID 275 (OID 7521147)
--
-- Name: controle_c_inclusion Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_inclusion" (
	"c_inclusion" text NOT NULL,
	"description" text,
	Constraint "controle_c_inclusion_pkey" Primary Key ("c_inclusion")
);

--
-- TOC Entry ID 276 (OID 7521147)
--
-- Name: controle_c_inclusion Type: ACL Owner: 
--

REVOKE ALL on "controle_c_inclusion" from PUBLIC;
GRANT SELECT on "controle_c_inclusion" to PUBLIC;
GRANT ALL on "controle_c_inclusion" to "postgres";
GRANT ALL on "controle_c_inclusion" to "superkadagona";
GRANT SELECT on "controle_c_inclusion" to "kadagona";
GRANT ALL on "controle_c_inclusion" to "superchoukoutien";
GRANT SELECT on "controle_c_inclusion" to "choukoutien";
GRANT SELECT on "controle_c_inclusion" to "visiteurchoukoutien";

--
-- TOC Entry ID 277 (OID 7521153)
--
-- Name: controle_c_incl1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_incl1" (
	"c_incl1" text NOT NULL,
	"description" text,
	Constraint "controle_c_incl1_pkey" Primary Key ("c_incl1")
);

--
-- TOC Entry ID 278 (OID 7521153)
--
-- Name: controle_c_incl1 Type: ACL Owner: 
--

REVOKE ALL on "controle_c_incl1" from PUBLIC;
GRANT SELECT on "controle_c_incl1" to PUBLIC;
GRANT ALL on "controle_c_incl1" to "postgres";
GRANT ALL on "controle_c_incl1" to "superkadagona";
GRANT SELECT on "controle_c_incl1" to "kadagona";
GRANT ALL on "controle_c_incl1" to "superchoukoutien";
GRANT SELECT on "controle_c_incl1" to "choukoutien";
GRANT SELECT on "controle_c_incl1" to "visiteurchoukoutien";

--
-- TOC Entry ID 279 (OID 7521159)
--
-- Name: controle_c_incl2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_incl2" (
	"c_incl2" text NOT NULL,
	"description" text,
	Constraint "controle_c_incl2_pkey" Primary Key ("c_incl2")
);

--
-- TOC Entry ID 280 (OID 7521159)
--
-- Name: controle_c_incl2 Type: ACL Owner: 
--

REVOKE ALL on "controle_c_incl2" from PUBLIC;
GRANT SELECT on "controle_c_incl2" to PUBLIC;
GRANT ALL on "controle_c_incl2" to "postgres";
GRANT ALL on "controle_c_incl2" to "superkadagona";
GRANT SELECT on "controle_c_incl2" to "kadagona";
GRANT ALL on "controle_c_incl2" to "superchoukoutien";
GRANT SELECT on "controle_c_incl2" to "choukoutien";
GRANT SELECT on "controle_c_incl2" to "visiteurchoukoutien";

--
-- TOC Entry ID 281 (OID 7521165)
--
-- Name: controle_c_incl3 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_incl3" (
	"c_incl3" text NOT NULL,
	"description" text,
	Constraint "controle_c_incl3_pkey" Primary Key ("c_incl3")
);

--
-- TOC Entry ID 282 (OID 7521165)
--
-- Name: controle_c_incl3 Type: ACL Owner: 
--

REVOKE ALL on "controle_c_incl3" from PUBLIC;
GRANT SELECT on "controle_c_incl3" to PUBLIC;
GRANT ALL on "controle_c_incl3" to "postgres";
GRANT ALL on "controle_c_incl3" to "superkadagona";
GRANT SELECT on "controle_c_incl3" to "kadagona";
GRANT ALL on "controle_c_incl3" to "superchoukoutien";
GRANT SELECT on "controle_c_incl3" to "choukoutien";
GRANT SELECT on "controle_c_incl3" to "visiteurchoukoutien";

--
-- TOC Entry ID 283 (OID 7521171)
--
-- Name: controle_c_element Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_element" (
	"c_element" text NOT NULL,
	"description" text,
	Constraint "controle_c_element_pkey" Primary Key ("c_element")
);

--
-- TOC Entry ID 284 (OID 7521171)
--
-- Name: controle_c_element Type: ACL Owner: 
--

REVOKE ALL on "controle_c_element" from PUBLIC;
GRANT SELECT on "controle_c_element" to PUBLIC;
GRANT ALL on "controle_c_element" to "postgres";
GRANT ALL on "controle_c_element" to "superkadagona";
GRANT SELECT on "controle_c_element" to "kadagona";
GRANT ALL on "controle_c_element" to "superchoukoutien";
GRANT SELECT on "controle_c_element" to "choukoutien";
GRANT SELECT on "controle_c_element" to "visiteurchoukoutien";

--
-- TOC Entry ID 285 (OID 7521177)
--
-- Name: controle_c_granulometrie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_granulometrie" (
	"c_granulometrie" text NOT NULL,
	"description" text,
	Constraint "controle_c_granulometrie_pkey" Primary Key ("c_granulometrie")
);

--
-- TOC Entry ID 286 (OID 7521177)
--
-- Name: controle_c_granulometrie Type: ACL Owner: 
--

REVOKE ALL on "controle_c_granulometrie" from PUBLIC;
GRANT SELECT on "controle_c_granulometrie" to PUBLIC;
GRANT ALL on "controle_c_granulometrie" to "postgres";
GRANT ALL on "controle_c_granulometrie" to "superkadagona";
GRANT SELECT on "controle_c_granulometrie" to "kadagona";
GRANT ALL on "controle_c_granulometrie" to "superchoukoutien";
GRANT SELECT on "controle_c_granulometrie" to "choukoutien";
GRANT SELECT on "controle_c_granulometrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 287 (OID 7521183)
--
-- Name: controle_c_liant Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_liant" (
	"c_liant" text NOT NULL,
	"description" text,
	Constraint "controle_c_liant_pkey" Primary Key ("c_liant")
);

--
-- TOC Entry ID 288 (OID 7521183)
--
-- Name: controle_c_liant Type: ACL Owner: 
--

REVOKE ALL on "controle_c_liant" from PUBLIC;
GRANT SELECT on "controle_c_liant" to PUBLIC;
GRANT ALL on "controle_c_liant" to "postgres";
GRANT ALL on "controle_c_liant" to "superkadagona";
GRANT SELECT on "controle_c_liant" to "kadagona";
GRANT ALL on "controle_c_liant" to "superchoukoutien";
GRANT SELECT on "controle_c_liant" to "choukoutien";
GRANT SELECT on "controle_c_liant" to "visiteurchoukoutien";

--
-- TOC Entry ID 289 (OID 7521189)
--
-- Name: controle_c_consistance Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_consistance" (
	"c_consistance" text NOT NULL,
	"description" text,
	Constraint "controle_c_consistance_pkey" Primary Key ("c_consistance")
);

--
-- TOC Entry ID 290 (OID 7521189)
--
-- Name: controle_c_consistance Type: ACL Owner: 
--

REVOKE ALL on "controle_c_consistance" from PUBLIC;
GRANT SELECT on "controle_c_consistance" to PUBLIC;
GRANT ALL on "controle_c_consistance" to "postgres";
GRANT ALL on "controle_c_consistance" to "superkadagona";
GRANT SELECT on "controle_c_consistance" to "kadagona";
GRANT ALL on "controle_c_consistance" to "superchoukoutien";
GRANT SELECT on "controle_c_consistance" to "choukoutien";
GRANT SELECT on "controle_c_consistance" to "visiteurchoukoutien";

--
-- TOC Entry ID 291 (OID 7521195)
--
-- Name: controle_c_parasito Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_parasito" (
	"c_parasito" text NOT NULL,
	"description" text,
	Constraint "controle_c_parasito_pkey" Primary Key ("c_parasito")
);

--
-- TOC Entry ID 292 (OID 7521195)
--
-- Name: controle_c_parasito Type: ACL Owner: 
--

REVOKE ALL on "controle_c_parasito" from PUBLIC;
GRANT SELECT on "controle_c_parasito" to PUBLIC;
GRANT ALL on "controle_c_parasito" to "postgres";
GRANT ALL on "controle_c_parasito" to "superkadagona";
GRANT SELECT on "controle_c_parasito" to "kadagona";
GRANT ALL on "controle_c_parasito" to "superchoukoutien";
GRANT SELECT on "controle_c_parasito" to "choukoutien";
GRANT SELECT on "controle_c_parasito" to "visiteurchoukoutien";

--
-- TOC Entry ID 293 (OID 7521201)
--
-- Name: controle_c_palyno Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_palyno" (
	"c_palyno" text NOT NULL,
	"description" text,
	Constraint "controle_c_palyno_pkey" Primary Key ("c_palyno")
);

--
-- TOC Entry ID 294 (OID 7521201)
--
-- Name: controle_c_palyno Type: ACL Owner: 
--

REVOKE ALL on "controle_c_palyno" from PUBLIC;
GRANT SELECT on "controle_c_palyno" to PUBLIC;
GRANT ALL on "controle_c_palyno" to "postgres";
GRANT ALL on "controle_c_palyno" to "superkadagona";
GRANT SELECT on "controle_c_palyno" to "kadagona";
GRANT ALL on "controle_c_palyno" to "superchoukoutien";
GRANT SELECT on "controle_c_palyno" to "choukoutien";
GRANT SELECT on "controle_c_palyno" to "visiteurchoukoutien";

--
-- TOC Entry ID 295 (OID 7521207)
--
-- Name: controle_c_lame Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_lame" (
	"c_lame" text NOT NULL,
	"description" text,
	Constraint "controle_c_lame_pkey" Primary Key ("c_lame")
);

--
-- TOC Entry ID 296 (OID 7521207)
--
-- Name: controle_c_lame Type: ACL Owner: 
--

REVOKE ALL on "controle_c_lame" from PUBLIC;
GRANT SELECT on "controle_c_lame" to PUBLIC;
GRANT ALL on "controle_c_lame" to "postgres";
GRANT ALL on "controle_c_lame" to "superkadagona";
GRANT SELECT on "controle_c_lame" to "kadagona";
GRANT ALL on "controle_c_lame" to "superchoukoutien";
GRANT SELECT on "controle_c_lame" to "choukoutien";
GRANT SELECT on "controle_c_lame" to "visiteurchoukoutien";

--
-- TOC Entry ID 297 (OID 7521213)
--
-- Name: controle_c_autre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_autre" (
	"c_autre" text NOT NULL,
	"description" text,
	Constraint "controle_c_autre_pkey" Primary Key ("c_autre")
);

--
-- TOC Entry ID 298 (OID 7521213)
--
-- Name: controle_c_autre Type: ACL Owner: 
--

REVOKE ALL on "controle_c_autre" from PUBLIC;
GRANT SELECT on "controle_c_autre" to PUBLIC;
GRANT ALL on "controle_c_autre" to "postgres";
GRANT ALL on "controle_c_autre" to "superkadagona";
GRANT SELECT on "controle_c_autre" to "kadagona";
GRANT ALL on "controle_c_autre" to "superchoukoutien";
GRANT SELECT on "controle_c_autre" to "choukoutien";
GRANT SELECT on "controle_c_autre" to "visiteurchoukoutien";

--
-- TOC Entry ID 299 (OID 7521219)
--
-- Name: controle_c_mif Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_mif" (
	"c_mif" text NOT NULL,
	"description" text,
	Constraint "controle_c_mif_pkey" Primary Key ("c_mif")
);

--
-- TOC Entry ID 300 (OID 7521219)
--
-- Name: controle_c_mif Type: ACL Owner: 
--

REVOKE ALL on "controle_c_mif" from PUBLIC;
GRANT SELECT on "controle_c_mif" to PUBLIC;
GRANT ALL on "controle_c_mif" to "postgres";
GRANT ALL on "controle_c_mif" to "superkadagona";
GRANT SELECT on "controle_c_mif" to "kadagona";
GRANT ALL on "controle_c_mif" to "superchoukoutien";
GRANT SELECT on "controle_c_mif" to "choukoutien";
GRANT SELECT on "controle_c_mif" to "visiteurchoukoutien";

--
-- TOC Entry ID 301 (OID 7521225)
--
-- Name: controle_c_famille Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_famille" (
	"c_famille" text NOT NULL,
	"description" text,
	Constraint "controle_c_famille_pkey" Primary Key ("c_famille")
);

--
-- TOC Entry ID 302 (OID 7521225)
--
-- Name: controle_c_famille Type: ACL Owner: 
--

REVOKE ALL on "controle_c_famille" from PUBLIC;
GRANT SELECT on "controle_c_famille" to PUBLIC;
GRANT ALL on "controle_c_famille" to "postgres";
GRANT ALL on "controle_c_famille" to "superkadagona";
GRANT SELECT on "controle_c_famille" to "kadagona";
GRANT ALL on "controle_c_famille" to "superchoukoutien";
GRANT SELECT on "controle_c_famille" to "choukoutien";
GRANT SELECT on "controle_c_famille" to "visiteurchoukoutien";

--
-- TOC Entry ID 303 (OID 7521231)
--
-- Name: controle_c_genre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_genre" (
	"c_genre" text NOT NULL,
	"description" text,
	Constraint "controle_c_genre_pkey" Primary Key ("c_genre")
);

--
-- TOC Entry ID 304 (OID 7521231)
--
-- Name: controle_c_genre Type: ACL Owner: 
--

REVOKE ALL on "controle_c_genre" from PUBLIC;
GRANT SELECT on "controle_c_genre" to PUBLIC;
GRANT ALL on "controle_c_genre" to "postgres";
GRANT ALL on "controle_c_genre" to "superkadagona";
GRANT SELECT on "controle_c_genre" to "kadagona";
GRANT ALL on "controle_c_genre" to "superchoukoutien";
GRANT SELECT on "controle_c_genre" to "choukoutien";
GRANT SELECT on "controle_c_genre" to "visiteurchoukoutien";

--
-- TOC Entry ID 305 (OID 7521237)
--
-- Name: controle_c_macroreste Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_macroreste" (
	"c_macroreste" text NOT NULL,
	"description" text,
	Constraint "controle_c_macroreste_pkey" Primary Key ("c_macroreste")
);

--
-- TOC Entry ID 306 (OID 7521237)
--
-- Name: controle_c_macroreste Type: ACL Owner: 
--

REVOKE ALL on "controle_c_macroreste" from PUBLIC;
GRANT SELECT on "controle_c_macroreste" to PUBLIC;
GRANT ALL on "controle_c_macroreste" to "postgres";
GRANT ALL on "controle_c_macroreste" to "superkadagona";
GRANT SELECT on "controle_c_macroreste" to "kadagona";
GRANT ALL on "controle_c_macroreste" to "superchoukoutien";
GRANT SELECT on "controle_c_macroreste" to "choukoutien";
GRANT SELECT on "controle_c_macroreste" to "visiteurchoukoutien";

--
-- TOC Entry ID 307 (OID 7521243)
--
-- Name: controle_c_forme Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_forme" (
	"c_forme" text NOT NULL,
	"description" text,
	Constraint "controle_c_forme_pkey" Primary Key ("c_forme")
);

--
-- TOC Entry ID 308 (OID 7521243)
--
-- Name: controle_c_forme Type: ACL Owner: 
--

REVOKE ALL on "controle_c_forme" from PUBLIC;
GRANT SELECT on "controle_c_forme" to PUBLIC;
GRANT ALL on "controle_c_forme" to "postgres";
GRANT ALL on "controle_c_forme" to "superkadagona";
GRANT SELECT on "controle_c_forme" to "kadagona";
GRANT ALL on "controle_c_forme" to "superchoukoutien";
GRANT SELECT on "controle_c_forme" to "choukoutien";
GRANT SELECT on "controle_c_forme" to "visiteurchoukoutien";

--
-- TOC Entry ID 4 (OID 7521249)
--
-- Name: seq_photocoprolithe Type: SEQUENCE Owner: postgres
--

CREATE SEQUENCE "seq_photocoprolithe" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

--
-- TOC Entry ID 309 (OID 7521251)
--
-- Name: photocoprolithe Type: TABLE Owner: postgres
--

CREATE TABLE "photocoprolithe" (
	"idphoto" integer DEFAULT nextval('seq_photocoprolithe'::text) NOT NULL,
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"t_ensemble" text NOT NULL,
	"legende" text,
	Constraint "photocoprolithe_pkey" Primary Key ("idphoto")
);

--
-- TOC Entry ID 310 (OID 7521251)
--
-- Name: photocoprolithe Type: ACL Owner: 
--

REVOKE ALL on "photocoprolithe" from PUBLIC;
GRANT SELECT on "photocoprolithe" to PUBLIC;
GRANT ALL on "photocoprolithe" to "postgres";
GRANT ALL on "photocoprolithe" to "superkadagona";
GRANT SELECT on "photocoprolithe" to "visiteurkadagona";
GRANT ALL on "photocoprolithe" to "kadagona";
GRANT ALL on "photocoprolithe" to "superchoukoutien";
GRANT ALL on "photocoprolithe" to "choukoutien";
GRANT SELECT on "photocoprolithe" to "visiteurchoukoutien";

--
-- TOC Entry ID 311 (OID 7521257)
--
-- Name: controle_i_forme_galet Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_forme_galet" (
	"i_forme_galet" text NOT NULL,
	"description" text,
	Constraint "controle_i_forme_galet_pkey" Primary Key ("i_forme_galet")
);

--
-- TOC Entry ID 312 (OID 7521257)
--
-- Name: controle_i_forme_galet Type: ACL Owner: 
--

REVOKE ALL on "controle_i_forme_galet" from PUBLIC;
GRANT SELECT on "controle_i_forme_galet" to PUBLIC;
GRANT ALL on "controle_i_forme_galet" to "postgres";
GRANT ALL on "controle_i_forme_galet" to "superkadagona";
GRANT SELECT on "controle_i_forme_galet" to "kadagona";
GRANT ALL on "controle_i_forme_galet" to "superchoukoutien";
GRANT SELECT on "controle_i_forme_galet" to "choukoutien";
GRANT SELECT on "controle_i_forme_galet" to "visiteurchoukoutien";

--
-- TOC Entry ID 313 (OID 7521263)
--
-- Name: controle_i_matiere Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_matiere" (
	"i_matiere" text NOT NULL,
	"description" text,
	Constraint "controle_i_matiere_pkey" Primary Key ("i_matiere")
);

--
-- TOC Entry ID 314 (OID 7521263)
--
-- Name: controle_i_matiere Type: ACL Owner: 
--

REVOKE ALL on "controle_i_matiere" from PUBLIC;
GRANT SELECT on "controle_i_matiere" to PUBLIC;
GRANT ALL on "controle_i_matiere" to "postgres";
GRANT ALL on "controle_i_matiere" to "superkadagona";
GRANT SELECT on "controle_i_matiere" to "kadagona";
GRANT ALL on "controle_i_matiere" to "superchoukoutien";
GRANT SELECT on "controle_i_matiere" to "choukoutien";
GRANT SELECT on "controle_i_matiere" to "visiteurchoukoutien";

--
-- TOC Entry ID 315 (OID 7521269)
--
-- Name: controle_i_etat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_etat" (
	"i_etat" text NOT NULL,
	"description" text,
	Constraint "controle_i_etat_pkey" Primary Key ("i_etat")
);

--
-- TOC Entry ID 316 (OID 7521269)
--
-- Name: controle_i_etat Type: ACL Owner: 
--

REVOKE ALL on "controle_i_etat" from PUBLIC;
GRANT SELECT on "controle_i_etat" to PUBLIC;
GRANT ALL on "controle_i_etat" to "postgres";
GRANT ALL on "controle_i_etat" to "superkadagona";
GRANT SELECT on "controle_i_etat" to "kadagona";
GRANT ALL on "controle_i_etat" to "superchoukoutien";
GRANT SELECT on "controle_i_etat" to "choukoutien";
GRANT SELECT on "controle_i_etat" to "visiteurchoukoutien";

--
-- TOC Entry ID 317 (OID 7521275)
--
-- Name: controle_i_patine Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_patine" (
	"i_patine" text NOT NULL,
	"description" text,
	Constraint "controle_i_patine_pkey" Primary Key ("i_patine")
);

--
-- TOC Entry ID 318 (OID 7521275)
--
-- Name: controle_i_patine Type: ACL Owner: 
--

REVOKE ALL on "controle_i_patine" from PUBLIC;
GRANT SELECT on "controle_i_patine" to PUBLIC;
GRANT ALL on "controle_i_patine" to "postgres";
GRANT ALL on "controle_i_patine" to "superkadagona";
GRANT SELECT on "controle_i_patine" to "kadagona";
GRANT ALL on "controle_i_patine" to "superchoukoutien";
GRANT SELECT on "controle_i_patine" to "choukoutien";
GRANT SELECT on "controle_i_patine" to "visiteurchoukoutien";

--
-- TOC Entry ID 319 (OID 7521281)
--
-- Name: controle_i_dpatine Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_dpatine" (
	"i_dpatine" text NOT NULL,
	"description" text,
	Constraint "controle_i_dpatine_pkey" Primary Key ("i_dpatine")
);

--
-- TOC Entry ID 320 (OID 7521281)
--
-- Name: controle_i_dpatine Type: ACL Owner: 
--

REVOKE ALL on "controle_i_dpatine" from PUBLIC;
GRANT SELECT on "controle_i_dpatine" to PUBLIC;
GRANT ALL on "controle_i_dpatine" to "postgres";
GRANT ALL on "controle_i_dpatine" to "superkadagona";
GRANT SELECT on "controle_i_dpatine" to "kadagona";
GRANT ALL on "controle_i_dpatine" to "superchoukoutien";
GRANT SELECT on "controle_i_dpatine" to "choukoutien";
GRANT SELECT on "controle_i_dpatine" to "visiteurchoukoutien";

--
-- TOC Entry ID 321 (OID 7521287)
--
-- Name: controle_i_alteration Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_alteration" (
	"i_alteration" text NOT NULL,
	"description" text,
	Constraint "controle_i_alteration_pkey" Primary Key ("i_alteration")
);

--
-- TOC Entry ID 322 (OID 7521287)
--
-- Name: controle_i_alteration Type: ACL Owner: 
--

REVOKE ALL on "controle_i_alteration" from PUBLIC;
GRANT SELECT on "controle_i_alteration" to PUBLIC;
GRANT ALL on "controle_i_alteration" to "postgres";
GRANT ALL on "controle_i_alteration" to "superkadagona";
GRANT SELECT on "controle_i_alteration" to "kadagona";
GRANT ALL on "controle_i_alteration" to "superchoukoutien";
GRANT SELECT on "controle_i_alteration" to "choukoutien";
GRANT SELECT on "controle_i_alteration" to "visiteurchoukoutien";

--
-- TOC Entry ID 323 (OID 7521293)
--
-- Name: controle_i_encroutement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_encroutement" (
	"i_encroutement" text NOT NULL,
	"description" text,
	Constraint "controle_i_encroutement_pkey" Primary Key ("i_encroutement")
);

--
-- TOC Entry ID 324 (OID 7521293)
--
-- Name: controle_i_encroutement Type: ACL Owner: 
--

REVOKE ALL on "controle_i_encroutement" from PUBLIC;
GRANT SELECT on "controle_i_encroutement" to PUBLIC;
GRANT ALL on "controle_i_encroutement" to "postgres";
GRANT ALL on "controle_i_encroutement" to "superkadagona";
GRANT SELECT on "controle_i_encroutement" to "kadagona";
GRANT ALL on "controle_i_encroutement" to "superchoukoutien";
GRANT SELECT on "controle_i_encroutement" to "choukoutien";
GRANT SELECT on "controle_i_encroutement" to "visiteurchoukoutien";

--
-- TOC Entry ID 325 (OID 7521299)
--
-- Name: controle_i_pmycellium Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_pmycellium" (
	"i_pmycellium" text NOT NULL,
	"description" text,
	Constraint "controle_i_pmycellium_pkey" Primary Key ("i_pmycellium")
);

--
-- TOC Entry ID 326 (OID 7521299)
--
-- Name: controle_i_pmycellium Type: ACL Owner: 
--

REVOKE ALL on "controle_i_pmycellium" from PUBLIC;
GRANT SELECT on "controle_i_pmycellium" to PUBLIC;
GRANT ALL on "controle_i_pmycellium" to "postgres";
GRANT ALL on "controle_i_pmycellium" to "superkadagona";
GRANT SELECT on "controle_i_pmycellium" to "kadagona";
GRANT ALL on "controle_i_pmycellium" to "superchoukoutien";
GRANT SELECT on "controle_i_pmycellium" to "choukoutien";
GRANT SELECT on "controle_i_pmycellium" to "visiteurchoukoutien";

--
-- TOC Entry ID 327 (OID 7521305)
--
-- Name: controle_i_eolisation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_eolisation" (
	"i_eolisation" text NOT NULL,
	"description" text,
	Constraint "controle_i_eolisation_pkey" Primary Key ("i_eolisation")
);

--
-- TOC Entry ID 328 (OID 7521305)
--
-- Name: controle_i_eolisation Type: ACL Owner: 
--

REVOKE ALL on "controle_i_eolisation" from PUBLIC;
GRANT SELECT on "controle_i_eolisation" to PUBLIC;
GRANT ALL on "controle_i_eolisation" to "postgres";
GRANT ALL on "controle_i_eolisation" to "superkadagona";
GRANT SELECT on "controle_i_eolisation" to "kadagona";
GRANT ALL on "controle_i_eolisation" to "superchoukoutien";
GRANT SELECT on "controle_i_eolisation" to "choukoutien";
GRANT SELECT on "controle_i_eolisation" to "visiteurchoukoutien";

--
-- TOC Entry ID 329 (OID 7521311)
--
-- Name: controle_i_lustrage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_lustrage" (
	"i_lustrage" text NOT NULL,
	"description" text,
	Constraint "controle_i_lustrage_pkey" Primary Key ("i_lustrage")
);

--
-- TOC Entry ID 330 (OID 7521311)
--
-- Name: controle_i_lustrage Type: ACL Owner: 
--

REVOKE ALL on "controle_i_lustrage" from PUBLIC;
GRANT SELECT on "controle_i_lustrage" to PUBLIC;
GRANT ALL on "controle_i_lustrage" to "postgres";
GRANT ALL on "controle_i_lustrage" to "superkadagona";
GRANT SELECT on "controle_i_lustrage" to "kadagona";
GRANT ALL on "controle_i_lustrage" to "superchoukoutien";
GRANT SELECT on "controle_i_lustrage" to "choukoutien";
GRANT SELECT on "controle_i_lustrage" to "visiteurchoukoutien";

--
-- TOC Entry ID 331 (OID 7521317)
--
-- Name: controle_i_roulage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_roulage" (
	"i_roulage" text NOT NULL,
	"description" text,
	Constraint "controle_i_roulage_pkey" Primary Key ("i_roulage")
);

--
-- TOC Entry ID 332 (OID 7521317)
--
-- Name: controle_i_roulage Type: ACL Owner: 
--

REVOKE ALL on "controle_i_roulage" from PUBLIC;
GRANT SELECT on "controle_i_roulage" to PUBLIC;
GRANT ALL on "controle_i_roulage" to "postgres";
GRANT ALL on "controle_i_roulage" to "superkadagona";
GRANT SELECT on "controle_i_roulage" to "kadagona";
GRANT ALL on "controle_i_roulage" to "superchoukoutien";
GRANT SELECT on "controle_i_roulage" to "choukoutien";
GRANT SELECT on "controle_i_roulage" to "visiteurchoukoutien";

--
-- TOC Entry ID 333 (OID 7521323)
--
-- Name: controle_i_action Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_action" (
	"i_action" text NOT NULL,
	"description" text,
	Constraint "controle_i_action_pkey" Primary Key ("i_action")
);

--
-- TOC Entry ID 334 (OID 7521323)
--
-- Name: controle_i_action Type: ACL Owner: 
--

REVOKE ALL on "controle_i_action" from PUBLIC;
GRANT SELECT on "controle_i_action" to PUBLIC;
GRANT ALL on "controle_i_action" to "postgres";
GRANT ALL on "controle_i_action" to "superkadagona";
GRANT SELECT on "controle_i_action" to "kadagona";
GRANT ALL on "controle_i_action" to "superchoukoutien";
GRANT SELECT on "controle_i_action" to "choukoutien";
GRANT SELECT on "controle_i_action" to "visiteurchoukoutien";

--
-- TOC Entry ID 335 (OID 7521329)
--
-- Name: controle_i_desilicification Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_desilicification" (
	"i_desilicification" text NOT NULL,
	"description" text,
	Constraint "controle_i_desilicificatio_pkey" Primary Key ("i_desilicification")
);

--
-- TOC Entry ID 336 (OID 7521329)
--
-- Name: controle_i_desilicification Type: ACL Owner: 
--

REVOKE ALL on "controle_i_desilicification" from PUBLIC;
GRANT SELECT on "controle_i_desilicification" to PUBLIC;
GRANT ALL on "controle_i_desilicification" to "postgres";
GRANT ALL on "controle_i_desilicification" to "superkadagona";
GRANT SELECT on "controle_i_desilicification" to "kadagona";
GRANT ALL on "controle_i_desilicification" to "superchoukoutien";
GRANT SELECT on "controle_i_desilicification" to "choukoutien";
GRANT SELECT on "controle_i_desilicification" to "visiteurchoukoutien";

--
-- TOC Entry ID 337 (OID 7521335)
--
-- Name: controle_i_support Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_support" (
	"i_support" text NOT NULL,
	"description" text,
	Constraint "controle_i_support_pkey" Primary Key ("i_support")
);

--
-- TOC Entry ID 338 (OID 7521335)
--
-- Name: controle_i_support Type: ACL Owner: 
--

REVOKE ALL on "controle_i_support" from PUBLIC;
GRANT SELECT on "controle_i_support" to PUBLIC;
GRANT ALL on "controle_i_support" to "postgres";
GRANT ALL on "controle_i_support" to "superkadagona";
GRANT SELECT on "controle_i_support" to "kadagona";
GRANT ALL on "controle_i_support" to "superchoukoutien";
GRANT SELECT on "controle_i_support" to "choukoutien";
GRANT SELECT on "controle_i_support" to "visiteurchoukoutien";

--
-- TOC Entry ID 339 (OID 7521341)
--
-- Name: controle_i_objet Type: TABLE Owner: postgres
--

CREATE TABLE "controle_i_objet" (
	"i_objet" text NOT NULL,
	"description" text,
	Constraint "controle_i_objet_pkey" Primary Key ("i_objet")
);

--
-- TOC Entry ID 340 (OID 7521341)
--
-- Name: controle_i_objet Type: ACL Owner: 
--

REVOKE ALL on "controle_i_objet" from PUBLIC;
GRANT SELECT on "controle_i_objet" to PUBLIC;
GRANT ALL on "controle_i_objet" to "postgres";
GRANT ALL on "controle_i_objet" to "superkadagona";
GRANT SELECT on "controle_i_objet" to "kadagona";
GRANT ALL on "controle_i_objet" to "superchoukoutien";
GRANT SELECT on "controle_i_objet" to "choukoutien";
GRANT SELECT on "controle_i_objet" to "visiteurchoukoutien";

--
-- TOC Entry ID 5 (OID 7521347)
--
-- Name: seq_photoindustrie Type: SEQUENCE Owner: postgres
--

CREATE SEQUENCE "seq_photoindustrie" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

--
-- TOC Entry ID 341 (OID 7521349)
--
-- Name: photoindustrie Type: TABLE Owner: postgres
--

CREATE TABLE "photoindustrie" (
	"idphoto" integer DEFAULT nextval('seq_photoindustrie'::text) NOT NULL,
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"legende" text,
	Constraint "photoindustrie_pkey" Primary Key ("idphoto")
);

--
-- TOC Entry ID 342 (OID 7521349)
--
-- Name: photoindustrie Type: ACL Owner: 
--

REVOKE ALL on "photoindustrie" from PUBLIC;
GRANT SELECT on "photoindustrie" to PUBLIC;
GRANT ALL on "photoindustrie" to "postgres";
GRANT ALL on "photoindustrie" to "superkadagona";
GRANT SELECT on "photoindustrie" to "visiteurkadagona";
GRANT ALL on "photoindustrie" to "kadagona";
GRANT ALL on "photoindustrie" to "superchoukoutien";
GRANT ALL on "photoindustrie" to "choukoutien";
GRANT SELECT on "photoindustrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 343 (OID 7521355)
--
-- Name: retouche Type: TABLE Owner: postgres
--

CREATE TABLE "retouche" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"r_ordre" integer NOT NULL,
	"r_type" text,
	"r_obliquite" text,
	"r_denticulation" text,
	"r_cas" text,
	"r_utilisation" text,
	"r_dimension" text,
	"r_association" text,
	"r_superposition" text,
	"r_extremite" text,
	"r_bord" text,
	"r_frequence" text,
	"r_ecrasement" text,
	"r_lustrage" text,
	"r_strie" text,
	"r_origine" text,
	"r_destination" text,
	"r_sens" text,
	"r_tranchant" text,
	"r_relation" text,
	"r_extension" integer,
	Constraint "retouche_pkey" Primary Key ("zone", "numero", "bis", "r_ordre")
);

--
-- TOC Entry ID 344 (OID 7521355)
--
-- Name: retouche Type: ACL Owner: 
--

REVOKE ALL on "retouche" from PUBLIC;
GRANT SELECT on "retouche" to PUBLIC;
GRANT ALL on "retouche" to "postgres";
GRANT ALL on "retouche" to "superkadagona";
GRANT SELECT on "retouche" to "visiteurkadagona";
GRANT ALL on "retouche" to "kadagona";
GRANT ALL on "retouche" to "superchoukoutien";
GRANT ALL on "retouche" to "choukoutien";
GRANT SELECT on "retouche" to "visiteurchoukoutien";

--
-- TOC Entry ID 345 (OID 7521361)
--
-- Name: controle_r_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_ordre" (
	"r_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_r_ordre_pkey" Primary Key ("r_ordre")
);

--
-- TOC Entry ID 346 (OID 7521361)
--
-- Name: controle_r_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_r_ordre" from PUBLIC;
GRANT SELECT on "controle_r_ordre" to PUBLIC;
GRANT ALL on "controle_r_ordre" to "postgres";
GRANT ALL on "controle_r_ordre" to "superkadagona";
GRANT SELECT on "controle_r_ordre" to "kadagona";
GRANT ALL on "controle_r_ordre" to "superchoukoutien";
GRANT SELECT on "controle_r_ordre" to "choukoutien";
GRANT SELECT on "controle_r_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 347 (OID 7521367)
--
-- Name: controle_r_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_type" (
	"r_type" text NOT NULL,
	"description" text,
	Constraint "controle_r_type_pkey" Primary Key ("r_type")
);

--
-- TOC Entry ID 348 (OID 7521367)
--
-- Name: controle_r_type Type: ACL Owner: 
--

REVOKE ALL on "controle_r_type" from PUBLIC;
GRANT SELECT on "controle_r_type" to PUBLIC;
GRANT ALL on "controle_r_type" to "postgres";
GRANT ALL on "controle_r_type" to "superkadagona";
GRANT SELECT on "controle_r_type" to "kadagona";
GRANT ALL on "controle_r_type" to "superchoukoutien";
GRANT SELECT on "controle_r_type" to "choukoutien";
GRANT SELECT on "controle_r_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 349 (OID 7521373)
--
-- Name: controle_r_obliquite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_obliquite" (
	"r_obliquite" text NOT NULL,
	"description" text,
	Constraint "controle_r_obliquite_pkey" Primary Key ("r_obliquite")
);

--
-- TOC Entry ID 350 (OID 7521373)
--
-- Name: controle_r_obliquite Type: ACL Owner: 
--

REVOKE ALL on "controle_r_obliquite" from PUBLIC;
GRANT SELECT on "controle_r_obliquite" to PUBLIC;
GRANT ALL on "controle_r_obliquite" to "postgres";
GRANT ALL on "controle_r_obliquite" to "superkadagona";
GRANT SELECT on "controle_r_obliquite" to "kadagona";
GRANT ALL on "controle_r_obliquite" to "superchoukoutien";
GRANT SELECT on "controle_r_obliquite" to "choukoutien";
GRANT SELECT on "controle_r_obliquite" to "visiteurchoukoutien";

--
-- TOC Entry ID 351 (OID 7521379)
--
-- Name: controle_r_denticulation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_denticulation" (
	"r_denticulation" text NOT NULL,
	"description" text,
	Constraint "controle_r_denticulation_pkey" Primary Key ("r_denticulation")
);

--
-- TOC Entry ID 352 (OID 7521379)
--
-- Name: controle_r_denticulation Type: ACL Owner: 
--

REVOKE ALL on "controle_r_denticulation" from PUBLIC;
GRANT SELECT on "controle_r_denticulation" to PUBLIC;
GRANT ALL on "controle_r_denticulation" to "postgres";
GRANT ALL on "controle_r_denticulation" to "superkadagona";
GRANT SELECT on "controle_r_denticulation" to "kadagona";
GRANT ALL on "controle_r_denticulation" to "superchoukoutien";
GRANT SELECT on "controle_r_denticulation" to "choukoutien";
GRANT SELECT on "controle_r_denticulation" to "visiteurchoukoutien";

--
-- TOC Entry ID 353 (OID 7521385)
--
-- Name: controle_r_cas Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_cas" (
	"r_cas" text NOT NULL,
	"description" text,
	Constraint "controle_r_cas_pkey" Primary Key ("r_cas")
);

--
-- TOC Entry ID 354 (OID 7521385)
--
-- Name: controle_r_cas Type: ACL Owner: 
--

REVOKE ALL on "controle_r_cas" from PUBLIC;
GRANT SELECT on "controle_r_cas" to PUBLIC;
GRANT ALL on "controle_r_cas" to "postgres";
GRANT ALL on "controle_r_cas" to "superkadagona";
GRANT SELECT on "controle_r_cas" to "kadagona";
GRANT ALL on "controle_r_cas" to "superchoukoutien";
GRANT SELECT on "controle_r_cas" to "choukoutien";
GRANT SELECT on "controle_r_cas" to "visiteurchoukoutien";

--
-- TOC Entry ID 355 (OID 7521391)
--
-- Name: controle_r_utilisation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_utilisation" (
	"r_utilisation" text NOT NULL,
	"description" text,
	Constraint "controle_r_utilisation_pkey" Primary Key ("r_utilisation")
);

--
-- TOC Entry ID 356 (OID 7521391)
--
-- Name: controle_r_utilisation Type: ACL Owner: 
--

REVOKE ALL on "controle_r_utilisation" from PUBLIC;
GRANT SELECT on "controle_r_utilisation" to PUBLIC;
GRANT ALL on "controle_r_utilisation" to "postgres";
GRANT ALL on "controle_r_utilisation" to "superkadagona";
GRANT SELECT on "controle_r_utilisation" to "kadagona";
GRANT ALL on "controle_r_utilisation" to "superchoukoutien";
GRANT SELECT on "controle_r_utilisation" to "choukoutien";
GRANT SELECT on "controle_r_utilisation" to "visiteurchoukoutien";

--
-- TOC Entry ID 357 (OID 7521397)
--
-- Name: controle_r_dimension Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_dimension" (
	"r_dimension" text NOT NULL,
	"description" text,
	Constraint "controle_r_dimension_pkey" Primary Key ("r_dimension")
);

--
-- TOC Entry ID 358 (OID 7521397)
--
-- Name: controle_r_dimension Type: ACL Owner: 
--

REVOKE ALL on "controle_r_dimension" from PUBLIC;
GRANT SELECT on "controle_r_dimension" to PUBLIC;
GRANT ALL on "controle_r_dimension" to "postgres";
GRANT ALL on "controle_r_dimension" to "superkadagona";
GRANT SELECT on "controle_r_dimension" to "kadagona";
GRANT ALL on "controle_r_dimension" to "superchoukoutien";
GRANT SELECT on "controle_r_dimension" to "choukoutien";
GRANT SELECT on "controle_r_dimension" to "visiteurchoukoutien";

--
-- TOC Entry ID 359 (OID 7521403)
--
-- Name: controle_r_association Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_association" (
	"r_association" text NOT NULL,
	"description" text,
	Constraint "controle_r_association_pkey" Primary Key ("r_association")
);

--
-- TOC Entry ID 360 (OID 7521403)
--
-- Name: controle_r_association Type: ACL Owner: 
--

REVOKE ALL on "controle_r_association" from PUBLIC;
GRANT SELECT on "controle_r_association" to PUBLIC;
GRANT ALL on "controle_r_association" to "postgres";
GRANT ALL on "controle_r_association" to "superkadagona";
GRANT SELECT on "controle_r_association" to "kadagona";
GRANT ALL on "controle_r_association" to "superchoukoutien";
GRANT SELECT on "controle_r_association" to "choukoutien";
GRANT SELECT on "controle_r_association" to "visiteurchoukoutien";

--
-- TOC Entry ID 361 (OID 7521409)
--
-- Name: controle_r_superposition Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_superposition" (
	"r_superposition" text NOT NULL,
	"description" text,
	Constraint "controle_r_superposition_pkey" Primary Key ("r_superposition")
);

--
-- TOC Entry ID 362 (OID 7521409)
--
-- Name: controle_r_superposition Type: ACL Owner: 
--

REVOKE ALL on "controle_r_superposition" from PUBLIC;
GRANT SELECT on "controle_r_superposition" to PUBLIC;
GRANT ALL on "controle_r_superposition" to "postgres";
GRANT ALL on "controle_r_superposition" to "superkadagona";
GRANT SELECT on "controle_r_superposition" to "kadagona";
GRANT ALL on "controle_r_superposition" to "superchoukoutien";
GRANT SELECT on "controle_r_superposition" to "choukoutien";
GRANT SELECT on "controle_r_superposition" to "visiteurchoukoutien";

--
-- TOC Entry ID 363 (OID 7521415)
--
-- Name: controle_r_extremite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_extremite" (
	"r_extremite" text NOT NULL,
	"description" text,
	Constraint "controle_r_extremite_pkey" Primary Key ("r_extremite")
);

--
-- TOC Entry ID 364 (OID 7521415)
--
-- Name: controle_r_extremite Type: ACL Owner: 
--

REVOKE ALL on "controle_r_extremite" from PUBLIC;
GRANT SELECT on "controle_r_extremite" to PUBLIC;
GRANT ALL on "controle_r_extremite" to "postgres";
GRANT ALL on "controle_r_extremite" to "superkadagona";
GRANT SELECT on "controle_r_extremite" to "kadagona";
GRANT ALL on "controle_r_extremite" to "superchoukoutien";
GRANT SELECT on "controle_r_extremite" to "choukoutien";
GRANT SELECT on "controle_r_extremite" to "visiteurchoukoutien";

--
-- TOC Entry ID 365 (OID 7521421)
--
-- Name: controle_r_bord Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_bord" (
	"r_bord" text NOT NULL,
	"description" text,
	Constraint "controle_r_bord_pkey" Primary Key ("r_bord")
);

--
-- TOC Entry ID 366 (OID 7521421)
--
-- Name: controle_r_bord Type: ACL Owner: 
--

REVOKE ALL on "controle_r_bord" from PUBLIC;
GRANT SELECT on "controle_r_bord" to PUBLIC;
GRANT ALL on "controle_r_bord" to "postgres";
GRANT ALL on "controle_r_bord" to "superkadagona";
GRANT SELECT on "controle_r_bord" to "kadagona";
GRANT ALL on "controle_r_bord" to "superchoukoutien";
GRANT SELECT on "controle_r_bord" to "choukoutien";
GRANT SELECT on "controle_r_bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 367 (OID 7521427)
--
-- Name: controle_r_frequence Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_frequence" (
	"r_frequence" text NOT NULL,
	"description" text,
	Constraint "controle_r_frequence_pkey" Primary Key ("r_frequence")
);

--
-- TOC Entry ID 368 (OID 7521427)
--
-- Name: controle_r_frequence Type: ACL Owner: 
--

REVOKE ALL on "controle_r_frequence" from PUBLIC;
GRANT SELECT on "controle_r_frequence" to PUBLIC;
GRANT ALL on "controle_r_frequence" to "postgres";
GRANT ALL on "controle_r_frequence" to "superkadagona";
GRANT SELECT on "controle_r_frequence" to "kadagona";
GRANT ALL on "controle_r_frequence" to "superchoukoutien";
GRANT SELECT on "controle_r_frequence" to "choukoutien";
GRANT SELECT on "controle_r_frequence" to "visiteurchoukoutien";

--
-- TOC Entry ID 369 (OID 7521433)
--
-- Name: controle_r_ecrasement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_ecrasement" (
	"r_ecrasement" text NOT NULL,
	"description" text,
	Constraint "controle_r_ecrasement_pkey" Primary Key ("r_ecrasement")
);

--
-- TOC Entry ID 370 (OID 7521433)
--
-- Name: controle_r_ecrasement Type: ACL Owner: 
--

REVOKE ALL on "controle_r_ecrasement" from PUBLIC;
GRANT SELECT on "controle_r_ecrasement" to PUBLIC;
GRANT ALL on "controle_r_ecrasement" to "postgres";
GRANT ALL on "controle_r_ecrasement" to "superkadagona";
GRANT SELECT on "controle_r_ecrasement" to "kadagona";
GRANT ALL on "controle_r_ecrasement" to "superchoukoutien";
GRANT SELECT on "controle_r_ecrasement" to "choukoutien";
GRANT SELECT on "controle_r_ecrasement" to "visiteurchoukoutien";

--
-- TOC Entry ID 371 (OID 7521439)
--
-- Name: controle_r_lustrage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_lustrage" (
	"r_lustrage" text NOT NULL,
	"description" text,
	Constraint "controle_r_lustrage_pkey" Primary Key ("r_lustrage")
);

--
-- TOC Entry ID 372 (OID 7521439)
--
-- Name: controle_r_lustrage Type: ACL Owner: 
--

REVOKE ALL on "controle_r_lustrage" from PUBLIC;
GRANT SELECT on "controle_r_lustrage" to PUBLIC;
GRANT ALL on "controle_r_lustrage" to "postgres";
GRANT ALL on "controle_r_lustrage" to "superkadagona";
GRANT SELECT on "controle_r_lustrage" to "kadagona";
GRANT ALL on "controle_r_lustrage" to "superchoukoutien";
GRANT SELECT on "controle_r_lustrage" to "choukoutien";
GRANT SELECT on "controle_r_lustrage" to "visiteurchoukoutien";

--
-- TOC Entry ID 373 (OID 7521445)
--
-- Name: controle_r_strie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_strie" (
	"r_strie" text NOT NULL,
	"description" text,
	Constraint "controle_r_strie_pkey" Primary Key ("r_strie")
);

--
-- TOC Entry ID 374 (OID 7521445)
--
-- Name: controle_r_strie Type: ACL Owner: 
--

REVOKE ALL on "controle_r_strie" from PUBLIC;
GRANT SELECT on "controle_r_strie" to PUBLIC;
GRANT ALL on "controle_r_strie" to "postgres";
GRANT ALL on "controle_r_strie" to "superkadagona";
GRANT SELECT on "controle_r_strie" to "kadagona";
GRANT ALL on "controle_r_strie" to "superchoukoutien";
GRANT SELECT on "controle_r_strie" to "choukoutien";
GRANT SELECT on "controle_r_strie" to "visiteurchoukoutien";

--
-- TOC Entry ID 375 (OID 7521451)
--
-- Name: controle_r_origine Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_origine" (
	"r_origine" text NOT NULL,
	"description" text,
	Constraint "controle_r_origine_pkey" Primary Key ("r_origine")
);

--
-- TOC Entry ID 376 (OID 7521451)
--
-- Name: controle_r_origine Type: ACL Owner: 
--

REVOKE ALL on "controle_r_origine" from PUBLIC;
GRANT SELECT on "controle_r_origine" to PUBLIC;
GRANT ALL on "controle_r_origine" to "postgres";
GRANT ALL on "controle_r_origine" to "superkadagona";
GRANT SELECT on "controle_r_origine" to "kadagona";
GRANT ALL on "controle_r_origine" to "superchoukoutien";
GRANT SELECT on "controle_r_origine" to "choukoutien";
GRANT SELECT on "controle_r_origine" to "visiteurchoukoutien";

--
-- TOC Entry ID 377 (OID 7521457)
--
-- Name: controle_r_destination Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_destination" (
	"r_destination" text NOT NULL,
	"description" text,
	Constraint "controle_r_destination_pkey" Primary Key ("r_destination")
);

--
-- TOC Entry ID 378 (OID 7521457)
--
-- Name: controle_r_destination Type: ACL Owner: 
--

REVOKE ALL on "controle_r_destination" from PUBLIC;
GRANT SELECT on "controle_r_destination" to PUBLIC;
GRANT ALL on "controle_r_destination" to "postgres";
GRANT ALL on "controle_r_destination" to "superkadagona";
GRANT SELECT on "controle_r_destination" to "kadagona";
GRANT ALL on "controle_r_destination" to "superchoukoutien";
GRANT SELECT on "controle_r_destination" to "choukoutien";
GRANT SELECT on "controle_r_destination" to "visiteurchoukoutien";

--
-- TOC Entry ID 379 (OID 7521463)
--
-- Name: controle_r_sens Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_sens" (
	"r_sens" text NOT NULL,
	"description" text,
	Constraint "controle_r_sens_pkey" Primary Key ("r_sens")
);

--
-- TOC Entry ID 380 (OID 7521463)
--
-- Name: controle_r_sens Type: ACL Owner: 
--

REVOKE ALL on "controle_r_sens" from PUBLIC;
GRANT SELECT on "controle_r_sens" to PUBLIC;
GRANT ALL on "controle_r_sens" to "postgres";
GRANT ALL on "controle_r_sens" to "superkadagona";
GRANT SELECT on "controle_r_sens" to "kadagona";
GRANT ALL on "controle_r_sens" to "superchoukoutien";
GRANT SELECT on "controle_r_sens" to "choukoutien";
GRANT SELECT on "controle_r_sens" to "visiteurchoukoutien";

--
-- TOC Entry ID 381 (OID 7521469)
--
-- Name: controle_r_tranchant Type: TABLE Owner: postgres
--

CREATE TABLE "controle_r_tranchant" (
	"r_tranchant" text NOT NULL,
	"description" text,
	Constraint "controle_r_tranchant_pkey" Primary Key ("r_tranchant")
);

--
-- TOC Entry ID 382 (OID 7521469)
--
-- Name: controle_r_tranchant Type: ACL Owner: 
--

REVOKE ALL on "controle_r_tranchant" from PUBLIC;
GRANT SELECT on "controle_r_tranchant" to PUBLIC;
GRANT ALL on "controle_r_tranchant" to "postgres";
GRANT ALL on "controle_r_tranchant" to "superkadagona";
GRANT SELECT on "controle_r_tranchant" to "kadagona";
GRANT ALL on "controle_r_tranchant" to "superchoukoutien";
GRANT SELECT on "controle_r_tranchant" to "choukoutien";
GRANT SELECT on "controle_r_tranchant" to "visiteurchoukoutien";

--
-- TOC Entry ID 383 (OID 7521475)
--
-- Name: fracture_industrie Type: TABLE Owner: postgres
--

CREATE TABLE "fracture_industrie" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"fi_ordre" integer NOT NULL,
	"fi_type" text,
	"fi_percussion" text,
	"fi_mode" text,
	"fi_anciennete" text,
	"fi_localisation" text,
	"fi_relation" text,
	Constraint "fracture_industrie_pkey" Primary Key ("zone", "numero", "bis", "fi_ordre")
);

--
-- TOC Entry ID 384 (OID 7521475)
--
-- Name: fracture_industrie Type: ACL Owner: 
--

REVOKE ALL on "fracture_industrie" from PUBLIC;
GRANT SELECT on "fracture_industrie" to PUBLIC;
GRANT ALL on "fracture_industrie" to "postgres";
GRANT ALL on "fracture_industrie" to "superkadagona";
GRANT SELECT on "fracture_industrie" to "visiteurkadagona";
GRANT ALL on "fracture_industrie" to "kadagona";
GRANT ALL on "fracture_industrie" to "superchoukoutien";
GRANT ALL on "fracture_industrie" to "choukoutien";
GRANT SELECT on "fracture_industrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 385 (OID 7521481)
--
-- Name: controle_fi_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_fi_ordre" (
	"fi_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_fi_ordre_pkey" Primary Key ("fi_ordre")
);

--
-- TOC Entry ID 386 (OID 7521481)
--
-- Name: controle_fi_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_fi_ordre" from PUBLIC;
GRANT SELECT on "controle_fi_ordre" to PUBLIC;
GRANT ALL on "controle_fi_ordre" to "postgres";
GRANT ALL on "controle_fi_ordre" to "superkadagona";
GRANT SELECT on "controle_fi_ordre" to "kadagona";
GRANT ALL on "controle_fi_ordre" to "superchoukoutien";
GRANT SELECT on "controle_fi_ordre" to "choukoutien";
GRANT SELECT on "controle_fi_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 387 (OID 7521487)
--
-- Name: controle_fi_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_fi_type" (
	"fi_type" text NOT NULL,
	"description" text,
	Constraint "controle_fi_type_pkey" Primary Key ("fi_type")
);

--
-- TOC Entry ID 388 (OID 7521487)
--
-- Name: controle_fi_type Type: ACL Owner: 
--

REVOKE ALL on "controle_fi_type" from PUBLIC;
GRANT SELECT on "controle_fi_type" to PUBLIC;
GRANT ALL on "controle_fi_type" to "postgres";
GRANT ALL on "controle_fi_type" to "superkadagona";
GRANT SELECT on "controle_fi_type" to "kadagona";
GRANT ALL on "controle_fi_type" to "superchoukoutien";
GRANT SELECT on "controle_fi_type" to "choukoutien";
GRANT SELECT on "controle_fi_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 389 (OID 7521493)
--
-- Name: controle_fi_percussion Type: TABLE Owner: postgres
--

CREATE TABLE "controle_fi_percussion" (
	"fi_percussion" text NOT NULL,
	"description" text,
	Constraint "controle_fi_percussion_pkey" Primary Key ("fi_percussion")
);

--
-- TOC Entry ID 390 (OID 7521493)
--
-- Name: controle_fi_percussion Type: ACL Owner: 
--

REVOKE ALL on "controle_fi_percussion" from PUBLIC;
GRANT SELECT on "controle_fi_percussion" to PUBLIC;
GRANT ALL on "controle_fi_percussion" to "postgres";
GRANT ALL on "controle_fi_percussion" to "superkadagona";
GRANT SELECT on "controle_fi_percussion" to "kadagona";
GRANT ALL on "controle_fi_percussion" to "superchoukoutien";
GRANT SELECT on "controle_fi_percussion" to "choukoutien";
GRANT SELECT on "controle_fi_percussion" to "visiteurchoukoutien";

--
-- TOC Entry ID 391 (OID 7521499)
--
-- Name: controle_fi_mode Type: TABLE Owner: postgres
--

CREATE TABLE "controle_fi_mode" (
	"fi_mode" text NOT NULL,
	"description" text,
	Constraint "controle_fi_mode_pkey" Primary Key ("fi_mode")
);

--
-- TOC Entry ID 392 (OID 7521499)
--
-- Name: controle_fi_mode Type: ACL Owner: 
--

REVOKE ALL on "controle_fi_mode" from PUBLIC;
GRANT SELECT on "controle_fi_mode" to PUBLIC;
GRANT ALL on "controle_fi_mode" to "postgres";
GRANT ALL on "controle_fi_mode" to "superkadagona";
GRANT SELECT on "controle_fi_mode" to "kadagona";
GRANT ALL on "controle_fi_mode" to "superchoukoutien";
GRANT SELECT on "controle_fi_mode" to "choukoutien";
GRANT SELECT on "controle_fi_mode" to "visiteurchoukoutien";

--
-- TOC Entry ID 393 (OID 7521505)
--
-- Name: stigmate Type: TABLE Owner: postgres
--

CREATE TABLE "stigmate" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"s_ordre" integer NOT NULL,
	"s_type" text,
	"s_sous_type" text,
	"s_lustrage" text,
	"s_polissage" text,
	"s_sub" text,
	"s_localisation" text,
	"s_situation" text,
	"s_relation" text,
	"s_composite" text,
	"s_simple" text,
	"s_support" text,
	"s_roche" text,
	"s_geometrie" text,
	"s_alteration" text,
	"s_concretion" text,
	"s_plan" text,
	"s_dessin" text,
	"s_coupe" text,
	"s_photo" text,
	"s_analyse" text,
	"s_longueur" integer,
	"s_largeur" integer,
	"s_epaisseur" integer,
	"s_poids" integer,
	"s_outil" integer,
	"s_cimx" integer,
	"s_cimn" integer,
	"s_cr1s" integer,
	"s_cr2s" integer,
	"s_timx2" integer,
	"s_timn2" integer,
	"s_tr1s" integer,
	"s_tr2s" integer,
	"s_tang" integer,
	"s_numero" integer,
	Constraint "stigmate_pkey" Primary Key ("zone", "numero", "bis", "s_ordre")
);

--
-- TOC Entry ID 394 (OID 7521505)
--
-- Name: stigmate Type: ACL Owner: 
--

REVOKE ALL on "stigmate" from PUBLIC;
GRANT SELECT on "stigmate" to PUBLIC;
GRANT ALL on "stigmate" to "postgres";
GRANT ALL on "stigmate" to "superkadagona";
GRANT SELECT on "stigmate" to "visiteurkadagona";
GRANT ALL on "stigmate" to "kadagona";
GRANT ALL on "stigmate" to "superchoukoutien";
GRANT ALL on "stigmate" to "choukoutien";
GRANT SELECT on "stigmate" to "visiteurchoukoutien";

--
-- TOC Entry ID 395 (OID 7521511)
--
-- Name: controle_s_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_ordre" (
	"s_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_s_ordre_pkey" Primary Key ("s_ordre")
);

--
-- TOC Entry ID 396 (OID 7521511)
--
-- Name: controle_s_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_s_ordre" from PUBLIC;
GRANT SELECT on "controle_s_ordre" to PUBLIC;
GRANT ALL on "controle_s_ordre" to "postgres";
GRANT ALL on "controle_s_ordre" to "superkadagona";
GRANT SELECT on "controle_s_ordre" to "kadagona";
GRANT ALL on "controle_s_ordre" to "superchoukoutien";
GRANT SELECT on "controle_s_ordre" to "choukoutien";
GRANT SELECT on "controle_s_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 397 (OID 7521517)
--
-- Name: controle_s_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_type" (
	"s_type" text NOT NULL,
	"description" text,
	Constraint "controle_s_type_pkey" Primary Key ("s_type")
);

--
-- TOC Entry ID 398 (OID 7521517)
--
-- Name: controle_s_type Type: ACL Owner: 
--

REVOKE ALL on "controle_s_type" from PUBLIC;
GRANT SELECT on "controle_s_type" to PUBLIC;
GRANT ALL on "controle_s_type" to "postgres";
GRANT ALL on "controle_s_type" to "superkadagona";
GRANT SELECT on "controle_s_type" to "kadagona";
GRANT ALL on "controle_s_type" to "superchoukoutien";
GRANT SELECT on "controle_s_type" to "choukoutien";
GRANT SELECT on "controle_s_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 399 (OID 7521523)
--
-- Name: controle_s_sous_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_sous_type" (
	"s_sous_type" text NOT NULL,
	"description" text,
	Constraint "controle_s_sous_type_pkey" Primary Key ("s_sous_type")
);

--
-- TOC Entry ID 400 (OID 7521523)
--
-- Name: controle_s_sous_type Type: ACL Owner: 
--

REVOKE ALL on "controle_s_sous_type" from PUBLIC;
GRANT SELECT on "controle_s_sous_type" to PUBLIC;
GRANT ALL on "controle_s_sous_type" to "postgres";
GRANT ALL on "controle_s_sous_type" to "superkadagona";
GRANT SELECT on "controle_s_sous_type" to "kadagona";
GRANT ALL on "controle_s_sous_type" to "superchoukoutien";
GRANT SELECT on "controle_s_sous_type" to "choukoutien";
GRANT SELECT on "controle_s_sous_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 401 (OID 7521529)
--
-- Name: controle_s_lustrage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_lustrage" (
	"s_lustrage" text NOT NULL,
	"description" text,
	Constraint "controle_s_lustrage_pkey" Primary Key ("s_lustrage")
);

--
-- TOC Entry ID 402 (OID 7521529)
--
-- Name: controle_s_lustrage Type: ACL Owner: 
--

REVOKE ALL on "controle_s_lustrage" from PUBLIC;
GRANT SELECT on "controle_s_lustrage" to PUBLIC;
GRANT ALL on "controle_s_lustrage" to "postgres";
GRANT ALL on "controle_s_lustrage" to "superkadagona";
GRANT SELECT on "controle_s_lustrage" to "kadagona";
GRANT ALL on "controle_s_lustrage" to "superchoukoutien";
GRANT SELECT on "controle_s_lustrage" to "choukoutien";
GRANT SELECT on "controle_s_lustrage" to "visiteurchoukoutien";

--
-- TOC Entry ID 403 (OID 7521535)
--
-- Name: controle_s_polissage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_polissage" (
	"s_polissage" text NOT NULL,
	"description" text,
	Constraint "controle_s_polissage_pkey" Primary Key ("s_polissage")
);

--
-- TOC Entry ID 404 (OID 7521535)
--
-- Name: controle_s_polissage Type: ACL Owner: 
--

REVOKE ALL on "controle_s_polissage" from PUBLIC;
GRANT SELECT on "controle_s_polissage" to PUBLIC;
GRANT ALL on "controle_s_polissage" to "postgres";
GRANT ALL on "controle_s_polissage" to "superkadagona";
GRANT SELECT on "controle_s_polissage" to "kadagona";
GRANT ALL on "controle_s_polissage" to "superchoukoutien";
GRANT SELECT on "controle_s_polissage" to "choukoutien";
GRANT SELECT on "controle_s_polissage" to "visiteurchoukoutien";

--
-- TOC Entry ID 405 (OID 7521541)
--
-- Name: controle_s_localisation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_localisation" (
	"s_localisation" text NOT NULL,
	"description" text,
	Constraint "controle_s_localisation_pkey" Primary Key ("s_localisation")
);

--
-- TOC Entry ID 406 (OID 7521541)
--
-- Name: controle_s_localisation Type: ACL Owner: 
--

REVOKE ALL on "controle_s_localisation" from PUBLIC;
GRANT SELECT on "controle_s_localisation" to PUBLIC;
GRANT ALL on "controle_s_localisation" to "postgres";
GRANT ALL on "controle_s_localisation" to "superkadagona";
GRANT SELECT on "controle_s_localisation" to "kadagona";
GRANT ALL on "controle_s_localisation" to "superchoukoutien";
GRANT SELECT on "controle_s_localisation" to "choukoutien";
GRANT SELECT on "controle_s_localisation" to "visiteurchoukoutien";

--
-- TOC Entry ID 407 (OID 7521547)
--
-- Name: controle_s_situation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_situation" (
	"s_situation" text NOT NULL,
	"description" text,
	Constraint "controle_s_situation_pkey" Primary Key ("s_situation")
);

--
-- TOC Entry ID 408 (OID 7521547)
--
-- Name: controle_s_situation Type: ACL Owner: 
--

REVOKE ALL on "controle_s_situation" from PUBLIC;
GRANT SELECT on "controle_s_situation" to PUBLIC;
GRANT ALL on "controle_s_situation" to "postgres";
GRANT ALL on "controle_s_situation" to "superkadagona";
GRANT SELECT on "controle_s_situation" to "kadagona";
GRANT ALL on "controle_s_situation" to "superchoukoutien";
GRANT SELECT on "controle_s_situation" to "choukoutien";
GRANT SELECT on "controle_s_situation" to "visiteurchoukoutien";

--
-- TOC Entry ID 409 (OID 7521553)
--
-- Name: controle_s_relation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_s_relation" (
	"s_relation" text NOT NULL,
	"description" text,
	Constraint "controle_s_relation_pkey" Primary Key ("s_relation")
);

--
-- TOC Entry ID 410 (OID 7521553)
--
-- Name: controle_s_relation Type: ACL Owner: 
--

REVOKE ALL on "controle_s_relation" from PUBLIC;
GRANT SELECT on "controle_s_relation" to PUBLIC;
GRANT ALL on "controle_s_relation" to "postgres";
GRANT ALL on "controle_s_relation" to "superkadagona";
GRANT SELECT on "controle_s_relation" to "kadagona";
GRANT ALL on "controle_s_relation" to "superchoukoutien";
GRANT SELECT on "controle_s_relation" to "choukoutien";
GRANT SELECT on "controle_s_relation" to "visiteurchoukoutien";

--
-- TOC Entry ID 411 (OID 7521559)
--
-- Name: eclat Type: TABLE Owner: postgres
--

CREATE TABLE "eclat" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"e_code" text,
	"e_debitage" text,
	"e_section_long" text,
	"e_section_trans" text,
	"e_contour" text,
	"e_enlevement" text,
	"e_bulbe" text,
	"e_talon" text,
	"e_cone" text,
	"e_onde" text,
	"e_epi" text,
	"e_strie" text,
	"e_parasite" text,
	"e_secondaire" text,
	"e_charniere" text,
	"e_carene" text,
	"e_type" text,
	"e_longm" integer,
	"e_largm" integer,
	"e_fa" integer,
	"e_fb" integer,
	"e_fc" integer,
	"e_fd" integer,
	"e_fe" integer,
	"e_ff" integer,
	"e_ta" integer,
	"e_tb" integer,
	"e_tc" integer,
	"e_td" integer,
	"e_te" integer,
	"e_tf" integer,
	"e_tg" integer,
	"e_thc" integer,
	"e_ti" integer,
	Constraint "eclat_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 412 (OID 7521559)
--
-- Name: eclat Type: ACL Owner: 
--

REVOKE ALL on "eclat" from PUBLIC;
GRANT SELECT on "eclat" to PUBLIC;
GRANT ALL on "eclat" to "postgres";
GRANT ALL on "eclat" to "superkadagona";
GRANT SELECT on "eclat" to "visiteurkadagona";
GRANT ALL on "eclat" to "kadagona";
GRANT ALL on "eclat" to "superchoukoutien";
GRANT ALL on "eclat" to "choukoutien";
GRANT SELECT on "eclat" to "visiteurchoukoutien";

--
-- TOC Entry ID 413 (OID 7521565)
--
-- Name: controle_e_code Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_code" (
	"e_code" text NOT NULL,
	"description" text,
	Constraint "controle_e_code_pkey" Primary Key ("e_code")
);

--
-- TOC Entry ID 414 (OID 7521565)
--
-- Name: controle_e_code Type: ACL Owner: 
--

REVOKE ALL on "controle_e_code" from PUBLIC;
GRANT SELECT on "controle_e_code" to PUBLIC;
GRANT ALL on "controle_e_code" to "postgres";
GRANT ALL on "controle_e_code" to "superkadagona";
GRANT SELECT on "controle_e_code" to "kadagona";
GRANT ALL on "controle_e_code" to "superchoukoutien";
GRANT SELECT on "controle_e_code" to "choukoutien";
GRANT SELECT on "controle_e_code" to "visiteurchoukoutien";

--
-- TOC Entry ID 415 (OID 7521571)
--
-- Name: controle_e_debitage Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_debitage" (
	"e_debitage" text NOT NULL,
	"description" text,
	Constraint "controle_e_debitage_pkey" Primary Key ("e_debitage")
);

--
-- TOC Entry ID 416 (OID 7521571)
--
-- Name: controle_e_debitage Type: ACL Owner: 
--

REVOKE ALL on "controle_e_debitage" from PUBLIC;
GRANT SELECT on "controle_e_debitage" to PUBLIC;
GRANT ALL on "controle_e_debitage" to "postgres";
GRANT ALL on "controle_e_debitage" to "superkadagona";
GRANT SELECT on "controle_e_debitage" to "kadagona";
GRANT ALL on "controle_e_debitage" to "superchoukoutien";
GRANT SELECT on "controle_e_debitage" to "choukoutien";
GRANT SELECT on "controle_e_debitage" to "visiteurchoukoutien";

--
-- TOC Entry ID 417 (OID 7521577)
--
-- Name: controle_e_section_long Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_section_long" (
	"e_section_long" text NOT NULL,
	"description" text,
	Constraint "controle_e_section_long_pkey" Primary Key ("e_section_long")
);

--
-- TOC Entry ID 418 (OID 7521577)
--
-- Name: controle_e_section_long Type: ACL Owner: 
--

REVOKE ALL on "controle_e_section_long" from PUBLIC;
GRANT SELECT on "controle_e_section_long" to PUBLIC;
GRANT ALL on "controle_e_section_long" to "postgres";
GRANT ALL on "controle_e_section_long" to "superkadagona";
GRANT SELECT on "controle_e_section_long" to "kadagona";
GRANT ALL on "controle_e_section_long" to "superchoukoutien";
GRANT SELECT on "controle_e_section_long" to "choukoutien";
GRANT SELECT on "controle_e_section_long" to "visiteurchoukoutien";

--
-- TOC Entry ID 419 (OID 7521583)
--
-- Name: controle_e_section_trans Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_section_trans" (
	"e_section_trans" text NOT NULL,
	"description" text,
	Constraint "controle_e_section_trans_pkey" Primary Key ("e_section_trans")
);

--
-- TOC Entry ID 420 (OID 7521583)
--
-- Name: controle_e_section_trans Type: ACL Owner: 
--

REVOKE ALL on "controle_e_section_trans" from PUBLIC;
GRANT SELECT on "controle_e_section_trans" to PUBLIC;
GRANT ALL on "controle_e_section_trans" to "postgres";
GRANT ALL on "controle_e_section_trans" to "superkadagona";
GRANT SELECT on "controle_e_section_trans" to "kadagona";
GRANT ALL on "controle_e_section_trans" to "superchoukoutien";
GRANT SELECT on "controle_e_section_trans" to "choukoutien";
GRANT SELECT on "controle_e_section_trans" to "visiteurchoukoutien";

--
-- TOC Entry ID 421 (OID 7521589)
--
-- Name: controle_e_contour Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_contour" (
	"e_contour" text NOT NULL,
	"description" text,
	Constraint "controle_e_contour_pkey" Primary Key ("e_contour")
);

--
-- TOC Entry ID 422 (OID 7521589)
--
-- Name: controle_e_contour Type: ACL Owner: 
--

REVOKE ALL on "controle_e_contour" from PUBLIC;
GRANT SELECT on "controle_e_contour" to PUBLIC;
GRANT ALL on "controle_e_contour" to "postgres";
GRANT ALL on "controle_e_contour" to "superkadagona";
GRANT SELECT on "controle_e_contour" to "kadagona";
GRANT ALL on "controle_e_contour" to "superchoukoutien";
GRANT SELECT on "controle_e_contour" to "choukoutien";
GRANT SELECT on "controle_e_contour" to "visiteurchoukoutien";

--
-- TOC Entry ID 423 (OID 7521595)
--
-- Name: controle_e_enlevement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_enlevement" (
	"e_enlevement" text NOT NULL,
	"description" text,
	Constraint "controle_e_enlevement_pkey" Primary Key ("e_enlevement")
);

--
-- TOC Entry ID 424 (OID 7521595)
--
-- Name: controle_e_enlevement Type: ACL Owner: 
--

REVOKE ALL on "controle_e_enlevement" from PUBLIC;
GRANT SELECT on "controle_e_enlevement" to PUBLIC;
GRANT ALL on "controle_e_enlevement" to "postgres";
GRANT ALL on "controle_e_enlevement" to "superkadagona";
GRANT SELECT on "controle_e_enlevement" to "kadagona";
GRANT ALL on "controle_e_enlevement" to "superchoukoutien";
GRANT SELECT on "controle_e_enlevement" to "choukoutien";
GRANT SELECT on "controle_e_enlevement" to "visiteurchoukoutien";

--
-- TOC Entry ID 425 (OID 7521601)
--
-- Name: controle_e_bulbe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_bulbe" (
	"e_bulbe" text NOT NULL,
	"description" text,
	Constraint "controle_e_bulbe_pkey" Primary Key ("e_bulbe")
);

--
-- TOC Entry ID 426 (OID 7521601)
--
-- Name: controle_e_bulbe Type: ACL Owner: 
--

REVOKE ALL on "controle_e_bulbe" from PUBLIC;
GRANT SELECT on "controle_e_bulbe" to PUBLIC;
GRANT ALL on "controle_e_bulbe" to "postgres";
GRANT ALL on "controle_e_bulbe" to "superkadagona";
GRANT SELECT on "controle_e_bulbe" to "kadagona";
GRANT ALL on "controle_e_bulbe" to "superchoukoutien";
GRANT SELECT on "controle_e_bulbe" to "choukoutien";
GRANT SELECT on "controle_e_bulbe" to "visiteurchoukoutien";

--
-- TOC Entry ID 427 (OID 7521607)
--
-- Name: controle_e_talon Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_talon" (
	"e_talon" text NOT NULL,
	"description" text,
	Constraint "controle_e_talon_pkey" Primary Key ("e_talon")
);

--
-- TOC Entry ID 428 (OID 7521607)
--
-- Name: controle_e_talon Type: ACL Owner: 
--

REVOKE ALL on "controle_e_talon" from PUBLIC;
GRANT SELECT on "controle_e_talon" to PUBLIC;
GRANT ALL on "controle_e_talon" to "postgres";
GRANT ALL on "controle_e_talon" to "superkadagona";
GRANT SELECT on "controle_e_talon" to "kadagona";
GRANT ALL on "controle_e_talon" to "superchoukoutien";
GRANT SELECT on "controle_e_talon" to "choukoutien";
GRANT SELECT on "controle_e_talon" to "visiteurchoukoutien";

--
-- TOC Entry ID 429 (OID 7521613)
--
-- Name: controle_e_cone Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_cone" (
	"e_cone" text NOT NULL,
	"description" text,
	Constraint "controle_e_cone_pkey" Primary Key ("e_cone")
);

--
-- TOC Entry ID 430 (OID 7521613)
--
-- Name: controle_e_cone Type: ACL Owner: 
--

REVOKE ALL on "controle_e_cone" from PUBLIC;
GRANT SELECT on "controle_e_cone" to PUBLIC;
GRANT ALL on "controle_e_cone" to "postgres";
GRANT ALL on "controle_e_cone" to "superkadagona";
GRANT SELECT on "controle_e_cone" to "kadagona";
GRANT ALL on "controle_e_cone" to "superchoukoutien";
GRANT SELECT on "controle_e_cone" to "choukoutien";
GRANT SELECT on "controle_e_cone" to "visiteurchoukoutien";

--
-- TOC Entry ID 431 (OID 7521619)
--
-- Name: controle_e_onde Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_onde" (
	"e_onde" text NOT NULL,
	"description" text,
	Constraint "controle_e_onde_pkey" Primary Key ("e_onde")
);

--
-- TOC Entry ID 432 (OID 7521619)
--
-- Name: controle_e_onde Type: ACL Owner: 
--

REVOKE ALL on "controle_e_onde" from PUBLIC;
GRANT SELECT on "controle_e_onde" to PUBLIC;
GRANT ALL on "controle_e_onde" to "postgres";
GRANT ALL on "controle_e_onde" to "superkadagona";
GRANT SELECT on "controle_e_onde" to "kadagona";
GRANT ALL on "controle_e_onde" to "superchoukoutien";
GRANT SELECT on "controle_e_onde" to "choukoutien";
GRANT SELECT on "controle_e_onde" to "visiteurchoukoutien";

--
-- TOC Entry ID 433 (OID 7521625)
--
-- Name: controle_e_epi Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_epi" (
	"e_epi" text NOT NULL,
	"description" text,
	Constraint "controle_e_epi_pkey" Primary Key ("e_epi")
);

--
-- TOC Entry ID 434 (OID 7521625)
--
-- Name: controle_e_epi Type: ACL Owner: 
--

REVOKE ALL on "controle_e_epi" from PUBLIC;
GRANT SELECT on "controle_e_epi" to PUBLIC;
GRANT ALL on "controle_e_epi" to "postgres";
GRANT ALL on "controle_e_epi" to "superkadagona";
GRANT SELECT on "controle_e_epi" to "kadagona";
GRANT ALL on "controle_e_epi" to "superchoukoutien";
GRANT SELECT on "controle_e_epi" to "choukoutien";
GRANT SELECT on "controle_e_epi" to "visiteurchoukoutien";

--
-- TOC Entry ID 435 (OID 7521631)
--
-- Name: controle_e_strie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_strie" (
	"e_strie" text NOT NULL,
	"description" text,
	Constraint "controle_e_strie_pkey" Primary Key ("e_strie")
);

--
-- TOC Entry ID 436 (OID 7521631)
--
-- Name: controle_e_strie Type: ACL Owner: 
--

REVOKE ALL on "controle_e_strie" from PUBLIC;
GRANT SELECT on "controle_e_strie" to PUBLIC;
GRANT ALL on "controle_e_strie" to "postgres";
GRANT ALL on "controle_e_strie" to "superkadagona";
GRANT SELECT on "controle_e_strie" to "kadagona";
GRANT ALL on "controle_e_strie" to "superchoukoutien";
GRANT SELECT on "controle_e_strie" to "choukoutien";
GRANT SELECT on "controle_e_strie" to "visiteurchoukoutien";

--
-- TOC Entry ID 437 (OID 7521637)
--
-- Name: controle_e_parasite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_parasite" (
	"e_parasite" text NOT NULL,
	"description" text,
	Constraint "controle_e_parasite_pkey" Primary Key ("e_parasite")
);

--
-- TOC Entry ID 438 (OID 7521637)
--
-- Name: controle_e_parasite Type: ACL Owner: 
--

REVOKE ALL on "controle_e_parasite" from PUBLIC;
GRANT SELECT on "controle_e_parasite" to PUBLIC;
GRANT ALL on "controle_e_parasite" to "postgres";
GRANT ALL on "controle_e_parasite" to "superkadagona";
GRANT SELECT on "controle_e_parasite" to "kadagona";
GRANT ALL on "controle_e_parasite" to "superchoukoutien";
GRANT SELECT on "controle_e_parasite" to "choukoutien";
GRANT SELECT on "controle_e_parasite" to "visiteurchoukoutien";

--
-- TOC Entry ID 439 (OID 7521643)
--
-- Name: controle_e_secondaire Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_secondaire" (
	"e_secondaire" text NOT NULL,
	"description" text,
	Constraint "controle_e_secondaire_pkey" Primary Key ("e_secondaire")
);

--
-- TOC Entry ID 440 (OID 7521643)
--
-- Name: controle_e_secondaire Type: ACL Owner: 
--

REVOKE ALL on "controle_e_secondaire" from PUBLIC;
GRANT SELECT on "controle_e_secondaire" to PUBLIC;
GRANT ALL on "controle_e_secondaire" to "postgres";
GRANT ALL on "controle_e_secondaire" to "superkadagona";
GRANT SELECT on "controle_e_secondaire" to "kadagona";
GRANT ALL on "controle_e_secondaire" to "superchoukoutien";
GRANT SELECT on "controle_e_secondaire" to "choukoutien";
GRANT SELECT on "controle_e_secondaire" to "visiteurchoukoutien";

--
-- TOC Entry ID 441 (OID 7521649)
--
-- Name: controle_e_charniere Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_charniere" (
	"e_charniere" text NOT NULL,
	"description" text,
	Constraint "controle_e_charniere_pkey" Primary Key ("e_charniere")
);

--
-- TOC Entry ID 442 (OID 7521649)
--
-- Name: controle_e_charniere Type: ACL Owner: 
--

REVOKE ALL on "controle_e_charniere" from PUBLIC;
GRANT SELECT on "controle_e_charniere" to PUBLIC;
GRANT ALL on "controle_e_charniere" to "postgres";
GRANT ALL on "controle_e_charniere" to "superkadagona";
GRANT SELECT on "controle_e_charniere" to "kadagona";
GRANT ALL on "controle_e_charniere" to "superchoukoutien";
GRANT SELECT on "controle_e_charniere" to "choukoutien";
GRANT SELECT on "controle_e_charniere" to "visiteurchoukoutien";

--
-- TOC Entry ID 443 (OID 7521655)
--
-- Name: controle_e_carene Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_carene" (
	"e_carene" text NOT NULL,
	"description" text,
	Constraint "controle_e_carene_pkey" Primary Key ("e_carene")
);

--
-- TOC Entry ID 444 (OID 7521655)
--
-- Name: controle_e_carene Type: ACL Owner: 
--

REVOKE ALL on "controle_e_carene" from PUBLIC;
GRANT SELECT on "controle_e_carene" to PUBLIC;
GRANT ALL on "controle_e_carene" to "postgres";
GRANT ALL on "controle_e_carene" to "superkadagona";
GRANT SELECT on "controle_e_carene" to "kadagona";
GRANT ALL on "controle_e_carene" to "superchoukoutien";
GRANT SELECT on "controle_e_carene" to "choukoutien";
GRANT SELECT on "controle_e_carene" to "visiteurchoukoutien";

--
-- TOC Entry ID 445 (OID 7521661)
--
-- Name: controle_e_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_e_type" (
	"e_type" text NOT NULL,
	"description" text,
	Constraint "controle_e_type_pkey" Primary Key ("e_type")
);

--
-- TOC Entry ID 446 (OID 7521661)
--
-- Name: controle_e_type Type: ACL Owner: 
--

REVOKE ALL on "controle_e_type" from PUBLIC;
GRANT SELECT on "controle_e_type" to PUBLIC;
GRANT ALL on "controle_e_type" to "postgres";
GRANT ALL on "controle_e_type" to "superkadagona";
GRANT SELECT on "controle_e_type" to "kadagona";
GRANT ALL on "controle_e_type" to "superchoukoutien";
GRANT SELECT on "controle_e_type" to "choukoutien";
GRANT SELECT on "controle_e_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 447 (OID 7521667)
--
-- Name: bord Type: TABLE Owner: postgres
--

CREATE TABLE "bord" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"b_ordre" integer NOT NULL,
	"b_extremite" text,
	"b_code" text,
	"b_amincissement" text,
	"b_localisation" text,
	Constraint "bord_pkey" Primary Key ("zone", "numero", "bis", "b_ordre")
);

--
-- TOC Entry ID 448 (OID 7521667)
--
-- Name: bord Type: ACL Owner: 
--

REVOKE ALL on "bord" from PUBLIC;
GRANT SELECT on "bord" to PUBLIC;
GRANT ALL on "bord" to "postgres";
GRANT ALL on "bord" to "superkadagona";
GRANT SELECT on "bord" to "visiteurkadagona";
GRANT ALL on "bord" to "kadagona";
GRANT ALL on "bord" to "superchoukoutien";
GRANT ALL on "bord" to "choukoutien";
GRANT SELECT on "bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 449 (OID 7521673)
--
-- Name: controle_b_extremite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_extremite" (
	"b_extremite" text NOT NULL,
	"description" text,
	Constraint "controle_b_extremite_pkey" Primary Key ("b_extremite")
);

--
-- TOC Entry ID 450 (OID 7521673)
--
-- Name: controle_b_extremite Type: ACL Owner: 
--

REVOKE ALL on "controle_b_extremite" from PUBLIC;
GRANT SELECT on "controle_b_extremite" to PUBLIC;
GRANT ALL on "controle_b_extremite" to "postgres";
GRANT ALL on "controle_b_extremite" to "superkadagona";
GRANT SELECT on "controle_b_extremite" to "kadagona";
GRANT ALL on "controle_b_extremite" to "superchoukoutien";
GRANT SELECT on "controle_b_extremite" to "choukoutien";
GRANT SELECT on "controle_b_extremite" to "visiteurchoukoutien";

--
-- TOC Entry ID 451 (OID 7521679)
--
-- Name: controle_b_code Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_code" (
	"b_code" text NOT NULL,
	"description" text,
	Constraint "controle_b_code_pkey" Primary Key ("b_code")
);

--
-- TOC Entry ID 452 (OID 7521679)
--
-- Name: controle_b_code Type: ACL Owner: 
--

REVOKE ALL on "controle_b_code" from PUBLIC;
GRANT SELECT on "controle_b_code" to PUBLIC;
GRANT ALL on "controle_b_code" to "postgres";
GRANT ALL on "controle_b_code" to "superkadagona";
GRANT SELECT on "controle_b_code" to "kadagona";
GRANT ALL on "controle_b_code" to "superchoukoutien";
GRANT SELECT on "controle_b_code" to "choukoutien";
GRANT SELECT on "controle_b_code" to "visiteurchoukoutien";

--
-- TOC Entry ID 453 (OID 7521685)
--
-- Name: outil Type: TABLE Owner: postgres
--

CREATE TABLE "outil" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"o_ordre" integer NOT NULL,
	"o_code" text,
	"o_code_comp" text,
	"o_retouche" text,
	"o_orientation" text,
	"o_origine" text,
	"o_destination" text,
	"o_etat" text,
	"o_localisation" text,
	"o_sens" text,
	"o_serie" text,
	"o_forme" text,
	"o_chronologie" text,
	"o_a" integer,
	"o_b" integer,
	"o_c" integer,
	"o_d" integer,
	"o_e" integer,
	"o_f" integer,
	"o_g" integer,
	"o_h" integer,
	"o_tranchant" text,
	"o_relation" text,
	Constraint "outil_pkey" Primary Key ("zone", "numero", "bis", "o_ordre")
);

--
-- TOC Entry ID 454 (OID 7521685)
--
-- Name: outil Type: ACL Owner: 
--

REVOKE ALL on "outil" from PUBLIC;
GRANT SELECT on "outil" to PUBLIC;
GRANT ALL on "outil" to "postgres";
GRANT ALL on "outil" to "superkadagona";
GRANT SELECT on "outil" to "visiteurkadagona";
GRANT ALL on "outil" to "kadagona";
GRANT ALL on "outil" to "superchoukoutien";
GRANT ALL on "outil" to "choukoutien";
GRANT SELECT on "outil" to "visiteurchoukoutien";

--
-- TOC Entry ID 455 (OID 7521691)
--
-- Name: controle_o_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_ordre" (
	"o_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_o_ordre_pkey" Primary Key ("o_ordre")
);

--
-- TOC Entry ID 456 (OID 7521691)
--
-- Name: controle_o_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_o_ordre" from PUBLIC;
GRANT SELECT on "controle_o_ordre" to PUBLIC;
GRANT ALL on "controle_o_ordre" to "postgres";
GRANT ALL on "controle_o_ordre" to "superkadagona";
GRANT SELECT on "controle_o_ordre" to "kadagona";
GRANT ALL on "controle_o_ordre" to "superchoukoutien";
GRANT SELECT on "controle_o_ordre" to "choukoutien";
GRANT SELECT on "controle_o_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 457 (OID 7521697)
--
-- Name: controle_o_code Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_code" (
	"o_code" text NOT NULL,
	"description" text,
	Constraint "controle_o_code_pkey" Primary Key ("o_code")
);

--
-- TOC Entry ID 458 (OID 7521697)
--
-- Name: controle_o_code Type: ACL Owner: 
--

REVOKE ALL on "controle_o_code" from PUBLIC;
GRANT SELECT on "controle_o_code" to PUBLIC;
GRANT ALL on "controle_o_code" to "postgres";
GRANT ALL on "controle_o_code" to "superkadagona";
GRANT SELECT on "controle_o_code" to "kadagona";
GRANT ALL on "controle_o_code" to "superchoukoutien";
GRANT SELECT on "controle_o_code" to "choukoutien";
GRANT SELECT on "controle_o_code" to "visiteurchoukoutien";

--
-- TOC Entry ID 459 (OID 7521703)
--
-- Name: controle_o_retouche Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_retouche" (
	"o_retouche" text NOT NULL,
	"description" text,
	Constraint "controle_o_retouche_pkey" Primary Key ("o_retouche")
);

--
-- TOC Entry ID 460 (OID 7521703)
--
-- Name: controle_o_retouche Type: ACL Owner: 
--

REVOKE ALL on "controle_o_retouche" from PUBLIC;
GRANT SELECT on "controle_o_retouche" to PUBLIC;
GRANT ALL on "controle_o_retouche" to "postgres";
GRANT ALL on "controle_o_retouche" to "superkadagona";
GRANT SELECT on "controle_o_retouche" to "kadagona";
GRANT ALL on "controle_o_retouche" to "superchoukoutien";
GRANT SELECT on "controle_o_retouche" to "choukoutien";
GRANT SELECT on "controle_o_retouche" to "visiteurchoukoutien";

--
-- TOC Entry ID 461 (OID 7521709)
--
-- Name: controle_o_orientation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_orientation" (
	"o_orientation" text NOT NULL,
	"description" text,
	Constraint "controle_o_orientation_pkey" Primary Key ("o_orientation")
);

--
-- TOC Entry ID 462 (OID 7521709)
--
-- Name: controle_o_orientation Type: ACL Owner: 
--

REVOKE ALL on "controle_o_orientation" from PUBLIC;
GRANT SELECT on "controle_o_orientation" to PUBLIC;
GRANT ALL on "controle_o_orientation" to "postgres";
GRANT ALL on "controle_o_orientation" to "superkadagona";
GRANT SELECT on "controle_o_orientation" to "kadagona";
GRANT ALL on "controle_o_orientation" to "superchoukoutien";
GRANT SELECT on "controle_o_orientation" to "choukoutien";
GRANT SELECT on "controle_o_orientation" to "visiteurchoukoutien";

--
-- TOC Entry ID 463 (OID 7521715)
--
-- Name: controle_o_origine Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_origine" (
	"o_origine" text NOT NULL,
	"description" text,
	Constraint "controle_o_origine_pkey" Primary Key ("o_origine")
);

--
-- TOC Entry ID 464 (OID 7521715)
--
-- Name: controle_o_origine Type: ACL Owner: 
--

REVOKE ALL on "controle_o_origine" from PUBLIC;
GRANT SELECT on "controle_o_origine" to PUBLIC;
GRANT ALL on "controle_o_origine" to "postgres";
GRANT ALL on "controle_o_origine" to "superkadagona";
GRANT SELECT on "controle_o_origine" to "kadagona";
GRANT ALL on "controle_o_origine" to "superchoukoutien";
GRANT SELECT on "controle_o_origine" to "choukoutien";
GRANT SELECT on "controle_o_origine" to "visiteurchoukoutien";

--
-- TOC Entry ID 465 (OID 7521721)
--
-- Name: controle_o_destination Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_destination" (
	"o_destination" text NOT NULL,
	"description" text,
	Constraint "controle_o_destination_pkey" Primary Key ("o_destination")
);

--
-- TOC Entry ID 466 (OID 7521721)
--
-- Name: controle_o_destination Type: ACL Owner: 
--

REVOKE ALL on "controle_o_destination" from PUBLIC;
GRANT SELECT on "controle_o_destination" to PUBLIC;
GRANT ALL on "controle_o_destination" to "postgres";
GRANT ALL on "controle_o_destination" to "superkadagona";
GRANT SELECT on "controle_o_destination" to "kadagona";
GRANT ALL on "controle_o_destination" to "superchoukoutien";
GRANT SELECT on "controle_o_destination" to "choukoutien";
GRANT SELECT on "controle_o_destination" to "visiteurchoukoutien";

--
-- TOC Entry ID 467 (OID 7521727)
--
-- Name: controle_o_etat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_etat" (
	"o_etat" text NOT NULL,
	"description" text,
	Constraint "controle_o_etat_pkey" Primary Key ("o_etat")
);

--
-- TOC Entry ID 468 (OID 7521727)
--
-- Name: controle_o_etat Type: ACL Owner: 
--

REVOKE ALL on "controle_o_etat" from PUBLIC;
GRANT SELECT on "controle_o_etat" to PUBLIC;
GRANT ALL on "controle_o_etat" to "postgres";
GRANT ALL on "controle_o_etat" to "superkadagona";
GRANT SELECT on "controle_o_etat" to "kadagona";
GRANT ALL on "controle_o_etat" to "superchoukoutien";
GRANT SELECT on "controle_o_etat" to "choukoutien";
GRANT SELECT on "controle_o_etat" to "visiteurchoukoutien";

--
-- TOC Entry ID 469 (OID 7521733)
--
-- Name: controle_o_localisation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_localisation" (
	"o_localisation" text NOT NULL,
	"description" text,
	Constraint "controle_o_localisation_pkey" Primary Key ("o_localisation")
);

--
-- TOC Entry ID 470 (OID 7521733)
--
-- Name: controle_o_localisation Type: ACL Owner: 
--

REVOKE ALL on "controle_o_localisation" from PUBLIC;
GRANT SELECT on "controle_o_localisation" to PUBLIC;
GRANT ALL on "controle_o_localisation" to "postgres";
GRANT ALL on "controle_o_localisation" to "superkadagona";
GRANT SELECT on "controle_o_localisation" to "kadagona";
GRANT ALL on "controle_o_localisation" to "superchoukoutien";
GRANT SELECT on "controle_o_localisation" to "choukoutien";
GRANT SELECT on "controle_o_localisation" to "visiteurchoukoutien";

--
-- TOC Entry ID 471 (OID 7521739)
--
-- Name: controle_o_sens Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_sens" (
	"o_sens" text NOT NULL,
	"description" text,
	Constraint "controle_o_sens_pkey" Primary Key ("o_sens")
);

--
-- TOC Entry ID 472 (OID 7521739)
--
-- Name: controle_o_sens Type: ACL Owner: 
--

REVOKE ALL on "controle_o_sens" from PUBLIC;
GRANT SELECT on "controle_o_sens" to PUBLIC;
GRANT ALL on "controle_o_sens" to "postgres";
GRANT ALL on "controle_o_sens" to "superkadagona";
GRANT SELECT on "controle_o_sens" to "kadagona";
GRANT ALL on "controle_o_sens" to "superchoukoutien";
GRANT SELECT on "controle_o_sens" to "choukoutien";
GRANT SELECT on "controle_o_sens" to "visiteurchoukoutien";

--
-- TOC Entry ID 473 (OID 7521745)
--
-- Name: controle_o_serie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_serie" (
	"o_serie" text NOT NULL,
	"description" text,
	Constraint "controle_o_serie_pkey" Primary Key ("o_serie")
);

--
-- TOC Entry ID 474 (OID 7521745)
--
-- Name: controle_o_serie Type: ACL Owner: 
--

REVOKE ALL on "controle_o_serie" from PUBLIC;
GRANT SELECT on "controle_o_serie" to PUBLIC;
GRANT ALL on "controle_o_serie" to "postgres";
GRANT ALL on "controle_o_serie" to "superkadagona";
GRANT SELECT on "controle_o_serie" to "kadagona";
GRANT ALL on "controle_o_serie" to "superchoukoutien";
GRANT SELECT on "controle_o_serie" to "choukoutien";
GRANT SELECT on "controle_o_serie" to "visiteurchoukoutien";

--
-- TOC Entry ID 475 (OID 7521751)
--
-- Name: controle_o_forme Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_forme" (
	"o_forme" text NOT NULL,
	"description" text,
	Constraint "controle_o_forme_pkey" Primary Key ("o_forme")
);

--
-- TOC Entry ID 476 (OID 7521751)
--
-- Name: controle_o_forme Type: ACL Owner: 
--

REVOKE ALL on "controle_o_forme" from PUBLIC;
GRANT SELECT on "controle_o_forme" to PUBLIC;
GRANT ALL on "controle_o_forme" to "postgres";
GRANT ALL on "controle_o_forme" to "superkadagona";
GRANT SELECT on "controle_o_forme" to "kadagona";
GRANT ALL on "controle_o_forme" to "superchoukoutien";
GRANT SELECT on "controle_o_forme" to "choukoutien";
GRANT SELECT on "controle_o_forme" to "visiteurchoukoutien";

--
-- TOC Entry ID 477 (OID 7521757)
--
-- Name: controle_o_chronologie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_o_chronologie" (
	"o_chronologie" text NOT NULL,
	"description" text,
	Constraint "controle_o_chronologie_pkey" Primary Key ("o_chronologie")
);

--
-- TOC Entry ID 478 (OID 7521757)
--
-- Name: controle_o_chronologie Type: ACL Owner: 
--

REVOKE ALL on "controle_o_chronologie" from PUBLIC;
GRANT SELECT on "controle_o_chronologie" to PUBLIC;
GRANT ALL on "controle_o_chronologie" to "postgres";
GRANT ALL on "controle_o_chronologie" to "superkadagona";
GRANT SELECT on "controle_o_chronologie" to "kadagona";
GRANT ALL on "controle_o_chronologie" to "superchoukoutien";
GRANT SELECT on "controle_o_chronologie" to "choukoutien";
GRANT SELECT on "controle_o_chronologie" to "visiteurchoukoutien";

--
-- TOC Entry ID 479 (OID 7521763)
--
-- Name: controle_ga_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_type" (
	"ga_type" text NOT NULL,
	"description" text,
	Constraint "controle_ga_type_pkey" Primary Key ("ga_type")
);

--
-- TOC Entry ID 480 (OID 7521763)
--
-- Name: controle_ga_type Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_type" from PUBLIC;
GRANT SELECT on "controle_ga_type" to PUBLIC;
GRANT ALL on "controle_ga_type" to "postgres";
GRANT ALL on "controle_ga_type" to "superkadagona";
GRANT SELECT on "controle_ga_type" to "kadagona";
GRANT ALL on "controle_ga_type" to "superchoukoutien";
GRANT SELECT on "controle_ga_type" to "choukoutien";
GRANT SELECT on "controle_ga_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 481 (OID 7521769)
--
-- Name: controle_ga_facture Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_facture" (
	"ga_facture" text NOT NULL,
	"description" text,
	Constraint "controle_ga_facture_pkey" Primary Key ("ga_facture")
);

--
-- TOC Entry ID 482 (OID 7521769)
--
-- Name: controle_ga_facture Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_facture" from PUBLIC;
GRANT SELECT on "controle_ga_facture" to PUBLIC;
GRANT ALL on "controle_ga_facture" to "postgres";
GRANT ALL on "controle_ga_facture" to "superkadagona";
GRANT SELECT on "controle_ga_facture" to "kadagona";
GRANT ALL on "controle_ga_facture" to "superchoukoutien";
GRANT SELECT on "controle_ga_facture" to "choukoutien";
GRANT SELECT on "controle_ga_facture" to "visiteurchoukoutien";

--
-- TOC Entry ID 483 (OID 7521775)
--
-- Name: controle_ga_qualite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_qualite" (
	"ga_qualite" text NOT NULL,
	"description" text,
	Constraint "controle_ga_qualite_pkey" Primary Key ("ga_qualite")
);

--
-- TOC Entry ID 484 (OID 7521775)
--
-- Name: controle_ga_qualite Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_qualite" from PUBLIC;
GRANT SELECT on "controle_ga_qualite" to PUBLIC;
GRANT ALL on "controle_ga_qualite" to "postgres";
GRANT ALL on "controle_ga_qualite" to "superkadagona";
GRANT SELECT on "controle_ga_qualite" to "kadagona";
GRANT ALL on "controle_ga_qualite" to "superchoukoutien";
GRANT SELECT on "controle_ga_qualite" to "choukoutien";
GRANT SELECT on "controle_ga_qualite" to "visiteurchoukoutien";

--
-- TOC Entry ID 485 (OID 7521781)
--
-- Name: controle_ga_chf Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_chf" (
	"ga_chf" text NOT NULL,
	"description" text,
	Constraint "controle_ga_chf_pkey" Primary Key ("ga_chf")
);

--
-- TOC Entry ID 486 (OID 7521781)
--
-- Name: controle_ga_chf Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_chf" from PUBLIC;
GRANT SELECT on "controle_ga_chf" to PUBLIC;
GRANT ALL on "controle_ga_chf" to "postgres";
GRANT ALL on "controle_ga_chf" to "superkadagona";
GRANT SELECT on "controle_ga_chf" to "kadagona";
GRANT ALL on "controle_ga_chf" to "superchoukoutien";
GRANT SELECT on "controle_ga_chf" to "choukoutien";
GRANT SELECT on "controle_ga_chf" to "visiteurchoukoutien";

--
-- TOC Entry ID 487 (OID 7521787)
--
-- Name: controle_ga_forme Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_forme" (
	"ga_forme" text NOT NULL,
	"description" text,
	Constraint "controle_ga_forme_pkey" Primary Key ("ga_forme")
);

--
-- TOC Entry ID 488 (OID 7521787)
--
-- Name: controle_ga_forme Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_forme" from PUBLIC;
GRANT SELECT on "controle_ga_forme" to PUBLIC;
GRANT ALL on "controle_ga_forme" to "postgres";
GRANT ALL on "controle_ga_forme" to "superkadagona";
GRANT SELECT on "controle_ga_forme" to "kadagona";
GRANT ALL on "controle_ga_forme" to "superchoukoutien";
GRANT SELECT on "controle_ga_forme" to "choukoutien";
GRANT SELECT on "controle_ga_forme" to "visiteurchoukoutien";

--
-- TOC Entry ID 489 (OID 7521793)
--
-- Name: controle_ga_arete Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_arete" (
	"ga_arete" text NOT NULL,
	"description" text,
	Constraint "controle_ga_arete_pkey" Primary Key ("ga_arete")
);

--
-- TOC Entry ID 490 (OID 7521793)
--
-- Name: controle_ga_arete Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_arete" from PUBLIC;
GRANT SELECT on "controle_ga_arete" to PUBLIC;
GRANT ALL on "controle_ga_arete" to "postgres";
GRANT ALL on "controle_ga_arete" to "superkadagona";
GRANT SELECT on "controle_ga_arete" to "kadagona";
GRANT ALL on "controle_ga_arete" to "superchoukoutien";
GRANT SELECT on "controle_ga_arete" to "choukoutien";
GRANT SELECT on "controle_ga_arete" to "visiteurchoukoutien";

--
-- TOC Entry ID 491 (OID 7521799)
--
-- Name: controle_ga_orientation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_orientation" (
	"ga_orientation" text NOT NULL,
	"description" text,
	Constraint "controle_ga_orientation_pkey" Primary Key ("ga_orientation")
);

--
-- TOC Entry ID 492 (OID 7521799)
--
-- Name: controle_ga_orientation Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_orientation" from PUBLIC;
GRANT SELECT on "controle_ga_orientation" to PUBLIC;
GRANT ALL on "controle_ga_orientation" to "postgres";
GRANT ALL on "controle_ga_orientation" to "superkadagona";
GRANT SELECT on "controle_ga_orientation" to "kadagona";
GRANT ALL on "controle_ga_orientation" to "superchoukoutien";
GRANT SELECT on "controle_ga_orientation" to "choukoutien";
GRANT SELECT on "controle_ga_orientation" to "visiteurchoukoutien";

--
-- TOC Entry ID 493 (OID 7521805)
--
-- Name: controle_ga_retouche Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_retouche" (
	"ga_retouche" text NOT NULL,
	"description" text,
	Constraint "controle_ga_retouche_pkey" Primary Key ("ga_retouche")
);

--
-- TOC Entry ID 494 (OID 7521805)
--
-- Name: controle_ga_retouche Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_retouche" from PUBLIC;
GRANT SELECT on "controle_ga_retouche" to PUBLIC;
GRANT ALL on "controle_ga_retouche" to "postgres";
GRANT ALL on "controle_ga_retouche" to "superkadagona";
GRANT SELECT on "controle_ga_retouche" to "kadagona";
GRANT ALL on "controle_ga_retouche" to "superchoukoutien";
GRANT SELECT on "controle_ga_retouche" to "choukoutien";
GRANT SELECT on "controle_ga_retouche" to "visiteurchoukoutien";

--
-- TOC Entry ID 495 (OID 7521811)
--
-- Name: galet_amenage Type: TABLE Owner: postgres
--

CREATE TABLE "galet_amenage" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"ga_ordre" integer NOT NULL,
	"ga_type" text,
	"ga_facture" text,
	"ga_qualite" text,
	"ga_nba" integer,
	"ga_nbb" integer,
	"ga_nbp" integer,
	"ga_forme" text,
	"ga_arete" text,
	"ga_orientation" text,
	"ga_retouche" text,
	"ga_cha" integer,
	"ga_chb" integer,
	"ga_chc" integer,
	"ga_chd" integer,
	"ga_che" integer,
	"ga_chde" integer,
	"ga_chf" text,
	"ga_chh" integer,
	"ga_chi" integer,
	"ga_chj" integer,
	"ga_chk" integer,
	"ga_chl" integer,
	"ga_chm" integer,
	"ga_chna" integer,
	"ga_chnb" integer,
	"ga_cho" integer,
	"ga_chp" integer,
	"ga_chq" integer,
	"ga_chqq" integer,
	"ga_chr" integer,
	"ga_chrg" integer,
	"ga_chrd" integer,
	"ga_chrr" integer,
	"ga_chs" integer,
	"ga_cht" integer,
	"ga_chu" integer,
	"ga_chw1" integer,
	"ga_chw2" integer,
	"ga_chv1" integer,
	"ga_chv2" integer,
	"ga_chv3" integer,
	"ga_chx" integer,
	"ga_chxx" integer,
	"ga_chy" integer,
	"ga_chyy" integer,
	"ga_chz1" integer,
	"ga_chz2" integer,
	"ga_chz3" integer,
	"ga_chz4" integer,
	"ga_chg" text,
	"ga_obliquite" text,
	"ga_relation" text,
	Constraint "galet_amenage_pkey" Primary Key ("zone", "numero", "bis", "ga_ordre")
);

--
-- TOC Entry ID 496 (OID 7521811)
--
-- Name: galet_amenage Type: ACL Owner: 
--

REVOKE ALL on "galet_amenage" from PUBLIC;
GRANT SELECT on "galet_amenage" to PUBLIC;
GRANT ALL on "galet_amenage" to "postgres";
GRANT ALL on "galet_amenage" to "superkadagona";
GRANT SELECT on "galet_amenage" to "visiteurkadagona";
GRANT ALL on "galet_amenage" to "kadagona";
GRANT ALL on "galet_amenage" to "superchoukoutien";
GRANT ALL on "galet_amenage" to "choukoutien";
GRANT SELECT on "galet_amenage" to "visiteurchoukoutien";

--
-- TOC Entry ID 497 (OID 7521817)
--
-- Name: enlevement_galet Type: TABLE Owner: postgres
--

CREATE TABLE "enlevement_galet" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"ga_ordre" integer NOT NULL,
	"eg_rang" text NOT NULL,
	"eg_element" text,
	"eg_longueur_generale" text,
	"eg_profil" text,
	"eg_profondeur" text,
	"eg_obliquite" text,
	"eg_extremite" text,
	"eg_proeminence" text,
	"eg_sens" text,
	"eg_localisation" text,
	"eg_situation" text,
	"eg_epaisseur" text,
	"eg_longueur" integer,
	"eg_largeur" integer,
	"eg_tranchant" text,
	"eg_obliquite_degre" text,
	"eg_corde" integer,
	"eg_fleche" integer,
	"eg_dptimpact" text,
	"eg_support" text,
	"eg_relation" text,
	Constraint "enlevement_galet_pkey" Primary Key ("zone", "numero", "bis", "ga_ordre", "eg_rang")
);

--
-- TOC Entry ID 498 (OID 7521817)
--
-- Name: enlevement_galet Type: ACL Owner: 
--

REVOKE ALL on "enlevement_galet" from PUBLIC;
GRANT SELECT on "enlevement_galet" to PUBLIC;
GRANT ALL on "enlevement_galet" to "postgres";
GRANT ALL on "enlevement_galet" to "superkadagona";
GRANT SELECT on "enlevement_galet" to "visiteurkadagona";
GRANT ALL on "enlevement_galet" to "kadagona";
GRANT ALL on "enlevement_galet" to "superchoukoutien";
GRANT ALL on "enlevement_galet" to "choukoutien";
GRANT SELECT on "enlevement_galet" to "visiteurchoukoutien";

--
-- TOC Entry ID 499 (OID 7521823)
--
-- Name: controle_eg_element Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_element" (
	"eg_element" text NOT NULL,
	"description" text,
	Constraint "controle_eg_element_pkey" Primary Key ("eg_element")
);

--
-- TOC Entry ID 500 (OID 7521823)
--
-- Name: controle_eg_element Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_element" from PUBLIC;
GRANT SELECT on "controle_eg_element" to PUBLIC;
GRANT ALL on "controle_eg_element" to "postgres";
GRANT ALL on "controle_eg_element" to "superkadagona";
GRANT SELECT on "controle_eg_element" to "kadagona";
GRANT ALL on "controle_eg_element" to "superchoukoutien";
GRANT SELECT on "controle_eg_element" to "choukoutien";
GRANT SELECT on "controle_eg_element" to "visiteurchoukoutien";

--
-- TOC Entry ID 501 (OID 7521829)
--
-- Name: controle_eg_longueur_generale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_longueur_generale" (
	"eg_longueur_generale" text NOT NULL,
	"description" text,
	Constraint "controle_eg_longueur_gener_pkey" Primary Key ("eg_longueur_generale")
);

--
-- TOC Entry ID 502 (OID 7521829)
--
-- Name: controle_eg_longueur_generale Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_longueur_generale" from PUBLIC;
GRANT SELECT on "controle_eg_longueur_generale" to PUBLIC;
GRANT ALL on "controle_eg_longueur_generale" to "postgres";
GRANT ALL on "controle_eg_longueur_generale" to "superkadagona";
GRANT SELECT on "controle_eg_longueur_generale" to "kadagona";
GRANT ALL on "controle_eg_longueur_generale" to "superchoukoutien";
GRANT SELECT on "controle_eg_longueur_generale" to "choukoutien";
GRANT SELECT on "controle_eg_longueur_generale" to "visiteurchoukoutien";

--
-- TOC Entry ID 503 (OID 7521835)
--
-- Name: controle_eg_profil Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_profil" (
	"eg_profil" text NOT NULL,
	"description" text,
	Constraint "controle_eg_profil_pkey" Primary Key ("eg_profil")
);

--
-- TOC Entry ID 504 (OID 7521835)
--
-- Name: controle_eg_profil Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_profil" from PUBLIC;
GRANT SELECT on "controle_eg_profil" to PUBLIC;
GRANT ALL on "controle_eg_profil" to "postgres";
GRANT ALL on "controle_eg_profil" to "superkadagona";
GRANT SELECT on "controle_eg_profil" to "kadagona";
GRANT ALL on "controle_eg_profil" to "superchoukoutien";
GRANT SELECT on "controle_eg_profil" to "choukoutien";
GRANT SELECT on "controle_eg_profil" to "visiteurchoukoutien";

--
-- TOC Entry ID 505 (OID 7521841)
--
-- Name: controle_eg_profondeur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_profondeur" (
	"eg_profondeur" text NOT NULL,
	"description" text,
	Constraint "controle_eg_profondeur_pkey" Primary Key ("eg_profondeur")
);

--
-- TOC Entry ID 506 (OID 7521841)
--
-- Name: controle_eg_profondeur Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_profondeur" from PUBLIC;
GRANT SELECT on "controle_eg_profondeur" to PUBLIC;
GRANT ALL on "controle_eg_profondeur" to "postgres";
GRANT ALL on "controle_eg_profondeur" to "superkadagona";
GRANT SELECT on "controle_eg_profondeur" to "kadagona";
GRANT ALL on "controle_eg_profondeur" to "superchoukoutien";
GRANT SELECT on "controle_eg_profondeur" to "choukoutien";
GRANT SELECT on "controle_eg_profondeur" to "visiteurchoukoutien";

--
-- TOC Entry ID 507 (OID 7521847)
--
-- Name: controle_ga_obliquite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_ga_obliquite" (
	"ga_obliquite" text NOT NULL,
	"description" text,
	Constraint "controle_eg_obliquite_pkey" Primary Key ("ga_obliquite")
);

--
-- TOC Entry ID 508 (OID 7521847)
--
-- Name: controle_ga_obliquite Type: ACL Owner: 
--

REVOKE ALL on "controle_ga_obliquite" from PUBLIC;
GRANT SELECT on "controle_ga_obliquite" to PUBLIC;
GRANT ALL on "controle_ga_obliquite" to "postgres";
GRANT ALL on "controle_ga_obliquite" to "superkadagona";
GRANT SELECT on "controle_ga_obliquite" to "kadagona";
GRANT ALL on "controle_ga_obliquite" to "superchoukoutien";
GRANT SELECT on "controle_ga_obliquite" to "choukoutien";
GRANT SELECT on "controle_ga_obliquite" to "visiteurchoukoutien";

--
-- TOC Entry ID 509 (OID 7521853)
--
-- Name: controle_eg_extremite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_extremite" (
	"eg_extremite" text NOT NULL,
	"description" text,
	Constraint "controle_eg_extremite_pkey" Primary Key ("eg_extremite")
);

--
-- TOC Entry ID 510 (OID 7521853)
--
-- Name: controle_eg_extremite Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_extremite" from PUBLIC;
GRANT SELECT on "controle_eg_extremite" to PUBLIC;
GRANT ALL on "controle_eg_extremite" to "postgres";
GRANT ALL on "controle_eg_extremite" to "superkadagona";
GRANT SELECT on "controle_eg_extremite" to "kadagona";
GRANT ALL on "controle_eg_extremite" to "superchoukoutien";
GRANT SELECT on "controle_eg_extremite" to "choukoutien";
GRANT SELECT on "controle_eg_extremite" to "visiteurchoukoutien";

--
-- TOC Entry ID 511 (OID 7521859)
--
-- Name: controle_eg_proeminence Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_proeminence" (
	"eg_proeminence" text NOT NULL,
	"description" text,
	Constraint "controle_eg_proeminence_pkey" Primary Key ("eg_proeminence")
);

--
-- TOC Entry ID 512 (OID 7521859)
--
-- Name: controle_eg_proeminence Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_proeminence" from PUBLIC;
GRANT SELECT on "controle_eg_proeminence" to PUBLIC;
GRANT ALL on "controle_eg_proeminence" to "postgres";
GRANT ALL on "controle_eg_proeminence" to "superkadagona";
GRANT SELECT on "controle_eg_proeminence" to "kadagona";
GRANT ALL on "controle_eg_proeminence" to "superchoukoutien";
GRANT SELECT on "controle_eg_proeminence" to "choukoutien";
GRANT SELECT on "controle_eg_proeminence" to "visiteurchoukoutien";

--
-- TOC Entry ID 513 (OID 7521865)
--
-- Name: controle_eg_sens Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_sens" (
	"eg_sens" text NOT NULL,
	"description" text,
	Constraint "controle_eg_sens_pkey" Primary Key ("eg_sens")
);

--
-- TOC Entry ID 514 (OID 7521865)
--
-- Name: controle_eg_sens Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_sens" from PUBLIC;
GRANT SELECT on "controle_eg_sens" to PUBLIC;
GRANT ALL on "controle_eg_sens" to "postgres";
GRANT ALL on "controle_eg_sens" to "superkadagona";
GRANT SELECT on "controle_eg_sens" to "kadagona";
GRANT ALL on "controle_eg_sens" to "superchoukoutien";
GRANT SELECT on "controle_eg_sens" to "choukoutien";
GRANT SELECT on "controle_eg_sens" to "visiteurchoukoutien";

--
-- TOC Entry ID 515 (OID 7521871)
--
-- Name: controle_eg_situation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_situation" (
	"eg_situation" text NOT NULL,
	"description" text,
	Constraint "controle_eg_situation_pkey" Primary Key ("eg_situation")
);

--
-- TOC Entry ID 516 (OID 7521871)
--
-- Name: controle_eg_situation Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_situation" from PUBLIC;
GRANT SELECT on "controle_eg_situation" to PUBLIC;
GRANT ALL on "controle_eg_situation" to "postgres";
GRANT ALL on "controle_eg_situation" to "superkadagona";
GRANT SELECT on "controle_eg_situation" to "kadagona";
GRANT ALL on "controle_eg_situation" to "superchoukoutien";
GRANT SELECT on "controle_eg_situation" to "choukoutien";
GRANT SELECT on "controle_eg_situation" to "visiteurchoukoutien";

--
-- TOC Entry ID 517 (OID 7521877)
--
-- Name: controle_eg_epaisseur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_epaisseur" (
	"eg_epaisseur" text NOT NULL,
	"description" text,
	Constraint "controle_eg_epaisseur_pkey" Primary Key ("eg_epaisseur")
);

--
-- TOC Entry ID 518 (OID 7521877)
--
-- Name: controle_eg_epaisseur Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_epaisseur" from PUBLIC;
GRANT SELECT on "controle_eg_epaisseur" to PUBLIC;
GRANT ALL on "controle_eg_epaisseur" to "postgres";
GRANT ALL on "controle_eg_epaisseur" to "superkadagona";
GRANT SELECT on "controle_eg_epaisseur" to "kadagona";
GRANT ALL on "controle_eg_epaisseur" to "superchoukoutien";
GRANT SELECT on "controle_eg_epaisseur" to "choukoutien";
GRANT SELECT on "controle_eg_epaisseur" to "visiteurchoukoutien";

--
-- TOC Entry ID 519 (OID 7521883)
--
-- Name: controle_eg_support Type: TABLE Owner: postgres
--

CREATE TABLE "controle_eg_support" (
	"eg_support" text NOT NULL,
	"description" text,
	Constraint "controle_eg_support_pkey" Primary Key ("eg_support")
);

--
-- TOC Entry ID 520 (OID 7521883)
--
-- Name: controle_eg_support Type: ACL Owner: 
--

REVOKE ALL on "controle_eg_support" from PUBLIC;
GRANT SELECT on "controle_eg_support" to PUBLIC;
GRANT ALL on "controle_eg_support" to "postgres";
GRANT ALL on "controle_eg_support" to "superkadagona";
GRANT SELECT on "controle_eg_support" to "kadagona";
GRANT ALL on "controle_eg_support" to "superchoukoutien";
GRANT SELECT on "controle_eg_support" to "choukoutien";
GRANT SELECT on "controle_eg_support" to "visiteurchoukoutien";

--
-- TOC Entry ID 521 (OID 7521895)
--
-- Name: controle_n_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_n_type" (
	"n_type" text NOT NULL,
	"description" text,
	Constraint "controle_n_type_pkey" Primary Key ("n_type")
);

--
-- TOC Entry ID 522 (OID 7521895)
--
-- Name: controle_n_type Type: ACL Owner: 
--

REVOKE ALL on "controle_n_type" from PUBLIC;
GRANT SELECT on "controle_n_type" to PUBLIC;
GRANT ALL on "controle_n_type" to "postgres";
GRANT ALL on "controle_n_type" to "superkadagona";
GRANT SELECT on "controle_n_type" to "kadagona";
GRANT ALL on "controle_n_type" to "superchoukoutien";
GRANT SELECT on "controle_n_type" to "choukoutien";
GRANT SELECT on "controle_n_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 523 (OID 7521901)
--
-- Name: controle_n_forme Type: TABLE Owner: postgres
--

CREATE TABLE "controle_n_forme" (
	"n_forme" text NOT NULL,
	"description" text,
	Constraint "controle_n_forme_pkey" Primary Key ("n_forme")
);

--
-- TOC Entry ID 524 (OID 7521901)
--
-- Name: controle_n_forme Type: ACL Owner: 
--

REVOKE ALL on "controle_n_forme" from PUBLIC;
GRANT SELECT on "controle_n_forme" to PUBLIC;
GRANT ALL on "controle_n_forme" to "postgres";
GRANT ALL on "controle_n_forme" to "superkadagona";
GRANT SELECT on "controle_n_forme" to "kadagona";
GRANT ALL on "controle_n_forme" to "superchoukoutien";
GRANT SELECT on "controle_n_forme" to "choukoutien";
GRANT SELECT on "controle_n_forme" to "visiteurchoukoutien";

--
-- TOC Entry ID 525 (OID 7521907)
--
-- Name: controle_n_cortotal Type: TABLE Owner: postgres
--

CREATE TABLE "controle_n_cortotal" (
	"n_cortotal" integer NOT NULL,
	"description" text,
	Constraint "controle_n_cortotal_pkey" Primary Key ("n_cortotal")
);

--
-- TOC Entry ID 526 (OID 7521907)
--
-- Name: controle_n_cortotal Type: ACL Owner: 
--

REVOKE ALL on "controle_n_cortotal" from PUBLIC;
GRANT SELECT on "controle_n_cortotal" to PUBLIC;
GRANT ALL on "controle_n_cortotal" to "postgres";
GRANT ALL on "controle_n_cortotal" to "superkadagona";
GRANT SELECT on "controle_n_cortotal" to "kadagona";
GRANT ALL on "controle_n_cortotal" to "superchoukoutien";
GRANT SELECT on "controle_n_cortotal" to "choukoutien";
GRANT SELECT on "controle_n_cortotal" to "visiteurchoukoutien";

--
-- TOC Entry ID 527 (OID 7521913)
--
-- Name: controle_n_orientation Type: TABLE Owner: postgres
--

CREATE TABLE "controle_n_orientation" (
	"n_orientation" text NOT NULL,
	"description" text,
	Constraint "controle_n_orientation_pkey" Primary Key ("n_orientation")
);

--
-- TOC Entry ID 528 (OID 7521913)
--
-- Name: controle_n_orientation Type: ACL Owner: 
--

REVOKE ALL on "controle_n_orientation" from PUBLIC;
GRANT SELECT on "controle_n_orientation" to PUBLIC;
GRANT ALL on "controle_n_orientation" to "postgres";
GRANT ALL on "controle_n_orientation" to "superkadagona";
GRANT SELECT on "controle_n_orientation" to "kadagona";
GRANT ALL on "controle_n_orientation" to "superchoukoutien";
GRANT SELECT on "controle_n_orientation" to "choukoutien";
GRANT SELECT on "controle_n_orientation" to "visiteurchoukoutien";

--
-- TOC Entry ID 529 (OID 7521919)
--
-- Name: controle_n_epuisement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_n_epuisement" (
	"n_epuisement" text NOT NULL,
	"description" text,
	Constraint "controle_n_epuisement_pkey" Primary Key ("n_epuisement")
);

--
-- TOC Entry ID 530 (OID 7521919)
--
-- Name: controle_n_epuisement Type: ACL Owner: 
--

REVOKE ALL on "controle_n_epuisement" from PUBLIC;
GRANT SELECT on "controle_n_epuisement" to PUBLIC;
GRANT ALL on "controle_n_epuisement" to "postgres";
GRANT ALL on "controle_n_epuisement" to "superkadagona";
GRANT SELECT on "controle_n_epuisement" to "kadagona";
GRANT ALL on "controle_n_epuisement" to "superchoukoutien";
GRANT SELECT on "controle_n_epuisement" to "choukoutien";
GRANT SELECT on "controle_n_epuisement" to "visiteurchoukoutien";

--
-- TOC Entry ID 531 (OID 7521931)
--
-- Name: controle_en_obliquite Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_obliquite" (
	"en_obliquite" text NOT NULL,
	"description" text,
	Constraint "controle_en_obliquite_pkey" Primary Key ("en_obliquite")
);

--
-- TOC Entry ID 532 (OID 7521931)
--
-- Name: controle_en_obliquite Type: ACL Owner: 
--

REVOKE ALL on "controle_en_obliquite" from PUBLIC;
GRANT SELECT on "controle_en_obliquite" to PUBLIC;
GRANT ALL on "controle_en_obliquite" to "postgres";
GRANT ALL on "controle_en_obliquite" to "superkadagona";
GRANT SELECT on "controle_en_obliquite" to "kadagona";
GRANT ALL on "controle_en_obliquite" to "superchoukoutien";
GRANT SELECT on "controle_en_obliquite" to "choukoutien";
GRANT SELECT on "controle_en_obliquite" to "visiteurchoukoutien";

--
-- TOC Entry ID 533 (OID 7521937)
--
-- Name: controle_en_dptimpact Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_dptimpact" (
	"en_dptimpact" text NOT NULL,
	"description" text,
	Constraint "controle_en_dptimpact_pkey" Primary Key ("en_dptimpact")
);

--
-- TOC Entry ID 534 (OID 7521937)
--
-- Name: controle_en_dptimpact Type: ACL Owner: 
--

REVOKE ALL on "controle_en_dptimpact" from PUBLIC;
GRANT SELECT on "controle_en_dptimpact" to PUBLIC;
GRANT ALL on "controle_en_dptimpact" to "postgres";
GRANT ALL on "controle_en_dptimpact" to "superkadagona";
GRANT SELECT on "controle_en_dptimpact" to "kadagona";
GRANT ALL on "controle_en_dptimpact" to "superchoukoutien";
GRANT SELECT on "controle_en_dptimpact" to "choukoutien";
GRANT SELECT on "controle_en_dptimpact" to "visiteurchoukoutien";

--
-- TOC Entry ID 535 (OID 7521943)
--
-- Name: controle_en_profondeur Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_profondeur" (
	"en_profondeur" text NOT NULL,
	"description" text,
	Constraint "controle_en_profondeur_pkey" Primary Key ("en_profondeur")
);

--
-- TOC Entry ID 536 (OID 7521943)
--
-- Name: controle_en_profondeur Type: ACL Owner: 
--

REVOKE ALL on "controle_en_profondeur" from PUBLIC;
GRANT SELECT on "controle_en_profondeur" to PUBLIC;
GRANT ALL on "controle_en_profondeur" to "postgres";
GRANT ALL on "controle_en_profondeur" to "superkadagona";
GRANT SELECT on "controle_en_profondeur" to "kadagona";
GRANT ALL on "controle_en_profondeur" to "superchoukoutien";
GRANT SELECT on "controle_en_profondeur" to "choukoutien";
GRANT SELECT on "controle_en_profondeur" to "visiteurchoukoutien";

--
-- TOC Entry ID 537 (OID 7521949)
--
-- Name: controle_en_frappe Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_frappe" (
	"en_frappe" text NOT NULL,
	"description" text,
	Constraint "controle_en_frappe_pkey" Primary Key ("en_frappe")
);

--
-- TOC Entry ID 538 (OID 7521949)
--
-- Name: controle_en_frappe Type: ACL Owner: 
--

REVOKE ALL on "controle_en_frappe" from PUBLIC;
GRANT SELECT on "controle_en_frappe" to PUBLIC;
GRANT ALL on "controle_en_frappe" to "postgres";
GRANT ALL on "controle_en_frappe" to "superkadagona";
GRANT SELECT on "controle_en_frappe" to "kadagona";
GRANT ALL on "controle_en_frappe" to "superchoukoutien";
GRANT SELECT on "controle_en_frappe" to "choukoutien";
GRANT SELECT on "controle_en_frappe" to "visiteurchoukoutien";

--
-- TOC Entry ID 539 (OID 7521955)
--
-- Name: controle_en_inclinaison Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_inclinaison" (
	"en_inclinaison" text NOT NULL,
	"description" text,
	Constraint "controle_en_inclinaison_pkey" Primary Key ("en_inclinaison")
);

--
-- TOC Entry ID 540 (OID 7521955)
--
-- Name: controle_en_inclinaison Type: ACL Owner: 
--

REVOKE ALL on "controle_en_inclinaison" from PUBLIC;
GRANT SELECT on "controle_en_inclinaison" to PUBLIC;
GRANT ALL on "controle_en_inclinaison" to "postgres";
GRANT ALL on "controle_en_inclinaison" to "superkadagona";
GRANT SELECT on "controle_en_inclinaison" to "kadagona";
GRANT ALL on "controle_en_inclinaison" to "superchoukoutien";
GRANT SELECT on "controle_en_inclinaison" to "choukoutien";
GRANT SELECT on "controle_en_inclinaison" to "visiteurchoukoutien";

--
-- TOC Entry ID 541 (OID 7521961)
--
-- Name: controle_en_direction Type: TABLE Owner: postgres
--

CREATE TABLE "controle_en_direction" (
	"en_direction" text NOT NULL,
	"description" text,
	Constraint "controle_en_direction_pkey" Primary Key ("en_direction")
);

--
-- TOC Entry ID 542 (OID 7521961)
--
-- Name: controle_en_direction Type: ACL Owner: 
--

REVOKE ALL on "controle_en_direction" from PUBLIC;
GRANT SELECT on "controle_en_direction" to PUBLIC;
GRANT ALL on "controle_en_direction" to "postgres";
GRANT ALL on "controle_en_direction" to "superkadagona";
GRANT SELECT on "controle_en_direction" to "kadagona";
GRANT ALL on "controle_en_direction" to "superchoukoutien";
GRANT SELECT on "controle_en_direction" to "choukoutien";
GRANT SELECT on "controle_en_direction" to "visiteurchoukoutien";

--
-- TOC Entry ID 543 (OID 7521967)
--
-- Name: biface Type: TABLE Owner: postgres
--

CREATE TABLE "biface" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"b_forme" text,
	"b_type" text,
	"b_base" text,
	"b_surface" text,
	"b_enlevement" text,
	"b_amenagement_bord" text,
	"b_amenagement_distal" text,
	"b_distale" text,
	"b_biseau" text,
	"b_bord" text,
	"b_meplat" text,
	"b_extension" text,
	"b_symetrie" text,
	"b_facture" text,
	"b_bilaterale" text,
	"b_bifaciale" text,
	"b_arete" text,
	"b_retouche" text,
	"b_lar1" integer,
	"b_lar2" integer,
	"b_lar3" integer,
	"b_long1" integer,
	"b_l1a" integer,
	"b_long2" integer,
	"b_long3" integer,
	"b_lar4" integer,
	"b_l5" integer,
	"b_e1" integer,
	"b_e2" integer,
	"b_poids" integer,
	"b_ind1" real,
	"b_ind2" real,
	"b_ind3" real,
	"b_ind4" real,
	"b_ind5" real,
	"b_ind6" real,
	"b_ind7" real,
	"b_ind8" real,
	"b_ind9" real,
	"b_ind10" real,
	"b_ind11" real,
	"b_ind12" real,
	"b_ind13" real,
	"b_ind14" real,
	"b_ind15" real,
	"b_ind16" real,
	"b_bc" integer,
	"b_nt" integer,
	"b_dat1" text,
	"b_dat2" text,
	"b_dat" text,
	"b_bd1" integer,
	"b_be1" integer,
	"b_bd2" integer,
	"b_be2" integer,
	"b_1t" integer,
	"b_2t" integer,
	"b_bde1" integer,
	"b_bde2" integer,
	"b_bdet" integer,
	"b_ent" integer,
	"b_bf" text,
	"b_te" integer,
	"b_bh1" integer,
	"b_bh2" integer,
	"b_bht" integer,
	"b_bi1" integer,
	"b_bi2" integer,
	"b_bit" integer,
	"b_bj1" integer,
	"b_bj2" integer,
	"b_bj" integer,
	"b_bk1" integer,
	"b_bk2" integer,
	"b_bk" integer,
	"b_bna" integer,
	"b_bnb" integer,
	"b_bla" integer,
	"b_blb" integer,
	"b_bla1" integer,
	"b_blb1" integer,
	"b_bl1" integer,
	"b_bla2" integer,
	"b_blb2" integer,
	"b_bl2" integer,
	"b_bo1a" integer,
	"b_bo1b" integer,
	"b_bo2a" integer,
	"b_bo2b" integer,
	"b_bo" integer,
	"b_p1" integer,
	"b_p2" integer,
	"b_bp1" integer,
	"b_bp2" integer,
	"b_bq1" integer,
	"b_bq2" integer,
	"b_bq1a" integer,
	"b_bq2a" integer,
	"b_br1" integer,
	"b_br2" integer,
	"b_bv" integer,
	"b_bx" integer,
	"b_by" integer,
	"b_bep" integer,
	"b_bu1" integer,
	"b_bu2" integer,
	"b_bu" integer,
	"b_bu1a" integer,
	"b_bu2a" integer,
	"b_ua" integer,
	"b_bg" text,
	"b_ntf" text,
	"b_bo1" integer,
	"b_bo2" integer,
	"b_support" text,
	Constraint "biface_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 544 (OID 7521967)
--
-- Name: biface Type: ACL Owner: 
--

REVOKE ALL on "biface" from PUBLIC;
GRANT SELECT on "biface" to PUBLIC;
GRANT ALL on "biface" to "postgres";
GRANT ALL on "biface" to "superkadagona";
GRANT SELECT on "biface" to "visiteurkadagona";
GRANT ALL on "biface" to "kadagona";
GRANT ALL on "biface" to "superchoukoutien";
GRANT ALL on "biface" to "choukoutien";
GRANT SELECT on "biface" to "visiteurchoukoutien";

--
-- TOC Entry ID 545 (OID 7521973)
--
-- Name: controle_b_support Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_support" (
	"b_support" text NOT NULL,
	"description" text,
	Constraint "controle_b_support_pkey" Primary Key ("b_support")
);

--
-- TOC Entry ID 546 (OID 7521973)
--
-- Name: controle_b_support Type: ACL Owner: 
--

REVOKE ALL on "controle_b_support" from PUBLIC;
GRANT SELECT on "controle_b_support" to PUBLIC;
GRANT ALL on "controle_b_support" to "postgres";
GRANT ALL on "controle_b_support" to "superkadagona";
GRANT SELECT on "controle_b_support" to "kadagona";
GRANT ALL on "controle_b_support" to "superchoukoutien";
GRANT SELECT on "controle_b_support" to "choukoutien";
GRANT SELECT on "controle_b_support" to "visiteurchoukoutien";

--
-- TOC Entry ID 547 (OID 7521979)
--
-- Name: controle_b_base Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_base" (
	"b_base" text NOT NULL,
	"description" text,
	Constraint "controle_b_base_pkey" Primary Key ("b_base")
);

--
-- TOC Entry ID 548 (OID 7521979)
--
-- Name: controle_b_base Type: ACL Owner: 
--

REVOKE ALL on "controle_b_base" from PUBLIC;
GRANT SELECT on "controle_b_base" to PUBLIC;
GRANT ALL on "controle_b_base" to "postgres";
GRANT ALL on "controle_b_base" to "superkadagona";
GRANT SELECT on "controle_b_base" to "kadagona";
GRANT ALL on "controle_b_base" to "superchoukoutien";
GRANT SELECT on "controle_b_base" to "choukoutien";
GRANT SELECT on "controle_b_base" to "visiteurchoukoutien";

--
-- TOC Entry ID 549 (OID 7521985)
--
-- Name: controle_b_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_type" (
	"b_type" text NOT NULL,
	"description" text,
	Constraint "controle_b_type_pkey" Primary Key ("b_type")
);

--
-- TOC Entry ID 550 (OID 7521985)
--
-- Name: controle_b_type Type: ACL Owner: 
--

REVOKE ALL on "controle_b_type" from PUBLIC;
GRANT SELECT on "controle_b_type" to PUBLIC;
GRANT ALL on "controle_b_type" to "postgres";
GRANT ALL on "controle_b_type" to "superkadagona";
GRANT SELECT on "controle_b_type" to "kadagona";
GRANT ALL on "controle_b_type" to "superchoukoutien";
GRANT SELECT on "controle_b_type" to "choukoutien";
GRANT SELECT on "controle_b_type" to "visiteurchoukoutien";

--
-- TOC Entry ID 551 (OID 7521991)
--
-- Name: controle_b_surface Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_surface" (
	"b_surface" text NOT NULL,
	"description" text,
	Constraint "controle_b_surface_pkey" Primary Key ("b_surface")
);

--
-- TOC Entry ID 552 (OID 7521991)
--
-- Name: controle_b_surface Type: ACL Owner: 
--

REVOKE ALL on "controle_b_surface" from PUBLIC;
GRANT SELECT on "controle_b_surface" to PUBLIC;
GRANT ALL on "controle_b_surface" to "postgres";
GRANT ALL on "controle_b_surface" to "superkadagona";
GRANT SELECT on "controle_b_surface" to "kadagona";
GRANT ALL on "controle_b_surface" to "superchoukoutien";
GRANT SELECT on "controle_b_surface" to "choukoutien";
GRANT SELECT on "controle_b_surface" to "visiteurchoukoutien";

--
-- TOC Entry ID 553 (OID 7521997)
--
-- Name: controle_b_enlevement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_enlevement" (
	"b_enlevement" text NOT NULL,
	"description" text,
	Constraint "controle_b_enlevement_pkey" Primary Key ("b_enlevement")
);

--
-- TOC Entry ID 554 (OID 7521997)
--
-- Name: controle_b_enlevement Type: ACL Owner: 
--

REVOKE ALL on "controle_b_enlevement" from PUBLIC;
GRANT SELECT on "controle_b_enlevement" to PUBLIC;
GRANT ALL on "controle_b_enlevement" to "postgres";
GRANT ALL on "controle_b_enlevement" to "superkadagona";
GRANT SELECT on "controle_b_enlevement" to "kadagona";
GRANT ALL on "controle_b_enlevement" to "superchoukoutien";
GRANT SELECT on "controle_b_enlevement" to "choukoutien";
GRANT SELECT on "controle_b_enlevement" to "visiteurchoukoutien";

--
-- TOC Entry ID 555 (OID 7522003)
--
-- Name: controle_b_amenagement_bord Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_amenagement_bord" (
	"b_amenagement_bord" text NOT NULL,
	"description" text,
	Constraint "controle_b_amenagement_bor_pkey" Primary Key ("b_amenagement_bord")
);

--
-- TOC Entry ID 556 (OID 7522003)
--
-- Name: controle_b_amenagement_bord Type: ACL Owner: 
--

REVOKE ALL on "controle_b_amenagement_bord" from PUBLIC;
GRANT SELECT on "controle_b_amenagement_bord" to PUBLIC;
GRANT ALL on "controle_b_amenagement_bord" to "postgres";
GRANT ALL on "controle_b_amenagement_bord" to "superkadagona";
GRANT SELECT on "controle_b_amenagement_bord" to "kadagona";
GRANT ALL on "controle_b_amenagement_bord" to "superchoukoutien";
GRANT SELECT on "controle_b_amenagement_bord" to "choukoutien";
GRANT SELECT on "controle_b_amenagement_bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 557 (OID 7522009)
--
-- Name: controle_b_amenagement_distal Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_amenagement_distal" (
	"b_amenagement_distal" text NOT NULL,
	"description" text,
	Constraint "controle_b_amenagement_dis_pkey" Primary Key ("b_amenagement_distal")
);

--
-- TOC Entry ID 558 (OID 7522009)
--
-- Name: controle_b_amenagement_distal Type: ACL Owner: 
--

REVOKE ALL on "controle_b_amenagement_distal" from PUBLIC;
GRANT SELECT on "controle_b_amenagement_distal" to PUBLIC;
GRANT ALL on "controle_b_amenagement_distal" to "postgres";
GRANT ALL on "controle_b_amenagement_distal" to "superkadagona";
GRANT SELECT on "controle_b_amenagement_distal" to "kadagona";
GRANT ALL on "controle_b_amenagement_distal" to "superchoukoutien";
GRANT SELECT on "controle_b_amenagement_distal" to "choukoutien";
GRANT SELECT on "controle_b_amenagement_distal" to "visiteurchoukoutien";

--
-- TOC Entry ID 559 (OID 7522015)
--
-- Name: controle_b_distale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_distale" (
	"b_distale" text NOT NULL,
	"description" text,
	Constraint "controle_b_distale_pkey" Primary Key ("b_distale")
);

--
-- TOC Entry ID 560 (OID 7522015)
--
-- Name: controle_b_distale Type: ACL Owner: 
--

REVOKE ALL on "controle_b_distale" from PUBLIC;
GRANT SELECT on "controle_b_distale" to PUBLIC;
GRANT ALL on "controle_b_distale" to "postgres";
GRANT ALL on "controle_b_distale" to "superkadagona";
GRANT SELECT on "controle_b_distale" to "kadagona";
GRANT ALL on "controle_b_distale" to "superchoukoutien";
GRANT SELECT on "controle_b_distale" to "choukoutien";
GRANT SELECT on "controle_b_distale" to "visiteurchoukoutien";

--
-- TOC Entry ID 561 (OID 7522021)
--
-- Name: controle_b_biseau Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_biseau" (
	"b_biseau" text NOT NULL,
	"description" text,
	Constraint "controle_b_biseau_pkey" Primary Key ("b_biseau")
);

--
-- TOC Entry ID 562 (OID 7522021)
--
-- Name: controle_b_biseau Type: ACL Owner: 
--

REVOKE ALL on "controle_b_biseau" from PUBLIC;
GRANT SELECT on "controle_b_biseau" to PUBLIC;
GRANT ALL on "controle_b_biseau" to "postgres";
GRANT ALL on "controle_b_biseau" to "superkadagona";
GRANT SELECT on "controle_b_biseau" to "kadagona";
GRANT ALL on "controle_b_biseau" to "superchoukoutien";
GRANT SELECT on "controle_b_biseau" to "choukoutien";
GRANT SELECT on "controle_b_biseau" to "visiteurchoukoutien";

--
-- TOC Entry ID 563 (OID 7522027)
--
-- Name: controle_b_bord Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_bord" (
	"b_bord" text NOT NULL,
	"description" text,
	Constraint "controle_b_bord_pkey" Primary Key ("b_bord")
);

--
-- TOC Entry ID 564 (OID 7522027)
--
-- Name: controle_b_bord Type: ACL Owner: 
--

REVOKE ALL on "controle_b_bord" from PUBLIC;
GRANT SELECT on "controle_b_bord" to PUBLIC;
GRANT ALL on "controle_b_bord" to "postgres";
GRANT ALL on "controle_b_bord" to "superkadagona";
GRANT SELECT on "controle_b_bord" to "kadagona";
GRANT ALL on "controle_b_bord" to "superchoukoutien";
GRANT SELECT on "controle_b_bord" to "choukoutien";
GRANT SELECT on "controle_b_bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 565 (OID 7522033)
--
-- Name: controle_b_meplat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_meplat" (
	"b_meplat" text NOT NULL,
	"description" text,
	Constraint "controle_b_meplat_pkey" Primary Key ("b_meplat")
);

--
-- TOC Entry ID 566 (OID 7522033)
--
-- Name: controle_b_meplat Type: ACL Owner: 
--

REVOKE ALL on "controle_b_meplat" from PUBLIC;
GRANT SELECT on "controle_b_meplat" to PUBLIC;
GRANT ALL on "controle_b_meplat" to "postgres";
GRANT ALL on "controle_b_meplat" to "superkadagona";
GRANT SELECT on "controle_b_meplat" to "kadagona";
GRANT ALL on "controle_b_meplat" to "superchoukoutien";
GRANT SELECT on "controle_b_meplat" to "choukoutien";
GRANT SELECT on "controle_b_meplat" to "visiteurchoukoutien";

--
-- TOC Entry ID 567 (OID 7522039)
--
-- Name: controle_b_extension Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_extension" (
	"b_extension" text NOT NULL,
	"description" text,
	Constraint "controle_b_extension_pkey" Primary Key ("b_extension")
);

--
-- TOC Entry ID 568 (OID 7522039)
--
-- Name: controle_b_extension Type: ACL Owner: 
--

REVOKE ALL on "controle_b_extension" from PUBLIC;
GRANT SELECT on "controle_b_extension" to PUBLIC;
GRANT ALL on "controle_b_extension" to "postgres";
GRANT ALL on "controle_b_extension" to "superkadagona";
GRANT SELECT on "controle_b_extension" to "kadagona";
GRANT ALL on "controle_b_extension" to "superchoukoutien";
GRANT SELECT on "controle_b_extension" to "choukoutien";
GRANT SELECT on "controle_b_extension" to "visiteurchoukoutien";

--
-- TOC Entry ID 569 (OID 7522045)
--
-- Name: controle_b_symetrie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_symetrie" (
	"b_symetrie" text NOT NULL,
	"description" text,
	Constraint "controle_b_symetrie_pkey" Primary Key ("b_symetrie")
);

--
-- TOC Entry ID 570 (OID 7522045)
--
-- Name: controle_b_symetrie Type: ACL Owner: 
--

REVOKE ALL on "controle_b_symetrie" from PUBLIC;
GRANT SELECT on "controle_b_symetrie" to PUBLIC;
GRANT ALL on "controle_b_symetrie" to "postgres";
GRANT ALL on "controle_b_symetrie" to "superkadagona";
GRANT SELECT on "controle_b_symetrie" to "kadagona";
GRANT ALL on "controle_b_symetrie" to "superchoukoutien";
GRANT SELECT on "controle_b_symetrie" to "choukoutien";
GRANT SELECT on "controle_b_symetrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 571 (OID 7522051)
--
-- Name: controle_b_bilaterale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_bilaterale" (
	"b_bilaterale" text NOT NULL,
	"description" text,
	Constraint "controle_b_bilaterale_pkey" Primary Key ("b_bilaterale")
);

--
-- TOC Entry ID 572 (OID 7522051)
--
-- Name: controle_b_bilaterale Type: ACL Owner: 
--

REVOKE ALL on "controle_b_bilaterale" from PUBLIC;
GRANT SELECT on "controle_b_bilaterale" to PUBLIC;
GRANT ALL on "controle_b_bilaterale" to "postgres";
GRANT ALL on "controle_b_bilaterale" to "superkadagona";
GRANT SELECT on "controle_b_bilaterale" to "kadagona";
GRANT ALL on "controle_b_bilaterale" to "superchoukoutien";
GRANT SELECT on "controle_b_bilaterale" to "choukoutien";
GRANT SELECT on "controle_b_bilaterale" to "visiteurchoukoutien";

--
-- TOC Entry ID 573 (OID 7522057)
--
-- Name: controle_b_facture Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_facture" (
	"b_facture" text NOT NULL,
	"description" text,
	Constraint "controle_b_facture_pkey" Primary Key ("b_facture")
);

--
-- TOC Entry ID 574 (OID 7522057)
--
-- Name: controle_b_facture Type: ACL Owner: 
--

REVOKE ALL on "controle_b_facture" from PUBLIC;
GRANT SELECT on "controle_b_facture" to PUBLIC;
GRANT ALL on "controle_b_facture" to "postgres";
GRANT ALL on "controle_b_facture" to "superkadagona";
GRANT SELECT on "controle_b_facture" to "kadagona";
GRANT ALL on "controle_b_facture" to "superchoukoutien";
GRANT SELECT on "controle_b_facture" to "choukoutien";
GRANT SELECT on "controle_b_facture" to "visiteurchoukoutien";

--
-- TOC Entry ID 575 (OID 7522063)
--
-- Name: controle_b_bifaciale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_bifaciale" (
	"b_bifaciale" text NOT NULL,
	"description" text,
	Constraint "controle_b_bifaciale_pkey" Primary Key ("b_bifaciale")
);

--
-- TOC Entry ID 576 (OID 7522063)
--
-- Name: controle_b_bifaciale Type: ACL Owner: 
--

REVOKE ALL on "controle_b_bifaciale" from PUBLIC;
GRANT SELECT on "controle_b_bifaciale" to PUBLIC;
GRANT ALL on "controle_b_bifaciale" to "postgres";
GRANT ALL on "controle_b_bifaciale" to "superkadagona";
GRANT SELECT on "controle_b_bifaciale" to "kadagona";
GRANT ALL on "controle_b_bifaciale" to "superchoukoutien";
GRANT SELECT on "controle_b_bifaciale" to "choukoutien";
GRANT SELECT on "controle_b_bifaciale" to "visiteurchoukoutien";

--
-- TOC Entry ID 577 (OID 7522069)
--
-- Name: controle_b_arete Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_arete" (
	"b_arete" text NOT NULL,
	"description" text,
	Constraint "controle_b_arete_pkey" Primary Key ("b_arete")
);

--
-- TOC Entry ID 578 (OID 7522069)
--
-- Name: controle_b_arete Type: ACL Owner: 
--

REVOKE ALL on "controle_b_arete" from PUBLIC;
GRANT SELECT on "controle_b_arete" to PUBLIC;
GRANT ALL on "controle_b_arete" to "postgres";
GRANT ALL on "controle_b_arete" to "superkadagona";
GRANT SELECT on "controle_b_arete" to "kadagona";
GRANT ALL on "controle_b_arete" to "superchoukoutien";
GRANT SELECT on "controle_b_arete" to "choukoutien";
GRANT SELECT on "controle_b_arete" to "visiteurchoukoutien";

--
-- TOC Entry ID 579 (OID 7522075)
--
-- Name: controle_b_retouche Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_retouche" (
	"b_retouche" text NOT NULL,
	"description" text,
	Constraint "controle_b_retouche_pkey" Primary Key ("b_retouche")
);

--
-- TOC Entry ID 580 (OID 7522075)
--
-- Name: controle_b_retouche Type: ACL Owner: 
--

REVOKE ALL on "controle_b_retouche" from PUBLIC;
GRANT SELECT on "controle_b_retouche" to PUBLIC;
GRANT ALL on "controle_b_retouche" to "postgres";
GRANT ALL on "controle_b_retouche" to "superkadagona";
GRANT SELECT on "controle_b_retouche" to "kadagona";
GRANT ALL on "controle_b_retouche" to "superchoukoutien";
GRANT SELECT on "controle_b_retouche" to "choukoutien";
GRANT SELECT on "controle_b_retouche" to "visiteurchoukoutien";

--
-- TOC Entry ID 581 (OID 7522081)
--
-- Name: controle_b_dat1 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_dat1" (
	"b_dat1" text NOT NULL,
	"description" text,
	Constraint "controle_b_dat1_pkey" Primary Key ("b_dat1")
);

--
-- TOC Entry ID 582 (OID 7522081)
--
-- Name: controle_b_dat1 Type: ACL Owner: 
--

REVOKE ALL on "controle_b_dat1" from PUBLIC;
GRANT SELECT on "controle_b_dat1" to PUBLIC;
GRANT ALL on "controle_b_dat1" to "postgres";
GRANT ALL on "controle_b_dat1" to "superkadagona";
GRANT SELECT on "controle_b_dat1" to "kadagona";
GRANT ALL on "controle_b_dat1" to "superchoukoutien";
GRANT SELECT on "controle_b_dat1" to "choukoutien";
GRANT SELECT on "controle_b_dat1" to "visiteurchoukoutien";

--
-- TOC Entry ID 583 (OID 7522087)
--
-- Name: controle_b_dat2 Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_dat2" (
	"b_dat2" text NOT NULL,
	"description" text,
	Constraint "controle_b_dat2_pkey" Primary Key ("b_dat2")
);

--
-- TOC Entry ID 584 (OID 7522087)
--
-- Name: controle_b_dat2 Type: ACL Owner: 
--

REVOKE ALL on "controle_b_dat2" from PUBLIC;
GRANT SELECT on "controle_b_dat2" to PUBLIC;
GRANT ALL on "controle_b_dat2" to "postgres";
GRANT ALL on "controle_b_dat2" to "superkadagona";
GRANT SELECT on "controle_b_dat2" to "kadagona";
GRANT ALL on "controle_b_dat2" to "superchoukoutien";
GRANT SELECT on "controle_b_dat2" to "choukoutien";
GRANT SELECT on "controle_b_dat2" to "visiteurchoukoutien";

--
-- TOC Entry ID 585 (OID 7522093)
--
-- Name: controle_b_dat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_dat" (
	"b_dat" text NOT NULL,
	"description" text,
	Constraint "controle_b_dat_pkey" Primary Key ("b_dat")
);

--
-- TOC Entry ID 586 (OID 7522093)
--
-- Name: controle_b_dat Type: ACL Owner: 
--

REVOKE ALL on "controle_b_dat" from PUBLIC;
GRANT SELECT on "controle_b_dat" to PUBLIC;
GRANT ALL on "controle_b_dat" to "postgres";
GRANT ALL on "controle_b_dat" to "superkadagona";
GRANT SELECT on "controle_b_dat" to "kadagona";
GRANT ALL on "controle_b_dat" to "superchoukoutien";
GRANT SELECT on "controle_b_dat" to "choukoutien";
GRANT SELECT on "controle_b_dat" to "visiteurchoukoutien";

--
-- TOC Entry ID 587 (OID 7522099)
--
-- Name: controle_b_amincissement Type: TABLE Owner: postgres
--

CREATE TABLE "controle_b_amincissement" (
	"b_amincissement" text NOT NULL,
	"description" text,
	Constraint "controle_b_amincissement_pkey" Primary Key ("b_amincissement")
);

--
-- TOC Entry ID 588 (OID 7522099)
--
-- Name: controle_b_amincissement Type: ACL Owner: 
--

REVOKE ALL on "controle_b_amincissement" from PUBLIC;
GRANT SELECT on "controle_b_amincissement" to PUBLIC;
GRANT ALL on "controle_b_amincissement" to "postgres";
GRANT ALL on "controle_b_amincissement" to "superkadagona";
GRANT SELECT on "controle_b_amincissement" to "visiteurkadagona";
GRANT SELECT on "controle_b_amincissement" to "kadagona";
GRANT ALL on "controle_b_amincissement" to "superchoukoutien";
GRANT SELECT on "controle_b_amincissement" to "choukoutien";
GRANT SELECT on "controle_b_amincissement" to "visiteurchoukoutien";

--
-- TOC Entry ID 589 (OID 7522105)
--
-- Name: hachereau Type: TABLE Owner: postgres
--

CREATE TABLE "hachereau" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"h_type" text,
	"h_base" text,
	"h_surface" text,
	"h_amenagement_bord" text,
	"h_distale" text,
	"h_biseau" text,
	"h_bord" text,
	"h_meplat" text,
	"h_extension" text,
	"h_symetrie" text,
	"h_bilaterale" text,
	"h_facture" text,
	"h_arete" text,
	"h_retouche" text,
	"h_long1" integer,
	"h_long2" integer,
	"h_long3" integer,
	"h_l1" integer,
	"h_l1a" integer,
	"h_l2" integer,
	"h_l3" integer,
	"h_l4" integer,
	"h_l5" integer,
	"h_e1" integer,
	"h_e2" integer,
	"h_poids" integer,
	"h_ind1" real,
	"h_ind2" real,
	"h_ind3" real,
	"h_ind4" real,
	"h_ind5" real,
	"h_ind6" real,
	"h_ind7" real,
	"h_ind8" real,
	"h_ind9" real,
	"h_ind10" real,
	"h_ind11" real,
	"h_ind12" real,
	"h_ind13" real,
	"h_ind14" real,
	"h_ind15" real,
	"h_hc" integer,
	"h_hd" integer,
	"h_he" integer,
	"h_hb1a" integer,
	"h_hb1b" integer,
	"h_hb1" integer,
	"h_hb2a" integer,
	"h_hb2b" integer,
	"h_hb2" integer,
	"h_hde1" integer,
	"h_hg1" integer,
	"h_hg2" integer,
	"h_hh" integer,
	"h_hi" integer,
	"h_hj" integer,
	"h_hk" integer,
	"h_hla1" integer,
	"h_hlb1" integer,
	"h_hl1" integer,
	"h_hla2" integer,
	"h_hlb2" integer,
	"h_hl2" integer,
	"h_hm" integer,
	"h_hs" integer,
	"h_hng" integer,
	"h_hnd" integer,
	"h_ho" integer,
	"h_hp" integer,
	"h_hq" integer,
	"h_hr" integer,
	"h_hu" integer,
	"h_hx" integer,
	"h_hya1" integer,
	"h_hya2" integer,
	"h_hya" integer,
	"h_hyb1" integer,
	"h_hyb2" integer,
	"h_hyb" integer,
	"h_hy" integer,
	"h_hyax" integer,
	"h_hybx" integer,
	"h_hyx" integer,
	"h_hf" integer,
	"h_ntf" integer,
	"h_hde2" integer,
	Constraint "hachereau_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 590 (OID 7522105)
--
-- Name: hachereau Type: ACL Owner: 
--

REVOKE ALL on "hachereau" from PUBLIC;
GRANT SELECT on "hachereau" to PUBLIC;
GRANT ALL on "hachereau" to "postgres";
GRANT ALL on "hachereau" to "superkadagona";
GRANT SELECT on "hachereau" to "visiteurkadagona";
GRANT ALL on "hachereau" to "kadagona";
GRANT ALL on "hachereau" to "superchoukoutien";
GRANT ALL on "hachereau" to "choukoutien";
GRANT SELECT on "hachereau" to "visiteurchoukoutien";

--
-- TOC Entry ID 591 (OID 7522111)
--
-- Name: controle_h_base Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_base" (
	"h_base" text NOT NULL,
	"description" text,
	Constraint "controle_h_base_pkey" Primary Key ("h_base")
);

--
-- TOC Entry ID 592 (OID 7522111)
--
-- Name: controle_h_base Type: ACL Owner: 
--

REVOKE ALL on "controle_h_base" from PUBLIC;
GRANT SELECT on "controle_h_base" to PUBLIC;
GRANT ALL on "controle_h_base" to "postgres";
GRANT ALL on "controle_h_base" to "superkadagona";
GRANT SELECT on "controle_h_base" to "kadagona";
GRANT ALL on "controle_h_base" to "superchoukoutien";
GRANT SELECT on "controle_h_base" to "choukoutien";
GRANT SELECT on "controle_h_base" to "visiteurchoukoutien";

--
-- TOC Entry ID 593 (OID 7522117)
--
-- Name: controle_h_surface Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_surface" (
	"h_surface" text NOT NULL,
	"description" text,
	Constraint "controle_h_surface_pkey" Primary Key ("h_surface")
);

--
-- TOC Entry ID 594 (OID 7522117)
--
-- Name: controle_h_surface Type: ACL Owner: 
--

REVOKE ALL on "controle_h_surface" from PUBLIC;
GRANT SELECT on "controle_h_surface" to PUBLIC;
GRANT ALL on "controle_h_surface" to "postgres";
GRANT ALL on "controle_h_surface" to "superkadagona";
GRANT SELECT on "controle_h_surface" to "kadagona";
GRANT ALL on "controle_h_surface" to "superchoukoutien";
GRANT SELECT on "controle_h_surface" to "choukoutien";
GRANT SELECT on "controle_h_surface" to "visiteurchoukoutien";

--
-- TOC Entry ID 595 (OID 7522123)
--
-- Name: controle_h_amenagement_bord Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_amenagement_bord" (
	"h_amenagement_bord" text NOT NULL,
	"description" text,
	Constraint "controle_h_amenagement_bor_pkey" Primary Key ("h_amenagement_bord")
);

--
-- TOC Entry ID 596 (OID 7522123)
--
-- Name: controle_h_amenagement_bord Type: ACL Owner: 
--

REVOKE ALL on "controle_h_amenagement_bord" from PUBLIC;
GRANT SELECT on "controle_h_amenagement_bord" to PUBLIC;
GRANT ALL on "controle_h_amenagement_bord" to "postgres";
GRANT ALL on "controle_h_amenagement_bord" to "superkadagona";
GRANT SELECT on "controle_h_amenagement_bord" to "kadagona";
GRANT ALL on "controle_h_amenagement_bord" to "superchoukoutien";
GRANT SELECT on "controle_h_amenagement_bord" to "choukoutien";
GRANT SELECT on "controle_h_amenagement_bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 597 (OID 7522129)
--
-- Name: controle_h_amenagement_distal Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_amenagement_distal" (
	"amenagement_h_distal" text NOT NULL,
	"description" text,
	Constraint "controle_h_amenagement_dis_pkey" Primary Key ("amenagement_h_distal")
);

--
-- TOC Entry ID 598 (OID 7522129)
--
-- Name: controle_h_amenagement_distal Type: ACL Owner: 
--

REVOKE ALL on "controle_h_amenagement_distal" from PUBLIC;
GRANT SELECT on "controle_h_amenagement_distal" to PUBLIC;
GRANT ALL on "controle_h_amenagement_distal" to "postgres";
GRANT ALL on "controle_h_amenagement_distal" to "superkadagona";
GRANT SELECT on "controle_h_amenagement_distal" to "kadagona";
GRANT ALL on "controle_h_amenagement_distal" to "superchoukoutien";
GRANT SELECT on "controle_h_amenagement_distal" to "choukoutien";
GRANT SELECT on "controle_h_amenagement_distal" to "visiteurchoukoutien";

--
-- TOC Entry ID 599 (OID 7522135)
--
-- Name: controle_h_distale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_distale" (
	"h_distale" text NOT NULL,
	"description" text,
	Constraint "controle_h_distale_pkey" Primary Key ("h_distale")
);

--
-- TOC Entry ID 600 (OID 7522135)
--
-- Name: controle_h_distale Type: ACL Owner: 
--

REVOKE ALL on "controle_h_distale" from PUBLIC;
GRANT SELECT on "controle_h_distale" to PUBLIC;
GRANT ALL on "controle_h_distale" to "postgres";
GRANT ALL on "controle_h_distale" to "superkadagona";
GRANT SELECT on "controle_h_distale" to "kadagona";
GRANT ALL on "controle_h_distale" to "superchoukoutien";
GRANT SELECT on "controle_h_distale" to "choukoutien";
GRANT SELECT on "controle_h_distale" to "visiteurchoukoutien";

--
-- TOC Entry ID 601 (OID 7522141)
--
-- Name: controle_h_biseau Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_biseau" (
	"h_biseau" text NOT NULL,
	"description" text,
	Constraint "controle_h_biseau_pkey" Primary Key ("h_biseau")
);

--
-- TOC Entry ID 602 (OID 7522141)
--
-- Name: controle_h_biseau Type: ACL Owner: 
--

REVOKE ALL on "controle_h_biseau" from PUBLIC;
GRANT SELECT on "controle_h_biseau" to PUBLIC;
GRANT ALL on "controle_h_biseau" to "postgres";
GRANT ALL on "controle_h_biseau" to "superkadagona";
GRANT SELECT on "controle_h_biseau" to "kadagona";
GRANT ALL on "controle_h_biseau" to "superchoukoutien";
GRANT SELECT on "controle_h_biseau" to "choukoutien";
GRANT SELECT on "controle_h_biseau" to "visiteurchoukoutien";

--
-- TOC Entry ID 603 (OID 7522147)
--
-- Name: controle_h_bord Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_bord" (
	"h_bord" text NOT NULL,
	"description" text,
	Constraint "controle_h_bord_pkey" Primary Key ("h_bord")
);

--
-- TOC Entry ID 604 (OID 7522147)
--
-- Name: controle_h_bord Type: ACL Owner: 
--

REVOKE ALL on "controle_h_bord" from PUBLIC;
GRANT SELECT on "controle_h_bord" to PUBLIC;
GRANT ALL on "controle_h_bord" to "postgres";
GRANT ALL on "controle_h_bord" to "superkadagona";
GRANT SELECT on "controle_h_bord" to "kadagona";
GRANT ALL on "controle_h_bord" to "superchoukoutien";
GRANT SELECT on "controle_h_bord" to "choukoutien";
GRANT SELECT on "controle_h_bord" to "visiteurchoukoutien";

--
-- TOC Entry ID 605 (OID 7522153)
--
-- Name: controle_h_meplat Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_meplat" (
	"h_meplat" text NOT NULL,
	"description" text,
	Constraint "controle_h_meplat_pkey" Primary Key ("h_meplat")
);

--
-- TOC Entry ID 606 (OID 7522153)
--
-- Name: controle_h_meplat Type: ACL Owner: 
--

REVOKE ALL on "controle_h_meplat" from PUBLIC;
GRANT SELECT on "controle_h_meplat" to PUBLIC;
GRANT ALL on "controle_h_meplat" to "postgres";
GRANT ALL on "controle_h_meplat" to "superkadagona";
GRANT SELECT on "controle_h_meplat" to "kadagona";
GRANT ALL on "controle_h_meplat" to "superchoukoutien";
GRANT SELECT on "controle_h_meplat" to "choukoutien";
GRANT SELECT on "controle_h_meplat" to "visiteurchoukoutien";

--
-- TOC Entry ID 607 (OID 7522159)
--
-- Name: controle_h_extension Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_extension" (
	"h_extension" text NOT NULL,
	"description" text,
	Constraint "controle_h_extension_pkey" Primary Key ("h_extension")
);

--
-- TOC Entry ID 608 (OID 7522159)
--
-- Name: controle_h_extension Type: ACL Owner: 
--

REVOKE ALL on "controle_h_extension" from PUBLIC;
GRANT SELECT on "controle_h_extension" to PUBLIC;
GRANT ALL on "controle_h_extension" to "postgres";
GRANT ALL on "controle_h_extension" to "superkadagona";
GRANT SELECT on "controle_h_extension" to "kadagona";
GRANT ALL on "controle_h_extension" to "superchoukoutien";
GRANT SELECT on "controle_h_extension" to "choukoutien";
GRANT SELECT on "controle_h_extension" to "visiteurchoukoutien";

--
-- TOC Entry ID 609 (OID 7522165)
--
-- Name: controle_h_symetrie Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_symetrie" (
	"h_symetrie" text NOT NULL,
	"description" text,
	Constraint "controle_h_symetrie_pkey" Primary Key ("h_symetrie")
);

--
-- TOC Entry ID 610 (OID 7522165)
--
-- Name: controle_h_symetrie Type: ACL Owner: 
--

REVOKE ALL on "controle_h_symetrie" from PUBLIC;
GRANT SELECT on "controle_h_symetrie" to PUBLIC;
GRANT ALL on "controle_h_symetrie" to "postgres";
GRANT ALL on "controle_h_symetrie" to "superkadagona";
GRANT SELECT on "controle_h_symetrie" to "kadagona";
GRANT ALL on "controle_h_symetrie" to "superchoukoutien";
GRANT SELECT on "controle_h_symetrie" to "choukoutien";
GRANT SELECT on "controle_h_symetrie" to "visiteurchoukoutien";

--
-- TOC Entry ID 611 (OID 7522171)
--
-- Name: controle_h_bilaterale Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_bilaterale" (
	"h_bilaterale" text NOT NULL,
	"description" text,
	Constraint "controle_h_bilaterale_pkey" Primary Key ("h_bilaterale")
);

--
-- TOC Entry ID 612 (OID 7522171)
--
-- Name: controle_h_bilaterale Type: ACL Owner: 
--

REVOKE ALL on "controle_h_bilaterale" from PUBLIC;
GRANT SELECT on "controle_h_bilaterale" to PUBLIC;
GRANT ALL on "controle_h_bilaterale" to "postgres";
GRANT ALL on "controle_h_bilaterale" to "superkadagona";
GRANT SELECT on "controle_h_bilaterale" to "kadagona";
GRANT ALL on "controle_h_bilaterale" to "superchoukoutien";
GRANT SELECT on "controle_h_bilaterale" to "choukoutien";
GRANT SELECT on "controle_h_bilaterale" to "visiteurchoukoutien";

--
-- TOC Entry ID 613 (OID 7522177)
--
-- Name: controle_h_facture Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_facture" (
	"h_facture" text NOT NULL,
	"description" text,
	Constraint "controle_h_facture_pkey" Primary Key ("h_facture")
);

--
-- TOC Entry ID 614 (OID 7522177)
--
-- Name: controle_h_facture Type: ACL Owner: 
--

REVOKE ALL on "controle_h_facture" from PUBLIC;
GRANT SELECT on "controle_h_facture" to PUBLIC;
GRANT ALL on "controle_h_facture" to "postgres";
GRANT ALL on "controle_h_facture" to "superkadagona";
GRANT SELECT on "controle_h_facture" to "kadagona";
GRANT ALL on "controle_h_facture" to "superchoukoutien";
GRANT SELECT on "controle_h_facture" to "choukoutien";
GRANT SELECT on "controle_h_facture" to "visiteurchoukoutien";

--
-- TOC Entry ID 615 (OID 7522183)
--
-- Name: controle_h_arete Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_arete" (
	"h_arete" text NOT NULL,
	"description" text,
	Constraint "controle_h_arete_pkey" Primary Key ("h_arete")
);

--
-- TOC Entry ID 616 (OID 7522183)
--
-- Name: controle_h_arete Type: ACL Owner: 
--

REVOKE ALL on "controle_h_arete" from PUBLIC;
GRANT SELECT on "controle_h_arete" to PUBLIC;
GRANT ALL on "controle_h_arete" to "postgres";
GRANT ALL on "controle_h_arete" to "superkadagona";
GRANT SELECT on "controle_h_arete" to "kadagona";
GRANT ALL on "controle_h_arete" to "superchoukoutien";
GRANT SELECT on "controle_h_arete" to "choukoutien";
GRANT SELECT on "controle_h_arete" to "visiteurchoukoutien";

--
-- TOC Entry ID 617 (OID 7522189)
--
-- Name: controle_h_retouche Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_retouche" (
	"h_retouche" text NOT NULL,
	"description" text,
	Constraint "controle_h_retouche_pkey" Primary Key ("h_retouche")
);

--
-- TOC Entry ID 618 (OID 7522189)
--
-- Name: controle_h_retouche Type: ACL Owner: 
--

REVOKE ALL on "controle_h_retouche" from PUBLIC;
GRANT SELECT on "controle_h_retouche" to PUBLIC;
GRANT ALL on "controle_h_retouche" to "postgres";
GRANT ALL on "controle_h_retouche" to "superkadagona";
GRANT SELECT on "controle_h_retouche" to "kadagona";
GRANT ALL on "controle_h_retouche" to "superchoukoutien";
GRANT SELECT on "controle_h_retouche" to "choukoutien";
GRANT SELECT on "controle_h_retouche" to "visiteurchoukoutien";

--
-- TOC Entry ID 619 (OID 7522195)
--
-- Name: controle_h_type Type: TABLE Owner: postgres
--

CREATE TABLE "controle_h_type" (
	"h_type" text NOT NULL,
	"description" text,
	Constraint "controle_h_type_pkey" Primary Key ("h_type")
);

--
-- TOC Entry ID 620 (OID 7522195)
--
-- Name: controle_h_type Type: ACL Owner: 
--

REVOKE ALL on "controle_h_type" from PUBLIC;
GRANT SELECT on "controle_h_type" to PUBLIC;
GRANT ALL on "controle_h_type" to "postgres";
GRANT ALL on "controle_h_type" to "superkadagona";
GRANT SELECT on "controle_h_type" to "kadagona";
GRANT ALL on "controle_h_type" to "superchoukoutien";
GRANT SELECT on "controle_h_type" to "choukoutien";
GRANT SELECT on "controle_h_type" to "visiteurchoukoutien";

\connect - rachel

--
-- TOC Entry ID 621 (OID 7522201)
--
-- Name: controle_couche Type: TABLE Owner: rachel
--

CREATE TABLE "controle_couche" (
	"couche" text NOT NULL,
	"description" text,
	Constraint "controle_couche_pkey" Primary Key ("couche")
);

--
-- TOC Entry ID 622 (OID 7522201)
--
-- Name: controle_couche Type: ACL Owner: 
--

REVOKE ALL on "controle_couche" from PUBLIC;
GRANT SELECT on "controle_couche" to PUBLIC;
GRANT ALL on "controle_couche" to "rachel";
GRANT ALL on "controle_couche" to "superkadagona";
GRANT SELECT on "controle_couche" to "kadagona";
GRANT ALL on "controle_couche" to "superchoukoutien";
GRANT SELECT on "controle_couche" to "choukoutien";
GRANT SELECT on "controle_couche" to "visiteurchoukoutien";

--
-- TOC Entry ID 623 (OID 7522207)
--
-- Name: enlevement_biface Type: TABLE Owner: rachel
--

CREATE TABLE "enlevement_biface" (
	"bis" text NOT NULL,
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"eb_rang" text NOT NULL,
	"eb_longueur" integer,
	"eb_largeur" integer,
	"eb_obliquite" integer,
	"eb_corde" integer,
	"eb_fleche" integer,
	"eb_tranche" integer,
	Constraint "enlevement_biface_pkey" Primary Key ("zone", "numero", "bis", "eb_rang")
);

--
-- TOC Entry ID 624 (OID 7522207)
--
-- Name: enlevement_biface Type: ACL Owner: 
--

REVOKE ALL on "enlevement_biface" from PUBLIC;
GRANT SELECT on "enlevement_biface" to PUBLIC;
GRANT ALL on "enlevement_biface" to "rachel";
GRANT ALL on "enlevement_biface" to "superkadagona";
GRANT SELECT on "enlevement_biface" to "visiteurkadagona";
GRANT ALL on "enlevement_biface" to "kadagona";
GRANT ALL on "enlevement_biface" to "superchoukoutien";
GRANT ALL on "enlevement_biface" to "choukoutien";
GRANT SELECT on "enlevement_biface" to "visiteurchoukoutien";

\connect - postgres

--
-- TOC Entry ID 625 (OID 7522213)
--
-- Name: controle_c_ordre Type: TABLE Owner: postgres
--

CREATE TABLE "controle_c_ordre" (
	"c_ordre" text NOT NULL,
	"description" text,
	Constraint "controle_c_ordre_pkey" Primary Key ("c_ordre")
);

--
-- TOC Entry ID 626 (OID 7522213)
--
-- Name: controle_c_ordre Type: ACL Owner: 
--

REVOKE ALL on "controle_c_ordre" from PUBLIC;
GRANT SELECT on "controle_c_ordre" to PUBLIC;
GRANT ALL on "controle_c_ordre" to "postgres";
GRANT ALL on "controle_c_ordre" to "superchoukoutien";
GRANT SELECT on "controle_c_ordre" to "choukoutien";
GRANT SELECT on "controle_c_ordre" to "visiteurchoukoutien";

--
-- TOC Entry ID 627 (OID 7522219)
--
-- Name: industrie Type: TABLE Owner: postgres
--

CREATE TABLE "industrie" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"i_oa" integer,
	"i_ob" integer,
	"i_oc" integer,
	"i_poids" integer,
	"i_forme_galet" text,
	"i_matiere" text,
	"i_objet" text,
	"i_etat" text,
	"i_patine" text,
	"i_dpatine" text,
	"i_alteration" text,
	"i_encroutement" text,
	"i_pmycellium" text,
	"i_eolisation" text,
	"i_lustrage" text,
	"i_roulage" text,
	"i_action" text,
	"i_desilicification" text,
	"i_observation" text,
	"i_support" text,
	Constraint "industrie_pkey" Primary Key ("zone", "numero", "bis")
);

--
-- TOC Entry ID 628 (OID 7522219)
--
-- Name: industrie Type: ACL Owner: 
--

REVOKE ALL on "industrie" from PUBLIC;
GRANT SELECT on "industrie" to PUBLIC;
GRANT ALL on "industrie" to "postgres";
GRANT ALL on "industrie" to "superkadagona";
GRANT SELECT on "industrie" to "visiteurkadagona";
GRANT ALL on "industrie" to "kadagona";
GRANT ALL on "industrie" to "superchoukoutien";
GRANT ALL on "industrie" to "choukoutien";
GRANT SELECT on "industrie" to "visiteurchoukoutien";

\connect - rachel

--
-- TOC Entry ID 629 (OID 7543974)
--
-- Name: controle_responsable_fouille Type: TABLE Owner: rachel
--

CREATE TABLE "controle_responsable_fouille" (
	"responsable_fouille" text NOT NULL,
	"description" text,
	Constraint "controle_responsable_fouil_pkey" Primary Key ("responsable_fouille")
);

--
-- TOC Entry ID 630 (OID 7543974)
--
-- Name: controle_responsable_fouille Type: ACL Owner: 
--

REVOKE ALL on "controle_responsable_fouille" from PUBLIC;
GRANT ALL on "controle_responsable_fouille" to "rachel";
GRANT ALL on "controle_responsable_fouille" to "superchoukoutien";
GRANT SELECT on "controle_responsable_fouille" to "choukoutien";
GRANT SELECT on "controle_responsable_fouille" to "visiteurchoukoutien";

--
-- TOC Entry ID 631 (OID 7714450)
--
-- Name: nucleus Type: TABLE Owner: rachel
--

CREATE TABLE "nucleus" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"n_ordre" integer NOT NULL,
	"n_type" text,
	"n_nbplan" integer,
	"n_nba" integer,
	"n_nbb" integer,
	"n_nbp" integer,
	"n_orientation" text,
	"n_dirtotal" integer,
	"n_dirfacea" integer,
	"n_dirfaceb" integer,
	"n_dirprofil" integer,
	"n_formule" text,
	"n_rotation" text,
	"n_cortotal" integer,
	"n_corfacea" integer,
	"n_corfaceb" integer,
	"n_corprofil" integer,
	"n_epuisement" integer,
	Constraint "nucleus_pkey" Primary Key ("zone", "numero", "bis", "n_ordre")
);

--
-- TOC Entry ID 632 (OID 7714450)
--
-- Name: nucleus Type: ACL Owner: 
--

REVOKE ALL on "nucleus" from PUBLIC;
GRANT ALL on "nucleus" to "rachel";
GRANT ALL on "nucleus" to "choukoutien";
GRANT SELECT on "nucleus" to "visiteurchoukoutien";

--
-- TOC Entry ID 633 (OID 7715349)
--
-- Name: enlevement_nucleus Type: TABLE Owner: rachel
--

CREATE TABLE "enlevement_nucleus" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"n_ordre" integer NOT NULL,
	"en_rang" text NOT NULL,
	"en_longueur" integer,
	"en_largeur" integer,
	"en_obliquite" text,
	"en_obliquite_degre" text,
	"en_corde" integer,
	"en_fleche" integer,
	"en_dptimpact" text,
	"en_frappe" text,
	"en_numero" integer,
	"en_inclinaison" text,
	"en_direction" text,
	Constraint "enlevement_nucleus_pkey" Primary Key ("zone", "numero", "bis", "n_ordre", "en_rang")
);

--
-- TOC Entry ID 634 (OID 7715349)
--
-- Name: enlevement_nucleus Type: ACL Owner: 
--

REVOKE ALL on "enlevement_nucleus" from PUBLIC;
GRANT ALL on "enlevement_nucleus" to "rachel";
GRANT ALL on "enlevement_nucleus" to "choukoutien";
GRANT SELECT on "enlevement_nucleus" to "visiteurchoukoutien";

--
-- TOC Entry ID 635 (OID 7834615)
--
-- Name: usure_dent Type: TABLE Owner: rachel
--

CREATE TABLE "usure_dent" (
	"zone" text NOT NULL,
	"numero" integer NOT NULL,
	"bis" text NOT NULL,
	"ud_serie" text NOT NULL,
	"ud_type" text,
	"ud_lateralite" text,
	"ud_usure" text,
	"ud_fragmentation" text,
	Constraint "usure_dent_pkey" Primary Key ("zone", "numero", "bis", "ud_serie")
);

--
-- TOC Entry ID 636 (OID 7834615)
--
-- Name: usure_dent Type: ACL Owner: 
--

REVOKE ALL on "usure_dent" from PUBLIC;
GRANT ALL on "usure_dent" to "rachel";
GRANT ALL on "usure_dent" to "choukoutien";
GRANT SELECT on "usure_dent" to "visiteurchoukoutien";

\connect - postgres

--
-- TOC Entry ID 643 (OID 7522226)
--
-- Name: "RI_ConstraintTrigger_7522225" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "faune"  FROM "carnet" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'faune', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 639 (OID 7522228)
--
-- Name: "RI_ConstraintTrigger_7522227" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "carnet"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'faune', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 640 (OID 7522230)
--
-- Name: "RI_ConstraintTrigger_7522229" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "carnet"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'faune', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 658 (OID 7522238)
--
-- Name: "RI_ConstraintTrigger_7522237" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "fracture_faune"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 644 (OID 7522240)
--
-- Name: "RI_ConstraintTrigger_7522239" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "fracture_faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 645 (OID 7522242)
--
-- Name: "RI_ConstraintTrigger_7522241" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "fracture_faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'fracture_faune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 659 (OID 7522244)
--
-- Name: "RI_ConstraintTrigger_7522243" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "microfaune"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 646 (OID 7522246)
--
-- Name: "RI_ConstraintTrigger_7522245" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "microfaune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 647 (OID 7522248)
--
-- Name: "RI_ConstraintTrigger_7522247" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "microfaune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'microfaune', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 660 (OID 7522250)
--
-- Name: "RI_ConstraintTrigger_7522249" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "dent"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 648 (OID 7522252)
--
-- Name: "RI_ConstraintTrigger_7522251" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "dent" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 649 (OID 7522254)
--
-- Name: "RI_ConstraintTrigger_7522253" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "dent" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 661 (OID 7522256)
--
-- Name: "RI_ConstraintTrigger_7522255" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "os"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 650 (OID 7522258)
--
-- Name: "RI_ConstraintTrigger_7522257" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "os" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 651 (OID 7522260)
--
-- Name: "RI_ConstraintTrigger_7522259" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "os" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'os', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 662 (OID 7522262)
--
-- Name: "RI_ConstraintTrigger_7522261" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "trace"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 652 (OID 7522264)
--
-- Name: "RI_ConstraintTrigger_7522263" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "trace" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 653 (OID 7522266)
--
-- Name: "RI_ConstraintTrigger_7522265" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "trace" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'trace', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 663 (OID 7522268)
--
-- Name: "RI_ConstraintTrigger_7522267" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "coprolithe"  FROM "carnet" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'coprolithe', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 641 (OID 7522270)
--
-- Name: "RI_ConstraintTrigger_7522269" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "carnet"  FROM "coprolithe" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'coprolithe', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 642 (OID 7522272)
--
-- Name: "RI_ConstraintTrigger_7522271" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "carnet"  FROM "coprolithe" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'coprolithe', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 664 (OID 7522274)
--
-- Name: "RI_ConstraintTrigger_7522273" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "photocoprolithe"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'photocoprolithe', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 654 (OID 7522276)
--
-- Name: "RI_ConstraintTrigger_7522275" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "photocoprolithe" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'photocoprolithe', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 655 (OID 7522278)
--
-- Name: "RI_ConstraintTrigger_7522277" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "photocoprolithe" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'photocoprolithe', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 667 (OID 7522280)
--
-- Name: "RI_ConstraintTrigger_7522279" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "bord"  FROM "eclat" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 666 (OID 7522282)
--
-- Name: "RI_ConstraintTrigger_7522281" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "eclat"  FROM "bord" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 665 (OID 7522284)
--
-- Name: "RI_ConstraintTrigger_7522283" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "eclat"  FROM "bord" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'bord', 'eclat', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 670 (OID 7522286)
--
-- Name: "RI_ConstraintTrigger_7522285" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "enlevement_galet"  FROM "galet_amenage" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');

--
-- TOC Entry ID 669 (OID 7522288)
--
-- Name: "RI_ConstraintTrigger_7522287" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "galet_amenage"  FROM "enlevement_galet" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');

--
-- TOC Entry ID 668 (OID 7522290)
--
-- Name: "RI_ConstraintTrigger_7522289" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "galet_amenage"  FROM "enlevement_galet" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'enlevement_galet', 'galet_amenage', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'ga_ordre', 'ga_ordre');

\connect - rachel

--
-- TOC Entry ID 673 (OID 7522298)
--
-- Name: "RI_ConstraintTrigger_7522297" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "enlevement_biface"  FROM "biface" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

\connect - postgres

--
-- TOC Entry ID 672 (OID 7522300)
--
-- Name: "RI_ConstraintTrigger_7522299" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "biface"  FROM "enlevement_biface" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 671 (OID 7522302)
--
-- Name: "RI_ConstraintTrigger_7522301" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "biface"  FROM "enlevement_biface" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'enlevement_biface', 'biface', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 674 (OID 7522304)
--
-- Name: "RI_ConstraintTrigger_7522303" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "industrie"  FROM "carnet" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'industrie', 'carnet', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 675 (OID 7522306)
--
-- Name: "RI_ConstraintTrigger_7522305" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "retouche" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'retouche', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 676 (OID 7522308)
--
-- Name: "RI_ConstraintTrigger_7522307" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "retouche" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'retouche', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 677 (OID 7522310)
--
-- Name: "RI_ConstraintTrigger_7522309" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "fracture_industrie" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'fracture_industrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 678 (OID 7522312)
--
-- Name: "RI_ConstraintTrigger_7522311" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "fracture_industrie" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'fracture_industrie', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 679 (OID 7522314)
--
-- Name: "RI_ConstraintTrigger_7522313" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "stigmate" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'stigmate', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 680 (OID 7522316)
--
-- Name: "RI_ConstraintTrigger_7522315" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "stigmate" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'stigmate', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 681 (OID 7522318)
--
-- Name: "RI_ConstraintTrigger_7522317" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "eclat" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'eclat', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 682 (OID 7522320)
--
-- Name: "RI_ConstraintTrigger_7522319" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "eclat" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'eclat', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 683 (OID 7522322)
--
-- Name: "RI_ConstraintTrigger_7522321" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "outil" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'outil', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 684 (OID 7522324)
--
-- Name: "RI_ConstraintTrigger_7522323" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "outil" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'outil', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 685 (OID 7522326)
--
-- Name: "RI_ConstraintTrigger_7522325" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "galet_amenage" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'galet_amenage', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 686 (OID 7522328)
--
-- Name: "RI_ConstraintTrigger_7522327" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "galet_amenage" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'galet_amenage', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 687 (OID 7522334)
--
-- Name: "RI_ConstraintTrigger_7522333" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "biface" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'biface', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 688 (OID 7522336)
--
-- Name: "RI_ConstraintTrigger_7522335" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "biface" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'biface', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 689 (OID 7522338)
--
-- Name: "RI_ConstraintTrigger_7522337" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "hachereau" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'hachereau', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 690 (OID 7522340)
--
-- Name: "RI_ConstraintTrigger_7522339" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "hachereau" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'hachereau', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

\connect - rachel

--
-- TOC Entry ID 695 (OID 7714461)
--
-- Name: "RI_ConstraintTrigger_7714460" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "nucleus"  FROM "industrie" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

\connect - postgres

--
-- TOC Entry ID 692 (OID 7714464)
--
-- Name: "RI_ConstraintTrigger_7714463" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "industrie"  FROM "nucleus" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 691 (OID 7714466)
--
-- Name: "RI_ConstraintTrigger_7714465" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "industrie"  FROM "nucleus" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'nucleus', 'industrie', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

\connect - rachel

--
-- TOC Entry ID 696 (OID 7715359)
--
-- Name: "RI_ConstraintTrigger_7715358" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "enlevement_nucleus"  FROM "nucleus" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');

--
-- TOC Entry ID 693 (OID 7715361)
--
-- Name: "RI_ConstraintTrigger_7715360" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "nucleus"  FROM "enlevement_nucleus" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');

--
-- TOC Entry ID 694 (OID 7715363)
--
-- Name: "RI_ConstraintTrigger_7715362" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "nucleus"  FROM "enlevement_nucleus" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'enlevement_nucleus', 'nucleus', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis', 'n_ordre', 'n_ordre');

--
-- TOC Entry ID 697 (OID 7834622)
--
-- Name: "RI_ConstraintTrigger_7834621" Type: TRIGGER Owner: rachel
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER INSERT OR UPDATE ON "usure_dent"  FROM "faune" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

\connect - postgres

--
-- TOC Entry ID 657 (OID 7834624)
--
-- Name: "RI_ConstraintTrigger_7834623" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER DELETE ON "faune"  FROM "usure_dent" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del" ('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

--
-- TOC Entry ID 656 (OID 7834626)
--
-- Name: "RI_ConstraintTrigger_7834625" Type: TRIGGER Owner: postgres
--

CREATE CONSTRAINT TRIGGER "<unnamed>" AFTER UPDATE ON "faune"  FROM "usure_dent" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('<unnamed>', 'usure_dent', 'faune', 'UNSPECIFIED', 'zone', 'zone', 'numero', 'numero', 'bis', 'bis');

