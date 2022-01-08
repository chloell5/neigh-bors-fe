class MissionsController < ApplicationController
  def show
    mission = Mission.find(params[:id])
    user1 = User.find(session[:user_id])
    require "pry"; binding.pry
  

    @directions = UserFacade.driving_directions(user1, user2)
  end

  def new
  end

  def create
  end
end
