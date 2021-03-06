class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(set_restaurant)
    @restaurant.save
    redirect_to restaurants_path(@restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def task_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
