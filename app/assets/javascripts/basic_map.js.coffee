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
    
  enableSlideControl: =>
    hurricane = L.tileLayer.wms('http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r-t.cgi', {
        layers: 'nexrad-n0r-wmst',
        transparent: true,
        format: 'image/png',
        time: '2005-08-29T00:00:00' 
    })
    @layers_control.addOverlay(hurricane)
    
    console.log hurricane
    sliderControl = L.control.sliderControl({position: 'topright', layer: hurricane, startTime: '2005-08-29T00:00:00', endTime: '2005-08-30T15:00:00', timeStep: 1000*60*60})
    @map.addControl(sliderControl)
    sliderControl.startSlider()    
    

  defaultZoom: =>
    @map.setView([64.20637724320852, -152.841796875], 4)

  addLayer: (layer) =>
    @map.addLayer(layer)
