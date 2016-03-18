class Admin::IngredientsController < AdminController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy, :add_tag, :remove_tag]
  respond_to :html

  def index
    @ingredients = Ingredient.all.includes(:tags)
    respond_with(@ingredients)
  end

  def show
    respond_with(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
    if params[:food_id]
      @food = Food.find(params[:food_id])
      @restaurant = Restaurant.find(@food.restaurant)
    end
    respond_with(@ingredient)
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def create
    @ingredient = Ingredient.find_or_create_by(name: ingredient_params[:name])
    @ingredient.update(ingredient_params)
    if params[:ingredient][:food_id]
      @food = Food.find(params[:ingredient][:food_id])
      @ingredient.foods << @food
      @ingredient.save
      redirect_to restaurant_food_path(@food.restaurant, @food), notice: "Ingredient created"
    else
      redirect_to admin_ingredients_path, notice: "Ingredient created"
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to admin_ingredients_path, notice: "Updated: #{@ingredient.name}"
    else
      redirect_to edit_admin_ingredients_path, notice: "Ingredient not updated"
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to admin_ingredients_path
  end

  def add_tag
    tag = Tag.find(params[:tag_id])
    @ingredient.tags << tag unless @ingredient.tags.include? tag
    redirect_to edit_admin_ingredient_path(@ingredient)
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @ingredient.tags.delete(tag)
    redirect_to edit_admin_ingredient_path(@ingredient)
  end

  private
  def set_ingredient
    if params[:id]
      @ingredient = Ingredient.find(params[:id])
    elsif params[:ingredient_id]
      @ingredient = Ingredient.find(params[:ingredient_id])
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
    end
end
