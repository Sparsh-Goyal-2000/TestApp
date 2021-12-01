class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    unless @restaurant = Restaurant.includes(categories: :products).find_by(id: params[:id])
      redirect_to restaurants_path, alert: 'Restaurant Not Found'
    end
  end

end
