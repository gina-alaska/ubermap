class User < ActiveRecord::Base
  include GinaAuthentication::UserModel

  has_many :organizations_users
  has_many :organizations, through: :organizations_users

  def to_s
    "#{name} <#{email}>"
  end
end
