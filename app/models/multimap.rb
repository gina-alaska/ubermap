class Multimap < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :multimap_maps, dependent: :destroy
  has_many :maps, through: :multimap_maps
end
