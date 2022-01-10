class FarmsController < ApplicationController
  def new
  end

  def create
    farm = FarmFacade.farm_create(farm_params)
    redirect_to '/dashboard'
  end

  def show
    @farm = FarmFacade.find_farm(2)
    @user = UserFacade.find_by_id(2)
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  private

  def farm_params
    params.permit(:name, :address, :number_of_animals, :special_needs?, :special_needs_details)
  end
end
