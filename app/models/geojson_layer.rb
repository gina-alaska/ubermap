class GeojsonLayer < ActiveRecord::Base
  has_many :map_layers, as: :layer, dependent: :destroy
  has_many :maps, through: :map_layers

  belongs_to :organization

  attachment :file, extension: "geojson"

  scope :active, ->{ where(active: true) }

  serialize :fields

  before_save :fetch_fields

  def fetch_fields
    return if self.file.nil?

    set_fields_from_geojson
  end

  def set_fields_from_geojson
    f = []
    JSON.parse(self.file.read)['features'].each do |feature|
      f += feature['properties'].keys
    end

    self.fields = f.uniq.compact
  end

  def slug
    "#{layer_type}_#{id}"
  end

  def layer_type
    'geojson'
  end
end
