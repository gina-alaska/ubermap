class @BasicMapContainer
  constructor: (@selector, @default_layer = 'Mapbox Terrain') ->
    L.Icon.Default.imagePath = '/assets/mapbox.js/dist/images';

    @map = L.mapbox.map(@selector, 'gina-alaska.heb1gpfg')

    @defaultZoom()
    @layers = {}
    @layers_zindex = {}
    baselayers = {}

    # @layers_control = L.control.layers(baselayers, [], {
    #   autoZIndex: true
    # }).addTo(@map)

    L.control.scale({ position: 'bottomleft' }).addTo(@map)

    @map.on 'overlayadd', (e) ->
      e.layer.bringToFront()

    @zIndex = 100

  defaultZoom: =>
    @map.setView([64.20637724320852, -152.841796875], 4)

  addLayer: (layer) =>
    @map.addLayer(layer)

  add: (name, layer) =>
    @layers[name] = layer
    @layers_zindex[name] ||= @zIndex
    @zIndex += 1
    @layers[name].addTo(@map, @layers_zindex[name])

  remove: (name) =>
    @layers[name].removeFrom(@map)

  showLayer:(name) =>
    @layers[name].addTo(@map, @layers_zindex[name])

  hideLayer:(name) =>
    @layers[name].removeFrom(@map)

  adjustOpacity: (name, opacity) =>
    @layers[name].layer.setOpacity(opacity)
