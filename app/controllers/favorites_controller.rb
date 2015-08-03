class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :find_favoriteable, only: [:new, :create]
  respond_to :html
  before_filter :authenticate_user!

  def index
     @favoriteable = find_favoriteable
     @favorites = Favorite.all
    respond_with(@favorites)
  end

  def show
    respond_with(@favorite)
  end

  def new
    session[:return_to] ||= request.referer

    @favorite = Favorite.new
    respond_with(@favorite)
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def create
    @favorite = @favoriteable.favorites.new(favorite_params)
    # @favorite = Favorite.new(favorite_params)
    @favorite.save
    redirect_to session.delete(:return_to)
    # respond_with(@favorite)
  end

  def update
    @favorite.update(favorite_params)
    redirect_to session.delete(:return_to)
  end

  def destroy
     @favorite.destroy
    respond_with(@favorite)
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
      @favoriteable = find_favoriteable
    end

    def favorite_params
       params.require(:favorite).permit(:favorite_id, :favorite_type, :user_id, :title, :description, :rating)
    end

   def find_favoriteable
      params.each do |name, value|
         if name =~ /(.+)_id$/
            @favoriteable = $1.classify.constantize.find(value)
         end
      end
      return @favoriteable
   end

end
