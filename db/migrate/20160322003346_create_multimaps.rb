class CreateMultimaps < ActiveRecord::Migration
  def change
    create_table :multimaps do |t|
      t.string :name
      t.boolean :active, default: true
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
