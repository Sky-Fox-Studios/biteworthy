class SearchController < ApplicationController
  skip_before_action :set_restaurant, :set_restaurants, :set_menu, :set_menus, :set_menu_groups, :set_menu_group, :set_items, :set_item
  def home
    # search = Sunspot.search(Post, Comment)
    @search = params[:query]
    @tags  = Tag.all.order(:name)
    @foods = Food.all.order(:name)
    @restaurants = Restaurant.search do
      with(:active, true)
      fulltext params[:query] if params[:query] != ""
      paginate(page: params[:page], per_page: Sunspot.config.pagination.default_per_page)
    end

    @items = Item.search do
      fulltext params[:query] if params[:query] != ""
      paginate(page: params[:page], per_page: Sunspot.config.pagination.default_per_page)
    end
  end

  def choice_search
    @search = Extra.find(params[:choice_id])
    @restaurant = @search.restaurant
    @items  = Item.joins(:extras).where(extras: {addon_type: Extra.addon_types[:choice]}).where("extras.id IN (?)", params[:choice_id])
    render "search/item_search", locals: {search_type: "choice"}
  end

  def addition_search
    @search = Extra.find(params[:addition_id])
    @restaurant = @search.restaurant
    @items  = Item.joins(:extras).where(extras: {addon_type: Extra.addon_types[:addition]}).where("extras.id IN (?)", params[:addition_id])
    render "search/item_search", locals: {search_type: "addition"}
  end

  def food_search
    @search  = Food.find(params[:food_id])
    @restaurant = @search.restaurant
    @items = Item.joins(:foods).where('foods.id IN (?)', params[:food_id])
    render "search/item_search", locals: {search_type: "food"}
  end

  def tag_search
    if params[:restaurant_id].present?
      @restaurant  = Restaurant.find(params[:restaurant_id])
    end
    @search      = Tag.find(params[:tag_id])
    @items       = Item.joins(:tags).where('tags.id IN (?)', params[:tag_id])
    if @restaurant.present?
      @items       = @items.where(restaurant: @restaurant)
    end
    render "search/item_search", locals: {search_type: "tag"}
  end

  def ingredient_search
    @search = Ingredient.find(params[:ingredient_id])
    @items = Item.joins(:ingredients).where('ingredients.id IN (?)', params[:ingredient_id])
    render "search/item_search", locals: {search_type: "ingredient"}
  end

  def advanced
    if params[:include] && params[:exclude]
      @items = Item.active.joins(:tags).where("tags.id in (?)", params[:include]).where("tags.id not in (?)", params[:exclude])
    elsif params[:include]
      @items = Item.active.joins(:tags).where("tags.id in (?)", params[:include])
    elsif params[:exclude]
      @items = Item.active.joins(:tags).where("tags.id not in (?)", params[:exclude])
    else
      @items =Item.active.all
    end
    render partial: "search/items_found", locals: {items: @items.uniq}
  end
end