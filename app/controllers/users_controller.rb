class UsersController < ApplicationController
  def register
    @user = UserFacade.find_by_id(session[:user_id])
  end

  def update
    UserFacade.update_user(params, current_user.id)
    redirect_to '/dashboard'
  end

  def edit
    @user = UserFacade.find_by_id(session[:user_id])
  end
end
