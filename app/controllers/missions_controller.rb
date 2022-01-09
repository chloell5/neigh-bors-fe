class MissionsController < ApplicationController
  def index
  end

  def show
    mission = MissionFacade.mission_search(params[:mission_id])
    rescuer = UserFacade.find_by_id("#{mission.rescuer_id}")
    @evacuee = UserFacade.find_by_id("#{mission.evacuee_id}")
    @directions = UserFacade.driving_directions(rescuer, @evacuee)
  end

  def new
  end

  def create
  end

  private

  def mission_params
    params.permit(:mission_id, :rescuer_id, :evacuee_id)
  end
end
