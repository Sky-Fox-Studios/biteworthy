class SearchController < ApplicationController
  skip_before_action :set_restaurant, :set_restaurants, :set_menu, :set_menus, :set_menu_groups, :set_menu_group, :set_items, :set_item
  def home
    # search = Sunspot.search(Post, Comment)
    @search = params[:query]
    @restaurants = Restaurant.search do
      fulltext params[:query] if params[:query] != ""
      paginate(page: params[:page], per_page: Sunspot.config.pagination.default_per_page)
    end

    @items = Item.search do
      fulltext params[:query] if params[:query] != ""
      paginate(page: params[:page], per_page: Sunspot.config.pagination.default_per_page)
    end
  end

  def choice_search
    @choice = Extra.find(params[:choice_id])
    @items  = Item.joins(:extras).where(extras: {extra_type: Extra.extra_types[:choice]}).where("extras.id IN (?)", params[:choice_id])
    render "search/item_search", locals: {search_type: "choice", name: @choice.name}
  end

  def food_search
    @food  = Food.find(params[:food_id])
    @items = Item.joins(:foods).where('foods.id IN (?)', params[:food_id])
    render "search/item_search", locals: {search_type: "food", name: @food.name}
  end

  def ingredient_search
    @ingredient = Ingredient.find(params[:ingredient_id])
    @items = Item.joins(:ingredients).where('ingredients.id IN (?)', params[:ingredient_id])
    render "search/item_search", locals: {search_type: "ingredient", name: @ingredient.name}
  end
end
