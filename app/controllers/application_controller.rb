class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user = UserFacade.find_by_id(session[:user_id]) if session[:user_id]
  end

  def check_user
    if !current_user.present?
      redirect_to root_path
    end
  end
end
