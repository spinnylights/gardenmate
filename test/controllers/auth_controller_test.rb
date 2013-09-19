require "test_helper"

class AuthControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end
end
