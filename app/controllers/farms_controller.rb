class FarmsController < ApplicationController
  def login
  end

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
    # params.permit(:name, :address, :email, :password, :phone, :horses, :needs, :needs_text, :trailer, :sharing)
  end
end
