class Admin::ExtrasController < AdminController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  before_action :just_set_extra, only: [:add_foods, :add_new_food, :remove_food, :add_new_price, :remove_photo]

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

  def create
    @extra = Extra.new(extra_params)
    if @extra.save
      redirect_to admin_restaurant_extras_path(@restaurant), notice: "Extra: #{@extra.name} created"
    else
      render :new
    end

  end

  def update
    if @extra.update(extra_params)
      if params[:image]
        @extra.photos.new(user_id: current_user.id, photo_type: "Extra", image: params[:image]).save
      end
      redirect_to edit_admin_restaurant_extra_path(@restaurant, @extra), notice: "Extra updated"
    else
      render :edit
    end
  end

  def destroy
    @extra.destroy
    redirect_to admin_restaurant_extras_path(@restaurant), notice: "Extra removed"
  end

  def add_new_price
    @extra.prices.create(value: params[:price_value], size: params[:new_size])
    redirect_to edit_admin_restaurant_extra_path(@extra.restaurant, @extra)
  end

  def add_new_food
    @extra.foods.create(name: params[:food_name], description: params[:food_description], restaurant: @extra.restaurant)
    redirect_to edit_admin_restaurant_extra_path(@extra.restaurant, @extra)
  end

  def add_foods
    unless (params[:extra].empty?)
      foods = Food.where(id: params[:extra][:food_ids])
      @extra.foods = foods
    end
    redirect_to edit_admin_restaurant_extra_path(@extra.restaurant, @extra)
  end

  def remove_food
    food = Food.find(params[:food_id])
    @extra.foods.delete(food)
    redirect_to edit_admin_restaurant_extra_path(@extra.restaurant, @extra)
  end

  def remove_photo
    photo = Photo.find(params[:photo_id])
    @extra.photos.delete(photo)
    redirect_to edit_admin_restaurant_extra_path(@restaurant, @extra)
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
