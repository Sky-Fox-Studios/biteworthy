class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show]
  respond_to :html

  def index
     @favorites = Favorite.all
    respond_with(@favorites)
  end

  def show
    respond_with(@favorite)
  end
 
  private
   def set_favorite
      @favorites = Favorite.find(params[:id])
    end

end
