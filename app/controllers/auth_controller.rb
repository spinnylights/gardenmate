class AuthController < ApplicationController
  def index
  end
  
  def signin
    unless params[:user][:email] == 'bag@bags.com' && 
    params[:user][:password] == 'bagobags'
      render :index
    end
  end
end
