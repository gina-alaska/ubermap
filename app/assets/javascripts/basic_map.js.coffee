class @BasicMapContainer
  constructor: (@selector, @default_layer = 'Mapbox Terrain') ->
    L.Icon.Default.imagePath = '/assets/mapbox.js/dist/images';

    @map = L.mapbox.map(@selector, 'gina-alaska.heb1gpfg')
    @defaultZoom()

    baselayers = {}

    baselayers["Mapbox Terrain"] = L.mapbox.tileLayer('gina-alaska.heb1gpfg')

    $.extend(baselayers, Gina.Layers.find('TILE.EPSG::3857.*'))

    @layers_control = L.control.layers(baselayers, [], {
      autoZIndex: true
    }).addTo(@map)

    @map.addLayer(baselayers[@default_layer])

  defaultZoom: =>
    @map.setView([64.20637724320852, -152.841796875], 4)

  addLayer: (layer) =>
    @map.addLayer(layer)
