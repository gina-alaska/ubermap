class CreateMultimapMaps < ActiveRecord::Migration
  def change
    create_table :multimap_maps do |t|
      t.references :multimap, index: true, foreign_key: true
      t.references :map, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
