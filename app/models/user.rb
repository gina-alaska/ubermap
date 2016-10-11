class User < ActiveRecord::Base
  include GinaAuthentication::UserModel

  has_many :organization_users
  has_many :organizations, through: :organization_users
end
