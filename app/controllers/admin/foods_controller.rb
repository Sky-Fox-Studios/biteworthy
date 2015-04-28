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

  def new
    @food = Food.new
    respond_with(@food)
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to admin_foods_path
  end

  def update
    if @food.update(food_params)
       redirect_to admin_foods_path
    else
       redirect_to edit_admin_food_path(@food)
    end
  end

  def destroy
    @food.destroy
     redirect_to admin_foods_path
  end

  private
    def set_food
      @food = Food.find(params[:id])
      @food_tags = @food.tags
      @menu_groups = MenuGroup.includes(:restaurant).all.order('restaurants.name').order(:name)
    end

    def food_params
       params.require(:food).permit(:restauant_id, :menu_group_id, :name, :description, :price_low, :price_high)
    end
end
