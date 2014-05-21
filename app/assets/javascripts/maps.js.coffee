# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $('#map').length > 0
    container = new BasicMapContainer('map')
    $('#map').data('container', container)
    
    setTimeout => 
      hash = new L.Hash(container.map)
    , 100
    
    container.map.on('popupopen', () =>
      $('a[href=""]').hide()
      $('img[src=""]').hide()
      $('img[src=""]').parent('td').hide()
      $('img[src=""]').parent('a').parent('td').hide()
    )
    
    $('#map').data('container', container)

    $('[data-layer]').each((index, item) =>
      layer_config = $(item).data('layer')
      geojson = new GeoJSONLayer(layer_config)
      geojson.layer.addTo(container.map)
      
      if $('[data-map="reload"]').length > 0
        $('[data-map="reload"]').data('layer', geojson.layer)
    )
