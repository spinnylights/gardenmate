require "test_helper"

class RoutesTest < ActionDispatch::IntegrationTest
  def test_signup_route
    assert_routing '/signup', {controller: 'users', action: 'create'}
  end
end
