class OrganizationsUser < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user

  def to_s
    user
  end
end
