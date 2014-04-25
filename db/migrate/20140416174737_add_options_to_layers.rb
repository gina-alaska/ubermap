class AddOptionsToLayers < ActiveRecord::Migration
  def change
    add_column :layers, :options, :text
  end
end
