class AddOrganizationIdToMap < ActiveRecord::Migration
  def change
    add_reference :maps, :organization, index: true, foreign_key: true
  end
end
