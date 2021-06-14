class PlantedController < ApplicationController

  def destroy
    plant = Planted.find_by(params[:plant_id])
    plant.delete
    redirect_to '/plots'
  end
end
