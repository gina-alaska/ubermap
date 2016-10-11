require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'valid organization' do
    organization = Organization.new(name: 'test', description: 'test')
    assert organization.valid?
  end

  test 'organization invalid without name' do
    organization = Organization.new(description: 'test')
    refute organization.valid?, 'organization is valid without name'
    assert_not_nil organization.errors[:name], 'no validation error for name present'
  end
end
