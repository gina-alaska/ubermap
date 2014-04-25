class AddFieldsListToLayer < ActiveRecord::Migration
  def change
    add_column :layers, :fields, :text
  end
end
