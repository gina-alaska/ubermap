class AddActiveFlagToMultimapMaps < ActiveRecord::Migration
  def change
    add_column :multimap_maps, :active, :boolean, default: true
  end
end
