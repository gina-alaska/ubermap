class AddPolymorphicFieldsToMapLayer < ActiveRecord::Migration
  def change
    add_column :map_layers, :layer_type, :string
  end
end
