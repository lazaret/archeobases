--
-- Selected TOC Entries:
--
\connect - rachel

--
-- TOC Entry ID 4 (OID 77256)
--
-- Name: "plpgsql_call_handler" () Type: FUNCTION Owner: postgres
--

CREATE FUNCTION "plpgsql_call_handler" () RETURNS opaque AS '/usr/lib/postgresql/lib/plpgsql.so', 'plpgsql_call_handler' LANGUAGE 'C';

--
-- TOC Entry ID 5 (OID 77257)
--
-- Name: plpgsql Type: PROCEDURAL LANGUAGE Owner: 
--

CREATE TRUSTED PROCEDURAL LANGUAGE 'plpgsql' HANDLER "plpgsql_call_handler" LANCOMPILER 'PL/pgSQL';

\connect - rachel

--
-- TOC Entry ID 2 (OID 8094298)
--
-- Name: collection Type: TABLE Owner: rachel
--

CREATE TABLE "collection" (
        "identifiant" text NOT NULL,
        "type_objet" text,
        Constraint "collection_pkey" Primary Key ("identifiant")
);

--
-- TOC Entry ID 3 (OID 8094304)
--
-- Name: biblio Type: TABLE Owner: rachel
--

CREATE TABLE "biblio" (
        "identifiant" text NOT NULL,
        "type_biblio" text,
        "sous_type" text,
        "indice" text,
        "nom" text,
        "titre" text,
        "auteur" text,
        "editeur" text,
        "annee" text,
        "ville_edition" text,
        "periode" text,
        "nombre_volume" text,
        "pages" text,
        "url" text,
        "langue_biblio" text,
        "langues_resume" text,
        "institution" text,
        "nombre_exemplaires" text,
        "resume" text,
        "mots_clefs" text,
        "redacteur" text,
        "ecole" text,
        "journal" text,
        "serie" text,
        "mois" text,
        Constraint "biblio_pkey" Primary Key ("identifiant")
);

