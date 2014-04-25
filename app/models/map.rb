class Map < ActiveRecord::Base
  has_many :map_layers
  has_many :layers, through: :map_layers

  validates :slug, uniqueness: true

  accepts_nested_attributes_for :layers

  def to_param
    slug.parameterize
  end
end
