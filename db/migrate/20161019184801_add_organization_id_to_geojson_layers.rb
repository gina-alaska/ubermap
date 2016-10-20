class AddOrganizationIdToGeojsonLayers < ActiveRecord::Migration
  def change
    add_reference :geojson_layers, :organization, index: true, foreign_key: true
  end
end
