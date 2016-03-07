class Admin::ItemsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item_form, only: [:add_price, :add_food, :add_choice, :add_new_price, :add_new_food, :add_new_choice]

  respond_to :html


  def all
    unless @items
      @items = Item.page(@page).per(per_page_count)
    end
  end

  def index
    @items = Item.where(restaurant_id: @restaurant).page(params[:page]).per(per_page_count)

  end

  def restaurant_item_filter
  end

  def get_menu_groups_by_restaurant
     menu_groups = MenuGroup.where('restaurant_id' => params[:restaurant_id])
     render partial: 'admin/modules/menu_groups_select', :locals => {:menu_groups => menu_groups, :restaurant => @restaurant}
  end

  def new
    @item = Item.new
    @menu_groups = MenuGroup.where('restaurant_id' => params[:restaurant_id])
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    # if params[:add_tags] && !params[:add_tags].empty?
    #   @item.tags = Tag.save_tags(params[:add_tags])
    # end
    if @item.save
      redirect_to admin_restaurant_items_path(@item.restaurant), notice: "Item: #{@item.name} created"
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      if params[:image]
        @item.photos.new(user_id: current_user, photo_type: "Item", image: params[:image]).save
      end

      flash[:notice] = "Item updated"
    else
      flash[:notice] = "Item failed to update"
    end
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def destroy
    @item.destroy
    redirect_to admin_restaurant_items_path(@restaurant)
  end

  def add_new_price
    @item.prices.create(value: params[:price_value], size: params[:new_size])
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def add_new_food
    @item.foods.create(name: params[:food_name], description: params[:food_description], restaurant: @item.restaurant)
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def add_new_choice
    @item.choices.create(name: params[:choice_name], description: params[:choice_description], restaurant: @item.restaurant)
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def add_food
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @item.foods << food unless @item.foods.include? food
    end
    if params.has_key? :admin_updating
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
    else
      redirect_to restaurant_item_path(@item.restaurant, @item)
    end
  end

  def add_choice
    unless (params[:choice_id].empty?)
      choice = Choice.find(params[:choice_id])
      @item.choices << choice unless @item.choices.include? choice
    end
    if params.has_key? :admin_updating
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
    else
      redirect_to restaurant_item_path(@item.restaurant, @item)
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
    if @item.restaurant_id
      @restaurant = Restaurant.find(@item.restaurant_id)
      @menu_groups = MenuGroup.includes(:restaurant).where(restaurant: @restaurant).order(:name)
      @foods = Food.where(restaurant: @restaurant).order(:name)
      @item_foods = Food.joins(:items).where(restaurant: @restaurant).order(:name)
      @choices = Choice.where(restaurant: @restaurant).order(:name)
      @item_choices = Choice.joins(:items).where(restaurant: @restaurant).order(:name)
    else
      @menu_groups = MenuGroup.includes(:restaurant).all.order('restaurants.name').order(:name)
    end
  end

  def set_item_form
    @item = Item.find(params[:item_id])
  end

  def item_params
      params.require(:item).permit(:restaurant_id, :menu_group_id, :name, :description,
      food_attributes: [:restaurant_id, :name, :description])
    end
end
