# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@viewer_layers = {}

toggleLayersSwitch = (el, state = 'auto') ->
  target = $($(el).data('target'))
  icon = $(el).find('i')

  if state == 'auto'
    state = icon.hasClass('fa-toggle-on')
    updateLayersCheckbox(target, state)

  if state
    icon.switchClass('fa-toggle-on', 'fa-toggle-off')
  else
    icon.switchClass('fa-toggle-off', 'fa-toggle-on')

updateLayersCheckbox = (container, state) ->
  if state
    container.find('input:checked').click()
  else
    container.find('input:not(:checked)').click()

$(document).on 'turbolinks:load', ->
  if $('#map').length > 0
    container = new BasicMapContainer('map')
    # container.enableSlideControl();

    $('#map').data('container', container)

    # setTimeout =>
    #   hash = new L.Hash(container.map)
    # , 100

    container.map.on('popupopen', () =>
      $('.leaflet-container a[href=""]').hide()
      $('.leaflet-container img[src=""]').hide()
      $('.leaflet-container img[src=""]').parent('td').hide()
      $('.leaflet-container img[src=""]').parent('a').parent('td').hide()
    )

    $('[data-layer]').each((index, item) =>
      config = $(item).data('layer')
      layer = MapLayer.fromConfig container.map, config
      if layer?
        container.add(config.slug, layer)

        if !$(item).data('active')
          container.hideLayer(config.slug)
        else
          container.showLayer(config.slug)

        # @viewer_layers[config.slug].addTo(container.map)
        if $('[data-map="reload"]').length > 0
          $('[data-map="reload"]').data('layer', layer)
    )

    $('[data-behavior="adjust-opacity"]').slider({
      max: 100,
      min: 0,
      value: 100,
      stop: (e, slider) ->
        target = $(e.target)
        targetLayer= target.data('target')
        container.adjustOpacity(targetLayer, slider.value / 100)
    })

    $('[data-toggle="layer"]').on 'change', (e) =>
      target = $(e.target)
      slug = target.parents('[data-layer]').data('layer').slug
      if target.is(':checked')
        container.showLayer(slug)
      else
        container.hideLayer(slug)

      enabled = target.parents('.panel-body').find('input:checked').size() > 0
      toggleLayersSwitch(target.parents('.panel').find('[data-behavior="toggle-layers"]'), !enabled)


  $('[data-behavior="switch-icon"]').on 'shown.bs.collapse', ->
    $($(this).data('target')).switchClass('fa-plus-square-o', 'fa-minus-square-o')
  $('[data-behavior="switch-icon"]').on 'hidden.bs.collapse', ->
    $($(this).data('target')).switchClass('fa-minus-square-o', 'fa-plus-square-o')
  $('[data-behavior="toggle-layers"]').on 'click', ->
    target = $($(this).data('target'))
    icon = $(this).find('i')

    toggleLayersSwitch(this)
