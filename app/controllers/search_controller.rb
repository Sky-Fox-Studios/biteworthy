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
end
