class MissionsController < ApplicationController
  def index
    @missions = MissionFacade.all_missions
    user1 = UserFacade.find_by_id(current_user.id)
    @distance = MissionFacade.distance(user1, user2)
  end

  def show
    mission = MissionFacade.mission_search(params[:mission_id])

    rescuer = UserFacade.find_by_id("#{mission.rescuer_id}")
    @evacuee = UserFacade.find_by_id("#{mission.evacuee_id}")
    @directions = MissionFacade.driving_directions(rescuer, @evacuee)
  end

  def new
    @farm = FarmFacade.find_farm(current_user.id)
    @user = UserFacade.find_by_id(current_user.id)
  end

  def create
    message = "*TESTING* A Neigh-bors user near you has requested evacuation assistance. Log in to your Neigh-bors account to view details and accept assignment."
    recipient = ""

    farm_id = FarmFacade.find_farm(current_user.id).backend_id

    mission = MissionFacade.mission_create({:farm_id => farm_id})

    t = TwilioTextMessenger.new(message, recipient)
    t.call

    redirect_to '/dashboard'
  end

  private

  def mission_params
    params.permit(:mission_id, :rescuer_id, :farm_id, :evacuee_id)
  end
end
