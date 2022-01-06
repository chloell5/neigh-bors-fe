class UsersController < ApplicationController
  def login
  end

  def new
  end

  def create
    user = User.create(user_params)

    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :address, :email, :password, :phone, :horses, :needs, :needs_text, :trailer, :sharing)
  end
end
