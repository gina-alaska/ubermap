# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $('#map').length > 0
    container = new BasicMapContainer('map')
    # container.enableSlideControl();
    
    $('#map').data('container', container)
    
    setTimeout => 
      hash = new L.Hash(container.map)
    , 100
    
    container.map.on('popupopen', () =>
      $('.leaflet-container a[href=""]').hide()
      $('.leaflet-container img[src=""]').hide()
      $('.leaflet-container img[src=""]').parent('td').hide()
      $('.leaflet-container img[src=""]').parent('a').parent('td').hide()
    )
    
    $('[data-layer]').each((index, item) =>
      layer = MapLayer.fromConfig container.map, $(item).data('layer')
          
      if layer?
        layer.addTo(container.map)
        if $('[data-map="reload"]').length > 0
          $('[data-map="reload"]').data('layer', layer)
    )
