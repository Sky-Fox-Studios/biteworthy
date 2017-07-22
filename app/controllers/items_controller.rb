class ItemsController < ApplicationController
  before_action :set_items, only: [:show]

  respond_to :html

  def index
    if current_user
      @items = Item.where(items: :rating < -1)
    else
      @items = Item.all
    end
  end

  def show
    @review = Review.where(review_type: "Item", review_id: @item.id).first
  end

  private
  def set_items
    @item = Item
      .includes(:reviews, :prices, :photos, :foods, :ingredients)
      .find(params[:id])
    @item_extras_choice   = @item.extras.where(extra_type: Extra.extra_types[:choice])
    @item_extras_addition = @item.extras.where(extra_type: Extra.extra_types[:addition])
    @restaurant = Restaurant
      .includes(:addresses, :photos)
      .find(@item.restaurant_id)
    end
end
