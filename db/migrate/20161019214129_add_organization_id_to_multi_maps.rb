class AddOrganizationIdToMultiMaps < ActiveRecord::Migration
  def change
    add_reference :multimaps, :organization, index: true, foreign_key: true
  end
end
