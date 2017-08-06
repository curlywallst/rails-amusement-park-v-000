class AttractionsController < ApplicationController

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new

  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  def show
    @attraction = Attraction.find(params[:id])
  end



  def attraction_params
    params.require(:attraction).permit(:id, :name, :tickets, :happiness_rating, :min_height, :nausea_rating)
  end
end
