class @WMSLayer extends @MapLayer
  constructor: (@config) ->
    @layer = L.tileLayer.wms(@config.url, {
      layers: @config.layers,
      format: 'image/png',
      transparent: true
    })
