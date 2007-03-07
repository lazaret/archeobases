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
        "b_annee" int,
        "b_mois" text,
        "b_nombre_volume" int,
        "b_serie" text,
        "b_fascicule" int,
        "b_tome" int,
        "b_numero" int,
        "b_volume" int,
        "b_langue_document" text,
        "b_langue_resume" text,
        "b_etablissement" text,
        "b_description" text,
        "b_isbn" text,
        "b_issn" text,
        "b_resume" text,
        "b_mots_clefs" text,
        "b_nombre_ex_supp" int,
        "b_url" text,
        "b_modif_biblio" date,
        PRIMARY KEY ("identifiant")
);

REVOKE ALL on "biblio" from PUBLIC;
GRANT ALL on "biblio" to "rachel";
GRANT ALL on "biblio" to "collection";
GRANT ALL on "biblio" to "supercollection";
GRANT SELECT on "biblio" to "visiteurcollection";

CREATE TABLE "controle_b_type_biblio" (
        "b_type_biblio" text NOT NULL,
        "description" text,
        Constraint "controle_b_type_biblio_pkey" Primary Key ("b_type_biblio")
);

REVOKE ALL on "controle_b_type_biblio" from PUBLIC;
GRANT ALL on "controle_b_type_biblio" to "rachel";
GRANT SELECT on "controle_b_type_biblio" to "collection";
GRANT ALL on "controle_b_type_biblio" to "supercollection";
GRANT SELECT on "controle_b_type_biblio" to "visiteurcollection";

CREATE TABLE "controle_b_langue_document" (
        "b_langue_document" text NOT NULL,
        "description" text,
        Constraint "controle_b_langue_document_pkey" Primary Key ("b_langue_document")
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

