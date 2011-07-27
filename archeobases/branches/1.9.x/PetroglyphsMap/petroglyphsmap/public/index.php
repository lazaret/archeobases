<?php

session_start ();

?>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>SIG des Merveilles</title>
        <meta http-equiv="content-Type" content="text/html; charset=iso-8859-1" />
        <meta name="content-language" content="fr" />
        <meta name="Author" content="Gabriel Vatin - ENSG">
        <meta name="Copyright" content="Laboratoire D�partemental de Pr�histoire du Lazaret">
        <meta name="Description" content="SIG des roches grav�es de la Vall�e des Merveilles - gestion, visualisation et analyse des donn�es">

        <link rel="stylesheet" type="text/css" href="css/style.css"></link>
        <link rel="stylesheet" type="text/css" href="lib/ext/Ext/resources/css/ext-all.css"></link>
        <link rel="stylesheet" type="text/css" href="lib/ext/Ext/resources/css/xtheme-access.css"></link>
        <link rel="stylesheet" type="text/css" href="lib/openlayers/theme/default/style.css"></link>
        <link rel="stylesheet" type="text/css" href="app/css/main.css"></link>

        <script type="text/javascript" src="lib/ext/Ext/adapter/ext/ext-base.js"></script>        
        
        <script type="text/javascript" src="lib/ext/Ext/ext-all-debug.js"></script>
        <script type="text/javascript" src="lib/openlayers/lib/OpenLayers.js"></script>
        <script type="text/javascript" src="lib/geoext/lib/GeoExt.js"></script>
        <script type="text/javascript" src="lib/mapfish/MapFish.js"></script>
        <script type="text/javascript" src="http://api.ign.fr/geoportail/api?v=1.2-e&amp;key=2163304362720605860&amp;includeEngine=false&amp;"></script>
        <script type="text/javascript" src="http://depot.ign.fr/geoportail/api/js/1.2/GeoportalExtended.js"></script>
        <script type="text/javascript" src="app/lib/App/layout.js"></script>
        <script type="text/javascript" src="app/lib/App/main.js"></script>
        
        <script type="text/javascript">
        // once the window is loaded, create a session cookie for 24h
        window.onload = function(e){
            var expDate = new Date();
            expDate.setTime(expDate.getTime() + (24 * 3600 * 1000));    // time in milliseconds : one whole day
            document.cookie += ";expires=" + expDate.toGMTString();
        };
        
        // while leaving the page, destroy the views and temporary mapfiles
        window.onbeforeunload = function(e){
            Ext.Ajax.request({
                method: 'POST',
                url: 'reinit.php'
            });
        };
        </script>

    </head>

    <body></body>
<html>
