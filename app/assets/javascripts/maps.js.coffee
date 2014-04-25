# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $('#map').length > 0
    container = new BasicMapContainer('map');
    hash = new L.Hash(container.map);

    $('.layer-definition[data-url]').each((index, item) =>
      popup_template = $(item).data('popup')
      style = $(item).data('style')
      options = $(item).data('options')

      geojson = new GeoJSONLayer()
      layer = geojson.fromUrl($(item).data('url'), style)
      layer.setStyle(style)

      layer.on 'ready', () =>
        layer.eachLayer (l) =>
          for key,val of style
            l.feature.properties[key] = val if !l.feature.properties[key]? or !l.feature.properties[key]

          if l.setIcon?
            l.setIcon(L.mapbox.marker.icon(l.feature.properties))

          if options.clickable != false
            l.bindPopup(
              L.mapbox.template(popup_template, l.feature.properties),
              { maxWidth: 500 }
            )


        if options.zoomTo
          setTimeout(=>
            container.map.fitBounds(layer.getBounds())
          , 100)


      layer.addTo(container.map)
    )
