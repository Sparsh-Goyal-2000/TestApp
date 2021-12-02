class RestaurantsController < ApplicationController

  before_action :set_object, only: :show

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  private def set_object
    unless @restaurant = Restaurant.includes(categories: :products).find_by(id: params[:id])
      redirect_to restaurants_path, alert: 'Restaurant Not Found'
    end
  end

end
