class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @ingredients = Ingredient.all
    respond_with(@ingredients)
  end

  def show
    respond_with(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
    respond_with(@ingredient)
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    redirect_to admin_ingredients_path
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to edit_admin_ingredient_path(@ingredient)
    else
      redirect_to edit_admin_ingredient_path(@ingredient)
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to admin_ingredients_path
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
    end

  def ingredient_params
    params.require(:ingredient).permit(:name)
    end
end
