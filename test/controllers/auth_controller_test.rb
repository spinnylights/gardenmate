require "test_helper"

class AuthControllerTest < ActionController::TestCase
  def test_get_index
    get :index
    assert_response :success
  end

  def test_post_signin
    post :index
    assert_response :success
  end
end
