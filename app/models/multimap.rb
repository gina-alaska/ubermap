class Multimap < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :multimap_maps, dependent: :destroy
  has_many :maps, through: :multimap_maps
  has_many :geojson_layers, through: :maps
  has_many :wms_layers, through: :maps

  def title
    name
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
