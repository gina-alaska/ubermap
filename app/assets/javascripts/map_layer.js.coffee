class @MapLayer
  constructor: ->
    @autoZoom()
    
  @fromConfig: (map, config) ->
    switch config.type
      when 'wms'
        layer = new WMSLayer(map, config)
      when 'geojson'
        layer = new GeoJSONLayer(map, config)

  autoZoom: =>
    if @config.options.auto_zoom == 'yes'
      setTimeout(=>
        @map.fitBounds(@layer.getBounds())
      , 100)  
  
  addTo: (map) =>
    @layer.addTo(map)
    @layer.bringToFront()
    
  removeFrom: (map) =>
    map.removeLayer(@layer)