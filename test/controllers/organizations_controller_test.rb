require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should render show" do
    get :show, id: @organization
    assert_response :success
  end

  test "should redirect to permission denied for new" do
    get :new
    assert_redirected_to permission_denied_path
  end

  test "should get new for admin" do
    login_as(:admin)
    get :new
    assert_response :success
  end

  test "should create organization for admin" do
    login_as(:admin)

    assert_difference('Organization.count') do
      post :create, organization: { name: 'Some new organization' }
    end

    assert_redirected_to organization_url(assigns(:organization))
  end

  test "should redirect to permission denied on create" do
    post :create, organization: { name: 'New organization' }
    assert_redirected_to permission_denied_path
  end

  test "should get edit" do
    get :edit, id: @organization
    assert_response :success
  end

  test "should update organization" do
    patch :update, id: @organization, organization: { name: @organization.name + ' testing update' }
    assert_redirected_to organizations_url
  end

  test "admin should destroy organization" do
    login_as(:admin)
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to organizations_url
  end

  test "user should redirect to permission denied on organization destroy" do
    delete :destroy, id: @organization
    assert_redirected_to permission_denied_path
  end
end
