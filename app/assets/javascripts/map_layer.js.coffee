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

  option_auto_zoom: =>
    if @config.options? and @config.options.auto_zoom == 'yes'
      setTimeout(=>
        @map.fitBounds(@layer.getBounds())
      , 100)  
  
  addTo: (map, zIndex = 100) =>
    map.addLayer(@layer)    
    @layer.setZIndex(zIndex)
    
    if @config.options? and @config.options.baselayer != 'yes'
      @layer.bringToFront()
      
  removeFrom: (map, control) =>
    map.removeLayer(@layer)
    