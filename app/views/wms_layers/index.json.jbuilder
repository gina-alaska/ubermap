json.array!(@wms_layers) do |wms_layer|
  json.extract! wms_layer, :id, :url, :layers, :legend, :active, :options, :description, :name
  json.url wms_layer_url(wms_layer, format: :json)
end
