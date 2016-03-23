class AddSlugToMultimap < ActiveRecord::Migration
  def change
    add_column :multimaps, :slug, :string
    add_index :multimaps, :slug, unique: true
  end
end
