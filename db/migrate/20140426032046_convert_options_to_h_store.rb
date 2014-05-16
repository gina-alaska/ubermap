class ConvertOptionsToHStore < ActiveRecord::Migration
  def up
    rename_column :layers, :options, :options_old
    add_column :layers, :options, :hstore
  end

  def down
    remove_column :layers, :options
    rename_column :layers, :options_old, :style
  end
end
