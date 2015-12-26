class Admin::FoodsController < AdminController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
     @foods = Food.all
    respond_with(@foods)
  end

  def show
    respond_with(@food)
  end

  def get_menu_groups_by_restaurant
     restaurant = Restaurant.find(params[:restaurant_id])
     menu_groups = MenuGroup.where('restaurant_id' => params[:restaurant_id])

    render partial: 'admin/modules/menu_groups_select', :locals => {:menu_groups => menu_groups, :restaurant => restaurant}

  end

  def new
    @food = Food.new
    if params[:food] && params[:food][:restaurant_id]
      @restaurant = Restaurant.find(food_params[:restaurant_id])
      @menu_groups = MenuGroup.where('restaurant_id' => food_params[:restaurant_id])

    end
    respond_with(@food)
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    @food.tags = Tag.save_tags(params[:add_tags])
    if @food.save
      redirect_to admin_foods_path
    else
      redirect_to :back
    end
  end

  def update
    if @food.update(food_params)
      @food.prices << Price.create(food_id: @food.id, price: params[:new_price], size: params[:new_size])
      @food.tags = Tag.save_tags(params[:add_tags])
       redirect_to admin_foods_path
    else
       redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
    end
  end

  def destroy
    @food.destroy
     redirect_to admin_foods_path
  end

  private
    def set_food
      @food = Food.find(params[:id])
      @menu_groups = MenuGroup.includes(:restaurant).all.order('restaurants.name').order(:name)
    end

    def food_params
       params.require(:food).permit(:restaurant_id, :menu_group_id, :name, :description)
    end
end
