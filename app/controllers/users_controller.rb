class UsersController < ApplicationController
  def register
    @user = UserFacade.find_by_id(session[:user_id])
  end

  def update
    UserFacade.update_user(params, current_user.id)
    
    if params[:register] == 'true'
      redirect_to '/farms/register'
    else
      redirect_to '/dashboard'
    end
  end

  def edit
    @user = UserFacade.find_by_id(session[:user_id])
  end
end
