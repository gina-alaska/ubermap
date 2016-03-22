require 'test_helper'

class ViewerControllerTest < ActionController::TestCase
  setup do
    @map = maps(:one)
  end

  test "should get show" do
    get :show, slug: @map.slug
    assert_response :success
  end

end
