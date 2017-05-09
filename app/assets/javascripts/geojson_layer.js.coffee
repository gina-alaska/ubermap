class @GeoJSONLayer extends @MapLayer
  constructor: (@map, @config) ->
    @layer = L.mapbox.featureLayer()
    @setStyle()

    @layer.loadURL(@config.url)

    if @config.popup? and @config.popup != ''
      @config.popup_template = Handlebars.compile(@config.popup)

    @intlData = {
      "intl": {
        "formats": {
          "number": {
              "USD": {
                  "style": "currency",
                  "currency": "USD"
              }
          }
        }
      }
    }

    super()

  marker_css: (type, name) ->
    type ||= 'fa'
    "#{type} #{type}-#{name}"

  setStyle: =>
    @layer.on 'ready', () =>
      @layer.eachLayer (l) =>
        if @config.arrows? || true
          decorator = L.polylineDecorator(l, {
            patterns: [
                {offset: 0, repeat: 100, symbol: L.Symbol.arrowHead({pixelSize: 15, polygon: false, pathOptions: {stroke: true}})}
            ]
          })
          @layer.addLayer(decorator)

        if l.setIcon?
          icon_type = @styleProps('marker-symbol-type', l.feature.properties)
          icon_name = @styleProps('marker-symbol', l.feature.properties)
          marker_css = @marker_css(icon_type, icon_name)

          l.setIcon(L.divIcon({
            className: 'custom-marker',
            iconSize: [30, 30],
            iconAnchor: [15, 15],
            html: "<div class=\"custom-marker-wrapper\">
                    <div class=\"icon\" style=\"color: " + (@styleProps('marker-color', l.feature.properties)) + "\">
                      <i class=\"#{marker_css}\"></i>
                    </div>
                    <div class=\"custom-marker-content\">
                      <span class=\"no-wrap\">" + (L.mapbox.template(@styleProps('marker-text', l.feature.properties), l.feature.properties)) + "</span>
                    </div>
                  </div>"
          }));

        if @config.popup_template? and @config.options.clickable != 'no'
          l.bindPopup(@config.popup_template(l.feature.properties, { data: @intlData }), {
            maxWidth: 800
          });

  styleProps: (name, attrs) =>
    if attrs[name]? and attrs[name] != ''
      attrs[name]
    else
      @config.style[name]
