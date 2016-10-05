require 'test_helper'

class WmsLayersControllerTest < ActionController::TestCase
  setup do
    @wms_layer = wms_layers(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wms_layers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wms_layer" do
    assert_difference('WmsLayer.count') do
      post :create, wms_layer: { active: @wms_layer.active, description: @wms_layer.description, layers: @wms_layer.layers, legend: @wms_layer.legend, name: @wms_layer.name, options: @wms_layer.options, url: @wms_layer.url }
    end

    assert_redirected_to edit_wms_layer_path(assigns(:wms_layer))
  end

  test "should show wms_layer" do
    get :show, id: @wms_layer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wms_layer
    assert_response :success
  end

  test "should update wms_layer" do
    patch :update, id: @wms_layer, wms_layer: { active: @wms_layer.active, description: @wms_layer.description, layers: @wms_layer.layers, legend: @wms_layer.legend, name: @wms_layer.name, options: @wms_layer.options, url: @wms_layer.url }
    assert_redirected_to edit_wms_layer_path(assigns(:wms_layer))
  end

  test "should destroy wms_layer" do
    assert_difference('WmsLayer.count', -1) do
      delete :destroy, id: @wms_layer
    end

    assert_redirected_to wms_layers_path
  end
end
