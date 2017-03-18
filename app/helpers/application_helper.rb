module ApplicationHelper
  def bootstrap_flash_type(type)
    case type
    when 'notice'
      'success'
    when 'error'
      'danger'
    else
      'info'
    end
  end

  def geojson_leaflet_params(layer)
    {
      name: layer.name,
      slug: "geojson_#{layer.id}",
      type: 'geojson',
      url: attachment_url(layer, :file),
      popup: layer.popup,
      legend: layer.legend,
      style: layer.style.as_json,
      options: layer.options.as_json
    }.to_json
  end

  def leaflet_params(layer)
    if layer.is_a? GeojsonLayer
      geojson_leaflet_params(layer)
    else
      layer.leaflet_params.to_json
    end
  end
end
