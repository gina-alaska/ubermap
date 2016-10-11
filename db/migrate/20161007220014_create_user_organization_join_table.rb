class CreateUserOrganizationJoinTable < ActiveRecord::Migration
  def change
    create_join_table :organizations, :users do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
