class Users::SessionsController < Devise::SessionsController
  before_filter :authenticate_user!

  def after_sign_in_path_for(user)
    '/console'
  end
  
  def console
    unless user_signed_in?
      redirect_to '/'
    end
  end
end
