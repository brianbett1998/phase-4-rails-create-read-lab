class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    if plant.valid?
      render json: plant, status: :created
    else
      render json: { error: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
