class SessionsController < ApplicationController

  def create
    all_users = UserFacade.all_users

    email_array = all_users.map do |user|
      user.email
    end

    if email_array.include?(helper_hash[:email])
      user = UserFacade.user_by_email(helper_hash[:email])

      session[:user_id] = user.id

      redirect_to dashboard_path
    else
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def helper_hash
    {
      email: auth_hash['info']['email'],
      full_name: auth_hash['info']['name'],
      google_id: auth_hash['uid'],
      google_token: auth_hash['credentials']['token']
    }
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

end
