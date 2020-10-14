class CampersController < ApplicationController
  before_action :find_camper, only: [:edit, :show, :update, :destroy]
  def index
    @campers = Camper.all
  end

  def new
    @camper = Camper.new
  end

  def show
  end

  def create
    @camper = Camper.new(camper_params)

    if @camper.save
      redirect_to camper_path(@camper)
    else
      redirect_to new_signup_path
    end
  end

  def edit
  end

  def update
    if @camper.update(camper_params)
      redirect_to camper_path(@camper)
    else
      render :edit
    end
  end

  def destroy
    @camper.destroy
    @campers = Camper.all
    redirect_to campers_path(@campers)
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :age)
  end

  def find_camper
    @camper = Camper.find(params[:id])
  end
end
