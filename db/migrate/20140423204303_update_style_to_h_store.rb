class UpdateStyleToHStore < ActiveRecord::Migration
  def up
    rename_column :layers, :style, :style_old
    add_column :layers, :style, :hstore

    Layer.all.each do |layer|
      layer.style = layer.style_old
    end
  end

  def down
    remove_column :layers, :style
    rename_column :layers, :style_old, :style
  end
end
