/* mock up mapbox tile class for testing */
L = {
  mapbox: {
    tileLayer: function(tilejson) {
      return tilejson;
    }
  }
}

console.log(Gina.Layers.get('TILE.EPSG::3857.BDL'));
console.log(Gina.Layers.get('TILE.EPSG::3857.*'));