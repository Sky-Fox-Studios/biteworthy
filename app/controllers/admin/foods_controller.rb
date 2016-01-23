class Admin::FoodsController < AdminController
  before_action :set_restaurant, only: [:all, :index, :show, :edit, :update, :destroy]
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :set_foods, only: [:all, :index]
  respond_to :html


  def all
    @restaurants = Restaurant.all.order(:name)
    render :index
  end

  def index
    @foods = Food.all
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
       redirect_to admin_foods_path
    else
       redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
    end
  end

  def destroy
    @food.destroy
     redirect_to admin_foods_path
  end

  def add_item_food
    binding.pry
    @restaurant = Restaurant.find_by(params[:restaurant_id])

    food = Food.find_or_create_by(restaurant: @restaurant, name: params[:food][:name])
    if food
      @item = Item.find_by(params[:item_id])
      @item.foods << food
      @item.save
    end
    redirect_to edit_admin_restaurant_item_path(@restaurant, @item)
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def set_restaurant
      if params[:restaurant_id]
        @restaurant = Restaurant.find(params[:restaurant_id])
      end
    end

    def set_foods
      @page= params[:page]
      if params.has_key?(:restaurant_id) && !params[:restaurant_id].empty?
        @foods = Food.where(restaurant_id: params[:restaurant_id]).page(@page).per(25)
      else
        @foods = Food.page(@page).per(25)
      end
    end

    def food_params
       params.require(:food).permit(:restaurant_id, :name, :description)
    end
end
