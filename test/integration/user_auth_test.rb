require 'test_helper'

class UserAuthTest < Capybara::Rails::TestCase
  def sign_in(email, password)
    visit '/'
    fill_in 'user_email',    with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  def sign_in_bag
    sign_in(users(:bag).email, 'bagobags')
  end

  def test_that_users_can_log_in
    sign_in_bag
    refute page.has_text?('Password'), 
      "Page still has 'Password' on it--probably not signed in"
  end

  def test_that_junk_users_cannot_log_in
    sign_in('junk@junky.org', 'garbage')
    assert page.has_text?('Password'),
      "Page does not have 'Password' on it--log in seems to have worked"
  end

  def test_sign_up
    visit '/'
    click_link 'Sign up'
    assert current_url.include?('sign_up'), 'Not on sign-up page'
    fill_in 'user_email',                 with: 'gunge@bunge.net'
    fill_in 'user_password',              with: 'gungybungy'
    fill_in 'user_password_confirmation', with: 'gungybungy'
    click_button 'Sign up'
    assert page.has_text?('Sign out'), 
      "No 'Sign out' link--probably not signed in"
  end

  def test_sign_out
    sign_in_bag
    click_link 'Sign out'
    assert page.has_text?('Sign in'), "Not on sign-in page"
  end
end
