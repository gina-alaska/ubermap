require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
    @map = maps(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index, organization_id: @organization
    assert_response :success
    assert_not_nil assigns(:maps)
  end

  test "should get new" do
    get :new, organization_id: @organization
    assert_response :success
  end

  test "should create map" do
    assert_difference('Map.count') do
      post :create, organization_id: @organization, map: { active: @map.active, title: @map.title + ' testing' }
    end

    assert_redirected_to [@organization, assigns(:map)]
  end

  test "should show available geojson layers" do
    get :available_geojson, organization_id: @organization, id: @map

    assert_response :success
  end

  test "should show available wms layers" do
    get :available_wms, organization_id: @organization, id: @map

    assert_response :success
  end

  test "should add wms layer" do
    layer = wms_layers(:two)
    assert_difference("@map.wms_layers.count") do
      patch :add_wms, organization_id: @organization, id: @map, layer: layer
    end

    assert_redirected_to [@organization, @map]
  end

  test "should add geojson layer" do
    layer = geojson_layers(:two)
    assert_difference("@map.geojson_layers.count") do
      patch :add_geojson, organization_id: @organization, id: @map, layer: layer
    end

    assert_redirected_to [@organization, @map]
  end

  test "should remove wms layer" do
    layer = wms_layers(:one)
    assert_difference("@map.wms_layers.count", -1) do
      patch :remove_wms, organization_id: @organization, id: @map, layer: layer
    end

    assert_redirected_to [@organization, @map]
  end

  test "should remove geojson layer" do
    layer = geojson_layers(:one)
    assert_difference("@map.geojson_layers.count", -1) do
      patch :remove_geojson, organization_id: @organization, id: @map, layer: layer
    end

    assert_redirected_to [@organization, @map]
  end

  test "should show map" do
    get :show, organization_id: @organization, id: @map
    assert_response :success
  end

  test "should get edit" do
    get :edit, organization_id: @organization, id: @map
    assert_response :success
  end

  test "should update map" do
    patch :update, organization_id: @organization, id: @map, map: { active: @map.active, title: @map.title + ' testing update' }
    assert_redirected_to [@organization, assigns(:map)]
  end

  test "should destroy map" do
    assert_difference('Map.count', -1) do
      delete :destroy, organization_id: @organization, id: @map
    end

    assert_redirected_to @organization
  end
end
