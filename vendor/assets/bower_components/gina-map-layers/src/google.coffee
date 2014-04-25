Gina.Layers.return_by_name = false

Gina.Layers.tile_layer = (tilejson) ->
  regexp = /{([sxyz])}/g

  params = tilejson
  
  params.getTileUrl = (coord, zoom) ->    
    x = coord.x
    y = coord.y
    
    tiles = 1 << zoom
    x = (x % tiles)
    
    if x < 0
      x += tiles
    
    url = tilejson['tiles'][0]
    url = url.replace('{x}', x)
    url = url.replace('{y}', y)
    url = url.replace('{z}', zoom)
    
    url + '.png'
  
  params.alt = params.name;
  params.minZoom = tilejson['minzoom'];
  params.maxZoom = tilejson['maxzoom'];
  params.tileSize = new google.maps.Size(256,256);
  params.isPng = true;
  
  return new google.maps.ImageMapType(params);