class WmsLayer < ActiveRecord::Base
  
  def leaflet_params
    {
      type: 'wms',
      url: url,
      layers: layers,
      legend: legend,
      options: options.as_json
    }
  end
end
