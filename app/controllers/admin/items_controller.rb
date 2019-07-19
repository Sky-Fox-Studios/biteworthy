class Admin::ItemsController < AdminController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :just_set_item, only: [
    :add_extra, :add_new,
    :add_new_price, :add_new_extra,
    :remove_menu_group, :remove_extra, :remove_photo
  ]

  respond_to :html


  def all
    unless @items
      @items = Item.page(params[:page]).per(per_page_count)
    end
  end

  def add_tags
    # Uses ajax magic
  end

  def index
    @items = Item.where(restaurant_id: @restaurant).page(params[:page]).per(per_page_count)
    respond_to do |format|
      format.html
      format.json { render json: ItemDatatable.new(params, view_context: view_context) }
    end
  end

  def restaurant_item_filter
  end

  def get_menu_groups_by_restaurant
     menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
     render partial: 'admin/modules/menu_groups_select', locals: {menu_groups: menu_groups, restaurant: @restaurant}
  end

  def new
    @item = Item.new
    @menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      if params[:image]
        save_images(@item, params[:image])
      end
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      if params[:image]
        save_images(@item, params[:image])
      end
      flash[:notice] = "Item updated"
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
    else
      flash[:notice] = "Item failed to update"
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_restaurant_items_path(@restaurant)
  end

  def add_new
    # tag = Tag.find_or_initialize_by(name: params[:name], description: params[:description])
    # tag.update(tag_params)
    # @item.tags << tag unless @item.tags.include? tag
    # redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
  end

  def add_new_price
    Price.create(priced_id: @item.id, priced_type: @item.class.to_s, value: params[:price][:value], size: params[:price][:size])
    respond_to do |format|
      format.html { redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item), notice: 'Tag was successfully created.' }
      format.js { }
    end
  end

  def add_new_extra
    @notice = if params[:extra_name].present?
      extra = Extra.find_or_create_by(name: params[:extra_name], description: params[:extra_description], extra_type: params[:extra_type], restaurant: @item.restaurant)
      if @item.extras.include? extra
        "#{@item.name} already has #{params[:extra_type]} of  #{params[:extra_name]}"
      else
        @item.extras << extra
        nil # No notice
      end
    else
      "No name provided for #{params[:extra_type]}"
    end
    respond_to do |format|
      format.html { redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item), notice: @notice }
      format.js { }
    end
  end

  def add_extra
    notice = ""
    if params[:extra_choice_id].present?
      extra = Extra.find(params[:extra_choice_id])
    elsif params[:extra_addition_id].present?
      extra ||= Extra.find(params[:extra_addition_id])
    else
      notice = "No choice or addition selected"
    end
    @item.extras << extra if extra.present? && !@item.extras.include?(extra)
    redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item), notice: notice
  end

  def remove_menu_group
    menu_group = MenuGroup.find(params[:menu_group_id])
    @item.menu_groups.delete(menu_group)
    redirect_to edit_admin_restaurant_item_path(@restaurant, @item), notice: "Menu Group removed"
  end

  def remove_extra
    extra = Extra.find(params[:extra_id])
    @item.extras.delete(extra)
    redirect_to edit_admin_restaurant_item_path(@restaurant, @item), notice: "Extra removed"
  end

  def remove_photo
    photo = Photo.find(params[:photo_id])
    @item.photos.delete(photo)
    redirect_to edit_admin_restaurant_item_path(@restaurant, @item), notice: "Photo removed"
  end

  private
  def set_item
    just_set_item
    if @item.restaurant_id
      @restaurant  = Restaurant.find(@item.restaurant_id)
      @menu_groups = MenuGroup.includes(:restaurant).where(restaurant: @restaurant).order(:name)
      @foods       = Food.where(restaurant: @restaurant).order(:name)
      @extras      = Extra.where(restaurant: @restaurant).order(:name)
      @tags        = Tag.order_variety_then_name
    else
      @menu_groups = MenuGroup.includes(:restaurant).all.order('restaurants.name').order(:name)
    end
  end

  def just_set_item
    if params[:id]
      @item = Item.find(params[:id])
    elsif params[:item_id]
      @item = Item.find(params[:item_id])
    end
  end

  def item_params
    params.require(:item).permit(:restaurant_id, :name, :description, :user_id, menu_group_ids: [])
  end

  def food_params
    params.require(:food).permit(:name, :description)
  end

  def tag_params
    params.require(:tag).permit(:name, :description, :icon)
  end
end
