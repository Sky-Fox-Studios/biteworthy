class Admin::ExtrasController < AdminController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  before_action :just_set_extra, only: [:add_foods, :add_new_food, :remove_food, :add_new_price]

  respond_to :html

  def index
    @extras = Extra.where(restaurant: @restaurant).order(:name).page(params[:page]).per(per_page_count)
    @restaurants = Restaurant.all
    respond_with(@extras)
  end

  def show
    respond_with(@extra)
  end

  def new
    @extra = Extra.new
    respond_with(@extra)
  end

  def edit
  end

  private
  def just_set_extra
    if params[:id]
      @extra = Extra.find(params[:id])
    elsif params[:extra_id]
      @extra = Extra.find(params[:extra_id])
    end
  end

  def set_extra
    just_set_extra
    if @extra
      @restaurant = @extra.restaurant
      @foods = Food.where(restaurant: @restaurant).order(:name)
      @extra_foods = Food.joins(:extras).where(restaurant: @restaurant).order(:name)
    end
  end

  def extra_params
    params.require(:extra).permit(:restaurant_id, :name, :description, :extra_type)
    end
end
