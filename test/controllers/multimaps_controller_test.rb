require 'test_helper'

class MultimapsControllerTest < ActionController::TestCase
  setup do
    @multimap = multimaps(:one)
    @organization = organizations(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index, organization_id: @organization
    assert_redirected_to @organization
    # assert_response :success
    # assert_not_nil assigns(:multimaps)
  end

  test "should get new" do
    get :new, organization_id: @organization
    assert_response :success
  end

  test "should create multimap" do
    assert_difference('Multimap.count') do
      post :create, organization_id: @organization, multimap: { active: @multimap.active, description: @multimap.description, name: @multimap.name, user_id: @multimap.user_id }
    end

    assert_redirected_to [@organization, assigns(:multimap)]
  end

  test "should get available maps" do
    get :available, organization_id: @organization, id: @multimap
    assert_response :success
  end

  test "should add map" do
    assert_difference('@multimap.maps.count') do
      patch :add, organization_id: @organization, id: @multimap, map: maps(:one).slug
    end
    assert_redirected_to [@organization, assigns(:multimap)]
  end

  test "should remove map" do
    assert_difference('@multimap.maps.count', -1) do
      patch :remove, organization_id: @organization, id: @multimap, map: maps(:one).slug
    end
    assert_redirected_to [@organization, assigns(:multimap)]
  end

  test "should toggle activation of map layers" do
    patch :activate, organization_id: @organization, id: @multimap, map: maps(:one).slug
    assert_redirected_to [@organization, assigns(:multimap)]
  end

  test "should show multimap" do
    get :show, organization_id: @organization, id: @multimap
    assert_response :success
  end

  test "should get edit" do
    get :edit, organization_id: @organization, id: @multimap
    assert_response :success
  end

  test "should update multimap" do
    patch :update, organization_id: @organization, id: @multimap, multimap: { active: @multimap.active, description: @multimap.description, name: @multimap.name, user_id: @multimap.user_id }
    assert_redirected_to [@organization, assigns(:multimap)]
  end

  test "should destroy multimap" do
    assert_difference('Multimap.count', -1) do
      delete :destroy, organization_id: @organization, id: @multimap
    end

    assert_redirected_to @multimap.organization
  end
end
