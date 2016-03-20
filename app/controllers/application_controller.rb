class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_restaurant, :set_restaurants, :set_menu, :set_menus, :set_menu_groups, :set_menu_group, :set_items, :set_item
  before_action :page_history, only: [:create, :update]

   def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def page_history
    session[:return_to] ||= request.referer
  end

  def per_page_count
    25
  end

  def filter_index_by_restaurant(params, klass)
    if params.has_key?(:filter_restaurant_id) && !params[:filter_restaurant_id].empty?
      klass.constantize.where(restaurant_id: params[:filter_restaurant_id]).page(params[:page]).per(per_page_count)
    else
      klass.constantize.page(params[:page]).per(per_page_count)
    end

  end

  def page
    params[:page]
  end

  def set_restaurant
    if params[:restaurant_id] && !params[:restaurant_id].empty?
      @restaurant = Restaurant.find(params[:restaurant_id])
    elsif params[:filter_restaurant_id] && !params[:filter_restaurant_id].empty?
      @restaurant = Restaurant.find(params[:filter_restaurant_id])
    end
  end

  def set_menu
    if params[:menu_id] && !params[:menu_id].empty?
      @menu = Menu.find(params[:menu_id])
    elsif params[:filter_menu_id] && !params[:filter_menu_id].empty?
      @menu = Menu.find(params[:filter_menu_id])
    end
  end

  def set_menu_group
    if params[:menu_group_id] && !params[:menu_group_id].empty?
      @menu_group = MenuGroup.find(params[:menu_group_id])
    elsif params[:filter_menu_group_id] && !params[:filter_menu_group_id].empty?
      @menu_group = MenuGroup.find(params[:filter_menu_group_id])
    end
  end

  def set_item
    if params[:item_id] && !params[:item_id].empty?
      @item = Item.find(params[:item_id])
    elsif params[:filter_item_id] && !params[:filter_item_id].empty?
      @item = Item.find(params[:filter_item_id])
    end
  end

  def set_restaurants
    @restaurants = Restaurant.all.order(:name)
  end

  def set_menus
    if @restaurant
      @menus = Menu.where(restaurant: @restaurant).order(:name)
    else
      @menus = Menu.all.order(:name)
    end
  end

  def set_menu_groups
    if @restaurant
      @menu_groups = MenuGroup.where(restaurant: @restaurant).order(:name)
      else
      @menu_groups = MenuGroup.all.order(:name)
    end
  end

  def set_items
    if @restaurant
      if @menu_group
        @items = @menu_group.items.page(page).per(per_page_count)
      else
        @items = Item.where(restaurant: @restaurant).page(page).per(per_page_count)
      end
    end
  end
end
