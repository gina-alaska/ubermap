class @GeoJSONLayer extends @MapLayer
  constructor: (@map, @config) ->
    @layer = L.mapbox.featureLayer()
    @setStyle()
    @layer.loadURL(@config.url)

    super()

  setStyle: =>
    @layer.on 'ready', () =>
      @layer.eachLayer (l) =>
        if l.setIcon?
          l.setIcon(L.divIcon({
            className: 'custom-marker',
            iconSize: [30, 30],
            iconAnchor: [15, 15],
            html: "<div class=\"custom-marker-wrapper\">
                    <div class=\"icon\" style=\"color: " + (@styleProps('marker-color', l.feature.properties)) + "\">
                      <i class=\"fa fa-fw fa-" + (@styleProps('marker-symbol', l.feature.properties)) + "\"></i>
                    </div>
                    <div class=\"custom-marker-content\">
                      <span class=\"no-wrap\">" + (L.mapbox.template(@styleProps('marker-text', l.feature.properties), l.feature.properties)) + "</span>
                    </div>
                  </div>"
          }));

        if @config.popup? and @config.popup != '' and @config.options.clickable != 'no'
          l.bindPopup(L.mapbox.template(@config.popup, l.feature.properties), {
            maxWidth: 800
          });

  styleProps: (name, attrs) =>
    if attrs[name]? and attrs[name] != ''
      attrs[name]
    else
      @config.style[name]
