class Map < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :map_layers
  has_many :geojson_layers, through: :map_layers, source: :layer, source_type: 'GeojsonLayer'
  has_many :wms_layers, through: :map_layers, source: :layer, source_type: 'WmsLayer'

  has_many :multimap_maps, dependent: :destroy

  validates :slug, uniqueness: true
  validates :title, presence: true, uniqueness: true

  accepts_nested_attributes_for :geojson_layers
  accepts_nested_attributes_for :wms_layers

  def should_generate_new_friendly_id?
    slug.blank? || title_changed? || super
  end
end
