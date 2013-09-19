require 'test_helper'

class UserLoginTest < Capybara::Rails::TestCase
  def test_that_users_can_log_in
    visit '/'

    fill_in 'user_email',    with: 'bag@bags.com'
    fill_in 'user_password', with: 'bagobags'

    click_button 'Sign in'

    refute page.has_text?('Password'), 
      "Page still has 'Password' on it--probably not signed in"
  end
end
