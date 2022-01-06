class UsersController < ApplicationController
  def login
  end

  def new
  end

  def create
    redirect_to dashboard_path
  end
end
