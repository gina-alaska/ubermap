json.array!(@maps) do |map|
  json.extract! map, :id, :title, :slug, :active
  json.url map_url(map, format: :json)
end
