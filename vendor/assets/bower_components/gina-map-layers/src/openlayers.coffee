Gina.Layers.return_by_name = false

Gina.Layers.tile_layer = (tilejson) ->
  regexp = /{([sxyz])}/g

  urls = []
  for url in tilejson['tiles']
    urls.push(url.replace(regexp, "\${$1}"))

  opts = {
    wrapDateLine: true,
    sphericalMercator: true,
    visibility: false,
    transitionEffect: 'resize',
    attribution: tilejson['attribution']
  }

  new OpenLayers.Layer.XYZ(tilejson['name'], urls, opts)
