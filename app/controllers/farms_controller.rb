class FarmsController < ApplicationController
  def new
  end

  def create
    farm = Farm.create(farm_params)

    redirect_to farm_path(farm)
  end

  def show
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
