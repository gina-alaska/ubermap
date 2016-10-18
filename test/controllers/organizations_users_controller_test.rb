require 'test_helper'

class OrganizationsUsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @organization = organizations(:one)
    @user = users(:two)
    login_as(:one)
  end

  test "show new" do
    get :new, organization_id: @organization

    assert_response :success
  end

  test "should add user to organization" do
    assert_difference('@organization.users.count') do
      post :create, organization_id: @organization, id: @user
    end

    assert_redirected_to @organization
  end

  test "should remove user from organization" do
    assert_difference('@organization.users.count', -1) do
      delete :destroy, organization_id: @organization, id: users(:one)
    end

    assert_redirected_to @organization
  end
end
