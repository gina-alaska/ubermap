class GeojsonLayer < ActiveRecord::Base
  has_many :map_layers, as: :layer
  has_many :maps, through: :map_layers

  dragonfly_accessor :file

  scope :active, ->{ where(active: true) }

  serialize :fields

  before_save :fetch_fields

  def fetch_fields
    return if self.file.nil?
    
    case self.file.ext
    when 'geojson'
      set_fields_from_geojson
    end
  end

  def set_fields_from_geojson
    f = []
    JSON.parse(self.file.data)['features'].each do |feature|
      f += feature['properties'].keys
    end

    self.fields = f.uniq.compact
  end

  def leaflet_params
    {
      name: name,
      slug: "geojson_#{id}",
      type: 'geojson',
      url: file.try(:remote_url),
      popup: popup,
      legend: legend,
      style: style.as_json,
      options: options.as_json
    }
  end
end
