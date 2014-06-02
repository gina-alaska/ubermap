class CreateWmsLayers < ActiveRecord::Migration
  def change
    create_table :wms_layers do |t|
      t.string :url
      t.string :layers
      t.text :legend
      t.boolean :active, default: true
      t.hstore :options
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
