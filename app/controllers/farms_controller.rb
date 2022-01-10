class FarmsController < ApplicationController
  def new
  end

  def create
    farm = FarmFacade.farm_create(farm_params)
    redirect_to '/dashboard'
  end

  def show
    require "pry"; binding.pry
    @farm = Farm.find(params[:id])
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  private

  def farm_params
    params.permit(:name, :address, :number_of_animals, :special_needs?, :special_needs_details)
  end
end
