-- \connect -postgres
CREATE FUNCTION "plpgsql_call_handler" () RETURNS opaque AS '/usr/lib/postgresql/lib/plpgsql.so', 'plpgsql_call_handler' LANGUAGE 'C';
CREATE TRUSTED PROCEDURAL LANGUAGE 'plpgsql' HANDLER "plpgsql_call_handler" LANCOMPILER 'PL/pgSQL';

------------------------------------------------------
--                      ECRAN REQUETE
------------------------------------------------------
CREATE TABLE "requete" (
"nomrequete" text NOT NULL,
"coderequete" text,
Constraint "requete_pkey" Primary Key ("nomrequete")
);
------------------------------------------------------
--                      ECRAN CARNET
------------------------------------------------------
CREATE TABLE "controle_zone" (
"zone" text NOT NULL,
"description" text,
Constraint "controle_zone_pkey" Primary Key ("zone")
);
CREATE TABLE "controle_bis" (
"bis" text NOT NULL,
"description" text,
Constraint "controle_bis_pkey" Primary Key ("bis")
);
CREATE TABLE "controle_locus" (
"locus" text NOT NULL,
"description" text,
Constraint "controle_locus_pkey" Primary Key ("locus")
);
CREATE TABLE "controle_localite" (
"localite" text NOT NULL,
"description" text,
Constraint "controle_localite_pkey" Primary Key ("localite")
);
CREATE TABLE "controle_carre" (
"carre" text NOT NULL,
"description" text,
Constraint "controle_carre_pkey" Primary Key ("carre")
);
CREATE TABLE "controle_souscarre" (
"souscarre" text NOT NULL,
"description" text,
Constraint "controle_souscarre_pkey" Primary Key ("souscarre")
);
CREATE TABLE "controle_ensemble" (
"ensemble" text NOT NULL,
"description" text,
Constraint "controle_ensemble_pkey" Primary Key ("ensemble")
);
CREATE TABLE "controle_niveau" (
"niveau" text NOT NULL,
"description" text,
Constraint "controle_niveau_pkey" Primary Key ("niveau")
);
CREATE TABLE "controle_sol" (
"sol" text NOT NULL,
"description" text,
Constraint "controle_sol_pkey" Primary Key ("sol")
);
CREATE TABLE "controle_nature" (
"nature" text NOT NULL,
"description" text,
Constraint "controle_nature_pkey" Primary Key ("nature")
);
CREATE TABLE "controle_orientation" (
"orientation" text NOT NULL,
"description" text,
Constraint "controle_orientation_pkey" Primary Key ("orientation")
);
CREATE TABLE "controle_pendage" (
"pendage" text NOT NULL,
"description" text,
Constraint "controle_pendage_pkey" Primary Key ("pendage")
);
CREATE TABLE "controle_vers" (
"vers" text NOT NULL,
"description" text,
Constraint "controle_vers_pkey" Primary Key ("vers")
);

CREATE TABLE "controle_responsable_fouille" (
"responsable_fouille text NOT NULL,
"description" text, 
Constraint "controle_reponsable_fouille_pkey" Primary key ("responsable_fouille)
);

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
"responsable_fouille" text,
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
"saisie" date DEFAULT date('now'::text),Primary Key (zone, numero, bis));

------------------------------------------------------
--                      ECRAN FAUNE
------------------------------------------------------
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
"f_affespece" text, PRIMARY KEY (zone, numero, bis), FOREIGN KEY (zone, numero, bis) REFERENCES carnet (zone, numero, bis));

CREATE TABLE "remonte_genre" (
"genre" text NOT NULL,
"famille" text,
"ordre" text,
"classe" text,
Constraint "remonte_genre_pkey" Primary Key ("genre")
);
CREATE TABLE "remonte_famille" (
"famille" text NOT NULL,
"ordre" text,
"classe" text,
Constraint "remonte_famille_pkey" Primary Key ("famille")
);
CREATE TABLE "remonte_ordre" (
"ordre" text NOT NULL,
"classe" text,
Constraint "remonte_ordre_pkey" Primary Key ("ordre")
);
CREATE TABLE "controle_f_classe" (
"f_classe" text NOT NULL,
"description" text,
Constraint "controle_f_classe_pkey" Primary Key ("f_classe")
);
CREATE TABLE "controle_f_ordre" (
"f_ordre" text NOT NULL,
"description" text,
Constraint "controle_f_ordre_pkey" Primary Key ("f_ordre")
);
CREATE TABLE "controle_f_famille" (
"f_famille" text NOT NULL,
"description" text,
Constraint "controle_f_famille_pkey" Primary Key ("f_famille")
);
CREATE TABLE "controle_f_ssfamille" (
"f_ssfamille" text NOT NULL,
"description" text,
Constraint "controle_f_ssfamille_pkey" Primary Key ("f_ssfamille")
);
CREATE TABLE "controle_f_genre" (
"f_genre" text NOT NULL,
"description" text,
Constraint "controle_f_genre_pkey" Primary Key ("f_genre")
);
CREATE TABLE "controle_f_espece" (
"f_espece" text NOT NULL,
"description" text,
Constraint "controle_f_espece_pkey" Primary Key ("f_espece")
);
CREATE TABLE "controle_f_ssespece" (
"f_ssespece" text NOT NULL,
"description" text,
Constraint "controle_f_ssespece_pkey" Primary Key ("f_ssespece")
);
CREATE TABLE "controle_f_typos1" (
"f_typos1" text NOT NULL,
"description" text,
Constraint "controle_f_typos1_pkey" Primary Key ("f_typos1")
);
CREATE TABLE "controle_f_typos2" (
"f_typos2" text NOT NULL,
"description" text,
Constraint "controle_f_typos2_pkey" Primary Key ("f_typos2")
);
CREATE TABLE "controle_f_typos3" (
"f_typos3" text NOT NULL,
"description" text,
Constraint "controle_f_typos3_pkey" Primary Key ("f_typos3")
);
CREATE TABLE "controle_f_typos4" (
"f_typos4" text NOT NULL,
"description" text,
Constraint "controle_f_typos4_pkey" Primary Key ("f_typos4")
);
CREATE TABLE "controle_f_typos5" (
"f_typos5" text NOT NULL,
"description" text,
Constraint "controle_f_typos5_pkey" Primary Key ("f_typos5")
);
CREATE TABLE "controle_f_typos6" (
"f_typos6" text NOT NULL,
"description" text,
Constraint "controle_f_typos6_pkey" Primary Key ("f_typos6")
);
CREATE TABLE "controle_f_lateralite" (
"f_lateralite" text NOT NULL,
"description" text,
Constraint "controle_f_lateralite_pkey" Primary Key ("f_lateralite")
);
CREATE TABLE "controle_f_sexe" (
"f_sexe" text NOT NULL,
"description" text,
Constraint "controle_f_sexe_pkey" Primary Key ("f_sexe")
);
CREATE TABLE "controle_f_agecl" (
"f_agecl" text NOT NULL,
"description" text,
Constraint "controle_f_agecl_pkey" Primary Key ("f_agecl")
);
CREATE TABLE "controle_f_agest" (
"f_agest" text NOT NULL,
"description" text,
Constraint "controle_f_agest_pkey" Primary Key ("f_agest")
);
CREATE TABLE "controle_f_stserie" (
"f_stserie" text NOT NULL,
"description" text,
Constraint "controle_f_stserie_pkey" Primary Key ("f_stserie")
);
CREATE TABLE "controle_f_stdent" (
"f_stdent" text NOT NULL,
"description" text,
Constraint "controle_f_stdent_pkey" Primary Key ("f_stdent")
);
CREATE TABLE "controle_f_taille" (
"f_taille" text NOT NULL,
"description" text,
Constraint "controle_f_taille_pkey" Primary Key ("f_taille")
);
CREATE TABLE "controle_f_association" (
"f_association" text NOT NULL,
"description" text,
Constraint "controle_f_association_pkey" Primary Key ("f_association")
);
CREATE TABLE "controle_f_pathologie" (
"f_pathologie" text NOT NULL,
"description" text,
Constraint "controle_f_pathologie_pkey" Primary Key ("f_pathologie")
);
CREATE TABLE "controle_f_description" (
"f_description" text NOT NULL,
"description" text,
Constraint "controle_f_description_pkey" Primary Key ("f_description")
);
CREATE TABLE "controle_f_fragge" (
"f_fragge" text NOT NULL,
"description" text,
Constraint "controle_f_fragge_pkey" Primary Key ("f_fragge")
);
CREATE TABLE "controle_f_fragde" (
"f_fragde" text NOT NULL,
"description" text,
Constraint "controle_f_fragde_pkey" Primary Key ("f_fragde")
);
CREATE TABLE "controle_f_sauvefrag" (
"f_sauvefrag" text NOT NULL,
"description" text,
Constraint "controle_f_sauvefrag_pkey" Primary Key ("f_sauvefrag")
);
CREATE TABLE "controle_f_couleur" (
"f_couleur" text NOT NULL,
"description" text,
Constraint "controle_f_couleur_pkey" Primary Key ("f_couleur")
);
CREATE TABLE "controle_f_caltype" (
"f_caltype" text NOT NULL,
"description" text,
Constraint "controle_f_caltype_pkey" Primary Key ("f_caltype")
);
CREATE TABLE "controle_f_calcouleur" (
"f_calcouleur" text NOT NULL,
"description" text,
Constraint "controle_f_calcouleur_pkey" Primary Key ("f_calcouleur")
);
CREATE TABLE "controle_f_concretion" (
"f_concretion" text NOT NULL,
"description" text,
Constraint "controle_f_concretion_pkey" Primary Key ("f_concretion")
);
CREATE TABLE "controle_f_oxyde" (
"f_oxyde" text NOT NULL,
"description" text,
Constraint "controle_f_oxyde_pkey" Primary Key ("f_oxyde")
);
CREATE TABLE "controle_f_coraspect" (
"f_coraspect" text NOT NULL,
"description" text,
Constraint "controle_f_coraspect_pkey" Primary Key ("f_coraspect")
);
CREATE TABLE "controle_f_corfissure" (
"f_corfissure" text NOT NULL,
"description" text,
Constraint "controle_f_corfissure_pkey" Primary Key ("f_corfissure")
);
CREATE TABLE "controle_f_fossilisation" (
"f_fossilisation" text NOT NULL,
"description" text,
Constraint "controle_f_fossilisation_pkey" Primary Key ("f_fossilisation")
);
CREATE TABLE "controle_f_tissu" (
"f_tissu" text NOT NULL,
"description" text,
Constraint "controle_f_tissu_pkey" Primary Key ("f_tissu")
);
CREATE TABLE "controle_f_typedos" (
"f_typedos" text NOT NULL,
"description" text,
Constraint "controle_f_typedos_pkey" Primary Key ("f_typedos")
);
CREATE TABLE "controle_f_ilongueur" (
"f_ilongueur" text NOT NULL,
"description" text,
Constraint "controle_f_ilongueur_pkey" Primary Key ("f_ilongueur")
);
CREATE TABLE "controle_f_icirconference" (
"f_icirconference" text NOT NULL,
"description" text,
Constraint "controle_f_icirconference_pkey" Primary Key ("f_icirconference")
);
CREATE TABLE "controle_f_eclat" (
"f_eclat" text NOT NULL,
"description" text,
Constraint "controle_f_eclat_pkey" Primary Key ("f_eclat")
);
CREATE TABLE "controle_f_agent" (
"f_agent" text NOT NULL,
"description" text,
Constraint "controle_f_agent_pkey" Primary Key ("f_agent")
);
CREATE TABLE "controle_f_photo" (
"f_photo" text NOT NULL,
"description" text,
Constraint "controle_f_photo_pkey" Primary Key ("f_photo")
);
CREATE TABLE "controle_f_dessin" (
"f_dessin" text NOT NULL,
"description" text,
Constraint "controle_f_dessin_pkey" Primary Key ("f_dessin")
);
CREATE TABLE "controle_f_traitement" (
"f_traitement" text NOT NULL,
"description" text,
Constraint "controle_f_traitement_pkey" Primary Key ("f_traitement")
);
CREATE TABLE "controle_f_datation" (
"f_datation" text NOT NULL,
"description" text,
Constraint "controle_f_datation_pkey" Primary Key ("f_datation")
);
CREATE TABLE "controle_f_moulage" (
"f_moulage" text NOT NULL,
"description" text,
Constraint "controle_f_moulage_pkey" Primary Key ("f_moulage")
);
CREATE TABLE "controle_f_conservation" (
"f_conservation" text NOT NULL,
"description" text,
Constraint "controle_f_conservation_pkey" Primary Key ("f_conservation")
);
CREATE TABLE "controle_f_restauration" (
"f_restauration" text NOT NULL,
"description" text,
Constraint "controle_f_restauration_pkey" Primary Key ("f_restauration")
);
CREATE TABLE "controle_f_saisie" (
"f_saisie" text NOT NULL,
"description" text,
Constraint "controle_f_saisie_pkey" Primary Key ("f_saisie")
);
CREATE TABLE "controle_f_coprolithe" (
"f_coprolithe" text NOT NULL,
"description" text,
Constraint "controle_f_coprolithe_pkey" Primary Key ("f_coprolithe")
);
CREATE TABLE "controle_f_pelote" (
"f_pelote" text NOT NULL,
"description" text,
Constraint "controle_f_pelote_pkey" Primary Key ("f_pelote")
);
CREATE TABLE "controle_f_complement" (
"f_complement" text NOT NULL,
"description" text,
Constraint "controle_f_complement_pkey" Primary Key ("f_complement")
);
CREATE TABLE "controle_f_responsable" (
"f_responsable" text NOT NULL,
"description" text,
Constraint "controle_f_responsable_pkey" Primary Key ("f_responsable")
);
CREATE TABLE "controle_f_ancien_oss" (
"f_ancien_oss" text NOT NULL,
"description" text
);
CREATE TABLE "controle_f_reference" (
"f_reference" text NOT NULL,
"description" text,
Constraint "controle_f_reference_pkey" Primary Key ("f_reference")
);
CREATE TABLE "controle_f_affgenre" (
"f_affgenre" text NOT NULL,
"description" text,
Constraint "controle_f_affgenre_pkey" Primary Key ("f_affgenre")
);
CREATE TABLE "controle_f_affespece" (
"f_affespece" text NOT NULL,
"description" text,
Constraint "controle_f_affespece_pkey" Primary Key ("f_affespece")
);

------------------------------------------------------
--                      ECRAN USURE DENT
------------------------------------------------------
CREATE TABLE "usure_dent" (
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"ud_serie" integer NOT NULL,
"ud_type" text,
"ud_lateralite" text,
"ud_usure" text,
"fragmentation" text,
Constraint "usure_dent_pkey" Primary Key ("zone", "numero", "bis", "ud_serie"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis));

CREATE TABLE "controle_ud_serie" (
"ud_serie" text NOT NULL,
"description" text,
Constraint "controle_ud_serie_pkey" Primary Key ("ud_serie")
);
CREATE TABLE "controle_ud_type" (
"ud_type" text NOT NULL,
"description" text,
Constraint "controle_ud_type_pkey" Primary Key ("ud_type")
);
CREATE TABLE "controle_ud_lateralite" (
"ud_lateralite" text NOT NULL,
"description" text,
Constraint "controle_ud_lateralite_pkey" Primary Key ("ud_lateralite")
);
CREATE TABLE "controle_ud_usure" (
"ud_usure" text NOT NULL,
"description" text,
Constraint "controle_ud_usure_pkey" Primary Key ("ud_usure")
);
CREATE TABLE "controle_ud_fragmentation" (
"ud_fragmentation" text NOT NULL,
"description" text,
Constraint "controle_ud_fragmentation_pkey" Primary Key ("ud_fragmentation")
);
------------------------------------------------------
--                      ECRAN FRACTURE FAUNE
------------------------------------------------------
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
Constraint "fracture_faune_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
CREATE TABLE "controle_ff_localisation1" (
"ff_localisation1" text NOT NULL,
"description" text,
Constraint "controle_ff_localisation1_pkey" Primary Key ("ff_localisation1")
);
CREATE TABLE "controle_ff_non1" (
"ff_non1" text NOT NULL,
"description" text,
Constraint "controle_ff_non1_pkey" Primary Key ("ff_non1")
);
CREATE TABLE "controle_ff_angle1" (
"ff_angle1" text NOT NULL,
"description" text,
Constraint "controle_ff_angle1_pkey" Primary Key ("ff_angle1")
);
CREATE TABLE "controle_ff_aspect1" (
"ff_aspect1" text NOT NULL,
"description" text,
Constraint "controle_ff_aspect1_pkey" Primary Key ("ff_aspect1")
);
CREATE TABLE "controle_ff_profil1" (
"ff_profil1" text NOT NULL,
"description" text,
Constraint "controle_ff_profil1_pkey" Primary Key ("ff_profil1")
);
CREATE TABLE "controle_ff_morphologie1" (
"ff_morphologie1" text NOT NULL,
"description" text,
Constraint "controle_ff_morphologie1_pkey" Primary Key ("ff_morphologie1")
);
CREATE TABLE "controle_ff_localisation2" (
"ff_localisation2" text NOT NULL,
"description" text,
Constraint "controle_ff_localisation2_pkey" Primary Key ("ff_localisation2")
);
CREATE TABLE "controle_ff_non2" (
"ff_non2" text NOT NULL,
"description" text,
Constraint "controle_ff_non2_pkey" Primary Key ("ff_non2")
);
CREATE TABLE "controle_ff_angle2" (
"ff_angle2" text NOT NULL,
"description" text,
Constraint "controle_ff_angle2_pkey" Primary Key ("ff_angle2")
);
CREATE TABLE "controle_ff_aspect2" (
"ff_aspect2" text NOT NULL,
"description" text,
Constraint "controle_ff_aspect2_pkey" Primary Key ("ff_aspect2")
);
CREATE TABLE "controle_ff_profil2" (
"ff_profil2" text NOT NULL,
"description" text,
Constraint "controle_ff_profil2_pkey" Primary Key ("ff_profil2")
);
CREATE TABLE "controle_ff_morphologie2" (
"ff_morphologie2" text NOT NULL,
"description" text,
Constraint "controle_ff_morphologie2_pkey" Primary Key ("ff_morphologie2")
);
CREATE SEQUENCE "seq_photofaune" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE TABLE "photofaune" (
"idphoto" integer DEFAULT nextval('seq_photofaune'::text) NOT NULL,
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"legende" text,
Constraint "photofaune_pkey" Primary Key ("idphoto")
);
------------------------------------------------------
--                      ECRAN MICROFAUNE
------------------------------------------------------
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
Constraint "microfaune_pkey" Primary Key ("zone", "numero", "bis", "mf_serie", "mf_type"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
CREATE TABLE "controle_mf_serie" (
"mf_serie" text NOT NULL,
"description" text,
Constraint "controle_mf_serie_pkey" Primary Key ("mf_serie")
);
CREATE TABLE "controle_mf_type" (
"mf_type" text NOT NULL,
"description" text,
Constraint "controle_mf_type_pkey" Primary Key ("mf_type")
);
------------------------------------------------------
--                      ECRAN DENT
------------------------------------------------------
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
Constraint "dent_pkey" Primary Key ("zone", "numero", "bis", "d_serie", "d_type"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
CREATE TABLE "controle_d_serie" (
"d_serie" text NOT NULL,
"description" text,
Constraint "controle_d_serie_pkey" Primary Key ("d_serie")
);
CREATE TABLE "controle_d_type" (
"d_type" text NOT NULL,
"description" text,
Constraint "controle_d_type_pkey" Primary Key ("d_type")
);
------------------------------------------------------
--                      ECRAN OS
------------------------------------------------------
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
Constraint "os_pkey" Primary Key ("zone", "numero", "bis", "o_serie"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
CREATE TABLE "controle_o_sserie" (
"o_sserie" text NOT NULL,
"description" text,
Constraint "controle_o_sserie_pkey" Primary Key ("o_sserie")
);
------------------------------------------------------
--                      ECRAN TRACE
------------------------------------------------------
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
Constraint "trace_pkey" Primary Key ("zone", "numero", "bis", "t_ensemble"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
CREATE TABLE "controle_t_ensemble" (
"t_ensemble" text NOT NULL,
"description" text,
Constraint "controle_t_ensemble_pkey" Primary Key ("t_ensemble")
);
CREATE TABLE "controle_t_nature" (
"t_nature" text NOT NULL,
"description" text,
Constraint "controle_t_nature_pkey" Primary Key ("t_nature")
);
CREATE TABLE "controle_t_agent" (
"t_agent" text NOT NULL,
"description" text,
Constraint "controle_t_agent_pkey" Primary Key ("t_agent")
);
CREATE TABLE "controle_t_phenomene" (
"t_phenomene" text NOT NULL,
"description" text,
Constraint "controle_t_phenomene_pkey" Primary Key ("t_phenomene")
);
CREATE TABLE "controle_t_locmusc" (
"t_locmusc" text NOT NULL,
"description" text,
Constraint "controle_t_locmusc_pkey" Primary Key ("t_locmusc")
);
CREATE TABLE "controle_t_classe" (
"t_classe" text NOT NULL,
"description" text,
Constraint "controle_t_classe_pkey" Primary Key ("t_classe")
);
CREATE TABLE "controle_t_largeur" (
"t_largeur" text NOT NULL,
"description" text,
Constraint "controle_t_largeur_pkey" Primary Key ("t_largeur")
);
CREATE TABLE "controle_t_profondeur" (
"t_profondeur" text NOT NULL,
"description" text,
Constraint "controle_t_profondeur_pkey" Primary Key ("t_profondeur")
);
CREATE TABLE "controle_t_dstrie" (
"t_dstrie" text NOT NULL,
"description" text,
Constraint "controle_t_dstrie_pkey" Primary Key ("t_dstrie")
);
CREATE TABLE "controle_t_trace" (
"t_trace" text NOT NULL,
"description" text,
Constraint "controle_t_trace_pkey" Primary Key ("t_trace")
);
CREATE TABLE "controle_t_direction" (
"t_direction" text NOT NULL,
"description" text,
Constraint "controle_t_direction_pkey" Primary Key ("t_direction")
);
CREATE TABLE "controle_t_sens" (
"t_sens" text NOT NULL,
"description" text,
Constraint "controle_t_sens_pkey" Primary Key ("t_sens")
);
CREATE TABLE "controle_t_section" (
"t_section" text NOT NULL,
"description" text,
Constraint "controle_t_section_pkey" Primary Key ("t_section")
);
CREATE TABLE "controle_t_allure" (
"t_allure" text NOT NULL,
"description" text,
Constraint "controle_t_allure_pkey" Primary Key ("t_allure")
);
CREATE TABLE "controle_t_dessin" (
"t_dessin" text NOT NULL,
"description" text,
Constraint "controle_t_dessin_pkey" Primary Key ("t_dessin")
);
CREATE TABLE "controle_t_replique" (
"t_replique" text NOT NULL,
"description" text,
Constraint "controle_t_replique_pkey" Primary Key ("t_replique")
);
CREATE TABLE "controle_t_photo" (
"t_photo" text NOT NULL,
"description" text,
Constraint "controle_t_photo_pkey" Primary Key ("t_photo")
);
CREATE SEQUENCE "seq_phototrace" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE TABLE "phototrace" (
"idphoto" integer DEFAULT nextval('seq_phototrace'::text) NOT NULL,
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"t_ensemble" text NOT NULL,
"legende" text,
Constraint "phototrace_pkey" Primary Key ("idphoto")
);
------------------------------------------------------
--                      ECRAN COPROLITHE
------------------------------------------------------
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
Constraint "coprolithe_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES carnet (zone, numero, bis)
);
CREATE TABLE "controle_c_sediment" (
"c_sediment" text NOT NULL,
"description" text,
Constraint "controle_c_sediment_pkey" Primary Key ("c_sediment")
);
CREATE TABLE "controle_c_couleur" (
"c_couleur" text NOT NULL,
"description" text,
Constraint "controle_c_couleur_pkey" Primary Key ("c_couleur")
);
CREATE TABLE "controle_c_motif" (
"c_motif" text NOT NULL,
"description" text,
Constraint "controle_c_motif_pkey" Primary Key ("c_motif")
);
CREATE TABLE "controle_c_motnat" (
"c_motnat" text NOT NULL,
"description" text,
Constraint "controle_c_motnat_pkey" Primary Key ("c_motnat")
);
CREATE TABLE "controle_c_motcou" (
"c_motcou" text NOT NULL,
"description" text,
Constraint "controle_c_motcou_pkey" Primary Key ("c_motcou")
);
CREATE TABLE "controle_c_vol" (
"c_vol" text NOT NULL,
"description" text,
Constraint "controle_c_vol_pkey" Primary Key ("c_vol")
);
CREATE TABLE "controle_c_volext" (
"c_volext" text NOT NULL,
"description" text,
Constraint "controle_c_volext_pkey" Primary Key ("c_volext")
);
CREATE TABLE "controle_c_retrecissement" (
"c_retrecissement" text NOT NULL,
"description" text,
Constraint "controle_c_retrecissement_pkey" Primary Key ("c_retrecissement")
);
CREATE TABLE "controle_c_extremite" (
"c_extremite" text NOT NULL,
"description" text,
Constraint "controle_c_extremite_pkey" Primary Key ("c_extremite")
);
CREATE TABLE "controle_c_ext1" (
"c_ext1" text NOT NULL,
"description" text,
Constraint "controle_c_ext1_pkey" Primary Key ("c_ext1")
);
CREATE TABLE "controle_c_ext2" (
"c_ext2" text NOT NULL,
"description" text,
Constraint "controle_c_ext2_pkey" Primary Key ("c_ext2")
);
CREATE TABLE "controle_c_alteration" (
"c_alteration" text NOT NULL,
"description" text,
Constraint "controle_c_alteration_pkey" Primary Key ("c_alteration")
);
CREATE TABLE "controle_c_altnat" (
"c_altnat" text NOT NULL,
"description" text,
Constraint "controle_c_altnat_pkey" Primary Key ("c_altnat")
);
CREATE TABLE "controle_c_inclusion" (
"c_inclusion" text NOT NULL,
"description" text,
Constraint "controle_c_inclusion_pkey" Primary Key ("c_inclusion")
);
CREATE TABLE "controle_c_incl1" (
"c_incl1" text NOT NULL,
"description" text,
Constraint "controle_c_incl1_pkey" Primary Key ("c_incl1")
);
CREATE TABLE "controle_c_incl2" (
"c_incl2" text NOT NULL,
"description" text,
Constraint "controle_c_incl2_pkey" Primary Key ("c_incl2")
);
CREATE TABLE "controle_c_incl3" (
"c_incl3" text NOT NULL,
"description" text,
Constraint "controle_c_incl3_pkey" Primary Key ("c_incl3")
);
CREATE TABLE "controle_c_element" (
"c_element" text NOT NULL,
"description" text,
Constraint "controle_c_element_pkey" Primary Key ("c_element")
);
CREATE TABLE "controle_c_granulometrie" (
"c_granulometrie" text NOT NULL,
"description" text,
Constraint "controle_c_granulometrie_pkey" Primary Key ("c_granulometrie")
);
CREATE TABLE "controle_c_liant" (
"c_liant" text NOT NULL,
"description" text,
Constraint "controle_c_liant_pkey" Primary Key ("c_liant")
);
CREATE TABLE "controle_c_consistance" (
"c_consistance" text NOT NULL,
"description" text,
Constraint "controle_c_consistance_pkey" Primary Key ("c_consistance")
);
CREATE TABLE "controle_c_parasito" (
"c_parasito" text NOT NULL,
"description" text,
Constraint "controle_c_parasito_pkey" Primary Key ("c_parasito")
);
CREATE TABLE "controle_c_palyno" (
"c_palyno" text NOT NULL,
"description" text,
Constraint "controle_c_palyno_pkey" Primary Key ("c_palyno")
);
CREATE TABLE "controle_c_lame" (
"c_lame" text NOT NULL,
"description" text,
Constraint "controle_c_lame_pkey" Primary Key ("c_lame")
);
CREATE TABLE "controle_c_autre" (
"c_autre" text NOT NULL,
"description" text,
Constraint "controle_c_autre_pkey" Primary Key ("c_autre")
);
CREATE TABLE "controle_c_mif" (
"c_mif" text NOT NULL,
"description" text,
Constraint "controle_c_mif_pkey" Primary Key ("c_mif")
);
CREATE TABLE "controle_c_famille" (
"c_famille" text NOT NULL,
"description" text,
Constraint "controle_c_famille_pkey" Primary Key ("c_famille")
);
CREATE TABLE "controle_c_genre" (
"c_genre" text NOT NULL,
"description" text,
Constraint "controle_c_genre_pkey" Primary Key ("c_genre")
);
CREATE TABLE "controle_c_macroreste" (
"c_macroreste" text NOT NULL,
"description" text,
Constraint "controle_c_macroreste_pkey" Primary Key ("c_macroreste")
);
CREATE TABLE "controle_c_forme" (
"c_forme" text NOT NULL,
"description" text,
Constraint "controle_c_forme_pkey" Primary Key ("c_forme")
);
CREATE SEQUENCE "seq_photocoprolithe" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE TABLE "photocoprolithe" (
"idphoto" integer DEFAULT nextval('seq_photocoprolithe'::text) NOT NULL,
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"t_ensemble" text NOT NULL,
"legende" text,
Constraint "photocoprolithe_pkey" Primary Key ("idphoto"), FOREIGN KEY (zone, numero, bis) REFERENCES faune (zone, numero, bis)
);
------------------------------------------------------
--                      ECRAN INDUSTRIE
------------------------------------------------------
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
Constraint "industrie_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES carnet (zone, numero, bis)
);
CREATE TABLE "controle_i_forme_galet" (
"i_forme_galet" text NOT NULL,
"description" text,
Constraint "controle_i_forme_galet_pkey" Primary Key ("i_forme_galet")
);
CREATE TABLE "controle_i_matiere" (
"i_matiere" text NOT NULL,
"description" text,
Constraint "controle_i_matiere_pkey" Primary Key ("i_matiere")
);
CREATE TABLE "controle_i_etat" (
"i_etat" text NOT NULL,
"description" text,
Constraint "controle_i_etat_pkey" Primary Key ("i_etat")
);
CREATE TABLE "controle_i_patine" (
"i_patine" text NOT NULL,
"description" text,
Constraint "controle_i_patine_pkey" Primary Key ("i_patine")
);
CREATE TABLE "controle_i_dpatine" (
"i_dpatine" text NOT NULL,
"description" text,
Constraint "controle_i_dpatine_pkey" Primary Key ("i_dpatine")
);
CREATE TABLE "controle_i_alteration" (
"i_alteration" text NOT NULL,
"description" text,
Constraint "controle_i_alteration_pkey" Primary Key ("i_alteration")
);
CREATE TABLE "controle_i_encroutement" (
"i_encroutement" text NOT NULL,
"description" text,
Constraint "controle_i_encroutement_pkey" Primary Key ("i_encroutement")
);
CREATE TABLE "controle_i_pmycellium" (
"i_pmycellium" text NOT NULL,
"description" text,
Constraint "controle_i_pmycellium_pkey" Primary Key ("i_pmycellium")
);
CREATE TABLE "controle_i_eolisation" (
"i_eolisation" text NOT NULL,
"description" text,
Constraint "controle_i_eolisation_pkey" Primary Key ("i_eolisation")
);
CREATE TABLE "controle_i_lustrage" (
"i_lustrage" text NOT NULL,
"description" text,
Constraint "controle_i_lustrage_pkey" Primary Key ("i_lustrage")
);
CREATE TABLE "controle_i_roulage" (
"i_roulage" text NOT NULL,
"description" text,
Constraint "controle_i_roulage_pkey" Primary Key ("i_roulage")
);
CREATE TABLE "controle_i_action" (
"i_action" text NOT NULL,
"description" text,
Constraint "controle_i_action_pkey" Primary Key ("i_action")
);
CREATE TABLE "controle_i_desilicification" (
"i_desilicification" text NOT NULL,
"description" text,
Constraint "controle_i_desilicificatio_pkey" Primary Key ("i_desilicification")
);
CREATE TABLE "controle_i_support" (
"i_support" text NOT NULL,
"description" text,
Constraint "controle_i_support_pkey" Primary Key ("i_support")
);
CREATE TABLE "controle_i_objet" (
"i_objet" text NOT NULL,
"description" text,
Constraint "controle_i_objet_pkey" Primary Key ("i_objet")
);
CREATE SEQUENCE "seq_photoindustrie" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE TABLE "photoindustrie" (
"idphoto" integer DEFAULT nextval('seq_photoindustrie'::text) NOT NULL,
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"legende" text,
Constraint "photoindustrie_pkey" Primary Key ("idphoto")
);

------------------------------------------------------
--                      ECRAN RETOUCHE INDUSTRIE
------------------------------------------------------
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
Constraint "retouche_pkey" Primary Key ("zone", "numero", "bis", "r_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_r_ordre" (
"r_ordre" text NOT NULL,
"description" text,
Constraint "controle_r_ordre_pkey" Primary Key ("r_ordre")
);
CREATE TABLE "controle_r_type" (
"r_type" text NOT NULL,
"description" text,
Constraint "controle_r_type_pkey" Primary Key ("r_type")
);
CREATE TABLE "controle_r_obliquite" (
"r_obliquite" text NOT NULL,
"description" text,
Constraint "controle_r_obliquite_pkey" Primary Key ("r_obliquite")
);
CREATE TABLE "controle_r_denticulation" (
"r_denticulation" text NOT NULL,
"description" text,
Constraint "controle_r_denticulation_pkey" Primary Key ("r_denticulation")
);
CREATE TABLE "controle_r_cas" (
"r_cas" text NOT NULL,
"description" text,
Constraint "controle_r_cas_pkey" Primary Key ("r_cas")
);
CREATE TABLE "controle_r_utilisation" (
"r_utilisation" text NOT NULL,
"description" text,
Constraint "controle_r_utilisation_pkey" Primary Key ("r_utilisation")
);
CREATE TABLE "controle_r_dimension" (
"r_dimension" text NOT NULL,
"description" text,
Constraint "controle_r_dimension_pkey" Primary Key ("r_dimension")
);
CREATE TABLE "controle_r_association" (
"r_association" text NOT NULL,
"description" text,
Constraint "controle_r_association_pkey" Primary Key ("r_association")
);
CREATE TABLE "controle_r_superposition" (
"r_superposition" text NOT NULL,
"description" text,
Constraint "controle_r_superposition_pkey" Primary Key ("r_superposition")
);
CREATE TABLE "controle_r_extremite" (
"r_extremite" text NOT NULL,
"description" text,
Constraint "controle_r_extremite_pkey" Primary Key ("r_extremite")
);
CREATE TABLE "controle_r_bord" (
"r_bord" text NOT NULL,
"description" text,
Constraint "controle_r_bord_pkey" Primary Key ("r_bord")
);
CREATE TABLE "controle_r_frequence" (
"r_frequence" text NOT NULL,
"description" text,
Constraint "controle_r_frequence_pkey" Primary Key ("r_frequence")
);
CREATE TABLE "controle_r_ecrasement" (
"r_ecrasement" text NOT NULL,
"description" text,
Constraint "controle_r_ecrasement_pkey" Primary Key ("r_ecrasement")
);
CREATE TABLE "controle_r_lustrage" (
"r_lustrage" text NOT NULL,
"description" text,
Constraint "controle_r_lustrage_pkey" Primary Key ("r_lustrage")
);
CREATE TABLE "controle_r_strie" (
"r_strie" text NOT NULL,
"description" text,
Constraint "controle_r_strie_pkey" Primary Key ("r_strie")
);
CREATE TABLE "controle_r_origine" (
"r_origine" text NOT NULL,
"description" text,
Constraint "controle_r_origine_pkey" Primary Key ("r_origine")
);
CREATE TABLE "controle_r_destination" (
"r_destination" text NOT NULL,
"description" text,
Constraint "controle_r_destination_pkey" Primary Key ("r_destination")
);
CREATE TABLE "controle_r_sens" (
"r_sens" text NOT NULL,
"description" text,
Constraint "controle_r_sens_pkey" Primary Key ("r_sens")
);
CREATE TABLE "controle_r_tranchant" (
"r_tranchant" text NOT NULL,
"description" text,
Constraint "controle_r_tranchant_pkey" Primary Key ("r_tranchant")
);
------------------------------------------------------
--                      ECRAN FRACTURE INDUSTRIE
------------------------------------------------------
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
Constraint "fracture_industrie_pkey" Primary Key ("zone", "numero", "bis", "fi_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_fi_ordre" (
"fi_ordre" text NOT NULL,
"description" text,
Constraint "controle_fi_ordre_pkey" Primary Key ("fi_ordre")
);
CREATE TABLE "controle_fi_type" (
"fi_type" text NOT NULL,
"description" text,
Constraint "controle_fi_type_pkey" Primary Key ("fi_type")
);
CREATE TABLE "controle_fi_percussion" (
"fi_percussion" text NOT NULL,
"description" text,
Constraint "controle_fi_percussion_pkey" Primary Key ("fi_percussion")
);
CREATE TABLE "controle_fi_mode" (
"fi_mode" text NOT NULL,
"description" text,
Constraint "controle_fi_mode_pkey" Primary Key ("fi_mode")
);
------------------------------------------------------
--                      ECRAN STIGMATE
------------------------------------------------------
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
Constraint "stigmate_pkey" Primary Key ("zone", "numero", "bis", "s_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_s_ordre" (
"s_ordre" text NOT NULL,
"description" text,
Constraint "controle_s_ordre_pkey" Primary Key ("s_ordre")
);
CREATE TABLE "controle_s_type" (
"s_type" text NOT NULL,
"description" text,
Constraint "controle_s_type_pkey" Primary Key ("s_type")
);
CREATE TABLE "controle_s_sous_type" (
"s_sous_type" text NOT NULL,
"description" text,
Constraint "controle_s_sous_type_pkey" Primary Key ("s_sous_type")
);
CREATE TABLE "controle_s_lustrage" (
"s_lustrage" text NOT NULL,
"description" text,
Constraint "controle_s_lustrage_pkey" Primary Key ("s_lustrage")
);
CREATE TABLE "controle_s_polissage" (
"s_polissage" text NOT NULL,
"description" text,
Constraint "controle_s_polissage_pkey" Primary Key ("s_polissage")
);
CREATE TABLE "controle_s_localisation" (
"s_localisation" text NOT NULL,
"description" text,
Constraint "controle_s_localisation_pkey" Primary Key ("s_localisation")
);
CREATE TABLE "controle_s_situation" (
"s_situation" text NOT NULL,
"description" text,
Constraint "controle_s_situation_pkey" Primary Key ("s_situation")
);
CREATE TABLE "controle_s_relation" (
"s_relation" text NOT NULL,
"description" text,
Constraint "controle_s_relation_pkey" Primary Key ("s_relation")
);
------------------------------------------------------
--                      ECRAN ECLAT
------------------------------------------------------
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
Constraint "eclat_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_e_code" (
"e_code" text NOT NULL,
"description" text,
Constraint "controle_e_code_pkey" Primary Key ("e_code")
);
CREATE TABLE "controle_e_debitage" (
"e_debitage" text NOT NULL,
"description" text,
Constraint "controle_e_debitage_pkey" Primary Key ("e_debitage")
);
CREATE TABLE "controle_e_section_long" (
"e_section_long" text NOT NULL,
"description" text,
Constraint "controle_e_section_long_pkey" Primary Key ("e_section_long")
);
CREATE TABLE "controle_e_section_trans" (
"e_section_trans" text NOT NULL,
"description" text,
Constraint "controle_e_section_trans_pkey" Primary Key ("e_section_trans")
);
CREATE TABLE "controle_e_contour" (
"e_contour" text NOT NULL,
"description" text,
Constraint "controle_e_contour_pkey" Primary Key ("e_contour")
);
CREATE TABLE "controle_e_enlevement" (
"e_enlevement" text NOT NULL,
"description" text,
Constraint "controle_e_enlevement_pkey" Primary Key ("e_enlevement")
);
CREATE TABLE "controle_e_bulbe" (
"e_bulbe" text NOT NULL,
"description" text,
Constraint "controle_e_bulbe_pkey" Primary Key ("e_bulbe")
);
CREATE TABLE "controle_e_talon" (
"e_talon" text NOT NULL,
"description" text,
Constraint "controle_e_talon_pkey" Primary Key ("e_talon")
);
CREATE TABLE "controle_e_cone" (
"e_cone" text NOT NULL,
"description" text,
Constraint "controle_e_cone_pkey" Primary Key ("e_cone")
);
CREATE TABLE "controle_e_onde" (
"e_onde" text NOT NULL,
"description" text,
Constraint "controle_e_onde_pkey" Primary Key ("e_onde")
);
CREATE TABLE "controle_e_epi" (
"e_epi" text NOT NULL,
"description" text,
Constraint "controle_e_epi_pkey" Primary Key ("e_epi")
);
CREATE TABLE "controle_e_strie" (
"e_strie" text NOT NULL,
"description" text,
Constraint "controle_e_strie_pkey" Primary Key ("e_strie")
);
CREATE TABLE "controle_e_parasite" (
"e_parasite" text NOT NULL,
"description" text,
Constraint "controle_e_parasite_pkey" Primary Key ("e_parasite")
);
CREATE TABLE "controle_e_secondaire" (
"e_secondaire" text NOT NULL,
"description" text,
Constraint "controle_e_secondaire_pkey" Primary Key ("e_secondaire")
);
CREATE TABLE "controle_e_charniere" (
"e_charniere" text NOT NULL,
"description" text,
Constraint "controle_e_charniere_pkey" Primary Key ("e_charniere")
);
CREATE TABLE "controle_e_carene" (
"e_carene" text NOT NULL,
"description" text,
Constraint "controle_e_carene_pkey" Primary Key ("e_carene")
);
CREATE TABLE "controle_e_type" (
"e_type" text NOT NULL,
"description" text,
Constraint "controle_e_type_pkey" Primary Key ("e_type")
);
------------------------------------------------------
--                      ECRAN BORD
------------------------------------------------------
-- CREATE SEQUENCE "seq_bord" start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

CREATE TABLE "bord" (
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
"b_ordre" integer NOT NULL,
"b_extremite" text,
"b_code" text,
"b_amincissement" text,
"b_localisation" text,
Constraint "bord_pkey" Primary Key ("zone", "numero", "bis", "b_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES eclat (zone, numero, bis)
);

CREATE TABLE "controle_b_extremite" (
"b_extremite" text NOT NULL,
"description" text,
Constraint "controle_b_extremite_pkey" Primary Key ("b_extremite")
);
CREATE TABLE "controle_b_code" (
"b_code" text NOT NULL,
"description" text,
Constraint "controle_b_code_pkey" Primary Key ("b_code")
);
------------------------------------------------------
--                      ECRAN OUTIL
------------------------------------------------------
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
Constraint "outil_pkey" Primary Key ("zone", "numero", "bis", "o_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_o_ordre" (
"o_ordre" text NOT NULL,
"description" text,
Constraint "controle_o_ordre_pkey" Primary Key ("o_ordre")
);
CREATE TABLE "controle_o_code" (
"o_code" text NOT NULL,
"description" text,
Constraint "controle_o_code_pkey" Primary Key ("o_code")
);
CREATE TABLE "controle_o_retouche" (
"o_retouche" text NOT NULL,
"description" text,
Constraint "controle_o_retouche_pkey" Primary Key ("o_retouche")
);
CREATE TABLE "controle_o_orientation" (
"o_orientation" text NOT NULL,
"description" text,
Constraint "controle_o_orientation_pkey" Primary Key ("o_orientation")
);
CREATE TABLE "controle_o_origine" (
"o_origine" text NOT NULL,
"description" text,
Constraint "controle_o_origine_pkey" Primary Key ("o_origine")
);
CREATE TABLE "controle_o_destination" (
"o_destination" text NOT NULL,
"description" text,
Constraint "controle_o_destination_pkey" Primary Key ("o_destination")
);
CREATE TABLE "controle_o_etat" (
"o_etat" text NOT NULL,
"description" text,
Constraint "controle_o_etat_pkey" Primary Key ("o_etat")
);
CREATE TABLE "controle_o_localisation" (
"o_localisation" text NOT NULL,
"description" text,
Constraint "controle_o_localisation_pkey" Primary Key ("o_localisation")
);
CREATE TABLE "controle_o_sens" (
"o_sens" text NOT NULL,
"description" text,
Constraint "controle_o_sens_pkey" Primary Key ("o_sens")
);
CREATE TABLE "controle_o_serie" (
"o_serie" text NOT NULL,
"description" text,
Constraint "controle_o_serie_pkey" Primary Key ("o_serie")
);
CREATE TABLE "controle_o_forme" (
"o_forme" text NOT NULL,
"description" text,
Constraint "controle_o_forme_pkey" Primary Key ("o_forme")
);
CREATE TABLE "controle_o_chronologie" (
"o_chronologie" text NOT NULL,
"description" text,
Constraint "controle_o_chronologie_pkey" Primary Key ("o_chronologie")
);
------------------------------------------------------
--                      ECRAN GALET AMENAGE
------------------------------------------------------
CREATE TABLE "controle_ga_type" (
"ga_type" text NOT NULL,
"description" text,
Constraint "controle_ga_type_pkey" Primary Key ("ga_type")
);
CREATE TABLE "controle_ga_facture" (
"ga_facture" text NOT NULL,
"description" text,
Constraint "controle_ga_facture_pkey" Primary Key ("ga_facture")
);
CREATE TABLE "controle_ga_qualite" (
"ga_qualite" text NOT NULL,
"description" text,
Constraint "controle_ga_qualite_pkey" Primary Key ("ga_qualite")
);
CREATE TABLE "controle_ga_chf" (
"ga_chf" text NOT NULL,
"description" text,
Constraint "controle_ga_chf_pkey" Primary Key ("ga_chf")
);
CREATE TABLE "controle_ga_forme" (
"ga_forme" text NOT NULL,
"description" text,
Constraint "controle_ga_forme_pkey" Primary Key ("ga_forme")
);
CREATE TABLE "controle_ga_arete" (
"ga_arete" text NOT NULL,
"description" text,
Constraint "controle_ga_arete_pkey" Primary Key ("ga_arete")
);
CREATE TABLE "controle_ga_orientation" (
"ga_orientation" text NOT NULL,
"description" text,
Constraint "controle_ga_orientation_pkey" Primary Key ("ga_orientation")
);
CREATE TABLE "controle_ga_retouche" (
"ga_retouche" text NOT NULL,
"description" text,
Constraint "controle_ga_retouche_pkey" Primary Key ("ga_retouche")
);
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
        Constraint "galet_amenage_pkey" Primary Key ("zone", "numero", "bis", "ga_ordre"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
------------------------------------------------------
--                      ECRAN ENLEVEMENT GALET
------------------------------------------------------
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
Constraint "enlevement_galet_pkey" Primary Key ("zone", "numero", "bis", "ga_ordre", "eg_rang"), FOREIGN KEY (zone, numero, bis, ga_ordre) REFERENCES galet_amenage (zone, numero, bis, ga_ordre)
);
CREATE TABLE "controle_eg_element" (
"eg_element" text NOT NULL,
"description" text,
Constraint "controle_eg_element_pkey" Primary Key ("eg_element")
);
CREATE TABLE "controle_eg_longueur_generale" (
"eg_longueur_generale" text NOT NULL,
"description" text,
Constraint "controle_eg_longueur_gener_pkey" Primary Key ("eg_longueur_generale")
);
CREATE TABLE "controle_eg_profil" (
"eg_profil" text NOT NULL,
"description" text,
Constraint "controle_eg_profil_pkey" Primary Key ("eg_profil")
);
CREATE TABLE "controle_eg_profondeur" (
"eg_profondeur" text NOT NULL,
"description" text,
Constraint "controle_eg_profondeur_pkey" Primary Key ("eg_profondeur")
);
CREATE TABLE "controle_ga_obliquite" (
"ga_obliquite" text NOT NULL,
"description" text,
Constraint "controle_eg_obliquite_pkey" Primary Key ("ga_obliquite")
);
CREATE TABLE "controle_eg_extremite" (
"eg_extremite" text NOT NULL,
"description" text,
Constraint "controle_eg_extremite_pkey" Primary Key ("eg_extremite")
);
CREATE TABLE "controle_eg_proeminence" (
"eg_proeminence" text NOT NULL,
"description" text,
Constraint "controle_eg_proeminence_pkey" Primary Key ("eg_proeminence")
);
CREATE TABLE "controle_eg_sens" (
"eg_sens" text NOT NULL,
"description" text,
Constraint "controle_eg_sens_pkey" Primary Key ("eg_sens")
);
CREATE TABLE "controle_eg_situation" (
"eg_situation" text NOT NULL,
"description" text,
Constraint "controle_eg_situation_pkey" Primary Key ("eg_situation")
);
CREATE TABLE "controle_eg_epaisseur" (
"eg_epaisseur" text NOT NULL,
"description" text,
Constraint "controle_eg_epaisseur_pkey" Primary Key ("eg_epaisseur")
);
CREATE TABLE "controle_eg_support" (
"eg_support" text NOT NULL,
"description" text,
Constraint "controle_eg_support_pkey" Primary Key ("eg_support")
);
------------------------------------------------------
--                      ECRAN NUCLEUS
------------------------------------------------------
CREATE TABLE "nucleus" (
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
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
Constraint "nucleus_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_n_type" (
"n_type" text NOT NULL,
"description" text,
Constraint "controle_n_type_pkey" Primary Key ("n_type")
);
CREATE TABLE "controle_n_forme" (
"n_forme" text NOT NULL,
"description" text,
Constraint "controle_n_forme_pkey" Primary Key ("n_forme")
);
CREATE TABLE "controle_n_cortotal" (
"n_cortotal" integer NOT NULL,
"description" text,
Constraint "controle_n_cortotal_pkey" Primary Key ("n_cortotal")
);
CREATE TABLE "controle_n_orientation" (
"n_orientation" text NOT NULL,
"description" text,
Constraint "controle_n_orientation_pkey" Primary Key ("n_orientation")
);
CREATE TABLE "controle_n_epuisement" (
"n_epuisement" text NOT NULL,
"description" text,
Constraint "controle_n_epuisement_pkey" Primary Key ("n_epuisement")
);
------------------------------------------------------
--                      ECRAN ENLEVEMENT-NUCLEUS
------------------------------------------------------
CREATE TABLE "enlevement_nucleus" (
"zone" text NOT NULL,
"numero" integer NOT NULL,
"bis" text NOT NULL,
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
Constraint "enlevement_nucleus_pkey" Primary Key ("zone", "numero", "bis", "en_rang"), FOREIGN KEY (zone, numero, bis) REFERENCES nucleus (zone, numero, bis)
);
CREATE TABLE "controle_en_obliquite" (
"en_obliquite" text NOT NULL,
"description" text,
Constraint "controle_en_obliquite_pkey" Primary Key ("en_obliquite")
);
CREATE TABLE "controle_en_dptimpact" (
"en_dptimpact" text NOT NULL,
"description" text,
Constraint "controle_en_dptimpact_pkey" Primary Key ("en_dptimpact")
);
CREATE TABLE "controle_en_profondeur" (
"en_profondeur" text NOT NULL,
"description" text,
Constraint "controle_en_profondeur_pkey" Primary Key ("en_profondeur")
);
CREATE TABLE "controle_en_frappe" (
"en_frappe" text NOT NULL,
"description" text,
Constraint "controle_en_frappe_pkey" Primary Key ("en_frappe")
);
CREATE TABLE "controle_en_inclinaison" (
"en_inclinaison" text NOT NULL,
"description" text,
Constraint "controle_en_inclinaison_pkey" Primary Key ("en_inclinaison")
);
CREATE TABLE "controle_en_direction" (
"en_direction" text NOT NULL,
"description" text,
Constraint "controle_en_direction_pkey" Primary Key ("en_direction")
);
------------------------------------------------------
--                      ECRAN BIFACE
------------------------------------------------------
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
"b_lar5" integer,
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
"b_bo3" integer,
"b_bo3a" integer,
"b_bo3b" integer,
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
"b_bua" integer,
"b_bg" text,
"b_ntf" text,
"b_bo1" integer,
"b_bo2" integer,
"b_support" text,
Constraint "biface_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_b_support" (
"b_support" text NOT NULL,
"description" text,
Constraint "controle_b_support_pkey" Primary Key ("b_support")
);
CREATE TABLE "controle_b_base" (
"b_base" text NOT NULL,
"description" text,
Constraint "controle_b_base_pkey" Primary Key ("b_base")
);
CREATE TABLE "controle_b_type" (
"b_type" text NOT NULL,
"description" text,
Constraint "controle_b_type_pkey" Primary Key ("b_type")
);
CREATE TABLE "controle_b_surface" (
"b_surface" text NOT NULL,
"description" text,
Constraint "controle_b_surface_pkey" Primary Key ("b_surface")
);
CREATE TABLE "controle_b_enlevement" (
"b_enlevement" text NOT NULL,
"description" text,
Constraint "controle_b_enlevement_pkey" Primary Key ("b_enlevement")
);
CREATE TABLE "controle_b_amenagement_bord" (
"b_amenagement_bord" text NOT NULL,
"description" text,
Constraint "controle_b_amenagement_bor_pkey" Primary Key ("b_amenagement_bord")
);
CREATE TABLE "controle_b_amenagement_distal" (
"b_amenagement_distal" text NOT NULL,
"description" text,
Constraint "controle_b_amenagement_dis_pkey" Primary Key ("b_amenagement_distal")
);
CREATE TABLE "controle_b_distale" (
"b_distale" text NOT NULL,
"description" text,
Constraint "controle_b_distale_pkey" Primary Key ("b_distale")
);
CREATE TABLE "controle_b_biseau" (
"b_biseau" text NOT NULL,
"description" text,
Constraint "controle_b_biseau_pkey" Primary Key ("b_biseau")
);
CREATE TABLE "controle_b_bord" (
"b_bord" text NOT NULL,
"description" text,
Constraint "controle_b_bord_pkey" Primary Key ("b_bord")
);
CREATE TABLE "controle_b_meplat" (
"b_meplat" text NOT NULL,
"description" text,
Constraint "controle_b_meplat_pkey" Primary Key ("b_meplat")
);
CREATE TABLE "controle_b_extension" (
"b_extension" text NOT NULL,
"description" text,
Constraint "controle_b_extension_pkey" Primary Key ("b_extension")
);
CREATE TABLE "controle_b_symetrie" (
"b_symetrie" text NOT NULL,
"description" text,
Constraint "controle_b_symetrie_pkey" Primary Key ("b_symetrie")
);
CREATE TABLE "controle_b_bilaterale" (
"b_bilaterale" text NOT NULL,
"description" text,
Constraint "controle_b_bilaterale_pkey" Primary Key ("b_bilaterale")
);
CREATE TABLE "controle_b_facture" (
"b_facture" text NOT NULL,
"description" text,
Constraint "controle_b_facture_pkey" Primary Key ("b_facture")
);
CREATE TABLE "controle_b_bifaciale" (
"b_bifaciale" text NOT NULL,
"description" text,
Constraint "controle_b_bifaciale_pkey" Primary Key ("b_bifaciale")
);
CREATE TABLE "controle_b_arete" (
"b_arete" text NOT NULL,
"description" text,
Constraint "controle_b_arete_pkey" Primary Key ("b_arete")
);
CREATE TABLE "controle_b_retouche" (
"b_retouche" text NOT NULL,
"description" text,
Constraint "controle_b_retouche_pkey" Primary Key ("b_retouche")
);
CREATE TABLE "controle_b_dat1" (
"b_dat1" text NOT NULL,
"description" text,
Constraint "controle_b_dat1_pkey" Primary Key ("b_dat1")
);
CREATE TABLE "controle_b_dat2" (
"b_dat2" text NOT NULL,
"description" text,
Constraint "controle_b_dat2_pkey" Primary Key ("b_dat2")
);
CREATE TABLE "controle_b_dat" (
"b_dat" text NOT NULL,
"description" text,
Constraint "controle_b_dat_pkey" Primary Key ("b_dat")
);
CREATE TABLE "controle_b_amincissement" (
"b_amincissement" text NOT NULL,
"description" text,
Constraint "controle_b_amincissement_pkey" Primary Key ("b_amincissement")
);
------------------------------------------------------
--                      ENELVEMENT BIFACE
------------------------------------------------------
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
Constraint "enlevement_biface_pkey" Primary Key ("zone", "numero", 
"bis", "eb_rang"), FOREIGN KEY (zone, numero, bis) REFERENCES biface 
(zone, numero, bis) );
------------------------------------------------------
--                      ECRAN HACHEREAU
------------------------------------------------------
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
Constraint "hachereau_pkey" Primary Key ("zone", "numero", "bis"), FOREIGN KEY (zone, numero, bis) REFERENCES industrie (zone, numero, bis)
);
CREATE TABLE "controle_h_base" (
"h_base" text NOT NULL,
"description" text,
Constraint "controle_h_base_pkey" Primary Key ("h_base")
);
CREATE TABLE "controle_h_surface" (
"h_surface" text NOT NULL,
"description" text,
Constraint "controle_h_surface_pkey" Primary Key ("h_surface")
);
CREATE TABLE "controle_h_amenagement_bord" (
"h_amenagement_bord" text NOT NULL,
"description" text,
Constraint "controle_h_amenagement_bor_pkey" Primary Key ("h_amenagement_bord")
);
CREATE TABLE "controle_h_amenagement_distal" (
"amenagement_h_distal" text NOT NULL,
"description" text,
Constraint "controle_h_amenagement_dis_pkey" Primary Key ("amenagement_h_distal")
);
CREATE TABLE "controle_h_distale" (
"h_distale" text NOT NULL,
"description" text,
Constraint "controle_h_distale_pkey" Primary Key ("h_distale")
);
CREATE TABLE "controle_h_biseau" (
"h_biseau" text NOT NULL,
"description" text,
Constraint "controle_h_biseau_pkey" Primary Key ("h_biseau")
);
CREATE TABLE "controle_h_bord" (
"h_bord" text NOT NULL,
"description" text,
Constraint "controle_h_bord_pkey" Primary Key ("h_bord")
);
CREATE TABLE "controle_h_meplat" (
"h_meplat" text NOT NULL,
"description" text,
Constraint "controle_h_meplat_pkey" Primary Key ("h_meplat")
);
CREATE TABLE "controle_h_extension" (
"h_extension" text NOT NULL,
"description" text,
Constraint "controle_h_extension_pkey" Primary Key ("h_extension")
);
CREATE TABLE "controle_h_symetrie" (
"h_symetrie" text NOT NULL,
"description" text,
Constraint "controle_h_symetrie_pkey" Primary Key ("h_symetrie")
);
CREATE TABLE "controle_h_bilaterale" (
"h_bilaterale" text NOT NULL,
"description" text,
Constraint "controle_h_bilaterale_pkey" Primary Key ("h_bilaterale")
);
CREATE TABLE "controle_h_facture" (
"h_facture" text NOT NULL,
"description" text,
Constraint "controle_h_facture_pkey" Primary Key ("h_facture")
);
CREATE TABLE "controle_h_arete" (
"h_arete" text NOT NULL,
"description" text,
Constraint "controle_h_arete_pkey" Primary Key ("h_arete")
);
CREATE TABLE "controle_h_retouche" (
"h_retouche" text NOT NULL,
"description" text,
Constraint "controle_h_retouche_pkey" Primary Key ("h_retouche")
);
CREATE TABLE "controle_h_type" (
"h_type" text NOT NULL,
"description" text,
Constraint "controle_h_type_pkey" Primary Key ("h_type")
);

\disconnect
