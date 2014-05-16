require 'test_helper'

class GeojsonLayersControllerTest < ActionController::TestCase
  setup do
    @layer = layers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layer" do
    assert_difference('Layer.count') do
      post :create, layer: { active: @layer.active, description: @layer.description, file_name: @layer.file_name, file_uid: @layer.file_uid, legend: @layer.legend, name: @layer.name, style: @layer.style }
    end

    assert_redirected_to layer_path(assigns(:layer))
  end

  test "should show layer" do
    get :show, id: @layer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @layer
    assert_response :success
  end

  test "should update layer" do
    patch :update, id: @layer, layer: { active: @layer.active, description: @layer.description, file_name: @layer.file_name, file_uid: @layer.file_uid, legend: @layer.legend, name: @layer.name, style: @layer.style }
    assert_redirected_to layer_path(assigns(:layer))
  end

  test "should destroy layer" do
    assert_difference('Layer.count', -1) do
      delete :destroy, id: @layer
    end

    assert_redirected_to layers_path
  end
end
