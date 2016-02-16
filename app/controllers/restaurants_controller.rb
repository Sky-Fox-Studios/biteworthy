class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show

    respond_with(@restaurant)
    if current_user
      @items = Item.includes(:reviews).where(restaurant_id: @restaurant.id)
      .where.not("reviews.rating = 'Worst'")
    else
      @items = Item.all
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
      @menu_groups = MenuGroup.includes(:items).where(restaurant_id: @restaurant.id) #.where("items.review.rating > ?", -1)
    end
end
