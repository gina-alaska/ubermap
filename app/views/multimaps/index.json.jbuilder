json.array!(@multimaps) do |multimap|
  json.extract! multimap, :id, :name, :active, :description, :user_id
  json.url multimap_url(multimap, format: :json)
end
