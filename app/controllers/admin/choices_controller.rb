class Admin::ChoicesController < AdminController
  before_action :set_restaurant, only: [:index, :show, :new, :edit, :create, :update, :destroy, :add_food]
  before_action :set_choice, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @choices = filter_index_by_restaurant(params, "Choice")
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

  def add_food
    @choice = Choice.find(params[:choice_id])
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @choice.foods << food unless @choice.foods.include? food
    end
    if params.has_key? :admin_updating
      redirect_to edit_admin_restaurant_choice_path(@restaurant, @choice)
    else
      redirect_to restaurant_choice_path(@restaurant, @choice)
    end
  end


  private
  def set_choice
    @choice = Choice.find(params[:id])
    if @choice.restaurant
      @restaurant = @choice.restaurant
    end
  end

  def choice_params
    params.require(:choice).permit(:restaurant_id, :name, :description)
    end
end
