class AddOrganizationIdToWmsLayers < ActiveRecord::Migration
  def change
    add_reference :wms_layers, :organization, index: true, foreign_key: true
  end
end
