class Admin::ItemsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :update_price, :destroy]
  respond_to :html


  def all
    @page= params[:page]
    @restaurants = Restaurant.all.order(:name)
    if params.has_key?(:restaurant_id) && !params[:restaurant_id].empty?
      @menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
      if params[:restaurant_id] != params[:current_restaurant_id]
        params[:menu_group_id] = nil
      end
      if params.has_key?(:menu_group_id) && params[:menu_group_id] && !params[:menu_group_id].empty?
        @items = Item.where(restaurant_id: params[:restaurant_id], menu_group_id: params[:menu_group_id]).page(@page).per(25)
      else
        @items = Item.where(restaurant_id: params[:restaurant_id]).page(@page).per(25)
      end
    else
      @items = Item.page(@page).per(25)
    end
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

  def show
  end

  def get_menu_groups_by_restaurant
     restaurant = Restaurant.find(params[:restaurant_id])
     menu_groups = MenuGroup.where('restaurant_id' => params[:restaurant_id])
     render partial: 'admin/modules/menu_groups_select', :locals => {:menu_groups => menu_groups, :restaurant => restaurant}
  end

  def new
    @item = Item.new
    @restaurant = Restaurant.find(params[:restaurant_id])
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
      redirect_to admin_restaurant_item_path(@item.restaurant, @item), notice: "Item: #{@item.name} created"
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

  def update_price
    @item.prices << Price.create(item_id: @item.id, price: params[:new_price], size: params[:new_size])
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)

  end

  def destroy
    @item.destroy
    redirect_to admin_items_path
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
      params.require(:item).permit(:restaurant_id, :menu_group_id, :name, :description)
    end
end
