GINA Map Layers JS Library - V2
==================================

*NOTE* This is a complete rewrite and not all features from 1.x are currently supported.  The main feature that is missing is support for projections other than web mercator.  This is still pending and in the mean time you can use the old version of the library from here https://github.com/gina-alaska/gina-map-layers/tree/1.x

This project is a library used to find and add map layer into web maps.

Examples can be found at http://gina-alaska.github.io/gina-map-layers

Supported Web Map APIs
----------------------

* OpenLayers 2.11+
* Google Maps JS API v3
* Leaflet 0.6+
* Mapbox 1.6+

Downloading the library
-----------------------

Using bower:

    bower install https://github.com/gina-alaska/gina-map-layers.git
    
Download zip:

    https://github.com/gina-alaska/gina-map-layers/releases/tag/2.0.0
    
Clone from github

    git clone https://github.com/gina-alaska/gina-map-layers.git

Include the adapter for your map library
-------------------

The adapter file includes the base library and layer definitions for the specified map api.

  Leaflet

    <script src="gina-map-layers/dist/leaflet-adapter.js" type="text/javascript"></script>
    <!-- or include minified version -->
    <script src="gina-map-layers/dist/leaflet-adapter.min.js" type="text/javascript"></script>   

  Mapbox

    <script src="gina-map-layers/dist/mapbox-adapter.js" type="text/javascript"></script>   
    <!-- or include minified version -->
    <script src="gina-map-layers/dist/mapbox-adapter.min.js" type="text/javascript"></script>   

  OpenLayers: 

    <script src="gina-map-layers/dist/openlayers-adapter.js" type="text/javascript"></script>
    <!-- or include minified version -->
    <script src="gina-map-layers/dist/openlayers-adapter.min.js" type="text/javascript"></script>

  Google Maps: 

    <script src="gina-map-layers/dist/google-adapter.js" type="text/javascript"></script>
    <!-- or include minified version -->
    <script src="gina-map-layers/dist/google-adapter.min.js" type="text/javascript"></script>
  
Adding layers into your map object
--------------------------------------

To get an instances of a map layers use the <code>Gina.Layers.get</code> methods
  
    var bdl = Gina.Layers.get('TILE.EPSG:3857.BDL');

Limited wildcard support is available, include all tiles for the spherical mercator projection
  
    var layers = Gina.Layers.find('TILE.EPSG:3857.*');
    
Leaflet Example:
  
    <script type="text/javascript" charset="utf-8">
        var map = L.map('map').setView([64.8595627003585, -147.84934364372472], 4)
        map.addLayer(Gina.Layers.get('TILE.EPSG:3857.BDL'));
    </script>

OpenLayers Example:

    <script type="text/javascript" charset="utf-8">
      var map;
      function initialize() {
        map = new OpenLayers.Map("map");

        /* Inject all spherical mercator tile layers into the map */
        var bdl = Gina.Layers.get(map, 'TILE.EPSG:3857.BDL');
        map.addLayer(bdl);
        
        map.addControl(new OpenLayers.Control.LayerSwitcher());
        map.zoomToMaxExtent();        
      }
    </script>
    
Getting a layer definition
----------------------

  It is possible to get the tilejson definition for  for a specific layer calling the Gina.Definitions.get method,
    
  Example getting a reference to the BDL layer:
  
    // Fetch the BDL tile layer definiition
    var bdl = Gina.Definitions.get('TILE.EPSG:3857.BDL');
    
  To find multiple layer definitions you can also use the find method
  
    // Find all the layer definitions for EPSG:3857 (Spherical Mercator)
    var layers =  Gina.Definitions.find('TILE.EPSG:3857.*');

Available Tile Layers
---------------------

  Projection EPSG:3857 - Spherical Mercator (Google, Bing, OpenLayers)

    Layer ID                          Name
    ------------------------------    ---------------------------------
    TILE.EPSG:3857.BDL                GINA Best Data Layer
    TILE.EPSG:3857.TOPO               USGS Topographic DRG
    TILE.EPSG:3857.CHARTS             NOAA Nautical Charts DRG
    TILE.EPSG:3857.SHADED_RELIEF      GINA Shaded Relief (NED)
    TILE.EPSG:3857.LANDSAT_PAN        Panchromatic Landsat
    TILE.EPSG:3857.ORTHO_RGB          Alaska Ortho Project Natural Color (Overlay)
    TILE.EPSG:3857.ORTHO_CIR          Alaska Ortho Project Color Infrared (Overlay)
    TILE.EPSG:3857.ORTHO_GS           Alaska Ortho Project Grayscale (Overlay)
<!-- TILE.EPSG:3857.OWM_CLOUDS         OpenWeatherMap Clouds
TILE.EPSG:3857.OWM_PRECIP         OpenWeatherMap Precipitation
TILE.EPSG:3857.OWM_SNOW           OpenWeatherMap Snow
TILE.EPSG:3857.OWM_TEMP           OpenWeatherMap Temperature
TILE.EPSG:3857.OWM_WIND           OpenWeatherMap Wind Speed
TILE.EPSG:3857.OWM_PRESSURE       OpenWeatherMap Pressure
TILE.EPSG:3857.OWM_PRESSURE_CNTR  OpenWeatherMap Pressure Contours -->
    
<!-- Projection EPSG:3338 - Alaskan Albers (OpenLayers)

  Layer ID                        Name
  ------------------------------  ---------------------------------
  TILE.EPSG:3338.BDL              GINA Best Data Layer
  TILE.EPSG:3338.TOPO             USGS Topographic DRG
  TILE.EPSG:3338.SHADED_RELIEF    GINA Shaded Relief (NED)
  TILE.EPSG:3338.OSM              OpenStreetMaps Base Layer
  TILE.EPSG:3338.OSM_OVERLAY      OpenStreetMaps Roads & Cities (Overlay)
  TILE.EPSG:3338.ORTHO_RGB        Alaska Ortho Project Natural Color (Overlay)
  TILE.EPSG:3338.ORTHO_CIR        Alaska Ortho Project Color Infrared (Overlay)
  TILE.EPSG:3338.ORTHO_GS         Alaska Ortho Project Grayscale (Overlay)
  
Projection EPSG:3572 - Alaskan Centric Polar Projection (OpenLayers)

  Layer ID                        Name
  ------------------------------  ---------------------------------
  TILE.EPSG:3572.BDL              GINA Best Data Layer
  TILE.EPSG:3572.OSM              OpenStreetMaps Base Layer
  TILE.EPSG:3572.OSM_OVERLAY      OpenStreetMaps Roads & Cities (Overlay) -->

Attribution
-----------

OpenWeatherMap layers come from http://www.openweathermap.org, if you make use of OWM layers please visit their site for support and
information regarding usage terms.


License
-------

See LICENSE file for licensing and credits.  Think BSD/MIT.
