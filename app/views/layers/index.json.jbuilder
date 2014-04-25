json.array!(@layers) do |layer|
  json.extract! layer, :id, :name, :file_uid, :file_name, :active, :legend, :style, :description
  json.url layer_url(layer, format: :json)
end
