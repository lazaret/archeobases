<?php

session_start ();

$map_path = 'C:\\ms4w\\Apache\\htdocs\\';

/*
* Initialize SQL query
*/
ini_set ('max_execution_time', 0); // Aucune limite d'execution
$sessionpg = pg_connect("host=localhost port=5432 dbname=begogeo user=postgres password=postgres"); // Base g�ographique du Bego

/*
* Useful variables
*/
$identitystring = str_replace('*', '%', $_POST['identitystring']); // on r�cup�re le code figure demand� dans le formulaire, en remplacant * par % (pour le SQL)
$zonenb = $_POST['zonecombo'];
$_SESSION['identitystring'] = $identitystring;
$id = $_POST['log'];

$viewname = "rockview".$id; // nom de la vue unique qui va �tre cr��e
$mapname = "tmp/wfs_rockview".$id.".map"; // nom du mapfile unique qui va �tre cr��

$_SESSION['rockview'] = $viewname;

/*
* New temporary Mapfile, specific to the filter
*/
$map = ms_newMapObj($map_path."wfs_rockview.map"); // mapfile WFS de r�f�rence pour cr�er la vue
$map->setMetaData('wfs_onlineresource', 'http://127.0.0.1/cgi-bin/mapserv.exe?map=tmp/wfs_'.$viewname.'.map'); // on modifie le chemin d'acc�s URL
$rocks = $map->getLayerByName("rocks"); // on modifie le layer 'rocks'
$rocks->set('data', 'geo_point FROM ( select r.rock_id, r.rock_number, r.point_x, r.point_y, r.point_z, r.geo_point, r.year, g.group_number, z.zone_number from '.$viewname.' r join ("group" g join zone z on g.zone_id=z.zone_id) on r.group_id = g.group_id ) as subquery using unique rock_id using srid=2154');
// on ne change que le nom de la table (vue) o� vont �tre stock�es les donn�es de la requ�te
$map->save($mapname); // sauvagarde dans le dossier /tmp

/*
* Postgres view
*/
$query0 = "CREATE OR REPLACE VIEW ".$viewname.' AS
    SELECT rock.rock_id, rock.rock_number, rock.group_id, rock.point_x, rock.point_y, rock.point_z, rock.year, rock.geo_point
    ';

if (($identitystring != '') && is_numeric($zonenb)) {
    $query1 = 'FROM zone, "group", rock, figure
        WHERE UPPER(figure.identity) LIKE '."UPPER('".$identitystring."')
        AND figure.rock_id = rock.rock_id".'
        AND rock.group_id = "group".group_id
        AND "group".zone_id = zone.zone_id
        AND zone.zone_number = '.$zonenb;
} elseif ($identitystring != '') {
    $query1 = 'FROM rock, figure
        WHERE UPPER(figure.identity) LIKE '."UPPER('".$identitystring."')
        AND figure.rock_id = rock.rock_id" ;
} elseif (is_numeric($zonenb)) {
    $query1 = 'FROM zone, "group", rock
        WHERE rock.group_id = "group".group_id
        AND "group".zone_id = zone.zone_id
        AND zone.zone_number = '.$zonenb;
} else {
    $data = array ("success"=>false);
    echo json_encode($data);
    exit;
}

$query_view = $query0.$query1."
    GROUP BY rock.rock_id, rock.rock_number, rock.group_id, rock.point_x, rock.point_y, rock.point_z, rock.year, rock.geo_point";
pg_query($sessionpg, $query_view);

/*
* JSON response
*/
$data = array ("success"=>true, "mapfile"=>$mapname, "viewname"=>$viewname);
echo json_encode($data);

?>