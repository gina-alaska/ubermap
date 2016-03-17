module GeojsonLayersHelper
  def marker_css(style)
    name = style['marker-symbol']
    type = style['marker-symbol-type'] || 'fa'

    "#{type} #{type}-fw #{type}-#{name}"
  end
end
