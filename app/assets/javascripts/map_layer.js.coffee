class @MapLayer
  constructor: ->
    @handleOptions()
    @setupLoadEvents()

  setupLoadEvents: =>
    @layer.on 'loading', (e) =>
      $("##{@config.slug}").spin('layer')

    @layer.on 'load', (e) =>
      $("##{@config.slug}").spin(false)

  handleOptions: =>
    for option,active of @config.options
      if @["option_#{option}"]?
        @["option_#{option}"](active)

  @fromConfig: (map, config) ->
    switch config.type
      when 'wms'
        layer = new WMSLayer(map, config)
      when 'geojson'
        layer = new GeoJSONLayer(map, config)

  addTo: (map, zIndex = 100) =>
    return if map.hasLayer(@layer)
    map.addLayer(@layer)
    @layer.setZIndex(zIndex)

    if @config.options?
      if @config.options.auto_zoom == 'yes'
        @map.whenReady =>
          bounds = @layer.getBounds()
          if bounds.isValid()
            @map.fitBounds(bounds)
          else
            @layer.on 'ready', =>
              bounds = @layer.getBounds()
              @map.fitBounds(bounds) if bounds.isValid()

      if @config.options.baselayer != 'yes'
        @layer.bringToFront()

  removeFrom: (map, control) =>
    map.removeLayer(@layer)
