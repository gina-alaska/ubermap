json.array!(@geojson_layers) do |geojson_layer|
  json.extract! geojson_layer, :id, :name, :file_uid, :file_name, :active, :legend, :style, :description
  json.url geojson_layer_url(geojson_layer, format: :json)
end
