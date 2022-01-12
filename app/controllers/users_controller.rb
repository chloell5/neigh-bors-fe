class UsersController < ApplicationController
  def register
    @user = UserFacade.find_by_id(session[:user_id])
  end

  def edit
    UserFacade.update_user(params, current_user.id)
    redirect_to '/farms/register'
  end
end
