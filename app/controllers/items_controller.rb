class ItemsController < ApplicationController
  before_action :set_items, only: [:show]

  respond_to :html

  def index
    @items = Item.all
  end

  def show
    @review = Review.where(review_type: "Item", review_id: @item.id).first
  end

  private
  def set_items
    @item = Item.find(params[:id])
    @restaurant = Restaurant.find(@item.restaurant_id)
    end
end
