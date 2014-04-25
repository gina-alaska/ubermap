Gina.Layers.tile_layer = (tilejson) ->
  L.tileLayer(tilejson['tiles'][0], {
    tilejson
  });