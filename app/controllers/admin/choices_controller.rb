class Admin::ChoicesController < AdminController
  before_action :set_restaurant, only: [:index, :show, :new, :edit, :create, :update, :destroy, :add_food]
  before_action :set_choice, only: [:show, :edit, :update, :destroy]
  before_action :just_set_choice, only: [:add_foods, :add_new_food, :remove_food]

  respond_to :html

  def index
    @choices = Choice.where(restaurant: @restaurant).order(:name).page(params[:page]).per(per_page_count)
    @restaurants = Restaurant.all
    respond_with(@choices)
  end

  def show
    respond_with(@choice)
  end

  def new
    @choice = Choice.new
    respond_with(@choice)
  end

  def edit
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      redirect_to admin_restaurant_choices_path(@restaurant), notice: "Choice: #{@choice.name} created"
    else
      render :new
    end

  end

  def update
    if @choice.update(choice_params)
      redirect_to admin_restaurant_choices_path(@choice.restaurant), notice: "Choice updated"
    else
      render :edit
    end
  end

  def destroy
    @choice.destroy
    redirect_to admin_restaurant_choices_path(@restaurant), notice: "Choice removed"
  end

  def add_new_food
    @choice.foods.create(name: params[:food_name], description: params[:food_description], restaurant: @choice.restaurant)
    redirect_to edit_admin_restaurant_choice_path(@choice.restaurant, @choice)
  end

  def add_foods
    unless (params[:choice].empty?)
      foods = Food.where(id: params[:choice][:food_ids])
      @choice.foods = foods
    end
    redirect_to edit_admin_restaurant_choice_path(@choice.restaurant, @choice)
  end

  def remove_food
    food = Food.find(params[:food_id])
    @choice.foods.delete(food)
    redirect_to edit_admin_restaurant_choice_path(@choice.restaurant, @choice)
  end


  private
  def just_set_choice
    if params[:id]
      @choice = Choice.find(params[:id])
    elsif params[:choice_id]
      @choice = Choice.find(params[:choice_id])
    end
  end

  def set_choice
    just_set_choice
    if @choice
      @restaurant = @choice.restaurant
      @foods = Food.where(restaurant: @restaurant).order(:name)
      @choice_foods = Food.joins(:choices).where(restaurant: @restaurant).order(:name)
    end
  end

  def choice_params
    params.require(:choice).permit(:restaurant_id, :name, :description)
    end
end
