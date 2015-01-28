class FavoriteRestaurantController < ApplicationController
  before_action :set_favorite_restaurant, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
     @favorite_restaurants = FavoriteRestaurant.all
    respond_with(@favorite_restaurants)
  end

  def show
    respond_with(@favorite_restaurant)
  end

  def new
    @favorite_restaurant = FavoriteRestaurant.new
    respond_with(@favorite_restaurant)
  end

  def edit
  end

  def create
    @favorite_restaurant = FavoriteRestaurant.new(user_favorite_params)
    @favorite_restaurant.save
    respond_with(@favorite_restaurant)
  end

  def update
    @favorite_restaurant.update(user_favorite_params)
    respond_with(@favorite_restaurant)
  end

  def destroy
     @favorite_restaurant.destroy
    respond_with(@favorite_restaurant)
  end

  private
   def set_favorite_restaurant
      @favorite_restaurants = FavoriteRestaurant.find(params[:id])
    end

    def user_favorite_params
       params.require(:favorite_restaurant).permit(:rating, :item_id, :comment)
    end
end
