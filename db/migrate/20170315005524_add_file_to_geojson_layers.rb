class AddFileToGeojsonLayers < ActiveRecord::Migration
  def change
    add_column :geojson_layers, :file_id, :string
    add_column :geojson_layers, :file_size, :integer
    add_column :geojson_layers, :file_filename, :string
    add_column :geojson_layers, :file_content_type, :string
  end
end
