class Admin::AdditionsController < AdminController
  before_action :set_addition, only: [:show, :edit, :update, :destroy]
  before_action :just_set_addition, only: [:add_foods, :add_new_food, :remove_food, :add_new_price]

  respond_to :html

  def index
    @additions = Addition.where(restaurant: @restaurant).order(:name).page(params[:page]).per(per_page_count)
    @restaurants = Restaurant.all
    respond_with(@additions)
  end

  def show
    respond_with(@addition)
  end

  def new
    @addition = Addition.new
    respond_with(@addition)
  end

  def edit
  end

  def create
    @addition = Addition.new(addition_params)
    if @addition.save
      redirect_to admin_restaurant_additions_path(@restaurant), notice: "Addition: #{@addition.name} created"
    else
      render :new
    end

  end

  def update
    if @addition.update(addition_params)
      redirect_to admin_restaurant_additions_path(@addition.restaurant), notice: "Addition updated"
    else
      render :edit
    end
  end

  def destroy
    @addition.destroy
    redirect_to admin_restaurant_additions_path(@restaurant), notice: "Addition removed"
  end

  def add_new_price
    @addition.prices.create(value: params[:price_value], size: params[:new_size])
    redirect_to edit_admin_restaurant_addition_path(@addition.restaurant, @addition)
  end

  def add_new_food
    @addition.foods.create(name: params[:food_name], description: params[:food_description], restaurant: @addition.restaurant)
    redirect_to edit_admin_restaurant_addition_path(@addition.restaurant, @addition)
  end

  def add_foods
    unless (params[:addition].empty?)
      foods = Food.where(id: params[:addition][:food_ids])
      @addition.foods = foods
    end
    redirect_to edit_admin_restaurant_addition_path(@addition.restaurant, @addition)
  end

  def remove_food
    food = Food.find(params[:food_id])
    @addition.foods.delete(food)
    redirect_to edit_admin_restaurant_addition_path(@addition.restaurant, @addition)
  end


  private
  def just_set_addition
    if params[:id]
      @addition = Addition.find(params[:id])
    elsif params[:addition_id]
      @addition = Addition.find(params[:addition_id])
    end
  end

  def set_addition
    just_set_addition
    if @addition
      @restaurant = @addition.restaurant
      @foods = Food.where(restaurant: @restaurant).order(:name)
      @addition_foods = Food.joins(:additions).where(restaurant: @restaurant).order(:name)
    end
  end

  def addition_params
    params.require(:addition).permit(:restaurant_id, :name, :description)
    end
end
