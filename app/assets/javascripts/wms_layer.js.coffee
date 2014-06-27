class @WMSLayer extends @MapLayer
  constructor: (@map, @config) ->
    @layer = L.tileLayer.wms(@config.url, {
      layers: @config.layers,
      format: 'image/png',
      transparent: true
    })
    super()
    
  option_timeslider: (active) =>
    return unless active == 'yes'
    
    @slider = L.control.sliderControl({
      title: @config.options['slider_title'],
      position: 'topright', 
      layer: @layer, 
      startTime: @config.options['start_time'],
      endTime: @config.options['end_time'],
      timeStep: @config.options['interval'],
      range: false
    })
    @map.addControl(@slider)
    
    @slider.startSlider()

    
