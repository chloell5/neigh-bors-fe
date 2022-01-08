class SessionsController < ApplicationController

  def create
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)

    session[:user_id] = user.id

  

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
