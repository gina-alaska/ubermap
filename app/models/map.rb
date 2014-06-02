class Map < ActiveRecord::Base
  has_many :map_layers
  has_many :geojson_layers, through: :map_layers, source: :layer, source_type: 'GeojsonLayer'
  has_many :wms_layers, through: :map_layers, source: :layer, source_type: 'WmsLayer'

  validates :slug, uniqueness: true

  accepts_nested_attributes_for :geojson_layers
  accepts_nested_attributes_for :wms_layers

  def to_param
    slug.parameterize
  end
end
