class AlterPopupFieldForText < ActiveRecord::Migration
  def change
    change_column :layers, :popup, :text
  end
end
