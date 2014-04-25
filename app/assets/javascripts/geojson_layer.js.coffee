class @GeoJSONLayer
  fromUrl: (url, @options) =>
    L.mapbox.featureLayer(url)
  fromGeoJSON: (geojson, @options) =>
    L.mapbox.featureLayer(geojson)
