class MapLayer < ActiveRecord::Base
  belongs_to :map
  belongs_to :layer
end
