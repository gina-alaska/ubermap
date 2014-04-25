// Generated by CoffeeScript 1.7.1
(function() {
  Gina.Layers.return_by_name = false;

  Gina.Layers.tile_layer = function(tilejson) {
    var params, regexp;
    regexp = /{([sxyz])}/g;
    params = tilejson;
    params.getTileUrl = function(coord, zoom) {
      var tiles, url, x, y;
      x = coord.x;
      y = coord.y;
      tiles = 1 << zoom;
      x = x % tiles;
      if (x < 0) {
        x += tiles;
      }
      url = tilejson['tiles'][0];
      url = url.replace('{x}', x);
      url = url.replace('{y}', y);
      url = url.replace('{z}', zoom);
      return url + '.png';
    };
    params.alt = params.name;
    params.minZoom = tilejson['minzoom'];
    params.maxZoom = tilejson['maxzoom'];
    params.tileSize = new google.maps.Size(256, 256);
    params.isPng = true;
    return new google.maps.ImageMapType(params);
  };

}).call(this);
