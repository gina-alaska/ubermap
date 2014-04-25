class AddPopupToLayers < ActiveRecord::Migration
  def change
    add_column :layers, :popup, :string
  end
end
