class Admin::ItemsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :add_price, :destroy]

  respond_to :html


  def all
    render :index
  end

  def index
    @page= params[:page]

    @restaurants = Restaurant.all.order(:name)
    if params.has_key?(:restaurant_id) && !params[:restaurant_id].empty?
      @menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
      if params.has_key?(:menu_group_id) && !params[:menu_group_id].empty?
        @items = Item.where(restaurant_id: params[:restaurant_id], menu_group_id: params[:menu_group_id]).page(@page).per(25)
      else
        @items = Item.where(restaurant_id: params[:restaurant_id]).page(@page).per(25)
      end
    else
      @items = Item.page(@page).per(25)
    end
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
      flash[:notice] = "Item updated"
    else
      flash[:notice] = "Item failed to update"
    end
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def add_price
    @item.prices.create(value: params[:new_price], size: params[:new_size])
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def destroy
    @item.destroy
    redirect_to admin_restaurant_items_path(@restaurant)
  end

  def add_food
    @item = Item.find(params[:item_id])
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @item.foods << food unless @item.foods.include? food
    end
    if params.has_key? :admin_updating
      redirect_to edit_admin_restaurant_item_path(@restaurant, @item)
    else
      redirect_to restaurant_item_path(@restaurant, @item)
    end
  end

  def add_choice
    @item = Item.find(params[:item_id])
    unless (params[:choice_id].empty?)
      choice = Choice.find(params[:choice_id])
      @item.choices << choice unless @item.choices.include? choice
    end
    if params.has_key? :admin_updating
      redirect_to edit_admin_restaurant_item_path(@restaurant, @item)
    else
      redirect_to restaurant_item_path(@restaurant, @item)
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
    if @item.restaurant_id
      @restaurant = Restaurant.find(@item.restaurant_id)
      @menu_groups = MenuGroup.includes(:restaurant).where(restaurant_id: @item.restaurant_id).order('restaurants.name').order(:name)
    else
      @menu_groups = MenuGroup.includes(:restaurant).all.order('restaurants.name').order(:name)
    end
  end

  def item_params
      params.require(:item).permit(:restaurant_id, :menu_group_id, :name, :description,
      food_attributes: [:restaurant_id, :name, :description])
    end
end
