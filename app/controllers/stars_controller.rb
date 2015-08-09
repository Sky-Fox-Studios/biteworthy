class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
  before_action :find_starable, only: [:new, :create]
  respond_to :html
  before_filter :authenticate_user!

  def index
     @starable = find_starable
     @stars = Star.all
    respond_with(@stars)
  end

  def show
    respond_with(@star)
  end

  def new
    session[:return_to] ||= request.referer
    @star = Star.new
    respond_with(@star)
  end

  def create_user_rating
    new_star = Star.find_or_create_by( star_id: params[:star_id], star_type: params[:star_type], user_id: current_user.id)
    new_star.update(rating: params[:rating].to_i)
    find_starable
    render partial: "modules/rating_stars", locals: { rating: params[:rating].to_i, starable: @starable}
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def create
    star_params[:rating] = star_params[:rating].to_i
    @star = @starable.stars.new(star_params)
    @star.save
    redirect_to session.delete(:return_to)
  end

  def update
    @star.update(star_params)
    redirect_to session.delete(:return_to)
  end

  def destroy
     @star.destroy
    respond_with(@star)
  end

  private
    def set_star
      @star = Star.find(params[:id])
      @starable = find_starable
    end

    def star_params
       params.require(:star).permit(:star_id, :star_type, :user_id, :rating)
    end

   def find_starable
     if params.include?(:star_type) && params.include?(:star_id)
       @starable = params[:star_type].classify.constantize.find(params[:star_id])
     else
        params.each do |name, value|
           if name =~ /(.+)_id$/
             puts "name=#{name}, value=#{value}"
              @starable = $1.classify.constantize.find(value)
           end
        end
      end
      if !@starable && @star
        @starable = @star.star_type.classify.constantize.find(@star.star_id)
      end
      @starable
   end

end
