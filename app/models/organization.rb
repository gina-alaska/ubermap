class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :organizations_users
  has_many :users, through: :organizations_users, dependent: :destroy

  has_many :maps, dependent: :destroy

  has_many :multimaps, dependent: :destroy
  has_many :geojson_layers, dependent: :destroy
  has_many :wms_layers, dependent: :destroy

  validates :slug, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
