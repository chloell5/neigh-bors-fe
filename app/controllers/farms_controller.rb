class FarmsController < ApplicationController
  def new
  end

  def create
    user_id = session[:user_id]
    farm = FarmFacade.farm_create(farm_params, user_id)
    redirect_to '/dashboard'
  end

  def show
    @farm = FarmFacade.find_farm(current_user.id)
    @user = UserFacade.find_by_id(current_user.id)

  end

  def edit
    @farm = FarmFacade.find_farm(current_user.id)
  end

  def update
    FarmFacade.farm_update(farm_params, current_user.id)
    redirect_to '/dashboard'
  end

  private

  def farm_params
    params.permit(:name, :address, :number_of_animals, :special_needs?, :special_needs_details)
  end
end
