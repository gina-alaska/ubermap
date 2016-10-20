require 'test_helper'

class GeojsonLayersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @organization = organizations(:one)
    @geojson_layer = geojson_layers(:one)
    login_as(:one)
  end

  test "should show new geojson layer form" do
    get :new, organization_id: @organization

    assert_response :success
  end

  test "should create new geojson layer" do
    assert_difference('GeojsonLayer.count') do
      post :create, organization_id: @organization, geojson_layer: { name: 'testing creation' }
    end

    assert_equal @organization.id, assigns(:geojson_layer).organization_id

    assert_redirected_to edit_organization_geojson_layer_path(@organization, assigns(:geojson_layer))
  end


  test "should render the edit view" do
    get :edit, organization_id: @organization, id: @geojson_layer
    assert_response :success
  end

  test "should update the geojson layer" do
    patch :update, organization_id: @organization, id: @geojson_layer, geojson_layer: { name: 'Updated layer name' }

    assert_redirected_to edit_organization_geojson_layer_path(@organization, @geojson_layer)
  end

  test "should delete the geojson layer" do
    assert_difference('GeojsonLayer.count', -1) do
      delete :destroy, organization_id: @organization, id: @geojson_layer
    end

    assert_redirected_to @organization
  end
end
