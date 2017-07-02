class RestaurantsController < ApplicationController
  skip_before_action :set_page, :set_restaurants, :set_restaurants, :set_menu, :set_menus, :set_menu_groups, :set_menu_group, :set_items, :set_item
  before_action :set_restaurant_know_how, only: :show
  respond_to :html

  def index
    # not used
    @restaurants = Restaurant.active
  end

  def show
  end

  private
    def set_restaurant_know_how
      @restaurant = Restaurant.find(params[:id])
      @menus      = Menu.includes(:menu_groups)
        .includes(menu_groups: [items: [:reviews, :prices, :photos]])
        .where(restaurant_id: @restaurant.id)
        .order("menu_groups.menu_order")
        .order("reviews.rating DESC") #.where("items.review.rating > ?", -1)
      # @menu_groups = MenuGroup.includes(:items).where(restaurant_id: @restaurant.id) #.where("items.review.rating > ?", -1)
    end
end
