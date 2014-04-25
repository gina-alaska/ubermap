json.tilejson "2.1.0"
json.title @layer.name
json.description @layer.description
json.data [File.join(root_url, @layer.file.remote_url)]
