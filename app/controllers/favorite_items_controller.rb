class FavoriteItemsController < ApplicationController
   before_action :set_favorite_item, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
     @favorite_items = FavoriteItem.all
    respond_with(@favorite_items)
  end

  def show
    respond_with(@favorite_item)
  end

  def new
    @favorite_item = FavoriteItem.new
    respond_with(@favorite_item)
  end

  def edit
  end

  def create
    @favorite_item = FavoriteItem.new(user_favorite_params)
    @favorite_item.save
    respond_with(@favorite_item)
  end

  def update
    @favorite_item.update(user_favorite_params)
    respond_with(@favorite_item)
  end

  def destroy
     @favorite_item.destroy
    respond_with(@favorite_item)
  end

  private
   def set_favorite_item
      @favorite_items = FavoriteItem.find(params[:id])
    end

    def user_favorite_params
       params.require(:favorite_item).permit(:rating, :item_id, :comment)
    end
end
