class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show]

  respond_to :html

  def index
    @food_items = FoodItem.all
    respond_with(@food_items)
  end

  def show
    respond_with(@food_item)
  end

  private
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end
end
