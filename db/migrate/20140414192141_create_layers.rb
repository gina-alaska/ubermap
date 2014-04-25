class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :name
      t.string :file_uid
      t.string :file_name
      t.boolean :active
      t.text :legend
      t.text :style
      t.text :description

      t.timestamps
    end
  end
end
