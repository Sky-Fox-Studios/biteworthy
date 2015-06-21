class FoodsController < ApplicationController
  before_action :set_food, only: [:show]

  respond_to :html

  def index
    @foods = Food.all
    respond_with(@foods)
  end

  def show
    respond_with(@food)
  end

  private
    def set_food
      @food = Food.find(params[:id])
      @restaurant = Restaurant.find(@food.restaurant_id)
    end
end
