class Admin::FoodsController < AdminController
  before_action :set_restaurant, only: [:all, :index, :show, :edit, :update, :destroy, :add_ingredient, :add_ingredient_by_name, :remove_ingredient]
  before_action :set_food, only: [
    :show, :edit, :update, :destroy,
    :add_ingredient, :add_ingredient_by_name,
    :remove_ingredient, :remove_photo
  ]
  before_action :set_foods, only: [:all, :index]
  respond_to :html


  def all
    @restaurants = Restaurant.all.order(:name)
  end

  def index
    @foods = Food.where(restaurant: @restaurant)
    respond_with(@foods)
  end

  def show
    respond_with(@food)
  end

  def get_menu_groups_by_restaurant
     restaurant = Restaurant.find(params[:restaurant_id])
     menu_groups = MenuGroup.where(restaurant_id: params[:restaurant_id])
     render partial: 'admin/modules/menu_groups_select', locals: {menu_groups: menu_groups, restaurant: restaurant}
  end

  def new
    @food = Food.new
    if params[:food] && params[:food][:restaurant_id]
      @restaurant = Restaurant.find(food_params[:restaurant_id])
    elsif params.has_key? :restaurant_id
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    respond_with(@food)
  end

  def edit
    @tags = Tag.all.order(:name)
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to admin_foods_path
    else
      redirect_to :back
    end
  end

  def update
    if @food.update(food_params)
      if params[:image]
        @food.photos.new(user_id: current_user.id, photo_type: "Food", image: params[:image]).save
      end
       redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
    else
       redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
    end
  end

  def destroy
    @food.destroy
     redirect_to admin_foods_path
  end

  def add_new_food
    food = Food.find_or_create_by(name: food_params[:name], description: food_params[:description], restaurant_id: food_params[:restaurant_id])
    if params[:extra_id].present?
      @extra = Extra.find(params[:extra_id])
      @extra.foods << food
      redirect_to edit_admin_restaurant_extra_path(@extra.restaurant, @extra)
    elsif params[:item_id].present?
      @item = Item.find(params[:item_id])
      @item.foods << food
      redirect_to edit_admin_restaurant_item_path(@item.restaurant, @item)
    else
      redirect_to :back
    end
  end

  def add_ingredient
    if params[:ingredient_id].present?
      ingredient = Ingredient.find(params[:ingredient_id])
      @food.ingredients << ingredient unless @food.ingredients.include? ingredient
      redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
    else
      redirect_to edit_admin_restaurant_food_path(@restaurant, @food), notice: "No ingredient selected"
    end
  end

  def add_ingredient_by_name
    if params[:ingredient].present?
      ingredient = Ingredient.find_or_create_by(name: params[:ingredient][:name].singularize.capitalize)
      if params[:ingredient][:variety].present?
        Variety.find_or_create_by(food: @food, ingredient: ingredient, name: params[:ingredient][:variety])
      end
      @food.ingredients << ingredient unless @food.ingredients.include? ingredient
    end
    redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
  end

  def add_tag
    unless (params[:tag_id].empty?)
      tag = Tag.find(params[:tag_id])
      @food.tags << tag unless @food.tags.include? tag
    end
    redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
  end

  def add_new_tag
    tag = Tag.find_or_initialize_by(name: params[:tag][:name])
    tag.update(description: params[:tag][:description])
    @food.tags << tag unless @food.tags.include? tag
    redirect_to edit_admin_restaurant_food_path(@food.restaurant, @food)
  end

  def remove_ingredient
    ingredient = Ingredient.find(params[:ingredient_id])
    @food.ingredients.delete(ingredient)
    redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
  end

  def remove_photo
    photo = Photo.find(params[:photo_id])
    @food.photos.delete(photo)
    redirect_to edit_admin_restaurant_food_path(@restaurant, @food)
  end

  private
    def set_food
      if params[:id]
        @food = Food.find(params[:id])
      elsif params[:food_id]
        @food = Food.find(params[:food_id])
      end
    end

    def set_foods
      if params.has_key?(:filter_restaurant_id) && !params[:filter_restaurant_id].empty?
        @foods = Food.where(restaurant_id: params[:filter_restaurant_id]).page(page).per(per_page_count)
      else
        @foods = Food.page(page).per(per_page_count)
      end
    end

    def food_params
       params.require(:food).permit(:restaurant_id, :name, :description, :food_group)
    end
end
