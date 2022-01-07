class SessionsController < ApplicationController

  def create
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)

    session[:user_id] = user.id

    all_users = User.all

    if User.all.include?(user.email)
      redirect_to dashboard_path
    else
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
