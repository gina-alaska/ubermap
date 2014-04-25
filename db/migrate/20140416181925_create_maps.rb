class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.string :slug
      t.boolean :active

      t.timestamps
    end
  end
end
