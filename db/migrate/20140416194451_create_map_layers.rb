class CreateMapLayers < ActiveRecord::Migration
  def change
    create_table :map_layers do |t|
      t.integer :map_id
      t.integer :layer_id

      t.timestamps
    end
  end
end
