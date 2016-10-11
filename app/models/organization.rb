class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :organization_users
  has_many :users, through: :organization_users

  has_many :maps
  has_many :multimaps
  has_many :geojson_layers
  has_many :wms_layers

  validates :slug, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
