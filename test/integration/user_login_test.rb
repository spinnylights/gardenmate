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

  def test_that_junk_users_cannot_log_in
    visit '/'

    fill_in 'user_email', with: 'junk_user@trash.org'
    fill_in 'user_password', with: 'garbage'

    click_button 'Sign in'

    assert page.has_text?('Password'),
      "Page does not have 'Password' on it--log in seems to have worked"
  end
end
