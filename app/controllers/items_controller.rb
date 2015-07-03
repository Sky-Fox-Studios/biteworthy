class ItemsController < ApplicationController
  before_action :set_items, only: [:show]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@items)
  end

  private
  def set_items
    @item = Item.find(params[:id])
    @restaurant = Restaurant.find(@item.restaurant_id)
    end
end
