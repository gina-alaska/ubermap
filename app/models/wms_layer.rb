class WmsLayer < ActiveRecord::Base
  scope :active, ->{ where(active: true) }
  
  def slug
    "#{layer_type}_#{id}"
  end
  
  def layer_type
    'wms'
  end
  
  def leaflet_params
    {
      name: name,
      slug: slug,
      type: layer_type,
      url: url,
      layers: layers,
      legend: legend,
      options: options.as_json
    }
  end
end
