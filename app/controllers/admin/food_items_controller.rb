class Admin::FoodItemsController < AdminController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @food_items = FoodItem.all
    respond_with(@food_items)
  end

  def show
    respond_with(@food_item)
  end

  def new
    @food_item = FoodItem.new
    respond_with(@food_item)
  end

  def edit
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.save
    redirect_to admin_food_items_path
  end

  def update
    if @food_item.update(food_item_params)
       redirect_to admin_food_items_path
    else
       redirect_to edit_admin_food_item_path(@food_item)
    end
  end

  def destroy
    @food_item.destroy
     redirect_to admin_food_items_path
  end

  private
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:menu_group_id, :name, :description, :price)
    end
end
