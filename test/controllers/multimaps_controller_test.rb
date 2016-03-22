require 'test_helper'

class MultimapsControllerTest < ActionController::TestCase
  setup do
    @multimap = multimaps(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multimaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multimap" do
    assert_difference('Multimap.count') do
      post :create, multimap: { active: @multimap.active, description: @multimap.description, name: @multimap.name, user_id: @multimap.user_id }
    end

    assert_redirected_to multimap_path(assigns(:multimap))
  end

  test "should get add" do
    get :add, id: @multimap
    assert_response :success
  end

  test "should show multimap" do
    get :show, id: @multimap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multimap
    assert_response :success
  end

  test "should update multimap" do
    patch :update, id: @multimap, multimap: { active: @multimap.active, description: @multimap.description, name: @multimap.name, user_id: @multimap.user_id }
    assert_redirected_to multimap_path(assigns(:multimap))
  end

  test "should destroy multimap" do
    assert_difference('Multimap.count', -1) do
      delete :destroy, id: @multimap
    end

    assert_redirected_to multimaps_path
  end
end
