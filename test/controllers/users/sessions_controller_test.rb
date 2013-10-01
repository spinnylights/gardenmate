require "test_helper"

class Users::SessionsControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def test_get_console_works_if_signed_in
    sign_in users(:bag)
    get :console
    assert_template 'users/sessions/console', "Not on console page"
  end

  def test_get_console_redirects_to_home_if_not_signed_in
    get :console
    assert_redirected_to '/', "Not redirected to unauth root page"
  end
end
