class Admin::ItemsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
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
    if params[:item] && params[:item][:restaurant_id]
      @restaurant = Restaurant.find(item_params[:restaurant_id])
      @menu_groups = MenuGroup.where('restaurant_id' => item_params[:restaurant_id])

    end
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.tags = Tag.save_tags(params[:add_tags])
    @item.save
    redirect_to admin_items_path
  end

  def update
    @item.prices << Price.create(item_id: @item.id, price: params[:new_price], size: params[:new_size])
    if @item.update(item_params)
      redirect_to edit_admin_item_path(@item)
    else
      redirect_to edit_admin_item_path(@item)
    end
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
