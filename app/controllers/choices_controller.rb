class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show]

  respond_to :html

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @choices = Choice.where(restaurant: @restaurant)
    respond_with(@choices)
  end

  def show
    respond_with(@choice)
  end

  private
    def set_choice
      @choice = Choice.find(params[:id])
      @restaurant = Restaurant.find(@choice.restaurant_id)
    end
end
