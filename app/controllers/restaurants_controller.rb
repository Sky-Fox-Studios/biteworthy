class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
     @menu_groups = MenuGroup.includes(:food_items).where(restaurant_id: @restaurant.id).all
    respond_with(@restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
