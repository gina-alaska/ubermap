json.tilejson "2.1.0"
json.title @geojson_layer.name
json.description @geojson_layer.description
json.data [File.join(root_url, @geojson_layer.file.remote_url)]
