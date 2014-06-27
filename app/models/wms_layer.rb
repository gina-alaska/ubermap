class WmsLayer < ActiveRecord::Base
  scope :active, ->{ where(active: true) }
  
  def leaflet_params
    {
      name: name,
      slug: "wms_#{id}",
      type: 'wms',
      url: url,
      layers: layers,
      legend: legend,
      options: options.as_json
    }
  end
end
