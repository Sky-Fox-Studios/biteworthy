class Admin::FoodsController < AdminController
  before_action :set_restaurant, only: [:all, :index, :show, :edit, :update, :destroy, :add_ingredient, :add_ingredient_by_name, :remove_ingredient]
  before_action :set_food, only: [:show, :edit, :update, :destroy, :add_ingredient, :add_ingredient_by_name, :remove_ingredient]
  before_action :set_foods, only: [:all, :index]
  respond_to :html


  def all
    @restaurants = Restaurant.all.order(:name)
  end

  def index
    @foods = Food.where(restaurant: @restaurant)
    respond_with(@foods)
  end

  def show
    respond_with(@food)
  end

  def get_menu_groups_by_restaurant
     restaurant = Restaurant.find(params[:restaurant_id])
     menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
     render partial: 'admin/modules/menu_groups_select', :locals => {:menu_groups => menu_groups, :restaurant => restaurant}
  end

  def new
    @food = Food.new
    if params[:food] && params[:food][:restaurant_id]
      @restaurant = Restaurant.find(food_params[:restaurant_id])
    elsif params.has_key? :restaurant_id
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    respond_with(@food)
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to admin_foods_path
    else
      redirect_to :back
    end
  end

  def update
    if @food.update(food_params)
       redirect_to admin_restaurant_foods_path(@food.restaurant)
    else
       redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
    end
  end

  def destroy
    @food.destroy
     redirect_to admin_foods_path
  end

  def add_ingredient
    unless params[:ingredient_id].empty?
      ingredient = Ingredient.find(params[:ingredient_id])
      @food.ingredients << ingredient unless @food.ingredients.include? ingredient
      redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
    else
      redirect_to edit_admin_restaurant_food_path(@restaurant, @food), notice: "No ingredient selected"
    end
  end

  def add_ingredient_by_name
    unless params[:ingredient_name].empty?
      ingredient = Ingredient.find_or_create_by(name: params[:ingredient_name])
      @food.ingredients << ingredient unless @food.ingredients.include? ingredient
    end
    redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
  end

  def remove_ingredient
    ingredient = Ingredient.find(params[:ingredient_id])
    @food.ingredients.delete(ingredient)
    redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
  end

  private
    def set_food
    if params[:id]
      @food = Food.find(params[:id])
    elsif params[:food_id]
      @food = Food.find(params[:food_id])
    end

    end

    def set_foods
      @page= params[:page]
      if params.has_key?(:filter_restaurant_id) && !params[:filter_restaurant_id].empty?
        @foods = Food.where(restaurant_id: params[:filter_restaurant_id]).page(@page).per(per_page_count)
      else
        @foods = Food.page(@page).per(per_page_count)
      end
    end

    def food_params
       params.require(:food).permit(:restaurant_id, :name, :description)
    end
end
